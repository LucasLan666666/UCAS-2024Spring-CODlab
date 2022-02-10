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

module mem_if_wrapper (
	input           cpu_clk,
	input           cpu_reset,

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
	output [39:0]	cpu_mem_araddr,
	input		cpu_mem_arready,
	output		cpu_mem_arvalid,
	output [ 2:0]	cpu_mem_arsize,
	output [ 1:0]	cpu_mem_arburst,
	output [ 7:0]	cpu_mem_arlen,

	//AXI AW Channel for mem
	output reg [39:0] cpu_mem_awaddr,
	input             cpu_mem_awready,
	output reg 	  cpu_mem_awvalid,
	output      [2:0] cpu_mem_awsize,
	output      [1:0] cpu_mem_awburst,
	output      [7:0] cpu_mem_awlen,

	//AXI B Channel for mem
	output          cpu_mem_bready,
	input		cpu_mem_bvalid,

	//AXI R Channel for mem
	input  [31:0]	cpu_mem_rdata,
	output		cpu_mem_rready,
	input		cpu_mem_rvalid,
	input		cpu_mem_rlast,

	//AXI W Channel for mem
	output reg [31:0]  cpu_mem_wdata,
	input		   cpu_mem_wready,
	output reg [ 3:0]  cpu_mem_wstrb,
	output reg         cpu_mem_wvalid,
	output reg         cpu_mem_wlast
);

/* CPU MEM AR channel */
assign cpu_mem_araddr  = {8'd0, {32{MemRead}} & Address};
assign cpu_mem_arvalid = MemRead;
assign cpu_mem_arsize  = 3'b010;
assign cpu_mem_arburst = 2'b01;
assign cpu_mem_arlen   = 8'd0;

/* CPU MEM AW and W channel */
assign cpu_mem_awsize  = 3'b010;
assign cpu_mem_awburst = 2'b01;
assign cpu_mem_awlen   = 8'd0;

reg    aw_req_ack_tag;
reg    w_req_ack_tag;

//AW channel
always @(posedge cpu_clk)
begin
	if (cpu_reset == 1'b1)
	begin
		cpu_mem_awaddr <= 'd0;
		cpu_mem_awvalid <= 1'b0;
		aw_req_ack_tag <= 1'b0;
	end

	else if (~cpu_mem_awvalid & (~cpu_mem_wvalid) & MemWrite & (~Mem_Req_Ready))
	begin
		cpu_mem_awaddr <= {8'd0, Address};
		cpu_mem_awvalid <= 1'b1;
		aw_req_ack_tag <= 1'b0;
	end

	else if (cpu_mem_awvalid & cpu_mem_awready)
	begin
		cpu_mem_awaddr <= 'd0;
		cpu_mem_awvalid <= 1'b0;
		aw_req_ack_tag <= 1'b1;
	end

	else if (aw_req_ack_tag & w_req_ack_tag)
	begin
		cpu_mem_awaddr <= 'd0;
		cpu_mem_awvalid <= 'd0;
		aw_req_ack_tag <= 1'b0;
	end
end

//W channel
always @(posedge cpu_clk)
begin
	if (cpu_reset == 1'b1)
	begin
		cpu_mem_wdata <= 'd0;
		cpu_mem_wstrb <= 4'b0;
		cpu_mem_wvalid <= 1'b0;
		cpu_mem_wlast <= 1'b0;
		w_req_ack_tag <= 1'b0;
	end

	else if (~cpu_mem_awvalid & (~cpu_mem_wvalid) & MemWrite & (~Mem_Req_Ready))
	begin
		cpu_mem_wdata <= Write_data;
		cpu_mem_wstrb <= Write_strb;
		cpu_mem_wvalid <= 1'b1;
		cpu_mem_wlast <= 1'b1;
		w_req_ack_tag <= 1'b0;
	end

	else if (cpu_mem_wvalid & cpu_mem_wready)
	begin
		cpu_mem_wdata <= 'd0;
		cpu_mem_wstrb <= 4'b0;
		cpu_mem_wvalid <= 1'b0;
		cpu_mem_wlast <= 1'b0;
		w_req_ack_tag <= 1'b1;
	end

	else if (aw_req_ack_tag & w_req_ack_tag)
	begin
		cpu_mem_wdata <= 'd0;
		cpu_mem_wstrb <= 'd0;
		cpu_mem_wvalid <= 1'b0;
		cpu_mem_wlast <= 1'b0;
		w_req_ack_tag <= 1'b0;
	end
end

assign Mem_Req_Ready = (MemWrite & aw_req_ack_tag & w_req_ack_tag) | 
	               (MemRead & cpu_mem_arready);

/* CPU MEM B channel */
assign cpu_mem_bready = 1'b1;

/* CPU MEM R channel */
assign Read_data       = cpu_mem_rdata;
assign Read_data_Valid = cpu_mem_rvalid;
assign cpu_mem_rready  = Read_data_Ready;

endmodule
