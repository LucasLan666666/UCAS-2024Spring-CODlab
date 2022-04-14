# set custom IP repo path
set_property ip_repo_paths ${script_dir}/../design/${prj}/fpga/sources/ip_catalog [current_fileset]
update_ip_catalog -rebuild

# add custom_cpu source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/${arch}

# add cache source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/cache/

# add cache source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/dma/

# add reg_file, alu and shifter source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/shifter/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/alu/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/reg_file/

# add source HDL files of fixed components in custom_cpu 
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/wrapper/custom_cpu/

# add top module of ROLE region
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/fpga/sources/hdl/custom_role.v

# User-specified architecture options of custom CPU
source [file join $design_dir "../hardware/sources/custom_cpu/arch_options.tcl"]

# setup block design
set bd_design role
source ${script_dir}/../design/${prj}/fpga/wrapper/custom_cpu/${bd_design}.tcl

set_property synth_checkpoint_mode None [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd]
generate_target all [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd]

make_wrapper -files [get_files ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/${bd_design}.bd] -top
exec cp -r ./${project_name}/${target_path}/${project_name}.gen/sources_1/bd/${bd_design} \
    ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/
import_files -force -norecurse -fileset sources_1 ./${project_name}/${target_path}/${project_name}.srcs/sources_1/bd/${bd_design}/hdl/${bd_design}_wrapper.v

validate_bd_design
save_bd_design
close_bd_design ${bd_design}
			
# dnn_acc = 0: NOT using DNN accelerator
# dnn_acc = 1: using default DNN accelerator
# dnn_acc = 2: using custom DNN accelerator
if {${::dnn_acc} == "2"} {
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_dnn_acc/dnn_acc.dcp
} elseif {${::dnn_acc} == "1"} {
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/fpga/dcp/dnn_acc.dcp
}

# setup top module
set_property top custom_role [get_filesets sources_1]

