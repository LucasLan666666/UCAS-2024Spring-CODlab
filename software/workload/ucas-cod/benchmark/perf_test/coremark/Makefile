CC      := $(CROSS_COMPILE)gcc
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
	  -fno-stack-protector -Wall -march=rv32i -O0
endif

SIMPLE_COMMON := ../../simple_test/common
COMMON        := ../common

CFLAGS += -I $(SIMPLE_COMMON)/../include -I ../include 
CFLAGS += -DCPU_COUNT_PER_US=1 -DTIME -DHAS_PRINTF \
	  -DCOREMARK_LOOP=5 -DFLAGS_STR=\"$(FLAGS_STR)\"
ASFLAGS := -EL
LDFLAGS := -EL -N -e start -T user.ld

DIRS := bin elf obj disassembly sim
DIR_OBJS := $(foreach obj,$(DIRS),$(ARCH)/$(obj))

BENCH_DIR := $(shell find src/ -type f -name "*.c")
BENCH := $(BENCH_DIR:src/%=%)
BENCH_O := $(patsubst %.c,$(ARCH)/obj/%.o,$(BENCH))

COMMON_C_DIR := $(shell find $(COMMON)/ -type f -name "*.c")
COMMON_C := $(COMMON_C_DIR:$(COMMON)/%=%)
SIMPLE_COMMON_C_DIR := $(shell find $(SIMPLE_COMMON)/ -type f -name "*.c")
SIMPLE_COMMON_C := $(SIMPLE_COMMON_C_DIR:$(SIMPLE_COMMON)/%=%)
COMMON_S_DIR := $(shell find $(COMMON)/$(ARCH) -type f -name "*.S")
COMMON_S := $(COMMON_S_DIR:$(COMMON)/$(ARCH)/%=%)

COMMON_O := $(patsubst %.S,$(ARCH)/obj/common/%.o,$(COMMON_S)) \
            $(patsubst %.c,$(ARCH)/obj/simple_common/%.o,$(SIMPLE_COMMON_C)) \
            $(patsubst %.c,$(ARCH)/obj/common/%.o,$(COMMON_C))

ELFS := $(ARCH)/elf/coremark

all: $(ELFS)

$(ARCH)/elf/coremark: $(COMMON_O) $(BENCH_O)
	@mkdir -p $(DIR_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	@cd $(ARCH) && \
		$(OBJDUMP) -DS ../$@ > disassembly/$(patsubst $(ARCH)/elf/%,%,$@).S

$(ARCH)/obj/%.o: src/%.c
	@mkdir -p $(DIR_OBJS)
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

$(ARCH)/obj/common/%.o: $(COMMON)/$(ARCH)/%.S
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -o $@ $<

$(ARCH)/obj/simple_common/%.o: $(SIMPLE_COMMON)/%.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/simple_common
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

$(ARCH)/obj/common/%.o: $(COMMON)/%.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

clean:
	rm -rf $(DIR_OBJS)

