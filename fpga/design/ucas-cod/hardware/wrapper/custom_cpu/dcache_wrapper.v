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

module dcache_wrapper (
	input          cpu_clk,
	input          cpu_reset,

	//Memory request channel
	input  [31:0]   Address,
	input           MemWrite,
	input  [31:0]   Write_data,
	input  [ 3:0]   Write_strb,
	input           MemRead,
	output          Mem_Req_Ready,

	//Memory data response channel
	output [31:0]   Read_data,
	output          Read_data_Valid,
	input           Read_data_Ready, 

	//AXI AR Channel for data
	output [39:0]  cpu_mem_araddr,
	input          cpu_mem_arready,
	output         cpu_mem_arvalid,
	output [ 2:0]  cpu_mem_arsize,
	output [ 1:0]  cpu_mem_arburst,
	output [ 7:0]  cpu_mem_arlen,

	//AXI AW Channel for mem
	output [39:0]  cpu_mem_awaddr,
	input          cpu_mem_awready,
	output         cpu_mem_awvalid,
	output [ 2:0]  cpu_mem_awsize,
	output [ 1:0]  cpu_mem_awburst,
	output [ 7:0]  cpu_mem_awlen,

	//AXI B Channel for mem
	output         cpu_mem_bready,
	input          cpu_mem_bvalid,

	//AXI R Channel for mem
	input  [31:0]  cpu_mem_rdata,
	output         cpu_mem_rready,
	input          cpu_mem_rvalid,
	input          cpu_mem_rlast,

	//AXI W Channel for mem
	output [31:0]  cpu_mem_wdata,
	output [ 3:0]  cpu_mem_wstrb,
	input          cpu_mem_wready,
	output         cpu_mem_wvalid,
	output         cpu_mem_wlast
);

wire [31:0]  to_mem_rd_req_addr;
wire [31:0]  to_mem_wr_req_addr;       

dcache_top	u_dcache (
	.clk		(cpu_clk),
	.rst		(cpu_reset),
	
	//CPU interface
	.from_cpu_mem_req_valid    (MemRead | MemWrite),
	.from_cpu_mem_req          ( (~MemRead) | MemWrite ),
	.from_cpu_mem_req_addr     (Address),
	.from_cpu_mem_req_wdata    (Write_data),
	.from_cpu_mem_req_wstrb    (Write_strb),
	.to_cpu_mem_req_ready      (Mem_Req_Ready),
	
	.to_cpu_cache_rsp_valid    (Read_data_Valid),
	.to_cpu_cache_rsp_data     (Read_data),
	.from_cpu_cache_rsp_ready  (Read_data_Ready),

	//Memory interface
	.to_mem_rd_req_valid       (cpu_mem_arvalid),
	.to_mem_rd_req_addr        (to_mem_rd_req_addr),
	.to_mem_rd_req_len         (cpu_mem_arlen),
	.from_mem_rd_req_ready     (cpu_mem_arready),

	.from_mem_rd_rsp_valid     (cpu_mem_rvalid),
	.from_mem_rd_rsp_data      (cpu_mem_rdata),
	.from_mem_rd_rsp_last      (cpu_mem_rlast),
	.to_mem_rd_rsp_ready       (cpu_mem_rready),

	.to_mem_wr_req_valid       (cpu_mem_awvalid),
	.to_mem_wr_req_addr        (to_mem_wr_req_addr),
	.to_mem_wr_req_len         (cpu_mem_awlen),
	.from_mem_wr_req_ready     (cpu_mem_awready),

	.to_mem_wr_data_valid      (cpu_mem_wvalid),
	.to_mem_wr_data            (cpu_mem_wdata),
	.to_mem_wr_data_strb       (cpu_mem_wstrb),
	.to_mem_wr_data_last       (cpu_mem_wlast),
	.from_mem_wr_data_ready    (cpu_mem_wready)
);

assign cpu_mem_araddr = {8'd0, to_mem_rd_req_addr};
assign cpu_mem_awaddr = {8'd0, to_mem_wr_req_addr};

/* CPU MEM AR/AW channel */
assign cpu_mem_arsize  = 3'b010;
assign cpu_mem_arburst = 2'b01;
assign cpu_mem_awsize  = 3'b010;
assign cpu_mem_awburst = 2'b01;

/* CPU MEM B channel */
assign cpu_mem_bready  = 1'b1;

endmodule
