`timescale 10ns / 1ns

`define DATA_WIDTH 32

module alu_test();

	reg [`DATA_WIDTH - 1:0] A;
	reg [`DATA_WIDTH - 1:0] B;
	reg [2:0] ALUop;
	wire [`DATA_WIDTH - 1:0] Reference;
	wire OverflowReference;
	wire CarryOutReference;
	wire ZeroReference;
	wire Overflow;
	wire CarryOut;
	wire Zero;
	wire [`DATA_WIDTH - 1:0] Result;

    reg clk = 1;
    always #1 clk = ~clk;

    initial begin
        `define STIMULI(op, a, b) @(negedge clk); ALUop = op; A = a; B = b;
        `include "alu_input.vh"
        `undef STIMULI
        $display("=================================================");
        $display("Success: finished alu testbench.");
        $display("=================================================");
        $finish;
    end

    always @(posedge clk) begin
        if (Reference !== Result) begin
            $display("=================================================");
            $display("ERROR: A = %h, B = %h, ALUop = %h, Result = %h, Reference = %h.", A, B, ALUop, Result, Reference);
            $display("=================================================");
            $finish;
        end
        if ((ALUop === 3'b010 || ALUop === 3'b110 ) && Overflow !== OverflowReference) begin
            $display("=================================================");
            $display("ERROR: A = %h, B = %h, ALUop = %h, Result = %h, Overflow = %h, OverflowReference = %h.", A, B, ALUop, Result, Overflow, OverflowReference);
            $display("=================================================");
            $finish;
        end
        if ((ALUop === 3'b010 || ALUop === 3'b110 ) && CarryOut !== CarryOutReference) begin
            $display("=================================================");
            $display("ERROR: A = %h, B = %h, ALUop = %h, Result = %h, CarryOut = %h, CarryOutReference = %h.", A, B, ALUop, Result, CarryOut, CarryOutReference);
            $display("=================================================");
            $finish;
        end
        if (Zero !== ZeroReference) begin
            $display("=================================================");
            $display("ERROR: A = %h, B = %h, ALUop = %h, Result = %h, Zero = %h, ZeroReference = %h.", A, B, ALUop, Result, Zero, ZeroReference);
            $display("=================================================");
            $finish;
        end
    end

	alu u_alu(
		.A(A),
		.B(B),
		.ALUop(ALUop),
		.Overflow(Overflow),
		.CarryOut(CarryOut),
		.Zero(Zero),
		.Result(Result)
	);

  alu_reference u_alu_reference(
		.A(A),
		.B(B),
		.ALUop(ALUop),
		.Overflow(OverflowReference),
		.CarryOut(CarryOutReference),
		.Zero(ZeroReference),
		.Result(Reference)
  );

    reg [4095:0] dumpfile;
    initial begin
        if ($value$plusargs("DUMP=%s", dumpfile)) begin
            $dumpfile(dumpfile);
            $dumpvars();
        end
    end

endmodule
