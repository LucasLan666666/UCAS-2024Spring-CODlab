`timescale 10 ns / 1 ns

`define DATA_WIDTH 32
`define AND        3'b000
`define OR         3'b001
`define ADD        3'b010
`define SUB        3'b110
`define SLT        3'b111

module alu (
    input  [`DATA_WIDTH - 1:0]  A,
    input  [`DATA_WIDTH - 1:0]  B,
    input  [              2:0]  ALUop,
    output                      Overflow,
    output                      CarryOut,
    output                      Zero,
    output [`DATA_WIDTH - 1:0]  Result
);

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
    assign       B2 = (ALUop == `SUB || ALUop == `SLT) ? ~B + 1: B;

    assign CarryOut = (ALUop == `ADD) ? cout
                    : (ALUop == `SUB) ? (~A[`DATA_WIDTH - 1] && B[`DATA_WIDTH - 1]) || (~A[`DATA_WIDTH - 1] && ~B[`DATA_WIDTH - 1] && sum[`DATA_WIDTH - 1]) || (A[`DATA_WIDTH - 1] && B[`DATA_WIDTH - 1] && ~sum[`DATA_WIDTH - 1])
                    : `DATA_WIDTH'bz;

    assign Overflow = (ALUop == `ADD || ALUop == `SUB) ? (A2[`DATA_WIDTH - 1] && B2[`DATA_WIDTH - 1] && ~sum[`DATA_WIDTH - 1]) || (~A2[`DATA_WIDTH - 1] && ~B2[`DATA_WIDTH - 1] && sum[`DATA_WIDTH - 1])
                    : `DATA_WIDTH'bz;

    assign     Zero = (Result == `DATA_WIDTH'b0);

    assign   Result = (ALUop == `AND) ? A & B
                    : (ALUop == `OR ) ? A | B
                    : (ALUop == `ADD || ALUop == `SUB) ? sum
                    : (ALUop == `SLT) ? sum[`DATA_WIDTH - 1] ^ Overflow
                    : `DATA_WIDTH'bz;
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