`timescale 1ns / 1ns

module wall_clk_counter (
  input clk,
  input resetn,
  input  cnt_clear,
  output reg [31:0] cnt_val
);

  /* clk frequency: 100MHz (10ns) 
   * internal counter: 0 - 99 (1us) */
  reg [31:0] cnt_internal;

  always @(posedge clk)
  begin
	  if (~resetn)
		  cnt_internal <= 32'b0;

	  else if (cnt_clear)
		  cnt_internal <= 32'b0;
	  
	  else if (cnt_internal == 32'd99)
		  cnt_internal <= 32'b0;

	  else
		  cnt_internal <= cnt_internal + 32'd1;
  end

  always @(posedge clk)
  begin
	  if (~resetn)
		  cnt_val <= 32'b0;

	  else if (cnt_clear)
		  cnt_val <= 32'b0;

	  else if (~cnt_clear && (cnt_internal == 32'd99))
		  cnt_val <= cnt_val + 32'd1;
  end

endmodule
