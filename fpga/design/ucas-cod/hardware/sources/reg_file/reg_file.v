`timescale 10 ns / 1 ns

`define DATA_WIDTH 32
`define ADDR_WIDTH 5
`define   ADDR_NUM 32 // 寄存器数量是 32

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

	// 寄存器堆
	reg [`DATA_WIDTH - 1:0] reg_file [`ADDR_NUM - 1:0];

    always @(posedge clk) begin
        // 根据 wen 判断是否接受输入
        if (wen == 1 && waddr != `ADDR_WIDTH'b0) begin
            reg_file[waddr][`DATA_WIDTH] <= wdata;
        end
    end
    // 读出指定地址数据
    assign rdata1 = (raddr1 == 0) ? `DATA_WIDTH'b0 : reg_file[raddr1];
    assign rdata2 = (raddr2 == 0) ? `DATA_WIDTH'b0 : reg_file[raddr2];

endmodule
