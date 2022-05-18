`timescale 1 ns / 1 ps
`default_nettype none

`include "axi.vh"

module perfcnt(
    input  wire         clk,
    input  wire         rst,

    `AXI4LITE_SLAVE_IF  (s_axilite, 32, 32),

    input  wire [31:0] cpu_perf_cnt_0,
	input  wire [31:0] cpu_perf_cnt_1,
	input  wire [31:0] cpu_perf_cnt_2,
	input  wire [31:0] cpu_perf_cnt_3,
	input  wire [31:0] cpu_perf_cnt_4,
	input  wire [31:0] cpu_perf_cnt_5,
	input  wire [31:0] cpu_perf_cnt_6,
	input  wire [31:0] cpu_perf_cnt_7,
	input  wire [31:0] cpu_perf_cnt_8,
	input  wire [31:0] cpu_perf_cnt_9,
	input  wire [31:0] cpu_perf_cnt_10,
	input  wire [31:0] cpu_perf_cnt_11,
	input  wire [31:0] cpu_perf_cnt_12,
	input  wire [31:0] cpu_perf_cnt_13,
	input  wire [31:0] cpu_perf_cnt_14,
	input  wire [31:0] cpu_perf_cnt_15
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

    reg [15:0] read_addr, write_addr;
    reg [31:0] write_data;

    always @(posedge clk)
        if (arfire)
            read_addr <= s_axilite_araddr[15:0];

    always @(posedge clk)
        if (awfire)
            write_addr <= s_axilite_awaddr[15:0];

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
            case (read_addr)
                16'h0000:   read_data <= cpu_perf_cnt_0;
                16'h0008:   read_data <= cpu_perf_cnt_1;
                16'h1000:   read_data <= cpu_perf_cnt_2;
                16'h1008:   read_data <= cpu_perf_cnt_3;
                16'h2000:   read_data <= cpu_perf_cnt_4;
                16'h2008:   read_data <= cpu_perf_cnt_5;
                16'h3000:   read_data <= cpu_perf_cnt_6;
                16'h3008:   read_data <= cpu_perf_cnt_7;
                16'h4000:   read_data <= cpu_perf_cnt_8;
                16'h4008:   read_data <= cpu_perf_cnt_9;
                16'h5000:   read_data <= cpu_perf_cnt_10;
                16'h5008:   read_data <= cpu_perf_cnt_11;
                16'h6000:   read_data <= cpu_perf_cnt_12;
                16'h6008:   read_data <= cpu_perf_cnt_13;
                16'h7000:   read_data <= cpu_perf_cnt_14;
                16'h7008:   read_data <= cpu_perf_cnt_15;
                default:    read_data <= 32'd0;
            endcase
        end
    end

    assign s_axilite_arready    = r_state == R_STATE_AXI_AR;
    assign s_axilite_rvalid     = r_state == R_STATE_AXI_R;
    assign s_axilite_rdata      = read_data;
    assign s_axilite_rresp      = 2'd0;

    // Write logic

    assign s_axilite_awready    = w_state == W_STATE_AXI_AW;
    assign s_axilite_wready     = w_state == W_STATE_AXI_W;
    assign s_axilite_bvalid     = w_state == W_STATE_AXI_B;
    assign s_axilite_bresp      = 2'd0;

endmodule

`default_nettype wire
