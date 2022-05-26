`timescale 1 ns / 1 ps
`default_nettype none

`include "axi.vh"

module emu_top();

    wire clk;
    EmuClock clock(
        .clock(clk)
    );

    wire rst;
    EmuReset reset(
        .reset(rst)
    );

    wire trap;
    EmuTrigger trap_trig(
        .trigger(trap)
    );

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

    wire [31:0] cpu_perf_cnt_0;
    wire [31:0] cpu_perf_cnt_1;
    wire [31:0] cpu_perf_cnt_2;
    wire [31:0] cpu_perf_cnt_3;
    wire [31:0] cpu_perf_cnt_4;
    wire [31:0] cpu_perf_cnt_5;
    wire [31:0] cpu_perf_cnt_6;
    wire [31:0] cpu_perf_cnt_7;
    wire [31:0] cpu_perf_cnt_8;
    wire [31:0] cpu_perf_cnt_9;
    wire [31:0] cpu_perf_cnt_10;
    wire [31:0] cpu_perf_cnt_11;
    wire [31:0] cpu_perf_cnt_12;
    wire [31:0] cpu_perf_cnt_13;
    wire [31:0] cpu_perf_cnt_14;
    wire [31:0] cpu_perf_cnt_15;

    wire intr;

    wire [69:0] inst_retire;

    custom_cpu u_cpu (    
        .clk                (clk),
        .rst                (rst),

        .PC                 (PC),
        .Inst_Req_Valid     (Inst_Req_Valid),
        .Inst_Req_Ready     (Inst_Req_Ready),

        .Instruction        (Instruction),
        .Inst_Valid         (Inst_Valid),
        .Inst_Ready         (Inst_Ready),

        .Address            (Address),
        .MemWrite           (MemWrite),
        .Write_data         (Write_data),
        .Write_strb         (Write_strb),
        .MemRead            (MemRead),
        .Mem_Req_Ready      (Mem_Req_Ready),

        .Read_data          (Read_data    ),
        .Read_data_Valid    (Read_data_Valid),
        .Read_data_Ready    (Read_data_Ready),

        .intr               (intr),

        .cpu_perf_cnt_0     (cpu_perf_cnt_0 ),
        .cpu_perf_cnt_1     (cpu_perf_cnt_1 ),
        .cpu_perf_cnt_2     (cpu_perf_cnt_2 ),
        .cpu_perf_cnt_3     (cpu_perf_cnt_3 ),
        .cpu_perf_cnt_4     (cpu_perf_cnt_4 ),
        .cpu_perf_cnt_5     (cpu_perf_cnt_5 ),
        .cpu_perf_cnt_6     (cpu_perf_cnt_6 ),
        .cpu_perf_cnt_7     (cpu_perf_cnt_7 ),
        .cpu_perf_cnt_8     (cpu_perf_cnt_8 ),
        .cpu_perf_cnt_9     (cpu_perf_cnt_9 ),
        .cpu_perf_cnt_10    (cpu_perf_cnt_10),
        .cpu_perf_cnt_11    (cpu_perf_cnt_11),
        .cpu_perf_cnt_12    (cpu_perf_cnt_12),
        .cpu_perf_cnt_13    (cpu_perf_cnt_13),
        .cpu_perf_cnt_14    (cpu_perf_cnt_14),
        .cpu_perf_cnt_15    (cpu_perf_cnt_15),

        .inst_retire        (inst_retire)
    );

    assign trap = MemWrite && Address == 32'hc;

`ifdef TRACECMP_MULTI_CYCLE

    wire trace_mismatch;

    EmuTrigger trace_mismatch_trig (
        .trigger(trace_mismatch)
    );

    wire [31:0] PC_Ref;
    wire        Inst_Req_Valid_Ref;

    wire        Inst_Ready_Ref;

    wire [31:0] Address_Ref;
    wire        MemWrite_Ref;
    wire [31:0] Write_data_Ref;
    wire [ 3:0] Write_strb_Ref;
    wire        MemRead_Ref;

    wire        Read_data_Ready_Ref; 

    custom_cpu_golden u_cpu_golden (    
        .clk                (clk),
        .rst                (rst),

        .PC                 (PC_Ref),
        .Inst_Req_Valid     (Inst_Req_Valid_Ref),
        .Inst_Req_Ready     (Inst_Req_Ready),

        .Instruction        (Instruction),
        .Inst_Valid         (Inst_Valid),
        .Inst_Ready         (Inst_Ready_Ref),

        .Address            (Address_Ref),
        .MemWrite           (MemWrite_Ref),
        .Write_data         (Write_data_Ref),
        .Write_strb         (Write_strb_Ref),
        .MemRead            (MemRead_Ref),
        .Mem_Req_Ready      (Mem_Req_Ready),

        .Read_data          (Read_data),
        .Read_data_Valid    (Read_data_Valid),
        .Read_data_Ready    (Read_data_Ready_Ref)
    );

    wire [31:0] wmask = {
        {8{Write_strb[3]}},
        {8{Write_strb[2]}},
        {8{Write_strb[1]}},
        {8{Write_strb[0]}}
    };

    wire [31:0] wmask_ref = {
        {8{Write_strb_Ref[3]}},
        {8{Write_strb_Ref[2]}},
        {8{Write_strb_Ref[1]}},
        {8{Write_strb_Ref[0]}}
    };

    assign trace_mismatch = !rst && |{
        (Inst_Req_Valid         != Inst_Req_Valid_Ref           ),
        (PC                     != PC_Ref                       ) && Inst_Req_Valid,
        (Inst_Ready             != Inst_Ready_Ref               ),
        (MemRead                != MemRead_Ref                  ),
        (MemWrite               != MemWrite_Ref                 ),
        (Address                != Address_Ref                  ) && (MemWrite || MemRead),
        ((Write_data & wmask)   != (Write_data_Ref & wmask_ref) ) && MemWrite,
        (Write_strb             != Write_strb_Ref               ) && MemWrite,
        (Read_data_Ready        != Read_data_Ready_Ref          )
    };

`endif

    EmuTrace #(
        .DATA_WIDTH(69)
    ) trace_commit (
        .clk    (clk),
        .valid  (inst_retire[69]),
        .data   (inst_retire[68:0])
    );

    EmuTrace #(
        .DATA_WIDTH(32)
    ) trace_mmio_rdata (
        .clk    (clk),
        .valid  (cpu_mmio_lite_rvalid && cpu_mmio_lite_rready),
        .data   (cpu_mmio_lite_rdata)
    );

    `AXI4_AR_WIRE   (cpu_inst,  32, 32, 1);
    `AXI4_R_WIRE    (cpu_inst,  32, 32, 1);

    `AXI4_WIRE      (cpu_mem,   32, 32, 1);

    assign cpu_inst_arid        = 1'd0;
    assign cpu_inst_arprot      = 3'd2;
    assign cpu_inst_arlock      = 1'd0;
    assign cpu_inst_arcache     = 4'd0;
    assign cpu_inst_arregion    = 4'd0;
    assign cpu_inst_arqos       = 4'd0;

    assign cpu_mem_arid         = 1'd0;
    assign cpu_mem_arprot       = 3'd2;
    assign cpu_mem_arlock       = 1'd0;
    assign cpu_mem_arcache      = 4'd0;
    assign cpu_mem_arregion     = 4'd0;
    assign cpu_mem_arqos        = 4'd0;
    assign cpu_mem_awid         = 1'd0;
    assign cpu_mem_awprot       = 3'd2;
    assign cpu_mem_awlock       = 1'd0;
    assign cpu_mem_awcache      = 4'd0;
    assign cpu_mem_awregion     = 4'd0;
    assign cpu_mem_awqos        = 4'd0;

    wire [7:0] unused_0, unused_1, unused_2;

`ifdef USE_ICACHE 
    icache_wrapper
`else
    inst_if_wrapper
`endif
    u_inst_if_wrapper (
        .cpu_clk            (clk),
        .cpu_reset          (rst),

        .PC                 (PC),
        .Inst_Req_Valid     (Inst_Req_Valid),
        .Inst_Req_Ready     (Inst_Req_Ready),

        .Instruction        (Instruction),
        .Inst_Valid         (Inst_Valid),
        .Inst_Ready         (Inst_Ready),

        .cpu_inst_araddr    ({unused_0, cpu_inst_araddr}),
        .cpu_inst_arready   (cpu_inst_arready),
        .cpu_inst_arvalid   (cpu_inst_arvalid),
        .cpu_inst_arsize    (cpu_inst_arsize ),
        .cpu_inst_arburst   (cpu_inst_arburst),
        .cpu_inst_arlen     (cpu_inst_arlen  ),

        .cpu_inst_rdata     (cpu_inst_rdata ),
        .cpu_inst_rready    (cpu_inst_rready),
        .cpu_inst_rvalid    (cpu_inst_rvalid),
        .cpu_inst_rlast     (cpu_inst_rlast )
    );

`ifdef USE_DCACHE 
    dcache_wrapper
`else
    mem_if_wrapper
`endif
    u_mem_if_wrapper (
        .cpu_clk            (clk),
        .cpu_reset          (rst),

        .Address            (Address),
        .MemWrite           (MemWrite),
        .Write_data         (Write_data),
        .Write_strb         (Write_strb),
        .MemRead            (MemRead),
        .Mem_Req_Ready      (Mem_Req_Ready),

        .Read_data          (Read_data),
        .Read_data_Valid    (Read_data_Valid),
        .Read_data_Ready    (Read_data_Ready),

        .cpu_mem_araddr     ({unused_1, cpu_mem_araddr}),
        .cpu_mem_arready    (cpu_mem_arready),
        .cpu_mem_arvalid    (cpu_mem_arvalid),
        .cpu_mem_arsize     (cpu_mem_arsize ),
        .cpu_mem_arburst    (cpu_mem_arburst),
        .cpu_mem_arlen      (cpu_mem_arlen  ),

        .cpu_mem_awaddr     ({unused_2, cpu_mem_awaddr}),
        .cpu_mem_awready    (cpu_mem_awready),
        .cpu_mem_awvalid    (cpu_mem_awvalid),
        .cpu_mem_awsize     (cpu_mem_awsize ),
        .cpu_mem_awburst    (cpu_mem_awburst),
        .cpu_mem_awlen      (cpu_mem_awlen  ),

        .cpu_mem_bready     (cpu_mem_bready),
        .cpu_mem_bvalid     (cpu_mem_bvalid),

        .cpu_mem_rdata      (cpu_mem_rdata ),
        .cpu_mem_rready     (cpu_mem_rready),
        .cpu_mem_rvalid     (cpu_mem_rvalid),
        .cpu_mem_rlast      (cpu_mem_rlast ),

        .cpu_mem_wdata      (cpu_mem_wdata ),
        .cpu_mem_wready     (cpu_mem_wready),
        .cpu_mem_wstrb      (cpu_mem_wstrb ),
        .cpu_mem_wvalid     (cpu_mem_wvalid),
        .cpu_mem_wlast      (cpu_mem_wlast )
    );

    `AXI4_WIRE  (cpu_dram,  32, 32, 1);
    `AXI4_WIRE  (cpu_mmio,  32, 32, 1);

    axi_interconnect_wrap_1x2 #(
        .DATA_WIDTH     (32),
        .ADDR_WIDTH     (32),
        .ID_WIDTH       (1),
        .M00_BASE_ADDR  ('h00000000),   // 0x00000000 - 0x0fffffff
        .M00_ADDR_WIDTH (28),
        .M01_BASE_ADDR  ('h60000000),   // 0x60000000 - 0x6fffffff
        .M01_ADDR_WIDTH (28)
    )
    u_cpu_mem_xbar (
        .clk            (clk),
        .rst            (rst),
        `AXI4_CONNECT   (s00_axi, cpu_mem),
        `AXI4_CONNECT   (m00_axi, cpu_dram),
        `AXI4_CONNECT   (m01_axi, cpu_mmio)
    );

    `AXI4LITE_WIRE  (cpu_mmio_lite, 32, 32);

    axi_axil_adapter #(
        .ADDR_WIDTH         (32),
        .AXI_DATA_WIDTH     (32),
        .AXI_ID_WIDTH       (1),
        .AXIL_DATA_WIDTH    (32)
    )
    u_mmio_axi_to_lite (
        .clk                (clk),
        .rst                (rst),
        `AXI4_CONNECT       (s_axi, cpu_mmio),
        `AXI4LITE_CONNECT   (m_axil, cpu_mmio_lite)
    );

    `AXI4LITE_WIRE  (uart_mmio,     32, 32);
    `AXI4LITE_WIRE  (perfcnt_mmio,  32, 32);
`ifdef USE_DMA
    `AXI4LITE_WIRE  (dma_mmio,      32, 32);
`endif

`ifdef USE_DMA
    axil_interconnect_wrap_1x3 #(
`else
    axil_interconnect_wrap_1x2 #(
`endif
        .DATA_WIDTH     (32)
    ,   .ADDR_WIDTH     (32)
    ,   .M00_BASE_ADDR  ('h60000000) // 0x60000000 - 0x6000ffff
    ,   .M00_ADDR_WIDTH (16)
    ,   .M01_BASE_ADDR  ('h60010000) // 0x60010000 - 0x6001ffff
    ,   .M01_ADDR_WIDTH (16)
`ifdef USE_DMA
    ,   .M02_BASE_ADDR  ('h60020000) // 0x60020000 - 0x6002ffff
    ,   .M02_ADDR_WIDTH (16)
`endif
    )
    u_mmio_xbar (
        .clk                (clk)
    ,   .rst                (rst)
    ,   `AXI4LITE_CONNECT   (s00_axil, cpu_mmio_lite)
    ,   `AXI4LITE_CONNECT   (m00_axil, uart_mmio)
    ,   `AXI4LITE_CONNECT   (m01_axil, perfcnt_mmio)
`ifdef USE_DMA
    ,   `AXI4LITE_CONNECT   (m02_axil, dma_mmio)
`endif
    );

    uart_model u_uart(
        .clk                (clk),
        .rst                (rst),
        `AXI4LITE_CONNECT   (s_axilite, uart_mmio)
    );

    perfcnt u_perfcnt(
        .clk                (clk),
        .rst                (rst),
        `AXI4LITE_CONNECT   (s_axilite, perfcnt_mmio),
        .cpu_perf_cnt_0     (cpu_perf_cnt_0 ),
        .cpu_perf_cnt_1     (cpu_perf_cnt_1 ),
        .cpu_perf_cnt_2     (cpu_perf_cnt_2 ),
        .cpu_perf_cnt_3     (cpu_perf_cnt_3 ),
        .cpu_perf_cnt_4     (cpu_perf_cnt_4 ),
        .cpu_perf_cnt_5     (cpu_perf_cnt_5 ),
        .cpu_perf_cnt_6     (cpu_perf_cnt_6 ),
        .cpu_perf_cnt_7     (cpu_perf_cnt_7 ),
        .cpu_perf_cnt_8     (cpu_perf_cnt_8 ),
        .cpu_perf_cnt_9     (cpu_perf_cnt_9 ),
        .cpu_perf_cnt_10    (cpu_perf_cnt_10),
        .cpu_perf_cnt_11    (cpu_perf_cnt_11),
        .cpu_perf_cnt_12    (cpu_perf_cnt_12),
        .cpu_perf_cnt_13    (cpu_perf_cnt_13),
        .cpu_perf_cnt_14    (cpu_perf_cnt_14),
        .cpu_perf_cnt_15    (cpu_perf_cnt_15)
    );

`ifdef USE_DMA

	wire [9:0]   reg_addr;
	wire [31:0]  reg_wdata;
	wire         reg_write;
	wire [31:0]  reg_rdata;

    dma_ctrl u_dma_ctrl(
        .clk                (clk),
        .rst                (rst),
        `AXI4LITE_CONNECT   (s_axilite, dma_mmio),
        .reg_addr           (reg_addr ),
        .reg_wdata          (reg_wdata),
        .reg_write          (reg_write),
        .reg_rdata          (reg_rdata)
    );

    `AXI4_WIRE  (dma_dram, 32, 32, 1);

    wire [7:0] __unused_dma_aw, __unused_dma_ar;

    dma_engine #(
        .C_M_AXI_DATA_WIDTH (32),
        .ADDR_WIDTH         (12)
    )
    u_dma (
        .M_AXI_ACLK         (clk),
        .M_AXI_ARESET       (rst),
        .reg_addr           (reg_addr),
        .reg_wdata          (reg_wdata),
        .reg_write          (reg_write),
        .reg_rdata          (reg_rdata),
        .intr               (intr),
        .M_AXI_AWADDR       ({__unused_dma_aw, dma_dram_awaddr}),
        .M_AXI_AWLEN        (dma_dram_awlen),
        .M_AXI_AWBURST      (dma_dram_awburst),
        .M_AXI_AWSIZE       (dma_dram_awsize),
        .M_AXI_AWVALID      (dma_dram_awvalid),
        .M_AXI_AWREADY      (dma_dram_awready),
        .M_AXI_WDATA        (dma_dram_wdata),
        .M_AXI_WLAST        (dma_dram_wlast),
        .M_AXI_WSTRB        (dma_dram_wstrb),
        .M_AXI_WVALID       (dma_dram_wvalid),
        .M_AXI_WREADY       (dma_dram_wready),
        .M_AXI_ARADDR       (dma_dram_araddr),
        .M_AXI_ARLEN        (dma_dram_arlen),
        .M_AXI_ARBURST      (dma_dram_arburst),
        .M_AXI_ARSIZE       (dma_dram_arsize),
        .M_AXI_ARVALID      (dma_dram_arvalid),
        .M_AXI_ARREADY      (dma_dram_arready),
        .M_AXI_RDATA        (dma_dram_rdata),
        .M_AXI_RLAST        (dma_dram_rlast),
        .M_AXI_RVALID       (dma_dram_rvalid),
        .M_AXI_RRESP        (dma_dram_rresp),
        .M_AXI_RREADY       (dma_dram_rready),
        .M_AXI_BREADY       (dma_dram_bready),
        .M_AXI_BRESP        (dma_dram_bresp),
        .M_AXI_BVALID       (dma_dram_bvalid)
    );

    assign dma_dram_arid         = 1'd0;
    assign dma_dram_arprot       = 3'd2;
    assign dma_dram_arlock       = 1'd0;
    assign dma_dram_arcache      = 4'd0;
    assign dma_dram_arregion     = 4'd0;
    assign dma_dram_arqos        = 4'd0;
    assign dma_dram_awid         = 1'd0;
    assign dma_dram_awprot       = 3'd2;
    assign dma_dram_awlock       = 1'd0;
    assign dma_dram_awcache      = 4'd0;
    assign dma_dram_awregion     = 4'd0;
    assign dma_dram_awqos        = 4'd0;

`else

    assign intr = 1'b0;

`endif

    `AXI4_WIRE  (dram, 32, 32, 1);

`ifdef USE_DMA
    axi_interconnect_wrap_3x1 #(
`else
    axi_interconnect_wrap_2x1 #(
`endif
        .DATA_WIDTH     (32)
    ,   .ADDR_WIDTH     (32)
    ,   .ID_WIDTH       (1)
    ,   .M00_BASE_ADDR  ('h00000000)
    ,   .M00_ADDR_WIDTH (28)
    )
    u_dram_xbar (

        .clk                (clk)
    ,   .rst                (rst)

    ,   `AXI4_AR_CONNECT    (s00_axi, cpu_inst)
    ,   `AXI4_R_CONNECT     (s00_axi, cpu_inst)
    ,   .s00_axi_awvalid    (1'b0)
    ,   .s00_axi_wvalid     (1'b0)
    ,   .s00_axi_bready     (1'b0)

    ,   `AXI4_CONNECT       (s01_axi, cpu_dram)

`ifdef USE_DMA
    ,   `AXI4_CONNECT       (s02_axi, dma_dram)
`endif

    ,   `AXI4_CONNECT       (m00_axi, dram)

    );

    EmuRam #(
        .ADDR_WIDTH     (32),
        .DATA_WIDTH     (32),
        .ID_WIDTH       (1),
        .PF_COUNT       ('h10000),
        .R_DELAY        (50),
        .W_DELAY        (50)
    )
    u_rammodel (
        .clk            (clk),
        .rst            (rst),
        `AXI4_CONNECT   (s_axi, dram)
    );

endmodule

`default_nettype wire
