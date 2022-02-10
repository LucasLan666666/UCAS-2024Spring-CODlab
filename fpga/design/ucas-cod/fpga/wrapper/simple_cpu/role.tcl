#========================================================
# Vivado BD design auto run script for mpsoc
# Based on Vivado 2019.1
# Author: Yisong Chang (changyisong@ict.ac.cn)
# Date: 09/06/2020
#========================================================

namespace eval mpsoc_bd_val {
	set design_name role
	set bd_prefix ${mpsoc_bd_val::design_name}_
	set coe_prefix ${::script_dir}/../design/${::prj}/scripts/coe
}


# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${mpsoc_bd_val::design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne ${mpsoc_bd_val::design_name} } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <${mpsoc_bd_val::design_name}> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq ${mpsoc_bd_val::design_name} } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <${mpsoc_bd_val::design_name}> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${mpsoc_bd_val::design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <${mpsoc_bd_val::design_name}> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <${mpsoc_bd_val::design_name}> in project, so creating one..."

   create_bd_design ${mpsoc_bd_val::design_name}

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <${mpsoc_bd_val::design_name}> as current_bd_design."
   current_bd_design ${mpsoc_bd_val::design_name}

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"${mpsoc_bd_val::design_name}\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################

# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

#=============================================
# Create IP blocks
#=============================================

  # Create instance: axi_gpio to cpu reset signal
  set simple_cpu_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 simple_cpu_reset ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {0} \
	      CONFIG.C_ALL_OUTPUTS {1} \
	      CONFIG.C_GPIO_WIDTH {1} \
	      CONFIG.C_DOUT_DEFAULT {0x1} ] $simple_cpu_reset
	      
  # Create instance: axi_gpio_ic
  set axi_gpio_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_gpio_ic ]
  set_property -dict [ list CONFIG.NUM_MI {4} ] $axi_gpio_ic

  # Create instance: simple_cpu_top properties
  set block_name simple_cpu_top
  set block_cell_name u_simple_cpu_top
  if { [catch {set u_simple_cpu_top [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $u_simple_cpu_top eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

#=============================================
# Clock ports
#=============================================

  create_bd_port -dir I -type clk role_clk
  set_property CONFIG.FREQ_HZ 100000000 [get_bd_ports role_clk]

  create_bd_port -dir I -type clk role_to_mem_clk
  set_property CONFIG.FREQ_HZ 200000000 [get_bd_ports role_to_mem_clk]

#=============================================
# Reset ports
#=============================================

  # ROLE resetn
  create_bd_port -dir I -type rst role_resetn
  set_property CONFIG.ASSOCIATED_RESET {role_resetn} [get_bd_ports role_clk]

  create_bd_port -dir I -type rst role_to_mem_resetn
  set_property CONFIG.ASSOCIATED_RESET {role_to_mem_resetn} [get_bd_ports role_to_mem_clk]

#=============================================
# AXI ports
#=============================================
  
  set axi_shell_to_role [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_shell_to_role]
  set_property -dict [ list CONFIG.PROTOCOL {AXI4Lite} \
				CONFIG.ADDR_WIDTH {20} \
				CONFIG.DATA_WIDTH {32} ] $axi_shell_to_role

  set axi_role_to_shell [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_role_to_shell]
  set_property -dict [ list CONFIG.PROTOCOL {AXI4Lite} \
				CONFIG.ADDR_WIDTH {32} \
				CONFIG.DATA_WIDTH {32} ] $axi_role_to_shell

  set axi_role_to_mem [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_role_to_mem]
  set_property -dict [ list CONFIG.PROTOCOL {AXI4} \
				CONFIG.ADDR_WIDTH {40} \
				CONFIG.DATA_WIDTH {64} ] $axi_role_to_mem

  set_property CONFIG.ASSOCIATED_BUSIF {axi_shell_to_role:axi_role_to_shell:axi_role_to_mem} [get_bd_ports role_clk]
  set_property CONFIG.ASSOCIATED_BUSIF {axi_role_to_mem} [get_bd_ports role_to_mem_clk]

#=============================================
# System clock connection
#=============================================

  connect_bd_net [get_bd_ports role_clk] \
      [get_bd_pins simple_cpu_reset/s_axi_aclk] \
      [get_bd_pins u_simple_cpu_top/clk] \
      [get_bd_pins axi_gpio_ic/ACLK] \
      [get_bd_pins axi_gpio_ic/S00_ACLK] \
      [get_bd_pins axi_gpio_ic/M00_ACLK] \
      [get_bd_pins axi_gpio_ic/M01_ACLK] \
      [get_bd_pins axi_gpio_ic/M02_ACLK]

  connect_bd_net [get_bd_ports role_to_mem_clk] \
      [get_bd_pins axi_gpio_ic/M03_ACLK]

#=============================================
# System reset connection
#=============================================

  connect_bd_net [get_bd_ports role_resetn] \
      [get_bd_pins simple_cpu_reset/s_axi_aresetn] \
      [get_bd_pins u_simple_cpu_top/resetn] \
      [get_bd_pins axi_gpio_ic/ARESETN] \
      [get_bd_pins axi_gpio_ic/S00_ARESETN] \
      [get_bd_pins axi_gpio_ic/M00_ARESETN] \
      [get_bd_pins axi_gpio_ic/M01_ARESETN] \
      [get_bd_pins axi_gpio_ic/M02_ARESETN]

  connect_bd_net [get_bd_ports role_to_mem_resetn] \
      [get_bd_pins axi_gpio_ic/M03_ARESETN]

#=============================================
# AXI interface connection
#=============================================

  # AXI-Lite SHELL to ROLE master 
  connect_bd_intf_net [get_bd_intf_ports axi_shell_to_role] \
      [get_bd_intf_pins axi_gpio_ic/S00_AXI]

  connect_bd_intf_net [get_bd_intf_pins u_simple_cpu_top/simple_cpu_axi_if] \
      [get_bd_intf_pins axi_gpio_ic/M00_AXI]
  connect_bd_intf_net [get_bd_intf_pins simple_cpu_reset/S_AXI] \
      [get_bd_intf_pins axi_gpio_ic/M01_AXI]

  connect_bd_intf_net [get_bd_intf_pins axi_gpio_ic/M02_AXI] \
				[get_bd_intf_ports axi_role_to_shell]
  connect_bd_intf_net [get_bd_intf_pins axi_gpio_ic/M03_AXI] \
				[get_bd_intf_ports axi_role_to_mem]

#=============================================
# Adder - GPIO connection
#=============================================
  connect_bd_net [get_bd_pins u_simple_cpu_top/cpu_rst] \
      [get_bd_pins simple_cpu_reset/gpio_io_o]

#=============================================
# Create address segments
#=============================================
  create_bd_addr_seg -range 0x10000 -offset 0x00000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs u_simple_cpu_top/simple_cpu_axi_if/reg0] SEG_IDEAL_MEM_Reg
  create_bd_addr_seg -range 0x10000 -offset 0x10000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs simple_cpu_reset/S_AXI/Reg] SEG_cpu_reset_Reg

#=============================================
# Finish BD creation 
#=============================================

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

