set flow_dir ${design_dir}/../fpga/scripts/flow/${target}

# variable region (used in bit_gen):  specify the required role number
set region [lindex $val 2]

# set the number of partial reconfiguration regions
# Currently support values are 1 and 5
# Leveraged in SHELL design
set role_num ${component}

# parsing ISA for custom CPU design
set is_custom_cpu [regexp {^custom_cpu_} ${component}]

if {${is_custom_cpu} == 1} {
	scan ${component} "custom_cpu_%s" arch
}

