`timescale 1ns / 1ns

module wall_clk_counter (
  input clk,
  input resetn,
  output reg [31:0] cnt_val
);

  reg [31:0] cnt_internal;

  always @(posedge clk)
  begin
	  if (~resetn)
		  cnt_internal <= 32'b0;
	  
	  else if (cnt_internal == 32'd1000)
		  cnt_internal <= 32'b0;

	  else
		  cnt_internal <= cnt_internal + 32'd1;
  end

  always @(posedge clk)
  begin
	  if (~resetn)
		  cnt_val <= 32'b0;
	  else if (cnt_internal == 32'd1000)
		  cnt_val <= cnt_val + 32'b1;
  end

endmodule
