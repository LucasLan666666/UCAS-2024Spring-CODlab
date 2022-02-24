module cpu_to_mem_axi_2x1_arb #(
    // Width of data bus in bits
    parameter DATA_WIDTH = 32,
    // Width of address bus in bits
    parameter ADDR_WIDTH = 14,
    // Width of wstrb (width of data bus in words)
    parameter STRB_WIDTH = (DATA_WIDTH/8),
    // Width of ID signal
    parameter ID_WIDTH = 4,
    // Extra pipeline register on output
    parameter PIPELINE_OUTPUT = 0
)(
	input          clk,
	input          resetn,
	
	//AXI AR Channel for instruction
	input  [31:0]  cpu_inst_araddr,
	output	       cpu_inst_arready,
	input	       cpu_inst_arvalid,
	input  [ 2:0]  cpu_inst_arsize,
	input  [ 1:0]  cpu_inst_arburst,
	input  [ 7:0]  cpu_inst_arlen,

	//AXI R Channel for instruction
	output [31:0]  cpu_inst_rdata,
	input	       cpu_inst_rready,
	output	       cpu_inst_rvalid,
	output	       cpu_inst_rlast,

	//AXI AR Channel for data
	input  [31:0]  cpu_mem_araddr,
	output	       cpu_mem_arready,
	input	       cpu_mem_arvalid,
	input  [ 2:0]  cpu_mem_arsize,
	input  [ 1:0]  cpu_mem_arburst,
	input  [ 7:0]  cpu_mem_arlen,

	//AXI R Channel for mem
	output [31:0]	cpu_mem_rdata,
	input		cpu_mem_rready,
	output		cpu_mem_rvalid,
	output		cpu_mem_rlast,

	//AXI AW Channel for mem
	input  [31:0]	cpu_mem_awaddr,
	output		cpu_mem_awready,
	input  		cpu_mem_awvalid,
	input  [ 2:0]	cpu_mem_awsize,
	input  [ 1:0]	cpu_mem_awburst,
	input  [ 7:0]	cpu_mem_awlen,

	//AXI B Channel for mem
	input		cpu_mem_bready,
	output		cpu_mem_bvalid,

	//AXI W Channel for mem
	input  [31:0]	cpu_mem_wdata,
	output		cpu_mem_wready,
	input  [ 3:0]	cpu_mem_wstrb,
	input		cpu_mem_wvalid,
	input		cpu_mem_wlast,
	
	output [ID_WIDTH  -1:0]  s_axi_arid,
	output [ADDR_WIDTH-1:0]  s_axi_araddr,
	output [           7:0]  s_axi_arlen,
	output [           2:0]  s_axi_arsize,
	output [           1:0]  s_axi_arburst,
	output                   s_axi_arlock,
	output [           3:0]  s_axi_arcache,
	output [           2:0]  s_axi_arprot,
	output                   s_axi_arvalid,
	input                    s_axi_arready,
	
	input  [ID_WIDTH  -1:0]  s_axi_rid,
	input  [DATA_WIDTH-1:0]  s_axi_rdata,
	input  [           1:0]  s_axi_rresp,
	input                    s_axi_rlast,
	input                    s_axi_rvalid,
	output                   s_axi_rready,
	
	output [ID_WIDTH  -1:0]  s_axi_awid,
	output [ADDR_WIDTH-1:0]  s_axi_awaddr,
	output [           7:0]  s_axi_awlen,
	output [           2:0]  s_axi_awsize,
	output [           1:0]  s_axi_awburst,
	output                   s_axi_awlock,
	output [           3:0]  s_axi_awcache,
	output [           2:0]  s_axi_awprot,
	output                   s_axi_awvalid,
	input                    s_axi_awready,
	
	output [DATA_WIDTH-1:0]  s_axi_wdata,
	output [STRB_WIDTH-1:0]  s_axi_wstrb,
	output                   s_axi_wlast,
	output                   s_axi_wvalid,
	input                    s_axi_wready,
	
	input [ID_WIDTH-1:0]     s_axi_bid,
	input [         1:0]     s_axi_bresp,
	input                    s_axi_bvalid,
	output                   s_axi_bready
);

localparam INSTID = {ID_WIDTH{1'b0}},
           DATAID = {ID_WIDTH{1'b1}};

assign s_axi_awid      = DATAID;
assign s_axi_awaddr    = cpu_mem_awaddr;
assign s_axi_awlen     = cpu_mem_awlen;
assign s_axi_awsize    = cpu_mem_awsize;
assign s_axi_awburst   = cpu_mem_awburst;
assign s_axi_awlock    = 1'b0;
assign s_axi_awcache   = 4'b0;
assign s_axi_awprot    = 3'b0;
assign s_axi_awvalid   = cpu_mem_awvalid;
assign cpu_mem_awready = s_axi_awready;

assign s_axi_wdata    = cpu_mem_wdata;
assign s_axi_wstrb    = cpu_mem_wstrb;
assign s_axi_wlast    = cpu_mem_wlast;
assign s_axi_wvalid   = cpu_mem_wvalid;
assign cpu_mem_wready = s_axi_wready;

assign s_axi_bready   = cpu_mem_bready;
assign cpu_mem_bvalid = s_axi_bvalid;

assign s_axi_arcache = 4'b0;
assign s_axi_arlock  = 1'b0;
assign s_axi_arprot  = 3'b0;

reg                  arbusy;
reg [ID_WIDTH  -1:0] arid_r;
reg [ADDR_WIDTH-1:0] araddr_r;
reg [           2:0] arsize_r;
reg                  arvalid_r;
reg [           7:0] arlen_r;
reg [           1:0] arburst_r;
reg [DATA_WIDTH-1:0] rdata_r;

always @(posedge clk)
begin
    if (~resetn)
        arbusy <= 1'b0;
    else if (~arbusy & cpu_mem_arvalid)
        arbusy <= 1'b1;
    else if (~arbusy & cpu_inst_arvalid)
        arbusy <= 1'b1;
    else if (arbusy & s_axi_arready)
        arbusy <= 1'b0;
    
    if (~resetn)
    	arid_r <= {ID_WIDTH{1'b0}};
    else if (~arbusy & cpu_mem_arvalid)
        arid_r <= DATAID;
    else if (~arbusy & cpu_inst_arvalid)
        arid_r <= INSTID;

    if (~arbusy & cpu_mem_arvalid)
        araddr_r <= cpu_mem_araddr;
    else if (~arbusy & cpu_inst_arvalid)
        araddr_r <= cpu_inst_araddr;

    if (~arbusy & cpu_mem_arvalid)
        arsize_r <= cpu_mem_arsize;
    else if (~arbusy & cpu_inst_arvalid)
        arsize_r <= cpu_inst_arsize;

    if (~resetn)
        arvalid_r <= 1'b0;
    else if (~arbusy & cpu_mem_arvalid)
        arvalid_r <= 1'b1;
    else if (~arbusy & cpu_inst_arvalid)
        arvalid_r <= 1'b1;
    else if (arbusy & s_axi_arready)
        arvalid_r <= 1'b0;
    
    if (~arbusy & cpu_mem_arvalid)
        arlen_r <= cpu_mem_arlen;
    else if (~arbusy & cpu_inst_arvalid)
        arlen_r <= cpu_inst_arlen;

    if (~arbusy & cpu_mem_arvalid)
        arburst_r <= cpu_mem_arburst;
    else if (~arbusy & cpu_inst_arvalid)
        arburst_r <= cpu_inst_arburst;
end

assign s_axi_arid       = arid_r;
assign s_axi_araddr     = araddr_r;
assign s_axi_arlen      = arlen_r;
assign s_axi_arsize     = arsize_r;
assign s_axi_arburst    = arburst_r;
assign s_axi_arvalid    = arvalid_r;
assign cpu_mem_arready  = s_axi_arready & s_axi_arid == DATAID;
assign cpu_inst_arready = s_axi_arready & s_axi_arid == INSTID;

assign s_axi_rready    = cpu_mem_rready | cpu_inst_rready;
assign cpu_mem_rdata   = s_axi_rdata;
assign cpu_mem_rvalid  = s_axi_rid == DATAID & s_axi_rvalid;
assign cpu_mem_rlast   = s_axi_rlast;
assign cpu_inst_rdata  = s_axi_rdata;
assign cpu_inst_rvalid = s_axi_rid == INSTID & s_axi_rvalid;
assign cpu_inst_rlast  = s_axi_rlast;

endmodule
