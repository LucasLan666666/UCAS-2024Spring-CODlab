
`timescale 1 ns / 1 ns

module dnn_acc_top (
    user_clk,
    user_reset_n,
    acc_done_reg,
    gpio_acc_start,
    user_axi_araddr,
    user_axi_arburst,
    user_axi_arid,
    user_axi_arlen,
    user_axi_arsize,
    user_axi_arcache,
    user_axi_arvalid,
    user_axi_arready,
    user_axi_awaddr,
    user_axi_awburst,
    user_axi_awid,
    user_axi_awlen,
    user_axi_awsize,
    user_axi_awcache,
    user_axi_awvalid,
    user_axi_awready,
    user_axi_bid,
    user_axi_bresp,
    user_axi_bvalid,
    user_axi_bready,
    user_axi_rdata,
    user_axi_rid,
    user_axi_rlast,
    user_axi_rresp,
    user_axi_rvalid,
    user_axi_rready,
    user_axi_wdata,
    user_axi_wlast,
    user_axi_wstrb,
    user_axi_wvalid,
    user_axi_wready);

  input  user_clk;
  input  user_reset_n;

  output acc_done_reg;
  input  gpio_acc_start;

  output [31:0]user_axi_araddr;
  output [ 1:0]user_axi_arburst;
  output [ 0:0]user_axi_arid;
  output [ 3:0]user_axi_arlen;
  output [ 2:0]user_axi_arsize;
  output [ 3:0]user_axi_arcache;
  output       user_axi_arvalid;
  input        user_axi_arready;

  output [31:0]user_axi_awaddr;
  output [ 1:0]user_axi_awburst;
  output [ 0:0]user_axi_awid;
  output [ 3:0]user_axi_awlen;
  output [ 2:0]user_axi_awsize;
  output [ 3:0]user_axi_awcache;
  output       user_axi_awvalid;
  input        user_axi_awready;

  input [0:0]  user_axi_bid;
  input [1:0]  user_axi_bresp;
  input        user_axi_bvalid;
  output       user_axi_bready;

  input [63:0] user_axi_rdata;
  input [ 0:0] user_axi_rid;
  input        user_axi_rlast;
  input [ 1:0] user_axi_rresp;
  input        user_axi_rvalid;
  output       user_axi_rready;

  output [63:0]user_axi_wdata;
  output       user_axi_wlast;
  output [ 7:0]user_axi_wstrb;
  output       user_axi_wvalid;
  input        user_axi_wready;

endmodule

