
CC      := $(CROSS_COMPILE)gcc
CXX     := $(CROSS_COMPILE)g++
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

ifeq ($(ARCH),mips)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -ffreestanding -fno-stack-protector -mno-check-zero-division \
	  -Wno-unused-function -Wall -Werror -mno-imadd -mno-mad -EL -mips32 -G0 -O0
endif

ifeq ($(ARCH),riscv32)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -ffreestanding -Wno-unused-function \
	  -fno-stack-protector -Wall -Werror -march=rv32i -O0
endif
CFLAGS += -I ../include -I include
CFLAGS += -DSETTING_TEST -DMICROBENCH
ASFLAGS := -EL
LDFLAGS := -EL -N -e start -T user.ld

DIRS := bin elf obj disassembly sim
DIR_OBJS := $(foreach obj,$(DIRS),$(ARCH)/$(obj))

BENCH_C_DIR := $(shell find src/ -type f -name "*.c")
BENCH_CXX_DIR := $(shell find src/ -type f -name "*.cpp")
BENCH := $(BENCH_C_DIR:src/%.c=%) $(BENCH_CXX_DIR:src/%.cpp=%)
BENCH_O := $(BENCH:%=$(ARCH)/$(obj)/bench/%.o)

COMMON_C_DIR := $(shell find ../common/ -type f -name "*.c")
COMMON_C := $(COMMON_C_DIR:../common/%=%)
COMMON_S_DIR := $(shell find ../common/$(ARCH) -type f -name "*.S")
COMMON_S := $(COMMON_S_DIR:../common/$(ARCH)/%=%)
COMMON_O := $(patsubst %.S,$(ARCH)/obj/common/%.o,$(COMMON_S)) \
	    $(patsubst %.c,$(ARCH)/obj/common/%.o,$(COMMON_C))

TARGET := $(BENCH)
ELFS := $(addprefix $(ARCH)/elf/,$(TARGET))

all: $(ELFS)

$(ARCH)/elf/%: $(COMMON_O) $(ARCH)/obj/%/bench.o $(ARCH)/obj/%.o
	@mkdir -p $(DIR_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	@cd $(ARCH) && \
		$(OBJDUMP) -DS ../$@ > disassembly/$(patsubst $(ARCH)/elf/%,%,$@).S && \
		$(OBJCOPY) -S -O binary \
		    -j .text -j .text.\* -j .MIPS.abiflags \
		    -j .data -j .rodata -j .sdata -j .rodata.\* -j .eh_frame \
		    -j .bss --set-section-flags .bss=alloc,contents \
		    -j .sbss --set-section-flags .sbss=alloc,contents \
		    -j .scommon --set-section-flags .scommon=alloc,contents \
		    ../$@ bin/$(patsubst $(ARCH)/elf/%,%,$@).bin
	@cd $(ARCH) && xxd -e -c 4 bin/$(patsubst $(ARCH)/elf/%,%,$@).bin | awk -F ":" '{print $$2}' | awk -F " " '{print $$1}' \
				> sim/$(patsubst $(ARCH)/elf/%,%,$@).mem

$(ARCH)/obj/%/bench.o: bench.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/$(patsubst $(ARCH)/obj/%/bench.o,%,$@)
	$(CC) -c $(CFLAGS) -DBENCH_$(patsubst $(ARCH)/obj/%/bench.o,%,$@) $^ -o $@

$(ARCH)/obj/%.o: src/%.cpp 
	@mkdir -p $(DIR_OBJS)
	$(CXX) -c $(CFLAGS) -O2 -o $@ $< 

$(ARCH)/obj/%.o: src/%.c
	@mkdir -p $(DIR_OBJS)
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

$(ARCH)/obj/common/%.o: ../common/$(ARCH)/%.S
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -o $@ $<

$(ARCH)/obj/common/%.o: ../common/%.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

clean:
	echo $(ELFS)
	@rm -rf $(DIR_OBJS)
