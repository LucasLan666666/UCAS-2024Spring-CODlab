SIM_TOP := custom_cpu_test

SIM_BIN := $(SIM_OBJ_LOC)/sim.vvp
SIM_DUMP := $(SIM_OBJ_LOC)/dump.fst

SIM_SRCS := $(wildcard $(RTL_SRC_LOC)/alu/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/reg_file/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/shifter/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/$(SIM_TARGET)/$(DUT_ISA)/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/$(SIM_TARGET)/cache/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/$(SIM_TARGET)/dma/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/../wrapper/$(SIM_TARGET)/*.v)
SIM_SRCS += $(wildcard $(SIM_SRC_LOC)/$(SIM_TARGET)/$(DUT_ARCH)/*.v)
SIM_SRCS += $(wildcard $(SIM_SRC_LOC)/$(SIM_TARGET)/$(DUT_ARCH)/golden/$(DUT_ISA)/*.v)
SIM_SRCS += $(wildcard $(SIM_SRC_LOC)/$(SIM_TARGET)/common/*.v)

IV_FLAGS := -I ../
IV_FLAGS += -I $(RTL_SRC_LOC)/$(SIM_TARGET)/$(DUT_ISA)
IV_FLAGS += -I $(SIM_SRC_LOC)/$(SIM_TARGET)
IV_FLAGS += -DTRACE_FILE=\"$(TRACE_FILE)\"

# Parsing user-defined architectural options
ARCH_OPTION_TCL := $(RTL_SRC_LOC)/$(SIM_TARGET)/arch_options.tcl

USE_ICACHE     := $(shell cat $(ARCH_OPTION_TCL) | grep "icache" | awk '{print $$3}')
USE_DCACHE     := $(shell cat $(ARCH_OPTION_TCL) | grep "dcache" | awk '{print $$3}')

ifeq ($(USE_ICACHE),1)
IV_FLAGS += -DUSE_ICACHE
endif

ifeq ($(USE_DCACHE),1)
IV_FLAGS += -DUSE_DCACHE
endif

ifeq ($(DUT_ARCH),turbo)
IV_FLAGS += -DSIM_RETIRED_FIFO
endif

# Use FST format for waveform to provide better compression ratio
# Waveform file size would be reduced by about 10x.
PLUSARGS += -fst
PLUSARGS += +INITMEM="$(MEM_FILE)"
