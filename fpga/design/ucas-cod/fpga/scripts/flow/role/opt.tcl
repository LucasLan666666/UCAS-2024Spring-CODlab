# open shell checkpoint
open_checkpoint ${script_dir}/../design/${prj}/fpga/dcp/role_if_${region}.dcp

# open role checkpoint
read_checkpoint -cell [get_cells mpsoc_i/accel_role_${region}/inst] \
    ${dcp_dir}/synth.dcp

# setup output logs and reports
report_timing_summary -file ${synth_rpt_dir}/opt_timing_${region}.rpt -delay_type max -max_paths 20

# Design optimization
opt_design

