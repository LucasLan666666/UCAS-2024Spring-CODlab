set cpu_isa $env(CPU_ISA)
set sim_dut_type $env(SIM_DUT_TYPE)

# add top module of ROLE region
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/fpga/sources/hdl/custom_role.v

# add transformed sources
add_files -norecurse -fileset sources_1 ${script_dir}/../emu_out/emu_dut.v

# add files for FPGA
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/emu/include/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/emu/fpga_srcs/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/emu/custom_cpu/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/emu/custom_cpu/golden/${cpu_isa}.v
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/wrapper/custom_cpu/

# setup block design
set bd_design role
source [file dirname [info script]]/${bd_design}.tcl

set_property synth_checkpoint_mode None [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd]
generate_target all [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd]

make_wrapper -files [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd] -top
exec cp -r ./${project_name}/${target_path}/${project_name}.gen/sources_1/bd/${bd_design} \
    ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/
import_files -force -norecurse -fileset sources_1 ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/hdl/${bd_design}_wrapper.v

validate_bd_design
save_bd_design
close_bd_design ${bd_design}

# setup top module
set_property top custom_role [get_filesets sources_1]

