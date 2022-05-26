proc create_design { design_name } {

    create_bd_design $design_name
    current_bd_design $design_name

    #=============================================
    # Clock ports
    #=============================================

    create_bd_port -dir I -type clk -freq_hz 100000000 role_clk
    create_bd_port -dir I -type clk -freq_hz 200000000 role_to_mem_clk

    #=============================================
    # Reset ports
    #=============================================

    # ROLE resetn
    create_bd_port -dir I -type rst role_resetn
    set_property CONFIG.ASSOCIATED_RESET {role_resetn} [get_bd_ports role_clk]

    create_bd_port -dir I -type rst role_to_mem_resetn
    set_property CONFIG.ASSOCIATED_RESET {role_to_mem_resetn} [get_bd_ports role_to_mem_clk]

    #=============================================
    # AXI ports
    #=============================================

    set axi_shell_to_role [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_shell_to_role]
    set_property -dict [ list \
        CONFIG.PROTOCOL {AXI4Lite} \
        CONFIG.ADDR_WIDTH {20} \
        CONFIG.DATA_WIDTH {32} \
    ] $axi_shell_to_role

    set axi_role_to_shell [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_role_to_shell]
    set_property -dict [ list \
        CONFIG.PROTOCOL {AXI4Lite} \
        CONFIG.ADDR_WIDTH {32} \
        CONFIG.DATA_WIDTH {32} \
    ] $axi_role_to_shell

    set axi_role_to_mem [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 axi_role_to_mem]
    set_property -dict [ list \
        CONFIG.PROTOCOL {AXI4} \
        CONFIG.ADDR_WIDTH {40} \
        CONFIG.DATA_WIDTH {64} \
    ] $axi_role_to_mem

    set_property CONFIG.ASSOCIATED_BUSIF {axi_shell_to_role:axi_role_to_shell} [get_bd_ports role_clk]
    set_property CONFIG.ASSOCIATED_BUSIF {axi_role_to_mem} [get_bd_ports role_to_mem_clk]

    #=============================================
    # Create IP blocks
    #=============================================

    # Create instance: emu_clk_gen
    set emu_clk_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 emu_clk_gen ]
    set_property -dict [list \
        CONFIG.JITTER_OPTIONS {PS} \
        CONFIG.PRIM_SOURCE {No_buffer} \
        CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
        CONFIG.RESET_TYPE {ACTIVE_LOW} \
        CONFIG.RESET_PORT {resetn} \
    ] $emu_clk_gen

    # Create instance: emu_rst_gen
    set emu_rst_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 emu_rst_gen ]

    # Create instance: emu_system
    set emu_system [create_bd_cell -type module -reference EMU_SYSTEM emu_system]

    # Create instance: turbo_trace_cmp_inst
    set turbo_trace_cmp_inst [create_bd_cell -type module -reference turbo_trace_cmp turbo_trace_cmp_inst]

    # Create instance: axi_mmio_ic
    set axi_mmio_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mmio_ic ]
    set_property -dict [list CONFIG.NUM_MI {3} CONFIG.NUM_SI {1}] $axi_mmio_ic

    # Create instance: axi_mem_ic
    # IMPORTANT: CONFIG.STRATEGY must be set to instantiate crossbar in SASD mode for an AXI master interface without ID signal
    set axi_mem_ic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_ic ]
    set_property -dict [list CONFIG.NUM_MI {1} CONFIG.NUM_SI {4} CONFIG.STRATEGY {1} ] $axi_mem_ic

    # Create instance: axi_remap_host_axi, and set properties
    set axi_remap_host_axi [create_bd_cell -type module -reference axi_remap axi_remap_host_axi]
    set_property -dict [ list \
        CONFIG.ADDR_BASE {0x00000000} \
        CONFIG.ADDR_MASK {0x0FFFFFFF} \
        CONFIG.DATA_WIDTH {32} \
        CONFIG.ID_WIDTH {1} \
    ] $axi_remap_host_axi

    # Create instance: axi_remap_lsu_axi, and set properties
    set axi_remap_lsu_axi [create_bd_cell -type module -reference axi_remap axi_remap_lsu_axi]
    set_property -dict [ list \
        CONFIG.ADDR_BASE {0x10000000} \
        CONFIG.ADDR_MASK {0x0000FFFF} \
        CONFIG.DATA_WIDTH {32} \
        CONFIG.ID_WIDTH {1} \
    ] $axi_remap_lsu_axi

    # Create instance: axi_remap_scanchain, and set properties
    set axi_remap_scanchain [create_bd_cell -type module -reference axi_remap axi_remap_scanchain]
    set_property -dict [ list \
        CONFIG.ADDR_BASE {0x10010000} \
        CONFIG.ADDR_MASK {0x0000FFFF} \
        CONFIG.DATA_WIDTH {64} \
        CONFIG.ID_WIDTH {1} \
    ] $axi_remap_scanchain

    # Create instance: axi_remap_golden_axi, and set properties
    set axi_remap_golden_axi [create_bd_cell -type module -reference axi_remap axi_remap_golden_axi]
    set_property -dict [ list \
        CONFIG.ADDR_BASE {0x20000000} \
        CONFIG.ADDR_MASK {0x0FFFFFFF} \
        CONFIG.DATA_WIDTH {32} \
        CONFIG.ID_WIDTH {1} \
    ] $axi_remap_golden_axi

    #=============================================
    # System clock connection
    #=============================================

    connect_bd_net [get_bd_ports role_clk] \
        [get_bd_pins emu_clk_gen/clk_in1] \
        [get_bd_pins axi_mmio_ic/S00_ACLK] \
        [get_bd_pins axi_mmio_ic/M01_ACLK]

    connect_bd_net [get_bd_pins emu_clk_gen/clk_out1] \
        [get_bd_pins emu_rst_gen/slowest_sync_clk] \
        [get_bd_pins emu_system/clk] \
        [get_bd_pins turbo_trace_cmp_inst/clk] \
        [get_bd_pins axi_remap_host_axi/clk] \
        [get_bd_pins axi_remap_lsu_axi/clk] \
        [get_bd_pins axi_remap_scanchain/clk] \
        [get_bd_pins axi_remap_golden_axi/clk] \
        [get_bd_pins axi_mmio_ic/ACLK] \
        [get_bd_pins axi_mmio_ic/M00_ACLK] \
        [get_bd_pins axi_mmio_ic/M02_ACLK] \
        [get_bd_pins axi_mem_ic/ACLK] \
        [get_bd_pins axi_mem_ic/S00_ACLK] \
        [get_bd_pins axi_mem_ic/S01_ACLK] \
        [get_bd_pins axi_mem_ic/S02_ACLK] \
        [get_bd_pins axi_mem_ic/S03_ACLK]

    connect_bd_net [get_bd_ports role_to_mem_clk] \
        [get_bd_pins axi_mem_ic/M00_ACLK]

    #=============================================
    # System reset connection
    #=============================================

    connect_bd_net [get_bd_ports role_resetn] \
        [get_bd_pins emu_clk_gen/resetn] \
        [get_bd_pins emu_rst_gen/ext_reset_in] \
        [get_bd_pins axi_mmio_ic/S00_ARESETN] \
        [get_bd_pins axi_mmio_ic/M01_ARESETN]

    connect_bd_net [get_bd_ports role_to_mem_resetn] \
        [get_bd_pins axi_mem_ic/M00_ARESETN]

    connect_bd_net [get_bd_pins emu_clk_gen/locked] \
        [get_bd_pins emu_rst_gen/dcm_locked]

    connect_bd_net [get_bd_pins emu_rst_gen/interconnect_aresetn] \
        [get_bd_pins axi_mmio_ic/ARESETN] \
        [get_bd_pins axi_mem_ic/ARESETN]

    connect_bd_net [get_bd_pins emu_rst_gen/peripheral_aresetn] \
        [get_bd_pins emu_system/resetn] \
        [get_bd_pins turbo_trace_cmp_inst/resetn] \
        [get_bd_pins axi_remap_host_axi/resetn] \
        [get_bd_pins axi_remap_lsu_axi/resetn] \
        [get_bd_pins axi_remap_scanchain/resetn] \
        [get_bd_pins axi_remap_golden_axi/resetn] \
        [get_bd_pins axi_mmio_ic/M00_ARESETN] \
        [get_bd_pins axi_mmio_ic/M02_ARESETN] \
        [get_bd_pins axi_mem_ic/S00_ARESETN] \
        [get_bd_pins axi_mem_ic/S01_ARESETN] \
        [get_bd_pins axi_mem_ic/S02_ARESETN] \
        [get_bd_pins axi_mem_ic/S03_ARESETN]

    #=============================================
    # AXI interface connection
    #=============================================

    connect_bd_intf_net -intf_net shell_to_role_conn \
        [get_bd_intf_ports axi_shell_to_role] \
        [get_bd_intf_pins axi_mmio_ic/S00_AXI]

    connect_bd_intf_net -intf_net emu_system_mmio \
        [get_bd_intf_pins axi_mmio_ic/M00_AXI] \
        [get_bd_intf_pins emu_system/s_axilite]

    connect_bd_intf_net -intf_net role_to_shell_conn \
        [get_bd_intf_pins axi_mmio_ic/M01_AXI] \
        [get_bd_intf_ports axi_role_to_shell]

    connect_bd_intf_net -intf_net trace_cmp_mmio \
        [get_bd_intf_pins axi_mmio_ic/M02_AXI] \
        [get_bd_intf_pins turbo_trace_cmp_inst/s_axilite]

    connect_bd_intf_net -intf_net emu_system_host_axi_conn \
        [get_bd_intf_pins emu_system/u_rammodel_host_axi] \
        [get_bd_intf_pins axi_remap_host_axi/s_axi]

    connect_bd_intf_net -intf_net emu_system_lsu_axi_conn \
        [get_bd_intf_pins emu_system/u_rammodel_lsu_axi] \
        [get_bd_intf_pins axi_remap_lsu_axi/s_axi]

    connect_bd_intf_net -intf_net emu_system_lsu_scanchain_conn \
        [get_bd_intf_pins emu_system/m_axi] \
        [get_bd_intf_pins axi_remap_scanchain/s_axi]

    connect_bd_intf_net -intf_net trace_cmp_axi_conn \
        [get_bd_intf_pins turbo_trace_cmp_inst/m_axi_dram] \
        [get_bd_intf_pins axi_remap_golden_axi/s_axi]

    connect_bd_intf_net -intf_net axi_remap_host_axi_conn \
        [get_bd_intf_pins axi_remap_host_axi/m_axi] \
        [get_bd_intf_pins axi_mem_ic/S00_AXI]

    connect_bd_intf_net -intf_net axi_remap_lsu_axi_conn \
        [get_bd_intf_pins axi_remap_lsu_axi/m_axi] \
        [get_bd_intf_pins axi_mem_ic/S01_AXI]

    connect_bd_intf_net -intf_net axi_remap_scanchain_axi_conn \
        [get_bd_intf_pins axi_remap_scanchain/m_axi] \
        [get_bd_intf_pins axi_mem_ic/S02_AXI]

    connect_bd_intf_net -intf_net axi_remap_golden_axi_conn \
        [get_bd_intf_pins axi_remap_golden_axi/m_axi] \
        [get_bd_intf_pins axi_mem_ic/S03_AXI]

    connect_bd_intf_net -intf_net role_to_mem_conn \
        [get_bd_intf_pins axi_mem_ic/M00_AXI] \
        [get_bd_intf_ports axi_role_to_mem]

    #=============================================
    # Other connections
    #=============================================

    connect_bd_net [get_bd_pins emu_system/trace_commit_trace_valid] [get_bd_pins turbo_trace_cmp_inst/trace_commit_trace_valid]
    connect_bd_net [get_bd_pins emu_system/trace_commit_trace_ready] [get_bd_pins turbo_trace_cmp_inst/trace_commit_trace_ready]
    connect_bd_net [get_bd_pins emu_system/trace_commit_trace_data] [get_bd_pins turbo_trace_cmp_inst/trace_commit_trace_data]

    connect_bd_net [get_bd_pins emu_system/trace_mmio_rdata_trace_valid] [get_bd_pins turbo_trace_cmp_inst/trace_mmio_rdata_trace_valid]
    connect_bd_net [get_bd_pins emu_system/trace_mmio_rdata_trace_ready] [get_bd_pins turbo_trace_cmp_inst/trace_mmio_rdata_trace_ready]
    connect_bd_net [get_bd_pins emu_system/trace_mmio_rdata_trace_data] [get_bd_pins turbo_trace_cmp_inst/trace_mmio_rdata_trace_data]

    #=============================================
    # Create address segments
    #=============================================

    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces emu_system/u_rammodel_host_axi] [get_bd_addr_segs axi_remap_host_axi/s_axi/reg0] EMU_HOST_AXI
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces emu_system/u_rammodel_lsu_axi] [get_bd_addr_segs axi_remap_lsu_axi/s_axi/reg0] EMU_LSU_AXI
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces emu_system/m_axi] [get_bd_addr_segs axi_remap_scanchain/s_axi/reg0] EMU_SCANCHAIN_AXI
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces turbo_trace_cmp_inst/m_axi_dram] [get_bd_addr_segs axi_remap_golden_axi/s_axi/reg0] TRACE_CMP_MEM

    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces axi_remap_host_axi/m_axi] [get_bd_addr_segs axi_role_to_mem/Reg] EMU_HOST_AXI_REMAP
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces axi_remap_lsu_axi/m_axi] [get_bd_addr_segs axi_role_to_mem/Reg] EMU_LSU_AXI_REMAP
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces axi_remap_scanchain/m_axi] [get_bd_addr_segs axi_role_to_mem/Reg] EMU_SCANCHAIN_AXI_REMAP
    create_bd_addr_seg -range 0x000100000000 -offset 0x00000000 [get_bd_addr_spaces axi_remap_golden_axi/m_axi] [get_bd_addr_segs axi_role_to_mem/Reg] GOLDEN_AXI_REMAP

    create_bd_addr_seg -range 0x10000 -offset 0x00000000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs emu_system/s_axilite/reg0] EMU_MMIO
    create_bd_addr_seg -range 0x10000 -offset 0x00010000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs axi_role_to_shell/Reg] ROLE_TO_SHELL_MMIO
    create_bd_addr_seg -range 0x10000 -offset 0x00020000 [get_bd_addr_spaces axi_shell_to_role] [get_bd_addr_segs turbo_trace_cmp_inst/s_axilite/reg0] TRACE_CMP_MMIO

    #=============================================
    # Finish BD creation 
    #=============================================

    save_bd_design

}

create_design role
