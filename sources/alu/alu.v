`default_nettype none
`timescale 10 ns / 1 ns
`define DATA_WIDTH 32

module alu (
    input  [`DATA_WIDTH - 1:0]  A,
    input  [`DATA_WIDTH - 1:0]  B,
    input  [              2:0]  ALUop,
    output                      Overflow,
    output                      CarryOut,
    output                      Zero,
    output [`DATA_WIDTH - 1:0]  Result
);

    // Status Flags
    localparam AND = 3'b000;
    localparam  OR = 3'b001;
    localparam ADD = 3'b010;
    localparam SUB = 3'b110;
    localparam SLT = 3'b111;

    wire   [`DATA_WIDTH - 1:0]  B_trans;
    wire                        b_invert;
    wire                        cout;
    wire   [`DATA_WIDTH - 1:0]  S;
    wire                        sign_A, sign_B, sign_S;
    wire                        op_and, op_or, op_add, op_sub, op_slt;

    // different ops
    assign op_and = (ALUop == AND);
    assign  op_or = (ALUop ==  OR);
    assign op_add = (ALUop == ADD);
    assign op_sub = (ALUop == SUB);
    assign op_slt = (ALUop == SLT);

    // for Status Flags
    assign sign_A = A[`DATA_WIDTH - 1];
    assign sign_B = B[`DATA_WIDTH - 1];
    assign sign_S = S[`DATA_WIDTH - 1];

    // for subtraction
    assign  B_trans = {32{b_invert}} ^ B;
    assign b_invert = op_sub || op_slt;

    // the only adder, for ADD, SUB, SLT
    assign {cout, S} = A + B_trans + b_invert;

    // Status Flags
    assign Overflow = (op_add && (sign_A == sign_B) || b_invert && (sign_A != sign_B)) && (sign_A != sign_S);
    assign CarryOut = op_add && cout || op_sub && !cout;
    assign     Zero = !Result;
    assign   Result = {32{op_and}} & (A & B)
                    | {32{op_or}} & (A | B)
                    | {32{op_add || op_sub}} & S
                    | {32{op_slt}} & (sign_S != Overflow);
endmodule
