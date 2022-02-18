set sch_dir ${target_prj}/${target_path}/sch
exec mkdir -p ${sch_dir}

source [file join $design_dir "rtl_chk.tcl"]

write_schematic -format pdf -force ${sch_dir}/${top_module}.pdf

exit
