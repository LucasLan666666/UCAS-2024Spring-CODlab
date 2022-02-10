`timescale 1ns / 1ns

`define DATA_WIDTH 32
`define ADDR_WIDTH 5

module reg_file_test();

    reg clk = 1;
    reg rst = 0;
    reg [`ADDR_WIDTH - 1:0] waddr = 0;
    reg wen = 0;
    reg [`DATA_WIDTH - 1:0] wdata = 0;

    reg [`ADDR_WIDTH - 1:0] raddr1 = 0;
    reg [`ADDR_WIDTH - 1:0] raddr2 = 0;
    wire [`DATA_WIDTH - 1:0] rdata1_ref;
    wire [`DATA_WIDTH - 1:0] rdata2_ref;
    wire [`DATA_WIDTH - 1:0] rdata1;
    wire [`DATA_WIDTH - 1:0] rdata2;

	always #1 clk = ~clk;

    reg compare = 0;

    integer i;

    initial begin
        @(negedge clk);
        wdata = 0;
        wen = 1;
        for (i=0; i<32; i=i+1) begin
            waddr = i;
            @(negedge clk);
        end
        wen = 0;
        compare = 1;
        `define STIMULI(ra1, ra2, wa, wd, we) \
            @(negedge clk); \
            raddr1 = ra1; \
            raddr2 = ra2; \
            waddr = wa; \
            wdata = wd; \
            wen = we;
        `include "reg_file_input.vh"
        `undef STIMULI
        $display("=================================================");
        $display("Success: finished reg_file testbench.");
        $display("=================================================");
        $finish;
    end

    always @(posedge clk) begin
        if (compare && rdata1_ref !== rdata1) begin
            $display("=================================================");
            $display("ERROR: Read at %02x, should get %08h, but get %08h.", raddr1, rdata1_ref, rdata1);
            $display("=================================================");
            $finish;
        end
        if (compare && rdata2_ref !== rdata2) begin
            $display("=================================================");
            $display("ERROR: Read at %02x, should get %08h, but get %08h.", raddr2, rdata2_ref, rdata2);
            $display("=================================================");
            $finish;
        end
    end

	reg_file u_reg_file(
		.clk(clk),
		.waddr(waddr),
		.raddr1(raddr1),
		.raddr2(raddr2),
		.wen(wen),
		.wdata(wdata),
		.rdata1(rdata1),
		.rdata2(rdata2)
	);

	reg_file_reference u_reg_file_reference(
		.clk(clk),
		.rst(rst),
		.waddr(waddr),
		.raddr1(raddr1),
		.raddr2(raddr2),
		.wen(wen),
		.wdata(wdata),
		.rdata1(rdata1_ref),
		.rdata2(rdata2_ref)
	);

    reg [4095:0] dumpfile;
    initial begin
        if ($value$plusargs("DUMP=%s", dumpfile)) begin
            $dumpfile(dumpfile);
            $dumpvars();
        end
    end
endmodule
