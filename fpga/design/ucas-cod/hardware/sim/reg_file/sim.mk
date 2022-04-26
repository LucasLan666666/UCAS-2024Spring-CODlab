SIM_TOP := reg_file_test

SIM_BIN := $(SIM_OBJ_LOC)/sim.vvp
SIM_DUMP := $(SIM_OBJ_LOC)/dump.vcd

SIM_SRCS := $(wildcard $(RTL_SRC_LOC)/$(SIM_TARGET)/*.v)
SIM_SRCS += $(wildcard $(SIM_SRC_LOC)/$(SIM_TARGET)/*.v)

IV_FLAGS := -I ../
IV_FLAGS += -I $(SIM_SRC_LOC)/$(SIM_TARGET)
IV_FLAGS += -grelative-include
