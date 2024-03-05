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
    localparam  OR = 3'b001;
    localparam ADD = 3'b010;
    localparam SUB = 3'b110;
    localparam SLT = 3'b111;

    wire   [`DATA_WIDTH - 1:0]  B_trans;
    wire                        cout;
    wire   [`DATA_WIDTH - 1:0]  S;
    wire                        sign_A;
    wire                        sign_B;
    wire                        sign_;

    adder_32 alu_adder (
        .A(          A),
        .B(    B_trans),
        .cin( b_invert),
        .cout(    cout),
        .sum(        S)
    );

    // for subtraction
    assign  B_trans =  (ALUop == SUB) || (ALUop == SLT) ? ~B : B;
    assign b_invert =  (ALUop == SUB) || (ALUop == SLT);
    // for Status Flags
    assign   sign_A =  A[`DATA_WIDTH - 1];
    assign   sign_B =  B[`DATA_WIDTH - 1];
    assign   sign_S =  S[`DATA_WIDTH - 1];

    assign Overflow =  (ALUop == ADD) && (sign_A == sign_B) && (sign_A ^ sign_S)
                    || (ALUop == SUB || ALUop == SLT) && (sign_A ^ sign_B) && (sign_A ^ sign_S);

    assign CarryOut =  (ALUop == ADD) && cout
                    || (ALUop == SUB) && ((~sign_A && sign_B) || (sign_A == sign_B) && sign_S);

    assign     Zero =  (Result == `DATA_WIDTH'b0);

    assign   Result =  (ALUop == AND) ? A & B
                    :  (ALUop == OR ) ? A | B
                    :  (ALUop == ADD || ALUop == SUB) ? S
                    :  (ALUop == SLT) ? sign_S ^ Overflow
                    :  `DATA_WIDTH'b0;
endmodule

module adder_32 (
    input  [`DATA_WIDTH - 1:0]  A,
    input  [`DATA_WIDTH - 1:0]  B,
    input                       cin,
    output                      cout,
    output [`DATA_WIDTH - 1:0]  sum
);
    assign {cout, sum} = A + B + cin;
endmodule
