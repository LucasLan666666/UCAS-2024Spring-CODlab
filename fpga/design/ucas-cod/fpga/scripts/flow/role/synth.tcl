# synthesizing full design
synth_design -top custom_role -part ${device} -mode out_of_context \
    -directive default -flatten_hierarchy rebuilt -max_uram 0

# checking potential combinational loops
check_timing -verbose

# setup output logs and reports
report_utilization -hierarchical -file ${synth_rpt_dir}/synth_util_hier.rpt
report_utilization -file ${synth_rpt_dir}/synth_util.rpt

# write checkpoint
write_checkpoint -force ${dcp_dir}/synth.dcp

