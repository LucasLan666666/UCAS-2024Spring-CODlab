`timescale 1 ns / 1 ps
`default_nettype none

`include "axi.vh"

module dma_ctrl(
    input  wire         clk,
    input  wire         rst,

    `AXI4LITE_SLAVE_IF  (s_axilite, 32, 32),

    output wire [9:0]   reg_addr,
    output wire [31:0]  reg_wdata,
    output wire         reg_write,
    input  wire [31:0]  reg_rdata
);

    wire arfire = s_axilite_arvalid && s_axilite_arready;
    wire rfire  = s_axilite_rvalid && s_axilite_rready;
    wire awfire = s_axilite_awvalid && s_axilite_awready;
    wire wfire  = s_axilite_wvalid && s_axilite_wready;
    wire bfire  = s_axilite_bvalid && s_axilite_bready;

    localparam [1:0]
        R_STATE_AXI_AR  = 2'd0,
        R_STATE_READ    = 2'd1,
        R_STATE_AXI_R   = 2'd2;

    localparam [1:0]
        W_STATE_AXI_AW  = 2'd0,
        W_STATE_AXI_W   = 2'd1,
        W_STATE_WRITE   = 2'd2,
        W_STATE_AXI_B   = 2'd3;

    reg [1:0] r_state, r_state_next;
    reg [1:0] w_state, w_state_next;

    always @(posedge clk) begin
        if (rst)
            r_state <= R_STATE_AXI_AR;
        else
            r_state <= r_state_next;
    end

    always @* begin
        case (r_state)
            R_STATE_AXI_AR: r_state_next = arfire ? R_STATE_READ : R_STATE_AXI_AR;
            R_STATE_READ:   r_state_next = R_STATE_AXI_R;
            R_STATE_AXI_R:  r_state_next = rfire ? R_STATE_AXI_AR : R_STATE_AXI_R;
            default:        r_state_next = R_STATE_AXI_AR;
        endcase
    end

    always @(posedge clk) begin
        if (rst)
            w_state <= W_STATE_AXI_AW;
        else
            w_state <= w_state_next;
    end

    always @* begin
        case (w_state)
            W_STATE_AXI_AW: w_state_next = awfire ? W_STATE_AXI_W : W_STATE_AXI_AW;
            W_STATE_AXI_W:  w_state_next = wfire ? W_STATE_WRITE : W_STATE_AXI_W;
            W_STATE_WRITE:  w_state_next = W_STATE_AXI_B;
            W_STATE_AXI_B:  w_state_next = bfire ? W_STATE_AXI_AW : W_STATE_AXI_B;
            default:        w_state_next = W_STATE_AXI_AW;
        endcase
    end

    reg [15:0] addr;
    reg [31:0] write_data;

    always @(posedge clk)
        if (arfire)
            addr <= s_axilite_araddr[15:0];
        else if (awfire)
            addr <= s_axilite_awaddr[15:0];

    wire [31:0] extended_wstrb = {
        {8{s_axilite_wstrb[3]}},
        {8{s_axilite_wstrb[2]}},
        {8{s_axilite_wstrb[1]}},
        {8{s_axilite_wstrb[0]}}
    };

    always @(posedge clk)
        if (wfire)
            write_data <= s_axilite_wdata & extended_wstrb;

    // Read logic

    reg [31:0] read_data;

    always @(posedge clk) begin
        if (r_state == R_STATE_READ) begin
            read_data <= reg_rdata;
        end
    end

    assign s_axilite_arready    = r_state == R_STATE_AXI_AR;
    assign s_axilite_rvalid     = r_state == R_STATE_AXI_R;
    assign s_axilite_rdata      = read_data;
    assign s_axilite_rresp      = 2'd0;

    // Write logic

    assign reg_addr             = addr[11:2];
    assign reg_write            = w_state == W_STATE_WRITE;
    assign reg_wdata            = write_data;

    assign s_axilite_awready    = w_state == W_STATE_AXI_AW;
    assign s_axilite_wready     = w_state == W_STATE_AXI_W;
    assign s_axilite_bvalid     = w_state == W_STATE_AXI_B;
    assign s_axilite_bresp      = 2'd0;

endmodule

`default_nettype wire
