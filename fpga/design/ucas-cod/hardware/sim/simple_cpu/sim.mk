SIM_TOP := simple_cpu_test

SIM_BIN := $(SIM_OBJ_LOC)/sim.vvp
SIM_DUMP := $(SIM_OBJ_LOC)/dump.fst

SIM_SRCS := $(wildcard $(RTL_SRC_LOC)/alu/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/reg_file/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/shifter/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/$(SIM_TARGET)/*.v)
SIM_SRCS += $(wildcard $(RTL_SRC_LOC)/../wrapper/$(SIM_TARGET)/*.v)
SIM_SRCS += $(wildcard $(SIM_SRC_LOC)/$(SIM_TARGET)/$(DUT_ARCH)/*.v)

IV_FLAGS := -I ../
IV_FLAGS += -I $(SIM_SRC_LOC)/$(SIM_TARGET)
IV_FLAGS += -DTRACE_FILE=\"$(TRACE_FILE)\"
IV_FLAGS += -grelative-include

# Use FST format for waveform to provide better compression ratio
# about 10x size reduction would be obtained 
PLUSARGS += -fst
PLUSARGS += +INITMEM="$(MEM_FILE)"
