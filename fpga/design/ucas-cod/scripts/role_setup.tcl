
if {${is_custom_cpu} == 1} {
	source [file join $design_dir "../fpga/wrapper/custom_cpu/role_setup.tcl"]
} else {
	source [file join $design_dir "../fpga/wrapper/${component}/role_setup.tcl"]
}
