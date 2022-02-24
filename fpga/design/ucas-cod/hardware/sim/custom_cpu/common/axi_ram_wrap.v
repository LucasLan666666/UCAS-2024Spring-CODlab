module axi_ram_wrap #
(
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
)
(
    input  wire                   clk,
    input  wire                   rst,
    input  wire [4:0]             random_mask,

    input  wire [ID_WIDTH-1:0]    axi_awid,
    input  wire [ADDR_WIDTH-1:0]  axi_awaddr,
    input  wire [7:0]             axi_awlen,
    input  wire [2:0]             axi_awsize,
    input  wire [1:0]             axi_awburst,
    input  wire                   axi_awlock,
    input  wire [3:0]             axi_awcache,
    input  wire [2:0]             axi_awprot,
    input  wire                   axi_awvalid,
    output wire                   axi_awready,
    input  wire [DATA_WIDTH-1:0]  axi_wdata,
    input  wire [STRB_WIDTH-1:0]  axi_wstrb,
    input  wire                   axi_wlast,
    input  wire                   axi_wvalid,
    output wire                   axi_wready,
    output wire [ID_WIDTH-1:0]    axi_bid,
    output wire [1:0]             axi_bresp,
    output wire                   axi_bvalid,
    input  wire                   axi_bready,
    input  wire [ID_WIDTH-1:0]    axi_arid,
    input  wire [ADDR_WIDTH-1:0]  axi_araddr,
    input  wire [7:0]             axi_arlen,
    input  wire [2:0]             axi_arsize,
    input  wire [1:0]             axi_arburst,
    input  wire                   axi_arlock,
    input  wire [3:0]             axi_arcache,
    input  wire [2:0]             axi_arprot,
    input  wire                   axi_arvalid,
    output wire                   axi_arready,
    output wire [ID_WIDTH-1:0]    axi_rid,
    output wire [DATA_WIDTH-1:0]  axi_rdata,
    output wire [1:0]             axi_rresp,
    output wire                   axi_rlast,
    output wire                   axi_rvalid,
    input  wire                   axi_rready
);

wire ar_and;
wire  r_and;
wire aw_and;
wire  w_and;
wire  b_and;
assign aw_and = random_mask[0];
assign  w_and = random_mask[1];
assign  b_and = random_mask[2] | 1'b1;
assign ar_and = random_mask[3];
assign  r_and = random_mask[4];

// master to slave mask
assign axi_arvalid_m = axi_arvalid & ar_and;
assign axi_rready_m  = axi_rready  &  r_and;
assign axi_awvalid_m = axi_awvalid & aw_and;
assign axi_wvalid_m  = axi_wvalid  &  w_and;
assign axi_bready_m  = axi_bready  &  b_and;

// slave to master mask
assign axi_arready = axi_arready_s & ar_and;
assign axi_rvalid  = axi_rvalid_s  &  r_and;
assign axi_awready = axi_awready_s & aw_and;
assign axi_wready  = axi_wready_s  &  w_and;
assign axi_bvalid  = axi_bvalid_s  &  b_and;
     
//ar
wire [ID_WIDTH-1:0]     ram_arid;
wire [ADDR_WIDTH-1:0]   ram_araddr;
wire [7:0]              ram_arlen;
wire [2:0]              ram_arsize;
wire [1:0]              ram_arburst;
wire [1:0]              ram_arlock;
wire [3:0]              ram_arcache;
wire [2:0]              ram_arprot;
wire                    ram_arvalid;
wire                    ram_arready;
//r
wire [ID_WIDTH-1:0]     ram_rid;
wire [DATA_WIDTH-1:0]   ram_rdata;
wire [1:0]              ram_rresp;
wire                    ram_rlast;
wire                    ram_rvalid;
wire                    ram_rready;
//aw
wire [ID_WIDTH-1:0]     ram_awid;
wire [ADDR_WIDTH-1:0]   ram_awaddr;
wire [7:0]              ram_awlen;
wire [2:0]              ram_awsize;
wire [1:0]              ram_awburst;
wire                    ram_awlock;
wire [3:0]              ram_awcache;
wire [2:0]              ram_awprot;
wire                    ram_awvalid;
wire                    ram_awready;
//w
wire [DATA_WIDTH-1:0]   ram_wdata;
wire [STRB_WIDTH-1:0]   ram_wstrb;
wire                    ram_wlast;
wire                    ram_wvalid;
wire                    ram_wready;
//b
wire [ID_WIDTH-1:0]     ram_bid;
wire [1:0]              ram_bresp;
wire                    ram_bvalid;
wire                    ram_bready;

axi_ram ram(
    .clk            (clk          ),
    .rst            (rst          ),

    //ar
    .s_axi_arid     (ram_arid     ),
    .s_axi_araddr   (ram_araddr   ),
    .s_axi_arlen    (ram_arlen    ),
    .s_axi_arsize   (ram_arsize   ),
    .s_axi_arburst  (ram_arburst  ),
    .s_axi_arvalid  (ram_arvalid  ),
    .s_axi_arready  (ram_arready  ),
    //r
    .s_axi_rid      (ram_rid      ),
    .s_axi_rdata    (ram_rdata    ),
    .s_axi_rresp    (ram_rresp    ),
    .s_axi_rlast    (ram_rlast    ),
    .s_axi_rvalid   (ram_rvalid   ),
    .s_axi_rready   (ram_rready   ),
    //aw
    .s_axi_awid     (ram_awid     ),
    .s_axi_awaddr   (ram_awaddr   ),
    .s_axi_awlen    (ram_awlen    ),
    .s_axi_awsize   (ram_awsize   ),
    .s_axi_awburst  (ram_awburst  ),
    .s_axi_awvalid  (ram_awvalid  ),
    .s_axi_awready  (ram_awready  ),
    //w
    .s_axi_wdata    (ram_wdata    ),
    .s_axi_wstrb    (ram_wstrb    ),
    .s_axi_wlast    (ram_wlast    ),
    .s_axi_wvalid   (ram_wvalid   ),
    .s_axi_wready   (ram_wready   ),
    //b
    .s_axi_bid      (ram_bid      ),
    .s_axi_bresp    (ram_bresp    ),
    .s_axi_bvalid   (ram_bvalid   ),
    .s_axi_bready   (ram_bready   )
);

//ar
assign ram_arid    = axi_arid;
assign ram_araddr  = axi_araddr;
assign ram_arlen   = axi_arlen;
assign ram_arsize  = axi_arsize;
assign ram_arburst = axi_arburst;
assign ram_arlock  = axi_arlock;
assign ram_arcache = axi_arcache;
assign ram_arprot  = axi_arprot;
assign ram_arvalid = axi_arvalid_m;
assign axi_arready_s = ram_arready;
//r
assign axi_rid    = axi_rvalid ? ram_rid   :  4'd0;
assign axi_rdata  = axi_rvalid ? ram_rdata : 32'd0;
assign axi_rresp  = axi_rvalid ? ram_rresp :  2'd0;
assign axi_rlast  = axi_rvalid ? ram_rlast :  1'd0;
assign axi_rvalid_s = ram_rvalid;
assign ram_rready = axi_rready_m;
//aw
assign ram_awid    = axi_awid;
assign ram_awaddr  = axi_awaddr;
assign ram_awlen   = axi_awlen;
assign ram_awsize  = axi_awsize;
assign ram_awburst = axi_awburst;
assign ram_awlock  = axi_awlock;
assign ram_awcache = axi_awcache;
assign ram_awprot  = axi_awprot;
assign ram_awvalid = axi_awvalid_m;
assign axi_awready_s = ram_awready;
//w
assign ram_wdata  = axi_wdata;
assign ram_wstrb  = axi_wstrb;
assign ram_wlast  = axi_wlast;
assign ram_wvalid = axi_wvalid_m;
assign axi_wready_s = ram_wready;
//b
assign axi_bid    = axi_bvalid ? ram_bid   : 4'd0;
assign axi_bresp  = axi_bvalid ? ram_bresp : 2'd0;
assign axi_bvalid_s = ram_bvalid;
assign ram_bready = axi_bready_m;
endmodule