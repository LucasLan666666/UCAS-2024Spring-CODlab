# parsing target and component
if {${target} != ""} {
	if {${component} == ""} {
		set target_path ${target}
	} else {
		set target_path ${target}_${component}
	}
}

# project name
set project_name ${prj}_${board}
set prj_file ${project_name}/${target_path}/${project_name}.xpr

# output directories
set vivado_out ${script_dir}/../vivado_out
set target_prj ${vivado_out}/${project_name}

exec mkdir -p ${target_prj}/${target_path}

set synth_rpt_dir ${target_prj}/${target_path}/synth_rpt
set impl_rpt_dir ${target_prj}/${target_path}/impl_rpt
set dcp_dir ${target_prj}/${target_path}/dcp

exec mkdir -p ${synth_rpt_dir} ${impl_rpt_dir} ${dcp_dir}
