# Xilinx Vivado toolset and open-source device tree compiler
include build_scripts/toolset.mk

# Specified FPGA board, chipset and project
include build_scripts/fpga_config.mk

# Target ISA for compilation of bootstrap, firmware and system software
# Default value is empty, which means ISA is specified by FPGA chip
ARCH ?= 

# target compiler setup
include build_scripts/compiler.mk

# Temporal directory to hold hardware design output files 
# (i.e., bitstream, hardware definition file (HDF))
HW_PLATFORM := $(shell pwd)/hw_plat/$(FPGA_TARGET)
BITSTREAM := $(HW_PLATFORM)/system.bit
SYS_HDF := $(HW_PLATFORM)/system.hdf

# Temporal directory to save all image files for porting
INSTALL_LOC := $(shell pwd)/ready_for_download/$(FPGA_TARGET)

.PHONY: FORCE

# software compilation
ifneq ($(PRJ_SW_MK),)
include fpga/design/$(FPGA_PRJ)/$(PRJ_SW_MK)
endif

# fpga design flow
include build_scripts/fpga.mk

# workload generation (user applications)
include build_scripts/workload.mk

# FPGA project-specific hardware design compilation/generation
ifneq ($(PRJ_HW_MK),)
include fpga/design/$(FPGA_PRJ)/$(PRJ_HW_MK)
endif

