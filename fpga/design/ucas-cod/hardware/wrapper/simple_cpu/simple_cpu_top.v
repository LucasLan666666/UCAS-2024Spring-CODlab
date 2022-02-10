/* =========================================
* Top module for MIPS cores in the FPGA
* evaluation platform
*
* Author: Yisong Chang (changyisong@ict.ac.cn)
* Date: 19/03/2017
* Version: v0.0.1
*===========================================
*/

`timescale 10 ns / 1 ns

module simple_cpu_top (

	//AXI AR Channel
    input  [13:0]        simple_cpu_axi_if_araddr,
    output               simple_cpu_axi_if_arready,
    input                simple_cpu_axi_if_arvalid,

	//AXI AW Channel
    input  [13:0]        simple_cpu_axi_if_awaddr,
    output               simple_cpu_axi_if_awready,
    input                simple_cpu_axi_if_awvalid,

	//AXI B Channel
    input                simple_cpu_axi_if_bready,
    output [ 1:0]        simple_cpu_axi_if_bresp,
    output               simple_cpu_axi_if_bvalid,

	//AXI R Channel
    output [31:0]	 simple_cpu_axi_if_rdata,
    input                simple_cpu_axi_if_rready,
    output [ 1:0]	 simple_cpu_axi_if_rresp,
    output               simple_cpu_axi_if_rvalid,

	//AXI W Channel
    input  [31:0]        simple_cpu_axi_if_wdata,
    output               simple_cpu_axi_if_wready,
    input  [ 3:0]        simple_cpu_axi_if_wstrb,
    input                simple_cpu_axi_if_wvalid,

    input                clk,
    input                resetn,
    input                cpu_rst
);

//at most 8KB ideal memory, so MEM_ADDR_WIDTH cannot exceed 13
localparam		MEM_ADDR_WIDTH = 12;

//AXI Lite IF ports to distributed memory
wire [MEM_ADDR_WIDTH - 3:0]  axi_lite_mem_addr;

wire			axi_lite_mem_wren;
wire [31:0]		axi_lite_mem_wdata;
wire			axi_lite_mem_rden;
wire [31:0]		axi_lite_mem_rdata;

//MIPS CPU ports to ideal memory
wire [31:0]		cpu_mem_addr;
wire			MemWrite;
wire [31:0]		cpu_mem_wdata;
wire			MemRead;
wire [3:0]		cpu_mem_wstrb;
wire [31:0]		cpu_mem_rdata;

wire [31:0]		PC;
wire [31:0]		Instruction;

//read arbitration signal
wire			cpu_mem_rd;
wire			axi_lite_mem_rd;

//Ideal memory ports
wire [MEM_ADDR_WIDTH - 3:0]	Waddr;
wire [MEM_ADDR_WIDTH - 3:0]	Raddr;

wire			Wren;
wire [31:0]		Wdata;
wire [ 3:0]		Wstrb;
wire			Rden;
wire [31:0]		Rdata;

  //AXI Lite Interface Module
  //Receving memory read/write requests from ARM CPU cores
  axi_lite_if 	#(
	  .ADDR_WIDTH		(MEM_ADDR_WIDTH)
  ) u_axi_lite_slave (
	  .S_AXI_ACLK		(clk),
	  .S_AXI_ARESETN	(resetn),
	  
	  .S_AXI_ARADDR		(simple_cpu_axi_if_araddr),
	  .S_AXI_ARREADY	(simple_cpu_axi_if_arready),
	  .S_AXI_ARVALID	(simple_cpu_axi_if_arvalid),
	  
	  .S_AXI_AWADDR		(simple_cpu_axi_if_awaddr),
	  .S_AXI_AWREADY	(simple_cpu_axi_if_awready),
	  .S_AXI_AWVALID	(simple_cpu_axi_if_awvalid),
	  
	  .S_AXI_BREADY		(simple_cpu_axi_if_bready),
	  .S_AXI_BRESP		(simple_cpu_axi_if_bresp),
	  .S_AXI_BVALID		(simple_cpu_axi_if_bvalid),
	  
	  .S_AXI_RDATA		(simple_cpu_axi_if_rdata),
	  .S_AXI_RREADY		(simple_cpu_axi_if_rready),
	  .S_AXI_RRESP		(simple_cpu_axi_if_rresp),
	  .S_AXI_RVALID		(simple_cpu_axi_if_rvalid),
	  
	  .S_AXI_WDATA		(simple_cpu_axi_if_wdata),
	  .S_AXI_WREADY		(simple_cpu_axi_if_wready),
	  .S_AXI_WSTRB		(simple_cpu_axi_if_wstrb),
	  .S_AXI_WVALID		(simple_cpu_axi_if_wvalid),
	  
	  .AXI_Address		(axi_lite_mem_addr),
	  .AXI_MemRead		(axi_lite_mem_rden),
	  .AXI_MemWrite		(axi_lite_mem_wren),
	  .AXI_Read_data	(axi_lite_mem_rdata),
	  .AXI_Write_data	(axi_lite_mem_wdata)
  );

//MIPS CPU cores
  simple_cpu	u_simple_cpu (	
	  .clk          (clk),
	  .rst          (cpu_rst),

	  .PC           (PC),
	  .Instruction	(Instruction),

	  .Address      (cpu_mem_addr),
	  .MemWrite     (MemWrite),
	  .Write_data	(cpu_mem_wdata),
	  .Write_strb	(cpu_mem_wstrb),
	  .MemRead      (MemRead),
	  .Read_data	(cpu_mem_rdata)
  );

/*
 * ============================================================== 
 * Memory read arbitration between AXI Lite IF and MIPS CPU
 * ==============================================================
 */

  //AXI Lite IF can read distributed memory only when MIPS CPU has no memory operations
  //if contention occurs, return 0xFFFFFFFF to Read_data port of AXI Lite IF
  assign cpu_mem_rd = MemRead & (~cpu_rst);
  assign axi_lite_mem_rd = axi_lite_mem_rden & (cpu_rst | (~MemRead));
  
  assign Rden = cpu_mem_rd | axi_lite_mem_rd;

  assign axi_lite_mem_rdata = ({32{axi_lite_mem_rd}} & Rdata) | ({32{~axi_lite_mem_rd}});

  assign cpu_mem_rdata = {32{cpu_mem_rd}} & Rdata;

  assign Raddr = ({MEM_ADDR_WIDTH-2{cpu_mem_rd}} & cpu_mem_addr[MEM_ADDR_WIDTH - 1:2]) | 
		 ({MEM_ADDR_WIDTH-2{axi_lite_mem_rd}} & axi_lite_mem_addr);

/*
 * ==============================================================
 * Memory write arbitration between AXI Lite IF and MIPS CPU
 * ==============================================================
 */
  //AXI Lite IF only generates memory write requests before MIPS CPU is running
  assign Wren = MemWrite | axi_lite_mem_wren;

  assign Wdata = ({32{MemWrite}} & cpu_mem_wdata) | 
		 ({32{axi_lite_mem_wren}} & axi_lite_mem_wdata);

  assign Wstrb = ({4{MemWrite}} & cpu_mem_wstrb) | 
		 ({4{axi_lite_mem_wren}} & 4'b1111);

  assign Waddr = ({MEM_ADDR_WIDTH-2{MemWrite}} & cpu_mem_addr[MEM_ADDR_WIDTH - 1:2]) | 
		 ({MEM_ADDR_WIDTH-2{axi_lite_mem_wren}} & axi_lite_mem_addr);

  //Distributed memory module used as main memory of MIPS CPU
  ideal_mem		# (
	  .ADDR_WIDTH	(MEM_ADDR_WIDTH)
  ) u_ideal_mem (
	  .clk			(clk),
	  
	  .Waddr		(Waddr),
	  .Raddr1		(PC[MEM_ADDR_WIDTH - 1:2]),
	  .Raddr2		(Raddr),

	  .Wren			(Wren),
	  .Rden1		(1'b1),
	  .Rden2		(Rden),

	  .Wdata		(Wdata),
	  .Wstrb		(Wstrb),
	  .Rdata1		(Instruction),
	  .Rdata2		(Rdata)
  );

endmodule

