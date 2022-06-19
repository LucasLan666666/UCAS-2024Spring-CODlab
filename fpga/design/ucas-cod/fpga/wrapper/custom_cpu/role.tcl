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

  # Create instance: CPU Reset signal AXI IC (clock converter) to Zynq PS 
  set cpu_reset_io_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 cpu_reset_io_ic ]
  set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_SI {1}] $cpu_reset_io_ic
  
  # Create instance: MMIO AXI IC to custom CPU
  set custom_cpu_mmio_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 custom_cpu_mmio_ic ]
  set_property -dict [list CONFIG.NUM_MI {5} CONFIG.NUM_SI {1}] $custom_cpu_mmio_ic

  # Create instance: MEMORY AXI IC to custom CPU
  set custom_cpu_mem_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 custom_cpu_mem_ic ]
  set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {4}] $custom_cpu_mem_ic

  # set cpu freq in HZ
  set cpu_freq_hz ${::cpu_freq}000000

  if {${::simple_dma} == "1"} {
	  # Create instance: DMA MMIO register interface
	  set dma_axi_lite_if [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 dma_axi_lite_if ]
	  set_property -dict [list CONFIG.SINGLE_PORT_BRAM {1} \
			CONFIG.PROTOCOL {AXI4} ] $dma_axi_lite_if

	  # Create instance: Add DMA AXI-Lite wrapper module
	  set block_name dma_mmio_wrapper
	  set block_cell_name u_dma_mmio_wrapper
	  if { [catch {set u_dma_mmio_wrapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	  } elseif { $u_dma_mmio_wrapper eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	  }
			
	  # Create instance: Add custom DMA module
	  set block_name dma_engine
	  set block_cell_name u_dma_engine
	  if { [catch {set u_dma_engine [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	  } elseif { $u_dma_engine eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	  }
	  set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_dma_engine/M_AXI_ACLK]
	  set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_dma_engine/M_AXI]
  }

  if {${::dnn_acc} != "0"} {
	  # Create instance: 64-bit to 32-bit memory data width converter
	  set dnn_ddr_downsizer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 dnn_ddr_downsizer ]
	  set_property -dict [list CONFIG.MI_DATA_WIDTH.VALUE_SRC {USER} \
                        CONFIG.SI_DATA_WIDTH {64} \
			CONFIG.MI_DATA_WIDTH {32} ] $dnn_ddr_downsizer
  
	  # Create instance: AXI-Lite wrapper of DNN accelerator 
	  set axi_gpio_dnn [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_dnn ]
	  set_property -dict [ list CONFIG.C_ALL_INPUTS {0} \
	          CONFIG.C_ALL_OUTPUTS {1} \
		  CONFIG.C_GPIO_WIDTH {1} \
		  CONFIG.C_IS_DUAL {1} \
		  CONFIG.C_ALL_INPUTS_2 {1} \
		  CONFIG.C_ALL_OUTPUTS_2 {0} \
		  CONFIG.C_GPIO2_WIDTH {1} ] $axi_gpio_dnn
  
	  # Create RTL block: dnn_acc_top
	  set block_name dnn_acc_top
	  set block_cell_name u_dnn_acc_top
	  if { [catch {set u_dnn_acc_top [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		  catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		  return 1
	  } elseif { $u_dnn_acc_top eq "" } {
		  catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		  return 1
	  }

	  set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_dnn_acc_top/user_clk]
	  set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_dnn_acc_top/user_axi]
  }

  # Create instance: custom cpu mem I/F arbitration 
  set custom_cpu_mem_arb [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 custom_cpu_mem_arb ]
  set_property -dict [list CONFIG.NUM_MI {2} CONFIG.NUM_SI {1}] $custom_cpu_mem_arb

  # Create instance: 32-bit to 64-bit memory data width converter
  set cpu_ddr_upsizer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dwidth_converter:2.1 cpu_ddr_upsizer ]
  set_property -dict [list CONFIG.MI_DATA_WIDTH.VALUE_SRC {USER}] $cpu_ddr_upsizer

  # Create instance: Reset infrastructure for custom CPU sub systems
  set cpu_clk_reset_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 cpu_clk_reset_gen ]

  # Create instance: Reset infrastructure for custom CPU memory interface
  set mem_clk_reset_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 mem_clk_reset_gen ]

  # Create instance: VCC
  set const_vcc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_vcc ]
  set_property -dict [list CONFIG.CONST_WIDTH {1} \
      CONFIG.CONST_VAL {0x1} ] $const_vcc
	  
  # Create instance: Register to control reset signal to custom CPU
  set cpu_reset_io [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 cpu_reset_io ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {0} \
			CONFIG.C_ALL_OUTPUTS {1} \
			CONFIG.C_GPIO_WIDTH {1}  \
			CONFIG.C_DOUT_DEFAULT {0x1} ] $cpu_reset_io

  # Create instance: Register to control reset signal to custom CPU
  set cpu_status_io [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 cpu_status_io ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} \
			CONFIG.C_ALL_OUTPUTS {0} \
			CONFIG.C_GPIO_WIDTH {32}  \
			CONFIG.C_IS_DUAL {1} \
			CONFIG.C_ALL_INPUTS_2 {1} \
			CONFIG.C_ALL_OUTPUTS_2 {0} \
			CONFIG.C_GPIO2_WIDTH {32} ] $cpu_status_io

  # Create instance: clock wizard
  set cpu_clk_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 cpu_clk_gen ]
  set_property -dict [list CONFIG.JITTER_OPTIONS {PS} \
                        CONFIG.PRIM_SOURCE {No_buffer} \
			CONFIG.CLKOUT1_REQUESTED_OUT_FREQ ${::cpu_freq} \
			CONFIG.RESET_TYPE {ACTIVE_LOW} \
			CONFIG.RESET_PORT {resetn} ] $cpu_clk_gen

  # Create instance: up to 8 AXI GPIO controller to connect performance counter
  set i 0
  while {$i < 8} {
	  set gpio_name gpio_$i
	  set gpio_ctrl [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 $gpio_name ]
	  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} \
			CONFIG.C_ALL_OUTPUTS {0} \
			CONFIG.C_GPIO_WIDTH {32} \
			CONFIG.C_IS_DUAL {1} \
			CONFIG.C_ALL_INPUTS_2 {1} \
			CONFIG.C_ALL_OUTPUTS_2 {0} \
			CONFIG.C_GPIO2_WIDTH {32} ] $gpio_ctrl

	  incr i 1
  }

  # Create instance: AXI GPIO controller as AXI wrapper of wall clock counter
  set wall_clk_counter_wrapper [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 wall_clk_counter_wrapper ]
  set_property -dict [ list CONFIG.C_ALL_INPUTS {1} \
			CONFIG.C_ALL_OUTPUTS {0} \
			CONFIG.C_GPIO_WIDTH {32} \
			CONFIG.C_IS_DUAL {1} \
			CONFIG.C_ALL_INPUTS_2 {0} \
			CONFIG.C_ALL_OUTPUTS_2 {1} \
			CONFIG.C_GPIO2_WIDTH {1} \
			CONFIG.C_DOUT_DEFAULT {0x1} ] $wall_clk_counter_wrapper

  # Create RTL block: wall_clk_counter
  set block_name wall_clk_counter
  set block_cell_name u_wall_clk_counter
  if { [catch {set u_wall_clk_counter [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
	  catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
	  return 1
  } elseif { $u_wall_clk_counter eq "" } {
	  catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
	  return 1
  }

  # Create instance: 8 x 1 crossbar for AXI GPIO controllers
  set gpio_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 gpio_ic ]
  set_property -dict [list CONFIG.NUM_MI {8} CONFIG.NUM_SI {1}] $gpio_ic

  # Create instance: simple_cpu_top properties
  set block_name custom_cpu
  set block_cell_name u_custom_cpu
  if { [catch {set u_custom_cpu [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $u_custom_cpu eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_custom_cpu/clk]

   if {${::icache} == "1"} {
	   set block_name icache_wrapper
	   set block_cell_name u_icache_wrapper
	   if { [catch {set u_icache_wrapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   } elseif { $u_icache_wrapper eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   }
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_icache_wrapper/cpu_clk]
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_icache_wrapper/cpu_inst]

   } else {
	   set block_name inst_if_wrapper
	   set block_cell_name u_inst_if_wrapper
	   if { [catch {set u_inst_if_wrapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   } elseif { $u_inst_if_wrapper eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   }

	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_inst_if_wrapper/cpu_clk]
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_inst_if_wrapper/cpu_inst]
   }

   if {${::dcache} == "1"} {
	   set block_name dcache_wrapper
	   set block_cell_name u_dcache_wrapper
	   if { [catch {set u_dcache_wrapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   } elseif { $u_dcache_wrapper eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   }
	   
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_dcache_wrapper/cpu_clk]
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_dcache_wrapper/cpu_mem]

   } else {
	   set block_name mem_if_wrapper
	   set block_cell_name u_mem_if_wrapper
	   if { [catch {set u_mem_if_wrapper [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
		   catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   } elseif { $u_mem_if_wrapper eq "" } {
		   catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
		   return 1
	   }
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_pins u_mem_if_wrapper/cpu_clk]
	   set_property CONFIG.FREQ_HZ ${cpu_freq_hz} [get_bd_intf_pins u_mem_if_wrapper/cpu_mem]
   }


#=============================================
# Clock ports
#=============================================

  create_bd_port -dir I -type clk role_clk
  set_property CONFIG.FREQ_HZ 100000000 [get_bd_ports role_clk]

  create_bd_port -dir I -type clk role_to_mem_clk
  set_property CONFIG.FREQ_HZ 100000000 [get_bd_ports role_to_mem_clk]

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

  set_property CONFIG.ASSOCIATED_BUSIF {axi_shell_to_role:axi_role_to_shell} [get_bd_ports role_clk]
  set_property CONFIG.ASSOCIATED_BUSIF {axi_role_to_mem} [get_bd_ports role_to_mem_clk]

#=============================================
# System clock connection
#=============================================
  # ROLE CLK
  connect_bd_net [get_bd_ports role_clk] \
		 [get_bd_pins cpu_clk_gen/clk_in1] \
		 [get_bd_pins cpu_reset_io_ic/ACLK] \
		 [get_bd_pins cpu_reset_io_ic/S00_ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/M00_ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/M02_ACLK] \
		 [get_bd_pins wall_clk_counter_wrapper/s_axi_aclk] \
		 [get_bd_pins u_wall_clk_counter/clk]

  # ROLE to MEMORY CLK
  connect_bd_net [get_bd_ports role_to_mem_clk] \
                 [get_bd_pins custom_cpu_mem_ic/ACLK] \
                 [get_bd_pins custom_cpu_mem_ic/M00_ACLK] \
		 [get_bd_pins mem_clk_reset_gen/slowest_sync_clk] \
		 [get_bd_pins cpu_ddr_upsizer/s_axi_aclk]

  # CPU CLK
  connect_bd_net -net cpu_clk [get_bd_pins cpu_clk_gen/clk_out1] \
		 [get_bd_pins cpu_clk_reset_gen/slowest_sync_clk] \
		 [get_bd_pins cpu_reset_io_ic/M00_ACLK] \
		 [get_bd_pins cpu_reset_io_ic/M01_ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/S00_ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/M01_ACLK] \
		 [get_bd_pins custom_cpu_mmio_ic/M03_ACLK] \
	         [get_bd_pins custom_cpu_mmio_ic/M04_ACLK] \
                 [get_bd_pins custom_cpu_mem_ic/S*_ACLK] \
                 [get_bd_pins custom_cpu_mem_arb/*ACLK] \
		 [get_bd_pins gpio_ic/*ACLK] \
		 [get_bd_pins u_custom_cpu/clk] \
		 [get_bd_pins gpio_*/s_axi_aclk] \
		 [get_bd_pins cpu_status_io/s_axi_aclk] \
		 [get_bd_pins cpu_reset_io/s_axi_aclk]

  connect_bd_net [get_bd_pins cpu_clk_gen/locked] \
          [get_bd_pins cpu_clk_reset_gen/dcm_locked]

  connect_bd_net [get_bd_pins const_vcc/dout] \
      [get_bd_pins mem_clk_reset_gen/dcm_locked]

  if {${::dnn_acc} != "0"} {
	  connect_bd_net -net cpu_clk \
		 [get_bd_pins u_dnn_acc_top/user_clk] \
		 [get_bd_pins dnn_ddr_downsizer/s_axi_aclk] \
		 [get_bd_pins axi_gpio_dnn/s_axi_aclk]
  }

  if {${::simple_dma} == "1"} {
	  connect_bd_net -net cpu_clk \
		  [get_bd_pins dma_axi_lite_if/s_axi_aclk] \
		  [get_bd_pins u_dma_engine/M_AXI_ACLK]
  }

#=============================================
# System reset connection
#=============================================

  connect_bd_net [get_bd_ports role_resetn] \
      [get_bd_pins cpu_clk_gen/resetn] \
      [get_bd_pins cpu_clk_reset_gen/ext_reset_in] \
      [get_bd_pins mem_clk_reset_gen/ext_reset_in] \
      [get_bd_pins cpu_reset_io_ic/ARESETN] \
      [get_bd_pins cpu_reset_io_ic/S00_ARESETN] \
      [get_bd_pins custom_cpu_mmio_ic/M00_ARESETN] \
      [get_bd_pins custom_cpu_mmio_ic/M02_ARESETN] \
      [get_bd_pins wall_clk_counter_wrapper/s_axi_aresetn] \
      [get_bd_pins u_wall_clk_counter/resetn]

  connect_bd_net [get_bd_pins mem_clk_reset_gen/peripheral_aresetn] \
                 [get_bd_pins custom_cpu_mem_ic/M00_ARESETN] \
		 [get_bd_pins cpu_ddr_upsizer/s_axi_aresetn]

  connect_bd_net [get_bd_pins mem_clk_reset_gen/interconnect_aresetn] \
                 [get_bd_pins custom_cpu_mem_ic/ARESETN]

  # CPU CLK
  connect_bd_net -net cpu_resetn [get_bd_pins cpu_clk_reset_gen/peripheral_aresetn] \
		 [get_bd_pins cpu_reset_io_ic/M00_ARESETN] \
		 [get_bd_pins cpu_reset_io_ic/M01_ARESETN] \
		 [get_bd_pins custom_cpu_mmio_ic/S00_ARESETN] \
		 [get_bd_pins custom_cpu_mmio_ic/M01_ARESETN] \
		 [get_bd_pins custom_cpu_mmio_ic/M03_ARESETN] \
		 [get_bd_pins custom_cpu_mmio_ic/M04_ARESETN] \
                 [get_bd_pins custom_cpu_mem_ic/S*_ARESETN] \
                 [get_bd_pins custom_cpu_mem_arb/*_ARESETN] \
		 [get_bd_pins gpio_ic/*_ARESETN] \
		 [get_bd_pins gpio_*/s_axi_aresetn] \
		 [get_bd_pins cpu_status_io/s_axi_aresetn] \
		 [get_bd_pins cpu_reset_io/s_axi_aresetn]

  connect_bd_net [get_bd_pins cpu_clk_reset_gen/interconnect_aresetn] \
		 [get_bd_pins custom_cpu_mmio_ic/ARESETN] \
                 [get_bd_pins custom_cpu_mem_arb/ARESETN] \
		 [get_bd_pins gpio_ic/ARESETN]

  if {${::dnn_acc} != "0"} {
	  connect_bd_net -net cpu_resetn \
		 [get_bd_pins u_dnn_acc_top/user_reset_n] \
		 [get_bd_pins dnn_ddr_downsizer/s_axi_aresetn] \
		 [get_bd_pins axi_gpio_dnn/s_axi_aresetn]
  }

  if {${::simple_dma} == "1"} {
	  connect_bd_net -net cpu_resetn \
		  [get_bd_pins dma_axi_lite_if/s_axi_aresetn]
  }

#=============================================
# Custom CPU interface connection
#=============================================
   if {${::icache} == "1"} {
	   set inst_if_entity u_icache_wrapper
   } else {
	   set inst_if_entity u_inst_if_wrapper
   }
   ## Custom Instruction interface connection
   connect_bd_net [get_bd_pins u_custom_cpu/PC] \
       [get_bd_pins ${inst_if_entity}/PC] \
       [get_bd_pins cpu_status_io/gpio_io_i]
   connect_bd_net [get_bd_pins u_custom_cpu/Inst_Req_Valid] \
       [get_bd_pins ${inst_if_entity}/Inst_Req_Valid]
   connect_bd_net [get_bd_pins u_custom_cpu/Inst_Req_Ready] \
       [get_bd_pins ${inst_if_entity}/Inst_Req_Ready]
   connect_bd_net [get_bd_pins u_custom_cpu/Instruction] \
       [get_bd_pins ${inst_if_entity}/Instruction] \
       [get_bd_pins cpu_status_io/gpio2_io_i]
   connect_bd_net [get_bd_pins u_custom_cpu/Inst_Valid] \
       [get_bd_pins ${inst_if_entity}/Inst_Valid]
   connect_bd_net [get_bd_pins u_custom_cpu/Inst_Ready] \
       [get_bd_pins ${inst_if_entity}/Inst_Ready]

   if {${::dcache} == "1"} {
	   set mem_if_entity u_dcache_wrapper
   } else {
	   set mem_if_entity u_mem_if_wrapper
   }
   ## Custom Instruction interface connection
   connect_bd_net [get_bd_pins u_custom_cpu/Address] \
       [get_bd_pins ${mem_if_entity}/Address]
   connect_bd_net [get_bd_pins u_custom_cpu/MemWrite] \
       [get_bd_pins ${mem_if_entity}/MemWrite]
   connect_bd_net [get_bd_pins u_custom_cpu/Write_data] \
       [get_bd_pins ${mem_if_entity}/Write_data]
   connect_bd_net [get_bd_pins u_custom_cpu/Write_strb] \
       [get_bd_pins ${mem_if_entity}/Write_strb]
   connect_bd_net [get_bd_pins u_custom_cpu/MemRead] \
       [get_bd_pins ${mem_if_entity}/MemRead]
   connect_bd_net [get_bd_pins u_custom_cpu/Mem_Req_Ready] \
       [get_bd_pins ${mem_if_entity}/Mem_Req_Ready]
   connect_bd_net [get_bd_pins u_custom_cpu/Read_data] \
       [get_bd_pins ${mem_if_entity}/Read_data]
   connect_bd_net [get_bd_pins u_custom_cpu/Read_data_Valid] \
       [get_bd_pins ${mem_if_entity}/Read_data_Valid]
   connect_bd_net [get_bd_pins u_custom_cpu/Read_data_Ready] \
       [get_bd_pins ${mem_if_entity}/Read_data_Ready]

  connect_bd_net -net cpu_clk [get_bd_pins ${mem_if_entity}/cpu_clk] \
		 [get_bd_pins ${inst_if_entity}/cpu_clk]

  connect_bd_net -net cpu_reset [get_bd_pins u_custom_cpu/rst] \
      [get_bd_pins ${mem_if_entity}/cpu_reset] \
      [get_bd_pins ${inst_if_entity}/cpu_reset] \
      [get_bd_pins cpu_reset_io/gpio_io_o]

  if {${::simple_dma} == "1"} {
	  connect_bd_net -net cpu_reset \
		  [get_bd_pins u_dma_engine/M_AXI_ARESET]

	  connect_bd_net [get_bd_pins u_dma_engine/intr] \
	          [get_bd_pins u_custom_cpu/intr]

	  connect_bd_net [get_bd_pins u_dma_engine/reg_wdata] \
	          [get_bd_pins dma_axi_lite_if/bram_wrdata_a]

	  connect_bd_net [get_bd_pins u_dma_engine/reg_rdata] \
	          [get_bd_pins dma_axi_lite_if/bram_rddata_a]

	  connect_bd_net [get_bd_pins u_dma_mmio_wrapper/bram_we_a] \
	          [get_bd_pins dma_axi_lite_if/bram_we_a]
	  connect_bd_net [get_bd_pins u_dma_engine/reg_write] \
	          [get_bd_pins u_dma_mmio_wrapper/reg_write]

	  connect_bd_net [get_bd_pins u_dma_mmio_wrapper/bram_addr_a] \
	          [get_bd_pins dma_axi_lite_if/bram_addr_a]
	  connect_bd_net [get_bd_pins u_dma_engine/reg_addr] \
	          [get_bd_pins u_dma_mmio_wrapper/reg_addr]
  }

#=============================================
# AXI interface connection
#=============================================

  # AXI-Lite SHELL to ROLE master
  connect_bd_intf_net [get_bd_intf_ports axi_shell_to_role] \
      [get_bd_intf_pins cpu_reset_io_ic/S00_AXI]

  connect_bd_intf_net [get_bd_intf_pins cpu_reset_io/S_AXI] \
      [get_bd_intf_pins cpu_reset_io_ic/M00_AXI]

  connect_bd_intf_net [get_bd_intf_pins cpu_status_io/S_AXI] \
      [get_bd_intf_pins cpu_reset_io_ic/M01_AXI]

  # Custom CPU interface
  connect_bd_intf_net [get_bd_intf_pins ${mem_if_entity}/cpu_mem] \
      [get_bd_intf_pins custom_cpu_mem_arb/S00_AXI]

  connect_bd_intf_net [get_bd_intf_pins custom_cpu_mem_arb/M00_AXI] \
      [get_bd_intf_pins custom_cpu_mem_ic/S01_AXI]

  connect_bd_intf_net [get_bd_intf_pins custom_cpu_mem_arb/M01_AXI] \
      [get_bd_intf_pins custom_cpu_mmio_ic/S00_AXI]

  connect_bd_intf_net [get_bd_intf_pins ${inst_if_entity}/cpu_inst] \
      [get_bd_intf_pins custom_cpu_mem_ic/S00_AXI]

  # ROLE TO MEM I/F
  connect_bd_intf_net [get_bd_intf_pins cpu_ddr_upsizer/s_axi] \
      [get_bd_intf_pins custom_cpu_mem_ic/M00_AXI]

  connect_bd_intf_net [get_bd_intf_pins cpu_ddr_upsizer/m_axi] \
      [get_bd_intf_ports axi_role_to_mem]

  # ROLE TO SHELL I/F
  connect_bd_intf_net [get_bd_intf_ports axi_role_to_shell] \
      [get_bd_intf_pins custom_cpu_mmio_ic/M00_AXI]

  connect_bd_intf_net [get_bd_intf_pins custom_cpu_mmio_ic/M01_AXI] \
      [get_bd_intf_pins gpio_ic/S00_AXI]
      
  connect_bd_intf_net [get_bd_intf_pins custom_cpu_mmio_ic/M02_AXI] \
      [get_bd_intf_pins wall_clk_counter_wrapper/S_AXI]

  set i 0
  while {$i < 8} {
	  connect_bd_intf_net [get_bd_intf_pins gpio_ic/M0${i}_AXI] \
			[get_bd_intf_pins gpio_$i/S_AXI]

	  incr i 1
  }

  if {${::simple_dma} == "1"} {
	  connect_bd_intf_net [get_bd_intf_pins u_dma_engine/M_AXI] \
                  [get_bd_intf_pins custom_cpu_mem_ic/S03_AXI]

	  connect_bd_intf_net [get_bd_intf_pins dma_axi_lite_if/S_AXI] \
                  [get_bd_intf_pins custom_cpu_mmio_ic/M04_AXI]
  }

  if {${::dnn_acc} != "0"} {
	  connect_bd_intf_net [get_bd_intf_pins custom_cpu_mmio_ic/M03_AXI] \
	          [get_bd_intf_pins axi_gpio_dnn/S_AXI]

	  connect_bd_intf_net [get_bd_intf_pins u_dnn_acc_top/user_axi] \
	          [get_bd_intf_pins dnn_ddr_downsizer/S_AXI]
		  
	  connect_bd_intf_net [get_bd_intf_pins dnn_ddr_downsizer/M_AXI] \
	          [get_bd_intf_pins custom_cpu_mem_ic/S02_AXI]
  }

#=============================================
# Perf counter GPIO connection
#=============================================

  set i 0
  while {$i < 8} {
	  set idx [expr $i * 2]
	  connect_bd_net [get_bd_pins gpio_$i/gpio_io_i] \
	         [get_bd_pins u_custom_cpu/cpu_perf_cnt_$idx]

	  incr idx 1
	  connect_bd_net [get_bd_pins gpio_$i/gpio2_io_i] \
	         [get_bd_pins u_custom_cpu/cpu_perf_cnt_$idx]

	  incr i 1
  }
  connect_bd_net [get_bd_pins wall_clk_counter_wrapper/gpio_io_i] \
	[get_bd_pins u_wall_clk_counter/cnt_val]
	  
  connect_bd_net [get_bd_pins u_wall_clk_counter/cnt_clear] \
	[get_bd_pins wall_clk_counter_wrapper/gpio2_io_o]

  if {${::dnn_acc} != "0"} {
	  connect_bd_net [get_bd_pins u_dnn_acc_top/gpio_acc_start] \
	          [get_bd_pins axi_gpio_dnn/gpio_io_o]
	  connect_bd_net [get_bd_pins u_dnn_acc_top/acc_done_reg] \
	          [get_bd_pins axi_gpio_dnn/gpio2_io_i]
  }

#=============================================
# Create address segments
#=============================================
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces ${inst_if_entity}/cpu_inst] [get_bd_addr_segs axi_role_to_mem/Reg] CPU_INST
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs axi_role_to_mem/Reg] CPU_DATA
  if {${::simple_dma} == "1"} {
	  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces u_dma_engine/M_AXI] [get_bd_addr_segs axi_role_to_mem/Reg] DMA_MEM
	  create_bd_addr_seg -range 0x1000 -offset 0x60020000 [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs dma_axi_lite_if/S_AXI/Mem0] CPU_DMA_MMIO
  }

  if {${::dnn_acc} != "0"} {
	  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces u_dnn_acc_top/user_axi] [get_bd_addr_segs axi_role_to_mem/Reg] DNN_MEM
	  create_bd_addr_seg -range 0x1000 -offset 0x60030000 [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs axi_gpio_dnn/S_AXI/Reg] CPU_DNN_MMIO
  }

  create_bd_addr_seg -range 0x1000 -offset 0x60000000 [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs axi_role_to_shell/Reg] CPU_UART
  create_bd_addr_seg -range 0x1000 -offset 0x60040000 [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs wall_clk_counter_wrapper/S_AXI/Reg] CPU_WALL_CLK_COUNTER

  set i 0
  set addr_base 0x60010000
  while {$i < 8} {
	  set addr [expr $addr_base + 0x1000]
	  create_bd_addr_seg -range 0x1000 -offset $addr_base [get_bd_addr_spaces ${mem_if_entity}/cpu_mem] [get_bd_addr_segs gpio_$i/S_AXI/Reg] PERF_CNT_$i
	  incr i 1
	  set addr_base $addr
  }

  create_bd_addr_seg -range 0x1000 -offset 0x00020000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs cpu_reset_io/S_AXI/Reg] CPU_RESET_REG
  create_bd_addr_seg -range 0x1000 -offset 0x00021000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs cpu_status_io/S_AXI/Reg] CPU_STATUS_REG

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

