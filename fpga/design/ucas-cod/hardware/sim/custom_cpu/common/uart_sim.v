`define COUNTER_BIT 7
module uart_sim #(
    parameter UART_SIM = 1
) (
    input       clk,
    input       reset,
    input       write_fifo,
    input [7:0] write_data,
    input       read_state,
    output      read_ok,
    output[31:0]read_data
);

reg [`COUNTER_BIT - 1:0] counter;
always @(posedge clk) begin
    if (reset)
        counter <= 'd0;
    else
        counter <= counter + 1;
end

wire        empty_fifo;
wire        full_fifo;
wire        pop_fifo;
wire [7:0]  pop_data;
reg         read_ok_r;
reg         pop_fifo_r;

assign pop_fifo  = ~empty_fifo & counter == {`COUNTER_BIT{1'b1}};
assign read_ok   = read_ok_r;
assign read_data = {28'b0, full_fifo, 3'b0};

always @(posedge clk) begin
    if (reset)
        pop_fifo_r <= 1'b0;
    else if (pop_fifo)
        pop_fifo_r <= 1'b1;
    else
        pop_fifo_r <= 1'b0;

    if (pop_fifo_r & UART_SIM)
        $write("%c", pop_data);
    
    if (read_state)
        read_ok_r <= 1'b1;
    else
        read_ok_r <= 1'b0;
end

sim_fifo u_sim_fifo (
    .clk        (clk        ),
    .reset      (reset      ),
    .push       (write_fifo ),
    .pop        (pop_fifo   ),
    .data_in    (write_data ),
    .data_out   (pop_data   ),
    .empty      (empty_fifo ),
    .full       (full_fifo  ),
    .fifo_count (           )
);

endmodule