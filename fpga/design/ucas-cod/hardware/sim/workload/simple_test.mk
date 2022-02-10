
BENCH_LOC := software/workload/ucas-cod/benchmark/$(BENCH_SUITE)/$(BENCH_GROUP)/$(DUT_ISA)

MEM_FILE   := $(BENCH_LOC)/sim/$(BENCH).mem
ifeq ($(DUT_ISA),mips)
TRACE_FILE := $(BENCH_LOC)/trace/$(BENCH).trace
endif

