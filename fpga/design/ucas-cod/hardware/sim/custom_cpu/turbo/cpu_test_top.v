/* =========================================
* Top module of custom CPU with 
* 1). a fixed design that contains 
* a number of AXI ICs, and 
* 2). clock wizard that generates 
* CPU source clock. 
*
* Author: Yisong Chang (changyisong@ict.ac.cn)
* Date: 29/02/2020
* Version: v0.0.1
*===========================================
*/

`timescale 10 ns / 1 ns

module cpu_test_top  #
(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 14,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 4,
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
) (
	input sys_clk,
	input sys_reset_n
);

  wire cpu_clk     = sys_clk;
  wire cpu_reset_n = sys_reset_n;

  wire [39:0] cpu_inst_araddr;
  wire [ 1:0] cpu_inst_arburst;
  wire [ 3:0] cpu_inst_arcache;
  wire [ 7:0] cpu_inst_arlen;
  wire [ 0:0] cpu_inst_arlock;
  wire [ 2:0] cpu_inst_arprot;
  wire [ 3:0] cpu_inst_arqos;
  wire        cpu_inst_arready;
  wire [ 2:0] cpu_inst_arsize;
  wire        cpu_inst_arvalid;
  wire [31:0] cpu_inst_rdata;
  wire        cpu_inst_rlast;
  wire        cpu_inst_rready;
  wire [ 1:0] cpu_inst_rresp;
  wire        cpu_inst_rvalid;

  wire [39:0] cpu_mem_araddr;
  wire [ 1:0] cpu_mem_arburst;
  wire [ 3:0] cpu_mem_arcache;
  wire [ 7:0] cpu_mem_arlen;
  wire [ 0:0] cpu_mem_arlock;
  wire [ 2:0] cpu_mem_arprot;
  wire [ 3:0] cpu_mem_arqos;
  wire [ 0:0] cpu_mem_arready;
  wire [ 2:0] cpu_mem_arsize;
  wire [ 0:0] cpu_mem_arvalid;
  wire [39:0] cpu_mem_awaddr;
  wire [ 1:0] cpu_mem_awburst;
  wire [ 3:0] cpu_mem_awcache;
  wire [ 7:0] cpu_mem_awlen;
  wire [ 0:0] cpu_mem_awlock;
  wire [ 2:0] cpu_mem_awprot;
  wire [ 3:0] cpu_mem_awqos;
  wire [ 0:0] cpu_mem_awready;
  wire [ 2:0] cpu_mem_awsize;
  wire [ 0:0] cpu_mem_awvalid;
  wire [ 0:0] cpu_mem_bready;
  wire [ 1:0] cpu_mem_bresp;
  wire [ 0:0] cpu_mem_bvalid;
  wire [31:0] cpu_mem_rdata;
  wire [ 0:0] cpu_mem_rlast;
  wire [ 0:0] cpu_mem_rready;
  wire [ 1:0] cpu_mem_rresp;
  wire [ 0:0] cpu_mem_rvalid;
  wire [31:0] cpu_mem_wdata;
  wire [ 0:0] cpu_mem_wlast;
  wire [ 0:0] cpu_mem_wready;
  wire [ 3:0] cpu_mem_wstrb;
  wire [ 0:0] cpu_mem_wvalid;

  wire [ID_WIDTH-1:0]    s_axi_awid;
  wire [ADDR_WIDTH-1:0]  s_axi_awaddr;
  wire [7:0]             s_axi_awlen;
  wire [2:0]             s_axi_awsize;
  wire [1:0]             s_axi_awburst;
  wire                   s_axi_awlock;
  wire [3:0]             s_axi_awcache;
  wire [2:0]             s_axi_awprot;
  wire                   s_axi_awvalid;
  wire                   s_axi_awready;
  wire [DATA_WIDTH-1:0]  s_axi_wdata;
  wire [STRB_WIDTH-1:0]  s_axi_wstrb;
  wire                   s_axi_wlast;
  wire                   s_axi_wvalid;
  wire                   s_axi_wready;
  wire [ID_WIDTH-1:0]    s_axi_bid;
  wire [1:0]             s_axi_bresp;
  wire                   s_axi_bvalid;
  wire                   s_axi_bready;
  wire [ID_WIDTH-1:0]    s_axi_arid;
  wire [ADDR_WIDTH-1:0]  s_axi_araddr;
  wire [7:0]             s_axi_arlen;
  wire [2:0]             s_axi_arsize;
  wire [1:0]             s_axi_arburst;
  wire                   s_axi_arlock;
  wire [3:0]             s_axi_arcache;
  wire [2:0]             s_axi_arprot;
  wire                   s_axi_arvalid;
  wire                   s_axi_arready;
  wire [ID_WIDTH-1:0]    s_axi_rid;
  wire [DATA_WIDTH-1:0]  s_axi_rdata;
  wire [1:0]             s_axi_rresp;
  wire                   s_axi_rlast;
  wire                   s_axi_rvalid;
  wire                   s_axi_rready;
  
  
  wire [31:0] PC;
  wire        Inst_Req_Valid;
  wire        Inst_Req_Ready;
  
  wire [31:0] Instruction;
  wire        Inst_Valid;
  wire        Inst_Ready;

  wire [31:0] Address;
  wire        MemWrite;
  wire [31:0] Write_data;
  wire [ 3:0] Write_strb;
  wire        MemRead;
  wire        Mem_Req_Ready;
  
  wire [31:0] Read_data;
  wire        Read_data_Valid;
  wire        Read_data_Ready; 

  wire [4:0]  random_mask;

  //custom CPU core
  custom_cpu	u_cpu (	
	.clk	        (cpu_clk),
	.rst	        (~cpu_reset_n),
	  
	.PC		(PC),
	.Inst_Req_Valid	(Inst_Req_Valid),
	.Inst_Req_Ready	(Inst_Req_Ready),
	  
	.Instruction	(Instruction),
	.Inst_Valid	(Inst_Valid),
	.Inst_Ready	(Inst_Ready),
	  
	.Address	(Address),
	.MemWrite	(MemWrite),
	.Write_data	(Write_data),
	.Write_strb	(Write_strb),
	.MemRead	(MemRead),
	.Mem_Req_Ready	(Mem_Req_Ready),
	  
	.Read_data	 (Read_data	),
	.Read_data_Valid (Read_data_Valid),
	.Read_data_Ready (Read_data_Ready)
  );

`ifdef USE_ICACHE 
  icache_wrapper  u_icache_wrapper (
`else
  inst_if_wrapper u_inst_if_wrapper (
`endif
	.cpu_clk        (cpu_clk),
	.cpu_reset      (~cpu_reset_n),

	.PC		(PC),
	.Inst_Req_Valid	(Inst_Req_Valid),
	.Inst_Req_Ready	(Inst_Req_Ready),
	  
	.Instruction	(Instruction),
	.Inst_Valid	(Inst_Valid),
	.Inst_Ready	(Inst_Ready),

	.cpu_inst_araddr  (cpu_inst_araddr ),
	.cpu_inst_arready (cpu_inst_arready),
	.cpu_inst_arvalid (cpu_inst_arvalid),
	.cpu_inst_arsize  (cpu_inst_arsize ),
	.cpu_inst_arburst (cpu_inst_arburst),
	.cpu_inst_arlen   (cpu_inst_arlen  ),
	                      
	.cpu_inst_rdata   (cpu_inst_rdata ),
	.cpu_inst_rready  (cpu_inst_rready),
	.cpu_inst_rvalid  (cpu_inst_rvalid),
	.cpu_inst_rlast   (cpu_inst_rlast )
  );

`ifdef USE_DCACHE 
  dcache_wrapper  u_dcache_wrapper (
`else
  mem_if_wrapper  u_mem_if_wrapper (
`endif
	.cpu_clk        (cpu_clk),
	.cpu_reset      (~cpu_reset_n),

	.Address	(Address),
	.MemWrite	(MemWrite),
	.Write_data	(Write_data),
	.Write_strb	(Write_strb),
	.MemRead	(MemRead),
	.Mem_Req_Ready	(Mem_Req_Ready),
	  
	.Read_data	 (Read_data),
	.Read_data_Valid (Read_data_Valid),
	.Read_data_Ready (Read_data_Ready),
	                      
	.cpu_mem_araddr   (cpu_mem_araddr ),
	.cpu_mem_arready  (cpu_mem_arready),
	.cpu_mem_arvalid  (cpu_mem_arvalid),
	.cpu_mem_arsize   (cpu_mem_arsize ),
	.cpu_mem_arburst  (cpu_mem_arburst),
	.cpu_mem_arlen    (cpu_mem_arlen  ),
	                      
	.cpu_mem_awaddr   (cpu_mem_awaddr ),
	.cpu_mem_awready  (cpu_mem_awready),
	.cpu_mem_awvalid  (cpu_mem_awvalid),
	.cpu_mem_awsize   (cpu_mem_awsize ),
	.cpu_mem_awburst  (cpu_mem_awburst),
	.cpu_mem_awlen    (cpu_mem_awlen  ),
	                      
	.cpu_mem_bready   (cpu_mem_bready),
	.cpu_mem_bvalid   (cpu_mem_bvalid),
	                      
	.cpu_mem_rdata    (cpu_mem_rdata ),
	.cpu_mem_rready   (cpu_mem_rready),
	.cpu_mem_rvalid   (cpu_mem_rvalid),
	.cpu_mem_rlast    (cpu_mem_rlast ),
	                      
	.cpu_mem_wdata    (cpu_mem_wdata ),
	.cpu_mem_wready   (cpu_mem_wready),
	.cpu_mem_wstrb    (cpu_mem_wstrb ),
	.cpu_mem_wvalid   (cpu_mem_wvalid),
	.cpu_mem_wlast    (cpu_mem_wlast )
  );

  cpu_to_mem_axi_2x1_arb  u_cpu_arb (
	.clk        (cpu_clk),
	.resetn     (cpu_reset_n),
	                      
	.cpu_inst_araddr  (cpu_inst_araddr[31:0]),
	.cpu_inst_arready (cpu_inst_arready),
	.cpu_inst_arvalid (cpu_inst_arvalid),
	.cpu_inst_arsize  (cpu_inst_arsize ),
	.cpu_inst_arburst (cpu_inst_arburst),
	.cpu_inst_arlen   (cpu_inst_arlen  ),
	                      
	.cpu_inst_rdata   (cpu_inst_rdata ),
	.cpu_inst_rready  (cpu_inst_rready),
	.cpu_inst_rvalid  (cpu_inst_rvalid),
	.cpu_inst_rlast   (cpu_inst_rlast ),
	                      
	.cpu_mem_araddr   (cpu_mem_araddr[31:0]),
	.cpu_mem_arready  (cpu_mem_arready),
	.cpu_mem_arvalid  (cpu_mem_arvalid),
	.cpu_mem_arsize   (cpu_mem_arsize ),
	.cpu_mem_arburst  (cpu_mem_arburst),
	.cpu_mem_arlen    (cpu_mem_arlen  ),
	                      
	.cpu_mem_awaddr   (cpu_mem_awaddr[31:0]),
	.cpu_mem_awready  (cpu_mem_awready),
	.cpu_mem_awvalid  (cpu_mem_awvalid),
	.cpu_mem_awsize   (cpu_mem_awsize ),
	.cpu_mem_awburst  (cpu_mem_awburst),
	.cpu_mem_awlen    (cpu_mem_awlen  ),
	                      
	.cpu_mem_bready   (cpu_mem_bready),
	.cpu_mem_bvalid   (cpu_mem_bvalid),
	                      
	.cpu_mem_rdata    (cpu_mem_rdata ),
	.cpu_mem_rready   (cpu_mem_rready),
	.cpu_mem_rvalid   (cpu_mem_rvalid),
	.cpu_mem_rlast    (cpu_mem_rlast ),
	                      
	.cpu_mem_wdata    (cpu_mem_wdata ),
	.cpu_mem_wready   (cpu_mem_wready),
	.cpu_mem_wstrb    (cpu_mem_wstrb ),
	.cpu_mem_wvalid   (cpu_mem_wvalid),
	.cpu_mem_wlast    (cpu_mem_wlast ),
	
	.s_axi_awid      (s_axi_awid),
	.s_axi_awaddr    (s_axi_awaddr),
	.s_axi_awlen     (s_axi_awlen),
	.s_axi_awsize    (s_axi_awsize),
	.s_axi_awburst   (s_axi_awburst),
	.s_axi_awlock    (s_axi_awlock),
	.s_axi_awcache   (s_axi_awcache),
        .s_axi_awprot    (s_axi_awprot),
        .s_axi_awvalid   (s_axi_awvalid),
        .s_axi_awready   (s_axi_awready),
        .s_axi_wdata     (s_axi_wdata),
        .s_axi_wstrb     (s_axi_wstrb),
        .s_axi_wlast     (s_axi_wlast),
        .s_axi_wvalid    (s_axi_wvalid),
        .s_axi_wready    (s_axi_wready),
        .s_axi_bid       (s_axi_bid),
        .s_axi_bresp     (s_axi_bresp),
        .s_axi_bvalid    (s_axi_bvalid),
        .s_axi_bready    (s_axi_bready),
        .s_axi_arid      (s_axi_arid),
        .s_axi_araddr    (s_axi_araddr),
        .s_axi_arlen     (s_axi_arlen),
        .s_axi_arsize    (s_axi_arsize),
        .s_axi_arburst   (s_axi_arburst),
        .s_axi_arlock    (s_axi_arlock),
        .s_axi_arcache   (s_axi_arcache),
        .s_axi_arprot    (s_axi_arprot),
        .s_axi_arvalid   (s_axi_arvalid),
        .s_axi_arready   (s_axi_arready),
	.s_axi_rid       (s_axi_rid),
	.s_axi_rdata     (s_axi_rdata),
	.s_axi_rresp     (s_axi_rresp),
	.s_axi_rlast     (s_axi_rlast),
	.s_axi_rvalid    (s_axi_rvalid),
	.s_axi_rready    (s_axi_rready)
  );

  pseudo_random u_pseudo_random (
    .clk          (sys_clk     ),
    .reset        (~sys_reset_n),
    .random_mask  (random_mask )
  );

  axi_ram_wrap    u_axi_ram_wrap (
	.clk           (sys_clk),
	.rst           (~sys_reset_n),
	.random_mask   (random_mask),
        .axi_awid    (s_axi_awid),
        .axi_awaddr  (s_axi_awaddr),
        .axi_awlen   (s_axi_awlen),
        .axi_awsize  (s_axi_awsize),
        .axi_awburst (s_axi_awburst),
        .axi_awlock  (s_axi_awlock),
        .axi_awcache (s_axi_awcache),
        .axi_awprot  (s_axi_awprot),
        .axi_awvalid (s_axi_awvalid),
        .axi_awready (s_axi_awready),
        .axi_wdata   (s_axi_wdata),
        .axi_wstrb   (s_axi_wstrb),
        .axi_wlast   (s_axi_wlast),
        .axi_wvalid  (s_axi_wvalid),
        .axi_wready  (s_axi_wready),
        .axi_bid     (s_axi_bid),
        .axi_bresp   (s_axi_bresp),
        .axi_bvalid  (s_axi_bvalid),
        .axi_bready  (s_axi_bready),
        .axi_arid    (s_axi_arid),
        .axi_araddr  (s_axi_araddr),
        .axi_arlen   (s_axi_arlen),
        .axi_arsize  (s_axi_arsize),
        .axi_arburst (s_axi_arburst),
        .axi_arlock  (s_axi_arlock),
        .axi_arcache (s_axi_arcache),
        .axi_arprot  (s_axi_arprot),
        .axi_arvalid (s_axi_arvalid),
        .axi_arready (s_axi_arready),
        .axi_rid     (s_axi_rid),
        .axi_rdata   (s_axi_rdata),
        .axi_rresp   (s_axi_rresp),
        .axi_rlast   (s_axi_rlast),
        .axi_rvalid  (s_axi_rvalid),
        .axi_rready  (s_axi_rready)  
  );

endmodule


