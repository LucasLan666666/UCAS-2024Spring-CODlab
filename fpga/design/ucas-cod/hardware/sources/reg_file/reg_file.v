`timescale 10 ns / 1 ns

`define DATA_WIDTH 32
`define ADDR_WIDTH 5
`define   ADDR_NUM 32 // the number of registers

module reg_file (
    input                       clk,
    input  [`ADDR_WIDTH - 1:0]  waddr,
    input  [`ADDR_WIDTH - 1:0]  raddr1,
    input  [`ADDR_WIDTH - 1:0]  raddr2,
    input                       wen,
    input  [`DATA_WIDTH - 1:0]  wdata,
    output [`DATA_WIDTH - 1:0]  rdata1,
    output [`DATA_WIDTH - 1:0]  rdata2
);

	// reg file
	reg [`DATA_WIDTH - 1:0] my_reg_file  [`ADDR_NUM - 1:0];

    always @(posedge clk) begin
        // when to accept input
        if (wen == 1 && waddr != `ADDR_WIDTH'b0) begin
            my_reg_file[waddr] <= wdata;
        end
    end
    // read data from specific address
    assign rdata1 = (raddr1 == 0) ? `DATA_WIDTH'b0 : my_reg_file[raddr1];
    assign rdata2 = (raddr2 == 0) ? `DATA_WIDTH'b0 : my_reg_file[raddr2];

endmodule
