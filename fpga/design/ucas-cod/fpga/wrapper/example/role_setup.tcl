# add example source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/example/

# add top module of ROLE region
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/fpga/sources/hdl/custom_role.v

# setup block design
set bd_design role
source ${script_dir}/../design/${prj}/fpga/wrapper/example/${bd_design}.tcl

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

