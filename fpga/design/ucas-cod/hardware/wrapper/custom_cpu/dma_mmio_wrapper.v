
module dma_mmio_wrapper (
	input  [ 3:0]    bram_we_a,
	input  [11:0]    bram_addr_a,

	output [ 9:0]    reg_addr,
	output [ 0:0]    reg_write
);

assign  reg_addr  = bram_addr_a[11:2];
assign  reg_write = bram_we_a[0];

endmodule

