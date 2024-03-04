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

    localparam AND = 3'b000;
    localparam OR  = 3'b001;
    localparam ADD = 3'b010;
    localparam SUB = 3'b110;
    localparam SLT = 3'b111;

    wire   [`DATA_WIDTH - 1:0]  A2;
    wire   [`DATA_WIDTH - 1:0]  B2;
    wire                        cout;
    wire   [`DATA_WIDTH - 1:0]  sum;

    adder_32 alu_adder (
        .A(         A2),
        .B(         B2),
        .cin(        0),
        .cout(    cout),
        .sum(      sum)
    );

    // 一个加法器实现 ADD，SUB，SLT
    assign       A2 = A;
    assign       B2 = (ALUop == SUB || ALUop == SLT) ? ~B + 1: B;

    assign CarryOut = (ALUop == ADD) ? cout
                    : (ALUop == SUB) ? (~A[`DATA_WIDTH - 1] && B[`DATA_WIDTH - 1]) || (~A[`DATA_WIDTH - 1] && ~B[`DATA_WIDTH - 1] && sum[`DATA_WIDTH - 1]) || (A[`DATA_WIDTH - 1] && B[`DATA_WIDTH - 1] && ~sum[`DATA_WIDTH - 1])
                    : `DATA_WIDTH'bx;

    assign Overflow = (ALUop == ADD || ALUop == SUB) ? (A2[`DATA_WIDTH - 1] && B2[`DATA_WIDTH - 1] && ~sum[`DATA_WIDTH - 1]) || (~A2[`DATA_WIDTH - 1] && ~B2[`DATA_WIDTH - 1] && sum[`DATA_WIDTH - 1])
                    : `DATA_WIDTH'bx;

    assign     Zero = (Result == `DATA_WIDTH'b0);

    assign   Result = (ALUop == AND) ? A & B
                    : (ALUop == OR ) ? A | B
                    : (ALUop == ADD || ALUop == SUB) ? sum
                    : (ALUop == SLT) ? sum[`DATA_WIDTH - 1] ^ Overflow
                    : `DATA_WIDTH'bx;
endmodule

module adder_32 (
    input  [`DATA_WIDTH - 1:0]  A,
    input  [`DATA_WIDTH - 1:0]  B,
    input                       cin,
    output                      cout,
    output                      sum
);
    assign {cout, sum} = A + B + cin;
endmodule