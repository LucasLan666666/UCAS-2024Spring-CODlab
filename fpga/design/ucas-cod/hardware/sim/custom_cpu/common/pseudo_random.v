module pseudo_random (
    input clk,
    input reset,
    output [4:0] random_mask 
);

reg [22:0] pseudo_random_23;
reg no_mask;
reg short_delay;
always @ (posedge clk)
begin
    if (reset)
        pseudo_random_23 <= {7'b1010101, 16'h7ea2};
    else
        pseudo_random_23 <= {pseudo_random_23[21:0], pseudo_random_23[22] ^ pseudo_random_23[17]};
    
    if (reset)
        no_mask <= pseudo_random_23[15:0]==16'h00FF;

    if (reset)
        short_delay <= pseudo_random_23[7:0]==8'hFF;
end
assign random_mask[0] = (pseudo_random_23[10]&pseudo_random_23[20]) & (short_delay|(pseudo_random_23[11]^pseudo_random_23[5]))
                          | no_mask;
assign random_mask[1] = (pseudo_random_23[ 9]&pseudo_random_23[17]) & (short_delay|(pseudo_random_23[12]^pseudo_random_23[4]))
                          | no_mask;
assign random_mask[2] = (pseudo_random_23[ 8]^pseudo_random_23[22]) & (short_delay|(pseudo_random_23[13]^pseudo_random_23[3]))
                          | no_mask;
assign random_mask[3] = (pseudo_random_23[ 7]&pseudo_random_23[19]) & (short_delay|(pseudo_random_23[14]^pseudo_random_23[2]))
                          | no_mask;
assign random_mask[4] = (pseudo_random_23[ 6]^pseudo_random_23[16]) & (short_delay|(pseudo_random_23[15]^pseudo_random_23[1]))
                          | no_mask;

endmodule