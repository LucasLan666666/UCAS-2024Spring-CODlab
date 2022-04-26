.PHONY: bhv_sim wav_chk

SIM_SRC_LOC := fpga/design/ucas-cod/hardware/sim
RTL_SRC_LOC := $(SIM_SRC_LOC)/../sources/
SIM_OBJ_LOC := fpga/sim_out/$(SIM_TARGET)
EMU_OBJ_LOC := fpga/emu_out

ifneq ($(SIM_DUT),)
DUT_ISA  := $(shell echo $(SIM_DUT) | awk -F ":" '{print $$1}')
DUT_ARCH := $(shell echo $(SIM_DUT) | awk -F ":" '{print $$2}')
endif

ifneq ($(WORKLOAD),)
BENCH_SUITE   := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$1}')
LIKELY_GROUP  := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$2}')
LIKELY_BENCH  := $(shell echo $(WORKLOAD) | awk -F ":" '{print $$3}')

ifeq ($(LIKELY_BENCH),)
BENCH       := $(LIKELY_GROUP)
BENCH_GROUP := 
else
BENCH       := $(LIKELY_BENCH)
BENCH_GROUP := $(LIKELY_GROUP)
endif
include $(SIM_SRC_LOC)/workload/$(BENCH_SUITE).mk
endif

ifneq ($(SIM_TARGET),)
include $(SIM_SRC_LOC)/$(SIM_TARGET)/sim.mk
endif

bhv_sim:
	@mkdir -p $(SIM_OBJ_LOC)
	iverilog -o $(SIM_BIN) -s $(SIM_TOP) $(IV_FLAGS) $(SIM_SRCS)
	vvp $(VVP_FLAGS) $(SIM_BIN) +DUMP="$(SIM_DUMP)" $(PLUSARGS) | tee bhv_sim.log && bash fpga/err_det.sh bhv_sim.log

wav_chk:
	@cd fpga/design/ucas-cod/run/ && bash get_wav.sh $(SIM_TARGET) $(SIM_DUMP) $(LIKELY_BENCH)

emu_transform:
	@mkdir -p $(EMU_OBJ_LOC)
	stdbuf -o0 yosys -c fpga/design/ucas-cod/hardware/emu/scripts/yosys.tcl
