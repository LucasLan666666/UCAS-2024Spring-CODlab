SIM_TOP := emu_top

SIM_BIN := $(SIM_OBJ_LOC)/sim.vvp
SIM_DUMP := $(SIM_OBJ_LOC)/dump.fst

SIM_SRCS += $(shell recheck --iv-srcs)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/custom_cpu/$(DUT_ISA)/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/custom_cpu/cache/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/custom_cpu/dma/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/shifter/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/alu/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/reg_file/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/../wrapper/custom_cpu/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/../emu/custom_cpu/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/../emu/custom_cpu/golden/$(DUT_ISA).v)

IV_FLAGS += -grelative-include
IV_FLAGS += $(shell recheck --iv-flags)
IV_FLAGS += -I $(RTL_SRC_LOC)/../emu/include

ifeq ($(DUT_ARCH),multi_cycle)
IV_FLAGS += -DTRACECMP_MULTI_CYCLE
endif

# Parsing user-defined architectural options
ARCH_OPTION_TCL := $(RTL_SRC_LOC)/custom_cpu/arch_options.tcl

USE_ICACHE     := $(shell cat $(ARCH_OPTION_TCL) | grep "icache" | awk '{print $$3}')
USE_DCACHE     := $(shell cat $(ARCH_OPTION_TCL) | grep "dcache" | awk '{print $$3}')
USE_DMA        := $(shell cat $(ARCH_OPTION_TCL) | grep "simple_dma" | awk '{print $$3}')

ifeq ($(USE_ICACHE),1)
IV_FLAGS += -DUSE_ICACHE
endif

ifeq ($(USE_DCACHE),1)
IV_FLAGS += -DUSE_DCACHE
endif

ifeq ($(USE_DMA),1)
IV_FLAGS += -DUSE_DMA
endif

VVP_FLAGS += $(shell recheck --vvp-flags)

PLUSARGS += -fst
PLUSARGS += -replay-scanchain $(EMU_OBJ_LOC)/scanchain.yml
PLUSARGS += -replay-checkpoint $(EMU_OBJ_LOC)/dump
PLUSARGS += +dumpfile=$(SIM_DUMP)

RUNCYCLE := $(shell echo $(SIM_DUT) | awk -F ":" '{print $$3}')
PLUSARGS += +runcycle=$(RUNCYCLE)
