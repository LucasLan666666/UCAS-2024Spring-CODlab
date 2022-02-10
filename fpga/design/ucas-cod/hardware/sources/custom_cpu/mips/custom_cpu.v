`timescale 10ns / 1ns

module custom_cpu(
	input         clk,
	input         rst,

	//Instruction request channel
	output [31:0] PC,
	output        Inst_Req_Valid,
	input         Inst_Req_Ready,

	//Instruction response channel
	input  [31:0] Instruction,
	input         Inst_Valid,
	output        Inst_Ready,

	//Memory request channel
	output [31:0] Address,
	output        MemWrite,
	output [31:0] Write_data,
	output [ 3:0] Write_strb,
	output        MemRead,
	input         Mem_Req_Ready,

	//Memory data response channel
	input  [31:0] Read_data,
	input         Read_data_Valid,
	output        Read_data_Ready,

	input         intr,

	output [31:0] cpu_perf_cnt_0,
	output [31:0] cpu_perf_cnt_1,
	output [31:0] cpu_perf_cnt_2,
	output [31:0] cpu_perf_cnt_3,
	output [31:0] cpu_perf_cnt_4,
	output [31:0] cpu_perf_cnt_5,
	output [31:0] cpu_perf_cnt_6,
	output [31:0] cpu_perf_cnt_7,
	output [31:0] cpu_perf_cnt_8,
	output [31:0] cpu_perf_cnt_9,
	output [31:0] cpu_perf_cnt_10,
	output [31:0] cpu_perf_cnt_11,
	output [31:0] cpu_perf_cnt_12,
	output [31:0] cpu_perf_cnt_13,
	output [31:0] cpu_perf_cnt_14,
	output [31:0] cpu_perf_cnt_15
);

/* The following two signals are leveraged for behavioral simulation, 
* both of which are delivered to testbench.
*
* STUDENTS MUST CONTROL LOGICAL BEHAVIORS of BOTH SIGNALS.
*
* inst_retire_valid (1-bit): setting to 1 for one-cycle 
* when inst_retired_fifo_full from testbench is low,  
* indicating that one instruction is being retired from
* the WB stage. 
*
* inst_retired (70-bit): detailed information of the retired instruction,
* mainly including (in order) 
* { 
*   retired PC (32-bit), 
*   reg_file write-back enable (1-bit), 
*   reg_file write-back address (5-bit), 
*   reg_file write-back data (32-bit) 
* }
*
*/
`ifdef BHV_SIM
	wire        inst_retire_valid;
	wire [69:0] inst_retired;
`endif

endmodule
