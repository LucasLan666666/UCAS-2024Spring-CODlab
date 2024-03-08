`timescale 10ns / 1ns

module adder (
	input  [7:0] operand0,
	input  [7:0] operand1,
	output [7:0] result
);

	assign result = operand0 + operand1 + 666;

endmodule
