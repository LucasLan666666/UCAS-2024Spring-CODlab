`ifndef __AXI4_H__
`define __AXI4_H__

`define _AXI4_DEF_FIELD(keyword, prefix, name, width) \
    keyword [(width)-1:0] prefix``_``name

`define _AXI4_CON_FIELD(if_prefix, wire_prefix, name) \
    .if_prefix``_``name(wire_prefix``_``name)

`define _AXI4LITE_AW_PORT_DECL(key1, key2, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key1, prefix, awvalid,     1), \
    `_AXI4_DEF_FIELD(key2, prefix, awready,     1), \
    `_AXI4_DEF_FIELD(key1, prefix, awaddr,      addr_width), \
    `_AXI4_DEF_FIELD(key1, prefix, awprot,      3)

`define _AXI4LITE_W_PORT_DECL(key1, key2, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key1, prefix, wvalid,      1), \
    `_AXI4_DEF_FIELD(key2, prefix, wready,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, wdata,       data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, wstrb,       (data_width/8))

`define _AXI4LITE_B_PORT_DECL(key1, key2, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key1, prefix, bvalid,      1), \
    `_AXI4_DEF_FIELD(key2, prefix, bready,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, bresp,       2)

`define _AXI4LITE_AR_PORT_DECL(key1, key2, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key1, prefix, arvalid,     1), \
    `_AXI4_DEF_FIELD(key2, prefix, arready,     1), \
    `_AXI4_DEF_FIELD(key1, prefix, araddr,      addr_width), \
    `_AXI4_DEF_FIELD(key1, prefix, arprot,      3)

`define _AXI4LITE_R_PORT_DECL(key1, key2, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key1, prefix, rvalid,      1), \
    `_AXI4_DEF_FIELD(key2, prefix, rready,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, rdata,       data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, rresp,       2)

`define _AXI4LITE_AW_ITEM_DECL(key, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key, prefix, awvalid,      1); \
    `_AXI4_DEF_FIELD(key, prefix, awready,      1); \
    `_AXI4_DEF_FIELD(key, prefix, awaddr,       addr_width); \
    `_AXI4_DEF_FIELD(key, prefix, awprot,       3)

`define _AXI4LITE_W_ITEM_DECL(key, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key, prefix, wvalid,       1); \
    `_AXI4_DEF_FIELD(key, prefix, wready,       1); \
    `_AXI4_DEF_FIELD(key, prefix, wdata,        data_width); \
    `_AXI4_DEF_FIELD(key, prefix, wstrb,        (data_width/8))

`define _AXI4LITE_B_ITEM_DECL(key, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key, prefix, bvalid,       1); \
    `_AXI4_DEF_FIELD(key, prefix, bready,       1); \
    `_AXI4_DEF_FIELD(key, prefix, bresp,        2)

`define _AXI4LITE_AR_ITEM_DECL(key, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key, prefix, arvalid,      1); \
    `_AXI4_DEF_FIELD(key, prefix, arready,      1); \
    `_AXI4_DEF_FIELD(key, prefix, araddr,       addr_width); \
    `_AXI4_DEF_FIELD(key, prefix, arprot,       3)

`define _AXI4LITE_R_ITEM_DECL(key, prefix, addr_width, data_width) \
    `_AXI4_DEF_FIELD(key, prefix, rvalid,       1); \
    `_AXI4_DEF_FIELD(key, prefix, rready,       1); \
    `_AXI4_DEF_FIELD(key, prefix, rdata,        data_width); \
    `_AXI4_DEF_FIELD(key, prefix, rresp,        2)

`define _AXI4_AW_PORT_DECL(key1, key2, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_AW_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, awid,        id_width), \
    `_AXI4_DEF_FIELD(key1, prefix, awlen,       8), \
    `_AXI4_DEF_FIELD(key1, prefix, awsize,      3), \
    `_AXI4_DEF_FIELD(key1, prefix, awburst,     2), \
    `_AXI4_DEF_FIELD(key1, prefix, awlock,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, awcache,     4), \
    `_AXI4_DEF_FIELD(key1, prefix, awqos,       4), \
    `_AXI4_DEF_FIELD(key1, prefix, awregion,    4)

`define _AXI4_W_PORT_DECL(key1, key2, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_W_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, wlast,       1)

`define _AXI4_B_PORT_DECL(key1, key2, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_B_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, bid,         id_width)

`define _AXI4_AR_PORT_DECL(key1, key2, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_AR_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, arid,        id_width), \
    `_AXI4_DEF_FIELD(key1, prefix, arlen,       8), \
    `_AXI4_DEF_FIELD(key1, prefix, arsize,      3), \
    `_AXI4_DEF_FIELD(key1, prefix, arburst,     2), \
    `_AXI4_DEF_FIELD(key1, prefix, arlock,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, arcache,     4), \
    `_AXI4_DEF_FIELD(key1, prefix, arqos,       4), \
    `_AXI4_DEF_FIELD(key1, prefix, arregion,    4)

`define _AXI4_R_PORT_DECL(key1, key2, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_R_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, rid,         id_width), \
    `_AXI4_DEF_FIELD(key1, prefix, rlast,       1)

`define _AXI4_AW_ITEM_DECL(key, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_AW_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, awid,        id_width); \
    `_AXI4_DEF_FIELD(key, prefix, awlen,       8); \
    `_AXI4_DEF_FIELD(key, prefix, awsize,      3); \
    `_AXI4_DEF_FIELD(key, prefix, awburst,     2); \
    `_AXI4_DEF_FIELD(key, prefix, awlock,      1); \
    `_AXI4_DEF_FIELD(key, prefix, awcache,     4); \
    `_AXI4_DEF_FIELD(key, prefix, awqos,       4); \
    `_AXI4_DEF_FIELD(key, prefix, awregion,    4)

`define _AXI4_W_ITEM_DECL(key, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_W_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, wlast,       1)

`define _AXI4_B_ITEM_DECL(key, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_B_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, bid,         id_width)

`define _AXI4_AR_ITEM_DECL(key, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_AR_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, arid,        id_width); \
    `_AXI4_DEF_FIELD(key, prefix, arlen,       8); \
    `_AXI4_DEF_FIELD(key, prefix, arsize,      3); \
    `_AXI4_DEF_FIELD(key, prefix, arburst,     2); \
    `_AXI4_DEF_FIELD(key, prefix, arlock,      1); \
    `_AXI4_DEF_FIELD(key, prefix, arcache,     4); \
    `_AXI4_DEF_FIELD(key, prefix, arqos,       4); \
    `_AXI4_DEF_FIELD(key, prefix, arregion,    4)

`define _AXI4_R_ITEM_DECL(key, prefix, addr_width, data_width, id_width) \
    `_AXI4LITE_R_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, rid,         id_width); \
    `_AXI4_DEF_FIELD(key, prefix, rlast,       1)

`define _AXI4_AW_PORT_DECL_NO_ID(key1, key2, prefix, addr_width, data_width) \
    `_AXI4LITE_AW_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, awlen,       8), \
    `_AXI4_DEF_FIELD(key1, prefix, awsize,      3), \
    `_AXI4_DEF_FIELD(key1, prefix, awburst,     2), \
    `_AXI4_DEF_FIELD(key1, prefix, awlock,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, awcache,     4), \
    `_AXI4_DEF_FIELD(key1, prefix, awqos,       4), \
    `_AXI4_DEF_FIELD(key1, prefix, awregion,    4)

`define _AXI4_W_PORT_DECL_NO_ID(key1, key2, prefix, addr_width, data_width) \
    `_AXI4LITE_W_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, wlast,       1)

`define _AXI4_B_PORT_DECL_NO_ID(key1, key2, prefix, addr_width, data_width) \
    `_AXI4LITE_B_PORT_DECL(key1, key2, prefix, addr_width, data_width)

`define _AXI4_AR_PORT_DECL_NO_ID(key1, key2, prefix, addr_width, data_width) \
    `_AXI4LITE_AR_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, arlen,       8), \
    `_AXI4_DEF_FIELD(key1, prefix, arsize,      3), \
    `_AXI4_DEF_FIELD(key1, prefix, arburst,     2), \
    `_AXI4_DEF_FIELD(key1, prefix, arlock,      1), \
    `_AXI4_DEF_FIELD(key1, prefix, arcache,     4), \
    `_AXI4_DEF_FIELD(key1, prefix, arqos,       4), \
    `_AXI4_DEF_FIELD(key1, prefix, arregion,    4)

`define _AXI4_R_PORT_DECL_NO_ID(key1, key2, prefix, addr_width, data_width) \
    `_AXI4LITE_R_PORT_DECL(key1, key2, prefix, addr_width, data_width), \
    `_AXI4_DEF_FIELD(key1, prefix, rlast,       1)

`define _AXI4_AW_ITEM_DECL_NO_ID(key, prefix, addr_width, data_width) \
    `_AXI4LITE_AW_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, awlen,       8); \
    `_AXI4_DEF_FIELD(key, prefix, awsize,      3); \
    `_AXI4_DEF_FIELD(key, prefix, awburst,     2); \
    `_AXI4_DEF_FIELD(key, prefix, awlock,      1); \
    `_AXI4_DEF_FIELD(key, prefix, awcache,     4); \
    `_AXI4_DEF_FIELD(key, prefix, awqos,       4); \
    `_AXI4_DEF_FIELD(key, prefix, awregion,    4)

`define _AXI4_W_ITEM_DECL_NO_ID(key, prefix, addr_width, data_width) \
    `_AXI4LITE_W_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, wlast,       1)

`define _AXI4_B_ITEM_DECL_NO_ID(key, prefix, addr_width, data_width) \
    `_AXI4LITE_B_ITEM_DECL(key, prefix, addr_width, data_width)

`define _AXI4_AR_ITEM_DECL_NO_ID(key, prefix, addr_width, data_width) \
    `_AXI4LITE_AR_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, arlen,       8); \
    `_AXI4_DEF_FIELD(key, prefix, arsize,      3); \
    `_AXI4_DEF_FIELD(key, prefix, arburst,     2); \
    `_AXI4_DEF_FIELD(key, prefix, arlock,      1); \
    `_AXI4_DEF_FIELD(key, prefix, arcache,     4); \
    `_AXI4_DEF_FIELD(key, prefix, arqos,       4); \
    `_AXI4_DEF_FIELD(key, prefix, arregion,    4)

`define _AXI4_R_ITEM_DECL_NO_ID(key, prefix, addr_width, data_width) \
    `_AXI4LITE_R_ITEM_DECL(key, prefix, addr_width, data_width); \
    `_AXI4_DEF_FIELD(key, prefix, rlast,       1)

////////////////////////////// AXI4-Lite //////////////////////////////

// Define an AXI4-Lite AW channel slave interface in module port declaration
`define AXI4LITE_AW_SLAVE_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AW_PORT_DECL(input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite W channel slave interface in module port declaration
`define AXI4LITE_W_SLAVE_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_W_PORT_DECL (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite B channel slave interface in module port declaration
`define AXI4LITE_B_SLAVE_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_B_PORT_DECL (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite AR channel slave interface in module port declaration
`define AXI4LITE_AR_SLAVE_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AR_PORT_DECL(input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite R channel slave interface in module port declaration
`define AXI4LITE_R_SLAVE_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_R_PORT_DECL (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite slave interface in module port declaration
`define AXI4LITE_SLAVE_IF(prefix, addr_width, data_width) \
    `AXI4LITE_AW_SLAVE_IF(prefix, addr_width, data_width), \
    `AXI4LITE_W_SLAVE_IF (prefix, addr_width, data_width), \
    `AXI4LITE_B_MASTER_IF(prefix, addr_width, data_width), \
    `AXI4LITE_AR_SLAVE_IF(prefix, addr_width, data_width), \
    `AXI4LITE_R_MASTER_IF(prefix, addr_width, data_width)

// Define an AXI4-Lite AW channel master interface in module port declaration
`define AXI4LITE_AW_MASTER_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AW_PORT_DECL(output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite W channel master interface in module port declaration
`define AXI4LITE_W_MASTER_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_W_PORT_DECL (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite B channel master interface in module port declaration
`define AXI4LITE_B_MASTER_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_B_PORT_DECL (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite AR channel master interface in module port declaration
`define AXI4LITE_AR_MASTER_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AR_PORT_DECL(output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite R channel master interface in module port declaration
`define AXI4LITE_R_MASTER_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_R_PORT_DECL (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite master interface in module port declaration
`define AXI4LITE_MASTER_IF(prefix, addr_width, data_width) \
    `AXI4LITE_AW_MASTER_IF(prefix, addr_width, data_width), \
    `AXI4LITE_W_MASTER_IF (prefix, addr_width, data_width), \
    `AXI4LITE_B_SLAVE_IF  (prefix, addr_width, data_width), \
    `AXI4LITE_AR_MASTER_IF(prefix, addr_width, data_width), \
    `AXI4LITE_R_SLAVE_IF  (prefix, addr_width, data_width)

// Define an AXI4-Lite AW channel monitor input interface in module port declaration
`define AXI4LITE_AW_INPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AW_PORT_DECL(input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite W channel monitor input interface in module port declaration
`define AXI4LITE_W_INPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_W_PORT_DECL (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite B channel monitor input interface in module port declaration
`define AXI4LITE_B_INPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_B_PORT_DECL (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite AR channel monitor input interface in module port declaration
`define AXI4LITE_AR_INPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AR_PORT_DECL (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite R channel monitor input interface in module port declaration
`define AXI4LITE_R_INPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_R_PORT_DECL (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4-Lite monitor input interface in module port declaration
`define AXI4LITE_INPUT_IF(prefix, addr_width, data_width) \
    `AXI4LITE_AW_INPUT_IF(prefix, addr_width, data_width), \
    `AXI4LITE_W_INPUT_IF (prefix, addr_width, data_width), \
    `AXI4LITE_B_INPUT_IF (prefix, addr_width, data_width), \
    `AXI4LITE_AR_INPUT_IF(prefix, addr_width, data_width), \
    `AXI4LITE_R_INPUT_IF (prefix, addr_width, data_width)

// Define an AXI4-Lite AW channel monitor output interface in module port declaration
`define AXI4LITE_AW_OUTPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AW_PORT_DECL(output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite W channel monitor output interface in module port declaration
`define AXI4LITE_W_OUTPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_W_PORT_DECL (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite B channel monitor output interface in module port declaration
`define AXI4LITE_B_OUTPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_B_PORT_DECL (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite AR channel monitor output interface in module port declaration
`define AXI4LITE_AR_OUTPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_AR_PORT_DECL(output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite R channel monitor output interface in module port declaration
`define AXI4LITE_R_OUTPUT_IF(prefix, addr_width, data_width) \
    `_AXI4LITE_R_PORT_DECL (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4-Lite monitor output interface in module port declaration
`define AXI4LITE_OUTPUT_IF(prefix, addr_width, data_width) \
    `AXI4LITE_AW_OUTPUT_IF(prefix, addr_width, data_width), \
    `AXI4LITE_W_OUTPUT_IF (prefix, addr_width, data_width), \
    `AXI4LITE_B_OUTPUT_IF (prefix, addr_width, data_width), \
    `AXI4LITE_AR_OUTPUT_IF(prefix, addr_width, data_width), \
    `AXI4LITE_R_OUTPUT_IF (prefix, addr_width, data_width)

// Define an AXI4-Lite AW channel wire bundle in module context
`define AXI4LITE_AW_WIRE(prefix, addr_width, data_width) \
    `_AXI4LITE_AW_ITEM_DECL(wire, prefix, addr_width, data_width)

// Define an AXI4-Lite W channel wire bundle in module context
`define AXI4LITE_W_WIRE(prefix, addr_width, data_width) \
    `_AXI4LITE_W_ITEM_DECL (wire, prefix, addr_width, data_width)

// Define an AXI4-Lite B channel wire bundle in module context
`define AXI4LITE_B_WIRE(prefix, addr_width, data_width) \
    `_AXI4LITE_B_ITEM_DECL (wire, prefix, addr_width, data_width)

// Define an AXI4-Lite AR channel wire bundle in module context
`define AXI4LITE_AR_WIRE(prefix, addr_width, data_width) \
    `_AXI4LITE_AR_ITEM_DECL(wire, prefix, addr_width, data_width)

// Define an AXI4-Lite R channel wire bundle in module context
`define AXI4LITE_R_WIRE(prefix, addr_width, data_width) \
    `_AXI4LITE_R_ITEM_DECL (wire, prefix, addr_width, data_width)

// Define an AXI4-Lite wire bundle in module context
`define AXI4LITE_WIRE(prefix, addr_width, data_width) \
    `AXI4LITE_AW_WIRE(prefix, addr_width, data_width); \
    `AXI4LITE_W_WIRE (prefix, addr_width, data_width); \
    `AXI4LITE_B_WIRE (prefix, addr_width, data_width); \
    `AXI4LITE_AR_WIRE(prefix, addr_width, data_width); \
    `AXI4LITE_R_WIRE (prefix, addr_width, data_width)

// Connect an AXI4-Lite AW channel interface with another in module instantiation
`define AXI4LITE_AW_CONNECT(if_prefix, wire_prefix) \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awvalid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awready), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awaddr), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awprot)

// Connect an AXI4-Lite W channel interface with another in module instantiation
`define AXI4LITE_W_CONNECT(if_prefix, wire_prefix) \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wvalid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wready), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wdata), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wstrb)

// Connect an AXI4-Lite B channel interface with another in module instantiation
`define AXI4LITE_B_CONNECT(if_prefix, wire_prefix) \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, bvalid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, bready), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, bresp)

// Connect an AXI4-Lite AR channel interface with another in module instantiation
`define AXI4LITE_AR_CONNECT(if_prefix, wire_prefix) \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arvalid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arready), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, araddr), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arprot)

// Connect an AXI4-Lite R channel interface with another in module instantiation
`define AXI4LITE_R_CONNECT(if_prefix, wire_prefix) \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rvalid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rready), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rdata), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rresp)

// Connect an AXI4-Lite interface with another in module instantiation
`define AXI4LITE_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_AW_CONNECT(if_prefix, wire_prefix), \
    `AXI4LITE_W_CONNECT (if_prefix, wire_prefix), \
    `AXI4LITE_B_CONNECT (if_prefix, wire_prefix), \
    `AXI4LITE_AR_CONNECT(if_prefix, wire_prefix), \
    `AXI4LITE_R_CONNECT (if_prefix, wire_prefix)

// List of AXI4-Lite AW channel payload fields
`define AXI4LITE_AW_PAYLOAD(prefix) { \
    prefix``_awaddr, \
    prefix``_awprot }

// List of AXI4-Lite W channel payload fields
`define AXI4LITE_W_PAYLOAD(prefix) { \
    prefix``_wdata, \
    prefix``_wstrb }

// List of AXI4-Lite B channel payload fields
`define AXI4LITE_B_PAYLOAD(prefix) { \
    prefix``_bresp }

// List of AXI4-Lite AR channel payload fields
`define AXI4LITE_AR_PAYLOAD(prefix) { \
    prefix``_araddr, \
    prefix``_arprot }

// List of AXI4-Lite R channel payload fields
`define AXI4LITE_R_PAYLOAD(prefix) { \
    prefix``_rdata, \
    prefix``_rresp }

// Length of AXI4-Lite AW channel payload fields
`define AXI4LITE_AW_PAYLOAD_LEN(addr_width, data_width)   (addr_width + 3)

// Length of AXI4-Lite W channel payload fields
`define AXI4LITE_W_PAYLOAD_LEN(addr_width, data_width)    (data_width + data_width/8)

// Length of AXI4-Lite B channel payload fields
`define AXI4LITE_B_PAYLOAD_LEN(addr_width, data_width)    2

// Length of AXI4-Lite AR channel payload fields
`define AXI4LITE_AR_PAYLOAD_LEN(addr_width, data_width)   (addr_width + 3)

// Length of AXI4-Lite R channel payload fields
`define AXI4LITE_R_PAYLOAD_LEN(addr_width, data_width)    (data_width + 2)

////////////////////////////// AXI4 //////////////////////////////

// Define an AXI4 AW channel slave interface in module port declaration
`define AXI4_AW_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AW_PORT_DECL(input wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 W channel slave interface in module port declaration
`define AXI4_W_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_W_PORT_DECL (input wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 B channel slave interface in module port declaration
`define AXI4_B_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_B_PORT_DECL (input wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AR channel slave interface in module port declaration
`define AXI4_AR_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AR_PORT_DECL(input wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 R channel slave interface in module port declaration
`define AXI4_R_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_R_PORT_DECL (input wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 slave interface in module port declaration
`define AXI4_SLAVE_IF(prefix, addr_width, data_width, id_width) \
    `AXI4_AW_SLAVE_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_W_SLAVE_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_B_MASTER_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_AR_SLAVE_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_R_MASTER_IF(prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel master interface in module port declaration
`define AXI4_AW_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AW_PORT_DECL(output wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 W channel master interface in module port declaration
`define AXI4_W_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_W_PORT_DECL (output wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 B channel master interface in module port declaration
`define AXI4_B_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_B_PORT_DECL (output wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel master interface in module port declaration
`define AXI4_AR_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AR_PORT_DECL(output wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel master interface in module port declaration
`define AXI4_R_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_R_PORT_DECL (output wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 master interface in module port declaration
`define AXI4_MASTER_IF(prefix, addr_width, data_width, id_width) \
    `AXI4_AW_MASTER_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_W_MASTER_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_B_SLAVE_IF  (prefix, addr_width, data_width, id_width), \
    `AXI4_AR_MASTER_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_R_SLAVE_IF  (prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel monitor input interface in module port declaration
`define AXI4_AW_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AW_PORT_DECL(input wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 W channel monitor input interface in module port declaration
`define AXI4_W_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_W_PORT_DECL (input wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 B channel monitor input interface in module port declaration
`define AXI4_B_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_B_PORT_DECL (input wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AR channel monitor input interface in module port declaration
`define AXI4_AR_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AR_PORT_DECL(input wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 R channel monitor input interface in module port declaration
`define AXI4_R_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_R_PORT_DECL (input wire, input wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 monitor input interface in module port declaration
`define AXI4_INPUT_IF(prefix, addr_width, data_width, id_width) \
    `AXI4_AW_INPUT_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_W_INPUT_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_B_INPUT_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_AR_INPUT_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_R_INPUT_IF (prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel monitor output interface in module port declaration
`define AXI4_AW_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AW_PORT_DECL(output wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 W channel monitor output interface in module port declaration
`define AXI4_W_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_W_PORT_DECL (output wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 B channel monitor output interface in module port declaration
`define AXI4_B_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_B_PORT_DECL (output wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AR channel monitor output interface in module port declaration
`define AXI4_AR_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_AR_PORT_DECL(output wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 R channel monitor output interface in module port declaration
`define AXI4_R_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `_AXI4_R_PORT_DECL (output wire, output wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 monitor output interface in module port declaration
`define AXI4_OUTPUT_IF(prefix, addr_width, data_width, id_width) \
    `AXI4_AW_OUTPUT_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_W_OUTPUT_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_B_OUTPUT_IF (prefix, addr_width, data_width, id_width), \
    `AXI4_AR_OUTPUT_IF(prefix, addr_width, data_width, id_width), \
    `AXI4_R_OUTPUT_IF (prefix, addr_width, data_width, id_width)

// Define an AXI4 AW channel wire bundle in module context
`define AXI4_AW_WIRE(prefix, addr_width, data_width, id_width) \
    `_AXI4_AW_ITEM_DECL(wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 W channel wire bundle in module context
`define AXI4_W_WIRE(prefix, addr_width, data_width, id_width) \
    `_AXI4_W_ITEM_DECL (wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 B channel wire bundle in module context
`define AXI4_B_WIRE(prefix, addr_width, data_width, id_width) \
    `_AXI4_B_ITEM_DECL (wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 AR channel wire bundle in module context
`define AXI4_AR_WIRE(prefix, addr_width, data_width, id_width) \
    `_AXI4_AR_ITEM_DECL(wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 R channel wire bundle in module context
`define AXI4_R_WIRE(prefix, addr_width, data_width, id_width) \
    `_AXI4_R_ITEM_DECL (wire, prefix, addr_width, data_width, id_width)

// Define an AXI4 wire bundle in module context
`define AXI4_WIRE(prefix, addr_width, data_width, id_width) \
    `AXI4_AW_WIRE(prefix, addr_width, data_width, id_width); \
    `AXI4_W_WIRE (prefix, addr_width, data_width, id_width); \
    `AXI4_B_WIRE (prefix, addr_width, data_width, id_width); \
    `AXI4_AR_WIRE(prefix, addr_width, data_width, id_width); \
    `AXI4_R_WIRE (prefix, addr_width, data_width, id_width)

// Connect an AXI4 AW channel interface with another in module instantiation
`define AXI4_AW_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_AW_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awlen), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awsize), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awburst), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awlock), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awcache), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awqos), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awregion)

// Connect an AXI4 W channel interface with another in module instantiation
`define AXI4_W_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_W_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wlast)

// Connect an AXI4 B channel interface with another in module instantiation
`define AXI4_B_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_B_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, bid)

// Connect an AXI4 AR channel interface with another in module instantiation
`define AXI4_AR_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_AR_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arlen), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arsize), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arburst), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arlock), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arcache), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arqos), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arregion)

// Connect an AXI4 R channel interface with another in module instantiation
`define AXI4_R_CONNECT(if_prefix, wire_prefix) \
    `AXI4LITE_R_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rid), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rlast)

// Connect an AXI4 interface with another in module instantiation
`define AXI4_CONNECT(if_prefix, wire_prefix) \
    `AXI4_AW_CONNECT(if_prefix, wire_prefix), \
    `AXI4_W_CONNECT (if_prefix, wire_prefix), \
    `AXI4_B_CONNECT (if_prefix, wire_prefix), \
    `AXI4_AR_CONNECT(if_prefix, wire_prefix), \
    `AXI4_R_CONNECT (if_prefix, wire_prefix)

// List of AXI4 AW channel payload fields
`define AXI4_AW_PAYLOAD(prefix) { \
    `AXI4LITE_AW_PAYLOAD(prefix), \
    prefix``_awid, \
    prefix``_awlen, \
    prefix``_awsize, \
    prefix``_awburst, \
    prefix``_awlock, \
    prefix``_awcache, \
    prefix``_awqos, \
    prefix``_awregion }

// List of AXI4 W channel payload fields
`define AXI4_W_PAYLOAD(prefix) { \
    `AXI4LITE_W_PAYLOAD(prefix), \
    prefix``_wlast }

// List of AXI4 B channel payload fields
`define AXI4_B_PAYLOAD(prefix) { \
    `AXI4LITE_B_PAYLOAD(prefix), \
    prefix``_bid }

// List of AXI4 AR channel payload fields
`define AXI4_AR_PAYLOAD(prefix) { \
    `AXI4LITE_AR_PAYLOAD(prefix), \
    prefix``_arid, \
    prefix``_arlen, \
    prefix``_arsize, \
    prefix``_arburst, \
    prefix``_arlock, \
    prefix``_arcache, \
    prefix``_arqos, \
    prefix``_arregion }

// List of AXI4 R channel payload fields
`define AXI4_R_PAYLOAD(prefix) { \
    `AXI4LITE_R_PAYLOAD(prefix), \
    prefix``_rid, \
    prefix``_rlast }

// Length of AXI4 AW channel payload fields
`define AXI4_AW_PAYLOAD_LEN(addr_width, data_width, id_width) \
    (`AXI4LITE_AW_PAYLOAD_LEN(addr_width, data_width) + id_width + 26)

// Length of AXI4 W channel payload fields
`define AXI4_W_PAYLOAD_LEN(addr_width, data_width, id_width) \
    (`AXI4LITE_W_PAYLOAD_LEN(addr_width, data_width) + 1)

// Length of AXI4 B channel payload fields
`define AXI4_B_PAYLOAD_LEN(addr_width, data_width, id_width) \
    (`AXI4LITE_B_PAYLOAD_LEN(addr_width, data_width) + id_width)

// Length of AXI4 AR channel payload fields
`define AXI4_AR_PAYLOAD_LEN(addr_width, data_width, id_width) \
    (`AXI4LITE_AR_PAYLOAD_LEN(addr_width, data_width) + id_width + 26)

// Length of AXI4 R channel payload fields
`define AXI4_R_PAYLOAD_LEN(addr_width, data_width, id_width) \
    (`AXI4LITE_R_PAYLOAD_LEN(addr_width, data_width) + id_width + 1)

////////////////////////////// AXI4 NO ID //////////////////////////////

// Define an AXI4 AW channel slave interface without ID in module port declaration
`define AXI4_AW_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AW_PORT_DECL_NO_ID(input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 W channel slave interface without ID in module port declaration
`define AXI4_W_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_W_PORT_DECL_NO_ID (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 B channel slave interface without ID in module port declaration
`define AXI4_B_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_B_PORT_DECL_NO_ID (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 AR channel slave interface without ID in module port declaration
`define AXI4_AR_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AR_PORT_DECL_NO_ID(input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 R channel slave interface without ID in module port declaration
`define AXI4_R_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_R_PORT_DECL_NO_ID (input wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 slave interface without ID in module port declaration
`define AXI4_SLAVE_IF_NO_ID(prefix, addr_width, data_width) \
    `AXI4_AW_SLAVE_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_W_SLAVE_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_B_MASTER_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_AR_SLAVE_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_R_MASTER_IF_NO_ID(prefix, addr_width, data_width)

// Define an AXI4 AW channel master interface without ID in module port declaration
`define AXI4_AW_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AW_PORT_DECL_NO_ID(output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 W channel master interface without ID in module port declaration
`define AXI4_W_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_W_PORT_DECL_NO_ID (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 B channel master interface without ID in module port declaration
`define AXI4_B_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_B_PORT_DECL_NO_ID (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 AW channel master interface without ID in module port declaration
`define AXI4_AR_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AR_PORT_DECL_NO_ID(output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 AW channel master interface without ID in module port declaration
`define AXI4_R_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_R_PORT_DECL_NO_ID (output wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 master interface without ID in module port declaration
`define AXI4_MASTER_IF_NO_ID(prefix, addr_width, data_width) \
    `AXI4_AW_MASTER_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_W_MASTER_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_B_SLAVE_IF_NO_ID  (prefix, addr_width, data_width), \
    `AXI4_AR_MASTER_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_R_SLAVE_IF_NO_ID  (prefix, addr_width, data_width)

// Define an AXI4 AW channel monitor input interface without ID in module port declaration
`define AXI4_AW_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AW_PORT_DECL_NO_ID(input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 W channel monitor input interface without ID in module port declaration
`define AXI4_W_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_W_PORT_DECL_NO_ID (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 B channel monitor input interface without ID in module port declaration
`define AXI4_B_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_B_PORT_DECL_NO_ID (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 AR channel monitor input interface without ID in module port declaration
`define AXI4_AR_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AR_PORT_DECL_NO_ID(input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 R channel monitor input interface without ID in module port declaration
`define AXI4_R_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_R_PORT_DECL_NO_ID (input wire, input wire, prefix, addr_width, data_width)

// Define an AXI4 monitor input interface without ID in module port declaration
`define AXI4_INPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `AXI4_AW_INPUT_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_W_INPUT_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_B_INPUT_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_AR_INPUT_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_R_INPUT_IF_NO_ID (prefix, addr_width, data_width)

// Define an AXI4 AW channel monitor output interface without ID in module port declaration
`define AXI4_AW_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AW_PORT_DECL_NO_ID(output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 W channel monitor output interface without ID in module port declaration
`define AXI4_W_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_W_PORT_DECL_NO_ID (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 B channel monitor output interface without ID in module port declaration
`define AXI4_B_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_B_PORT_DECL_NO_ID (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 AR channel monitor output interface without ID in module port declaration
`define AXI4_AR_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AR_PORT_DECL_NO_ID(output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 R channel monitor output interface without ID in module port declaration
`define AXI4_R_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_R_PORT_DECL_NO_ID (output wire, output wire, prefix, addr_width, data_width)

// Define an AXI4 monitor output interface without ID in module port declaration
`define AXI4_OUTPUT_IF_NO_ID(prefix, addr_width, data_width) \
    `AXI4_AW_OUTPUT_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_W_OUTPUT_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_B_OUTPUT_IF_NO_ID (prefix, addr_width, data_width), \
    `AXI4_AR_OUTPUT_IF_NO_ID(prefix, addr_width, data_width), \
    `AXI4_R_OUTPUT_IF_NO_ID (prefix, addr_width, data_width_NO_ID)

// Define an AXI4 AW channel wire bundle without ID in module context
`define AXI4_AW_WIRE_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AW_ITEM_DECL_NO_ID(wire, prefix, addr_width, data_width)

// Define an AXI4 W channel wire bundle without ID in module context
`define AXI4_W_WIRE_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_W_ITEM_DECL_NO_ID (wire, prefix, addr_width, data_width)

// Define an AXI4 B channel wire bundle without ID in module context
`define AXI4_B_WIRE_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_B_ITEM_DECL_NO_ID (wire, prefix, addr_width, data_width)

// Define an AXI4 AR channel wire bundle without ID in module context
`define AXI4_AR_WIRE_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_AR_ITEM_DECL_NO_ID(wire, prefix, addr_width, data_width)

// Define an AXI4 R channel wire bundle without ID in module context
`define AXI4_R_WIRE_NO_ID(prefix, addr_width, data_width) \
    `_AXI4_R_ITEM_DECL_NO_ID (wire, prefix, addr_width, data_width)

// Define an AXI4 wire bundle without ID in module context
`define AXI4_WIRE_NO_ID(prefix, addr_width, data_width) \
    `AXI4_AW_WIRE_NO_ID(prefix, addr_width, data_width); \
    `AXI4_W_WIRE_NO_ID (prefix, addr_width, data_width); \
    `AXI4_B_WIRE_NO_ID (prefix, addr_width, data_width); \
    `AXI4_AR_WIRE_NO_ID(prefix, addr_width, data_width); \
    `AXI4_R_WIRE_NO_ID (prefix, addr_width, data_width)

// Connect an AXI4 AW channel interface without ID with another in module instantiation
`define AXI4_AW_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4LITE_AW_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awlen), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awsize), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awburst), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awlock), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awcache), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awqos), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, awregion)

// Connect an AXI4 W channel interface without ID with another in module instantiation
`define AXI4_W_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4LITE_W_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, wlast)

// Connect an AXI4 B channel interface without ID with another in module instantiation
`define AXI4_B_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4LITE_B_CONNECT(if_prefix, wire_prefix)

// Connect an AXI4 AR channel interface without ID with another in module instantiation
`define AXI4_AR_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4LITE_AR_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arlen), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arsize), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arburst), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arlock), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arcache), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arqos), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, arregion)

// Connect an AXI4 R channel interface without ID with another in module instantiation
`define AXI4_R_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4LITE_R_CONNECT(if_prefix, wire_prefix), \
    `_AXI4_CON_FIELD(if_prefix, wire_prefix, rlast)

// Connect an AXI4 interface without ID with another in module instantiation
`define AXI4_CONNECT_NO_ID(if_prefix, wire_prefix) \
    `AXI4_AW_CONNECT_NO_ID(if_prefix, wire_prefix), \
    `AXI4_W_CONNECT_NO_ID (if_prefix, wire_prefix), \
    `AXI4_B_CONNECT_NO_ID (if_prefix, wire_prefix), \
    `AXI4_AR_CONNECT_NO_ID(if_prefix, wire_prefix), \
    `AXI4_R_CONNECT_NO_ID (if_prefix, wire_prefix)

// List of AXI4 AW channel payload fields without ID
`define AXI4_AW_PAYLOAD_NO_ID(prefix) { \
    `AXI4LITE_AW_PAYLOAD(prefix), \
    prefix``_awlen, \
    prefix``_awsize, \
    prefix``_awburst, \
    prefix``_awlock, \
    prefix``_awcache, \
    prefix``_awqos, \
    prefix``_awregion }

// List of AXI4 W channel payload fields without ID
`define AXI4_W_PAYLOAD_NO_ID(prefix) { \
    `AXI4LITE_W_PAYLOAD(prefix), \
    prefix``_wlast }

// List of AXI4 B channel payload fields without ID
`define AXI4_B_PAYLOAD_NO_ID(prefix) { \
    `AXI4LITE_B_PAYLOAD(prefix) }

// List of AXI4 AR channel payload fields without ID
`define AXI4_AR_PAYLOAD_NO_ID(prefix) { \
    `AXI4LITE_AR_PAYLOAD(prefix), \
    prefix``_arlen, \
    prefix``_arsize, \
    prefix``_arburst, \
    prefix``_arlock, \
    prefix``_arcache, \
    prefix``_arqos, \
    prefix``_arregion }

// List of AXI4 R channel payload fields without ID
`define AXI4_R_PAYLOAD_NO_ID(prefix) { \
    `AXI4LITE_R_PAYLOAD(prefix), \
    prefix``_rlast }

// Length of AXI4 AW channel payload fields without ID
`define AXI4_AW_PAYLOAD_LEN_NO_ID(addr_width, data_width) \
    (`AXI4LITE_AW_PAYLOAD_LEN(addr_width, data_width) + 26)

// Length of AXI4 W channel payload fields without ID
`define AXI4_W_PAYLOAD_LEN_NO_ID(addr_width, data_width) \
    (`AXI4LITE_W_PAYLOAD_LEN(addr_width, data_width) + 1)

// Length of AXI4 B channel payload fields without ID
`define AXI4_B_PAYLOAD_LEN_NO_ID(addr_width, data_width) \
    (`AXI4LITE_B_PAYLOAD_LEN(addr_width, data_width))

// Length of AXI4 AR channel payload fields without ID
`define AXI4_AR_PAYLOAD_LEN_NO_ID(addr_width, data_width) \
    (`AXI4LITE_AR_PAYLOAD_LEN(addr_width, data_width) + 26)

// Length of AXI4 R channel payload fields without ID
`define AXI4_R_PAYLOAD_LEN_NO_ID(addr_width, data_width) \
    (`AXI4LITE_R_PAYLOAD_LEN(addr_width, data_width) + 1)

`endif // `ifndef __AXI4_H__
