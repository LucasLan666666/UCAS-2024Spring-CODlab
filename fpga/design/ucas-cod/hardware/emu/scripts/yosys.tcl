set recheck_tcl [exec recheck --tcl]
set script_dir [file dirname [info script]]
# output_dir = fpga/emu_out
set output_dir ${script_dir}/../../../../../emu_out
set arch $env(CPU_ISA)
set dut $env(SIM_DUT_TYPE)
source ${script_dir}/../../sources/custom_cpu/arch_options.tcl

if {${icache} == "1"} {
    yosys verilog_defines -DUSE_ICACHE
}

if {${dcache} == "1"} {
    yosys verilog_defines -DUSE_DCACHE
}

if {${simple_dma} == "1"} {
    yosys verilog_defines -DUSE_DMA
}

if {${dut} == "multi_cycle"} {
    yosys verilog_defines -DTRACECMP_MULTI_CYCLE
}

yosys read_verilog -I ${script_dir}/../include ${script_dir}/../custom_cpu/*.v
yosys read_verilog ${script_dir}/../custom_cpu/golden/${arch}.v
yosys read_verilog ${script_dir}/../../sources/custom_cpu/${arch}/*.v
yosys read_verilog ${script_dir}/../../sources/custom_cpu/cache/*.v
yosys read_verilog ${script_dir}/../../sources/custom_cpu/dma/*.v
yosys read_verilog ${script_dir}/../../sources/shifter/*.v
yosys read_verilog ${script_dir}/../../sources/alu/*.v
yosys read_verilog ${script_dir}/../../sources/reg_file/*.v
yosys read_verilog ${script_dir}/../../wrapper/custom_cpu/*.v

set argv [list -top emu_top -sc ${output_dir}/scanchain.yml]
set argc [llength $argv]
source ${recheck_tcl}

yosys write_verilog ${output_dir}/emu_dut.v
