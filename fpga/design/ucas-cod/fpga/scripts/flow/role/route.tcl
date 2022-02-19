# routing
route_design

write_checkpoint -force ${dcp_dir}/route_${region}.dcp

report_utilization -file ${impl_rpt_dir}/post_route_util_${region}.rpt
report_timing_summary -file ${impl_rpt_dir}/post_route_timing_${region}.rpt -delay_type max -max_paths 20

report_route_status -file ${impl_rpt_dir}/post_route_status_${region}.rpt

exec mkdir -p ${out_dir}/${target_path}

# bitstream generation
write_bitstream -cell [get_cells mpsoc_i/accel_role_${region}/inst] \
    -force ${out_dir}/${target_path}/role_${region}.bit
write_cfgmem -format BIN -interface SMAPx32 \
    -disablebitswap -loadbit "up 0x0 ${out_dir}/${target_path}/role_${region}.bit" \
    -force ${out_dir}/role_${region}.bit.bin

