source [file join $script_dir "prj_setup.tcl"]

# add custom_cpu source HDL files
if {${is_custom_cpu} == 1} {
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/${arch}

	# add cache source HDL files
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/cache/
	
	# add dma source HDL files
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/custom_cpu/dma/
}

# add simple cpu HDL files
if {${component} == "simple_cpu"} {
	add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/simple_cpu/
}

# add reg_file, alu and shifter source HDL files
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/shifter/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/alu/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/reg_file/
add_files -norecurse -fileset sources_1 ${script_dir}/../design/${prj}/hardware/sources/example/

if {${is_custom_cpu} == 1} {
	set top_module custom_cpu
} elseif {${component} == "example"} {
	set top_module adder
} else {
	set top_module ${component}
}

# RTL check and generate schematics
synth_design -rtl -rtl_skip_constraints -rtl_skip_ip -top ${top_module}
