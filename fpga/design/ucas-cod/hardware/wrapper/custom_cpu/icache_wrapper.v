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

module icache_wrapper (
	input          cpu_clk,
	input          cpu_reset,

	//Instruction request channel
	input  [31:0]   PC,
	input           Inst_Req_Valid,
	output          Inst_Req_Ready,

	//Instruction response channel
	output [31:0]   Instruction,
	output          Inst_Valid,
	input           Inst_Ready,

	//AXI AR Channel for instruction
	output [39:0]  cpu_inst_araddr,
	input          cpu_inst_arready,
	output         cpu_inst_arvalid,
	output [ 2:0]  cpu_inst_arsize,
	output [ 1:0]  cpu_inst_arburst,
	output [ 7:0]  cpu_inst_arlen,

	//AXI R Channel for instruction
	input  [31:0]  cpu_inst_rdata,
	output         cpu_inst_rready,
	input          cpu_inst_rvalid,
	input          cpu_inst_rlast
);

wire [31:0] to_mem_rd_req_addr;

icache_top	u_icache (
	.clk		(cpu_clk),
	.rst		(cpu_reset),
	
	//CPU interface
	.from_cpu_inst_req_valid  (Inst_Req_Valid),
	.from_cpu_inst_req_addr   (PC),
	.to_cpu_inst_req_ready    (Inst_Req_Ready),
	
	.to_cpu_cache_rsp_valid   (Inst_Valid),
	.to_cpu_cache_rsp_data    (Instruction),
	.from_cpu_cache_rsp_ready (Inst_Ready),

	//Memory interface
	.to_mem_rd_req_valid      (cpu_inst_arvalid),
	.to_mem_rd_req_addr       (to_mem_rd_req_addr),
	.from_mem_rd_req_ready    (cpu_inst_arready),

	.from_mem_rd_rsp_valid    (cpu_inst_rvalid),
	.from_mem_rd_rsp_data     (cpu_inst_rdata),
	.from_mem_rd_rsp_last     (cpu_inst_rlast),
	.to_mem_rd_rsp_ready      (cpu_inst_rready)
);

assign cpu_inst_araddr = {8'd0, to_mem_rd_req_addr};

/* CPU Inst AR channel */
assign cpu_inst_arsize  = 3'b010;
assign cpu_inst_arburst = 2'b01;
assign cpu_inst_arlen   = 8'd7;

endmodule
