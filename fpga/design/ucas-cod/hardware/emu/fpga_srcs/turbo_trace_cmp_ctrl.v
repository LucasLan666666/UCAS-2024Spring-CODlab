`timescale 1 ns / 1 ps
`default_nettype none

`include "axi.vh"

module turbo_trace_cmp_ctrl(
    input  wire         clk,
    input  wire         rst,

    `AXI4LITE_SLAVE_IF  (s_axilite, 16, 32),

    input  wire         trace_mismatch,
    input  wire         rdata_fifo_full,
    input  wire         rdata_fifo_empty,

    input  wire [68:0]  dut_trace,
    input  wire [68:0]  ref_trace,

    output reg          passthrough,
    output reg          golden_rst
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

    wire [31:0] status = {
        29'd0,
        rdata_fifo_full,
        rdata_fifo_empty,
        trace_mismatch
    };

    wire [31:0] control = {
        30'd0,
        golden_rst,
        passthrough
    };

    wire [31:0] dut_pc      = dut_trace[31:0];
    wire [31:0] dut_wdata   = dut_trace[63:32];
    wire [31:0] dut_waddr   = {27'd0, dut_trace[68:64]};

    wire [31:0] ref_pc      = ref_trace[31:0];
    wire [31:0] ref_wdata   = ref_trace[63:32];
    wire [31:0] ref_waddr   = {27'd0, ref_trace[68:64]};

    always @(posedge clk) begin
        if (r_state == R_STATE_READ) begin
            case (read_addr)
                16'h0000:   read_data <= status;
                16'h0004:   read_data <= control;
                16'h0010:   read_data <= dut_pc;
                16'h0014:   read_data <= dut_wdata;
                16'h0018:   read_data <= dut_waddr;
                16'h0020:   read_data <= ref_pc;
                16'h0024:   read_data <= ref_wdata;
                16'h0028:   read_data <= ref_waddr;
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

    always @(posedge clk) begin
        if (rst)
            passthrough <= 1'b0;
        else if (w_state == W_STATE_WRITE && write_addr == 16'h0004)
            passthrough <= write_data[0];
    end

    always @(posedge clk) begin
        if (rst)
            golden_rst <= 1'b1;
        else if (w_state == W_STATE_WRITE && write_addr == 16'h0004)
            golden_rst <= write_data[1];
    end

endmodule

`default_nettype wire
