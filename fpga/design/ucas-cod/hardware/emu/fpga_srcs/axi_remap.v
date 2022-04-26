`timescale 1ns / 1ps
`default_nettype none

`include "axi.vh"

module axi_remap #(
    parameter   ADDR_WIDTH      = 32,
    parameter   DATA_WIDTH      = 64,
    parameter   ID_WIDTH        = 4,
    parameter   ADDR_BASE       = 'h0,
    parameter   ADDR_MASK       = 'hffffffff
)(
    input  wire                     clk,
    input  wire                     resetn,
    `AXI4_SLAVE_IF                  (s_axi, ADDR_WIDTH, DATA_WIDTH, ID_WIDTH),
    `AXI4_MASTER_IF                 (m_axi, ADDR_WIDTH, DATA_WIDTH, ID_WIDTH)
);

    assign  m_axi_awvalid   = s_axi_awvalid;
    assign  s_axi_awready   = m_axi_awready;
    assign  m_axi_awaddr    = s_axi_awaddr & ADDR_MASK | ADDR_BASE;
    assign  m_axi_awprot    = s_axi_awprot;
    assign  m_axi_awid      = s_axi_awid;
    assign  m_axi_awlen     = s_axi_awlen;
    assign  m_axi_awsize    = s_axi_awsize;
    assign  m_axi_awburst   = s_axi_awburst;
    assign  m_axi_awlock    = s_axi_awlock;
    assign  m_axi_awcache   = s_axi_awcache;
    assign  m_axi_awqos     = s_axi_awqos;
    assign  m_axi_awregion  = s_axi_awregion;

    assign  m_axi_wvalid    = s_axi_wvalid;
    assign  s_axi_wready    = m_axi_wready;
    assign  `AXI4_W_PAYLOAD(m_axi) = `AXI4_W_PAYLOAD(s_axi);

    assign  s_axi_bvalid    = m_axi_bvalid;
    assign  m_axi_bready    = s_axi_bready;
    assign  `AXI4_B_PAYLOAD(s_axi) = `AXI4_B_PAYLOAD(m_axi);

    assign  m_axi_arvalid   = s_axi_arvalid;
    assign  s_axi_arready   = m_axi_arready;
    assign  m_axi_araddr    = s_axi_araddr & ADDR_MASK | ADDR_BASE;
    assign  m_axi_arprot    = s_axi_arprot;
    assign  m_axi_arid      = s_axi_arid;
    assign  m_axi_arlen     = s_axi_arlen;
    assign  m_axi_arsize    = s_axi_arsize;
    assign  m_axi_arburst   = s_axi_arburst;
    assign  m_axi_arlock    = s_axi_arlock;
    assign  m_axi_arcache   = s_axi_arcache;
    assign  m_axi_arqos     = s_axi_arqos;
    assign  m_axi_arregion  = s_axi_arregion;

    assign  s_axi_rvalid    = m_axi_rvalid;
    assign  m_axi_rready    = s_axi_rready;
    assign  `AXI4_R_PAYLOAD(s_axi) = `AXI4_R_PAYLOAD(m_axi);

endmodule

`default_nettype wire
