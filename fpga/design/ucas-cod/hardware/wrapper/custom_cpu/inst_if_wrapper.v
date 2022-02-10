/* =========================================
* AXI wrapper for custom CPU in the FPGA
* evaluation platform
*
* Author: Yisong Chang (changyisong@ict.ac.cn)
* Date: 29/02/2020
* Version: v0.0.1
*===========================================
*/

`timescale 10 ns / 1 ns

module inst_if_wrapper (
	input           cpu_clk,
	input           cpu_reset,

	//Instruction request channel
	input  [31:0]   PC,
	input           Inst_Req_Valid,
	output          Inst_Req_Ready,

	//Instruction response channel
	output [31:0]   Instruction,
	output          Inst_Valid,
	input           Inst_Ready,

	//AXI AR Channel for instruction
	output [39:0]	cpu_inst_araddr,
	input		cpu_inst_arready,
	output		cpu_inst_arvalid,
	output [ 2:0]	cpu_inst_arsize,
	output [ 1:0]	cpu_inst_arburst,
	output [ 7:0]	cpu_inst_arlen,

	//AXI R Channel for instruction
	input  [31:0]	cpu_inst_rdata,
	output		cpu_inst_rready,
	input		cpu_inst_rvalid,
	input		cpu_inst_rlast
);


/* CPU Inst AR channel */
assign cpu_inst_arsize  = 3'b010;
assign cpu_inst_arburst = 2'b01;
assign cpu_inst_arlen   = 8'd0;

assign cpu_inst_araddr   = {8'd0, PC};
assign cpu_inst_arvalid  = Inst_Req_Valid;
assign Inst_Req_Ready    = cpu_inst_arready;

assign Instruction  = cpu_inst_rdata;
assign Inst_Valid   = cpu_inst_rvalid;
assign cpu_inst_rready = Inst_Ready;	

endmodule

