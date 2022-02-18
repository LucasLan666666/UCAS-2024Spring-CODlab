#========================================================
# Vivado project auto run script for mpsoc_kvs_platform
# Based on Vivado 2019.1
# Author: Yisong Chang (changyisong@ict.ac.cn)
# Date: 19/05/2020
#========================================================

# parsing argument
if {$argc != 5} {
	puts "Error: The argument should be hw_act val output_dir"
	exit
} else {
	set act [lindex $argv 0]
	set val [lindex $argv 1]
	set out_dir [lindex $argv 2]
	set board [lindex $argv 3]
	set prj [lindex $argv 4]
}

set script_dir [file dirname [info script]]
set design_dir ${script_dir}/../design/${prj}/scripts

# * For an FPGA design w/ both SHELL and ROLEs
## variable target:     specifies "shell" or "role" 
## variable component:  -- if ($target == "role" ): $component specifies a component to be implemented in the ROLE region 
##                      -- if ($target == "shell"): $component specifies the number of valid ROLEs in a SHELL
#
# * For an ordinary FPGA design
## variable target:     specifies the project name 
## variable component:  specifies the target FPGA board 
set target [lindex $val 0]
set component [lindex $val 1]

if { [file exists ${design_dir}/flow_setup.tcl] == 1 } {
	source [file join $design_dir "flow_setup.tcl"]
} else {
	set flow_dir ${design_dir}/flow
}

source [file join $script_dir "board/${board}.tcl"]
source [file join $script_dir "prologue.tcl"]

#====================
# Main flow
#====================
if {$act == "prj_gen"} {
	# project setup
	source [file join $script_dir "prj_setup.tcl"]
	source [file join $design_dir "prj_setup.tcl"]
	
	# Generate HDF
	write_hwdef -force -file ${out_dir}/system.hdf
	
	close_project

} elseif {$act == "run_syn"} {
	open_project ${prj_file}

	source [file join $flow_dir "synth.tcl"]

	close_project

} elseif {$act == "bit_gen"} {
	# Design optimization
	source [file join $flow_dir "opt.tcl"]
	# Placement
	source [file join $flow_dir "place.tcl"]
	# routing
	source [file join $flow_dir "route.tcl"]
	# bitstream generation
	if {$target == "shell"} {
		write_bitstream -force ${out_dir}/system.bit
	}

} elseif {$act == "dcp_chk"} {
	set dcp_obj [lindex $val 2]
	if {${dcp_obj} != "synth" && ${dcp_obj} != "place" && ${dcp_obj} != "route"} {
		puts "Error: Please specify the name of .dcp file to be opened"
		exit
	}
	open_checkpoint ${dcp_dir}/${dcp_obj}.dcp

} elseif {$act == "dcp_gen"} {
	set dcp_obj [lindex $val 2]
	if {$dcp_obj != "shell"} {
		source [file join $script_dir "prj_setup.tcl"]
	}
	# Launch tcl script whose name is specified by $target
	source [file join $design_dir "dcp_gen.tcl"]
} else {
	source [file join $design_dir "$act.tcl"]
}
