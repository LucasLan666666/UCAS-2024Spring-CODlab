`timescale 1ns / 1ps
`default_nettype none

module turbo_trace_cmp_fifo #(
    parameter WIDTH     = 32,
    parameter DEPTH     = 8,

    parameter CNTW      = $clog2(DEPTH)
)(

    input  wire                 clk,
    input  wire                 rst,

    input  wire                 ivalid,
    output reg                  iready,
    input  wire [WIDTH-1:0]     idata,

    output reg                  ovalid,
    input  wire                 oready,
    output wire [WIDTH-1:0]     odata,

    output wire                 empty,
    output wire                 full

);

    localparam [CNTW-1:0]
        PTR_MAX = DEPTH - 1,
        PTR_ZRO = 0,
        PTR_INC = 1;

    reg [WIDTH-1:0] data [DEPTH-1:0];
    reg [CNTW-1:0] rp, wp;

    wire ifire = ivalid && iready;
    wire ofire = ovalid && oready;

    wire [CNTW-1:0] rp_inc = rp == PTR_MAX ? PTR_ZRO : rp + PTR_INC;
    wire [CNTW-1:0] wp_inc = wp == PTR_MAX ? PTR_ZRO : wp + PTR_INC;

    wire [CNTW-1:0] rp_next = ofire ? rp_inc : rp;
    wire [CNTW-1:0] wp_next = ifire ? wp_inc : wp;

    always @(posedge clk)
        if (rst)
            wp <= PTR_ZRO;
        else
            wp <= wp_next;

    always @(posedge clk)
        if (rst)
            rp <= PTR_ZRO;
        else
            rp <= rp_next;

    always @(posedge clk)
        if (rst)
            iready <= 1'b1;
        else if (ofire)
            iready <= 1'b1;
        else if (ifire && wp_inc == rp)
            iready <= 1'b0;

    always @(posedge clk)
        if (rst)
            ovalid <= 1'b0;
        else if (ifire)
            ovalid <= 1'b1;
        else if (ofire && rp_inc == wp)
            ovalid <= 1'b0;

    always @(posedge clk) if (ifire) data[wp] <= idata;

    assign odata = data[rp];

    assign empty = !ovalid;
    assign full = !iready;

endmodule

`default_nettype wire
