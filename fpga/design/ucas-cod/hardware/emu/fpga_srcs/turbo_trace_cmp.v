`timescale 1 ns / 1 ps
`default_nettype none

`include "axi.vh"

module turbo_trace_cmp(
    input  wire         clk,
    input  wire         resetn,

    `AXI4LITE_SLAVE_IF  (s_axilite, 16, 32),
    `AXI4_MASTER_IF     (m_axi_dram, 32, 32, 1),

    input  wire         trace_commit_trace_valid,
    output wire         trace_commit_trace_ready,
    input  wire [68:0]  trace_commit_trace_data,

    input  wire         trace_mmio_rdata_trace_valid,
    output wire         trace_mmio_rdata_trace_ready,
    input  wire [31:0]  trace_mmio_rdata_trace_data
);

    wire rst = !resetn;

    wire golden_clk;
    wire golden_rst;
    wire golden_clk_en;

    ClockGate golden_clk_gate (
        .CLK    (clk),
        .EN     (golden_clk_en),
        .GCLK   (golden_clk)
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

    wire [69:0] inst_retire;

    custom_cpu_golden u_cpu (    
        .clk                (golden_clk),
        .rst                (golden_rst),

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

        .inst_retire        (inst_retire)
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

    inst_if_wrapper
    u_inst_if_wrapper (
        .cpu_clk            (clk),
        .cpu_reset          (rst),

        .PC                 (PC),
        .Inst_Req_Valid     (Inst_Req_Valid),
        .Inst_Req_Ready     (Inst_Req_Ready),

        .Instruction        (Instruction),
        .Inst_Valid         (Inst_Valid),
        .Inst_Ready         (Inst_Ready),

        .cpu_inst_araddr    (cpu_inst_araddr),
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

    mem_if_wrapper
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

        .cpu_mem_araddr     (cpu_mem_araddr),
        .cpu_mem_arready    (cpu_mem_arready),
        .cpu_mem_arvalid    (cpu_mem_arvalid),
        .cpu_mem_arsize     (cpu_mem_arsize ),
        .cpu_mem_arburst    (cpu_mem_arburst),
        .cpu_mem_arlen      (cpu_mem_arlen  ),

        .cpu_mem_awaddr     (cpu_mem_awaddr),
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

    axi_interconnect_wrap_2x1 #(
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

    ,   `AXI4_CONNECT       (m00_axi, m_axi_dram)

    );

    ////////////////////////////// TRACE CMP //////////////////////////////

    wire passthrough;

    wire mmio_rdata_valid, mmio_rdata_ready;
    wire [31:0] mmio_rdata_data;
    wire mmio_rdata_fifo_full, mmio_rdata_fifo_empty;

    turbo_trace_cmp_fifo #(
        .WIDTH  (32),
        .DEPTH  (16)
    ) u_mmio_rdata_fifo (
        .clk    (clk),
        .rst    (rst),
        .ivalid (trace_mmio_rdata_trace_valid),
        .iready (trace_mmio_rdata_trace_ready),
        .idata  (trace_mmio_rdata_trace_data),
        .ovalid (mmio_rdata_valid),
        .oready (mmio_rdata_ready || passthrough),
        .odata  (mmio_rdata_data),
        .full   (mmio_rdata_fifo_full),
        .empty  (mmio_rdata_fifo_empty)
    );

    turbo_trace_cmp_mmio_model u_mmio_model (
        .clk                (clk),
        .rst                (rst),
        `AXI4LITE_CONNECT   (s_axilite, cpu_mmio_lite),
        .rdata_trace_valid  (mmio_rdata_valid),
        .rdata_trace_ready  (mmio_rdata_ready),
        .rdata_trace_data   (mmio_rdata_data)
    );

    wire ref_write_zero = inst_retire[68:64] == 5'd0;
    wire ref_trace_valid = inst_retire[69] && !ref_write_zero;
    wire [68:0] ref_trace_data = inst_retire[68:0];

    wire dut_write_zero = trace_commit_trace_data[68:64] == 5'd0;
    wire dut_trace_vald = trace_commit_trace_valid && !dut_write_zero;
    wire [68:0] dut_trace_data = trace_commit_trace_data;

    wire trace_cmp_valid = dut_trace_vald && ref_trace_valid;
    wire trace_cmp_match = dut_trace_data == ref_trace_data;

    assign trace_commit_trace_ready = passthrough || dut_write_zero || trace_cmp_valid && trace_cmp_match;
    assign golden_clk_en = golden_rst || passthrough || !ref_trace_valid || ref_write_zero || trace_cmp_valid && trace_cmp_match;

    turbo_trace_cmp_ctrl u_ctrl (
        .clk                (clk),
        .rst                (rst),
        `AXI4LITE_CONNECT   (s_axilite, s_axilite),
        .trace_mismatch     (trace_cmp_valid && !trace_cmp_match),
        .rdata_fifo_full    (mmio_rdata_fifo_full),
        .rdata_fifo_empty   (mmio_rdata_fifo_empty),
        .dut_trace          (trace_commit_trace_data),
        .ref_trace          (inst_retire[68:0]),
        .passthrough        (passthrough),
        .golden_rst         (golden_rst)
    );

endmodule

`default_nettype wire
