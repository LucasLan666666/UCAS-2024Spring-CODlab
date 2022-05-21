
CC      := $(CROSS_COMPILE)gcc
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

ifeq ($(ARCH),mips)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -fno-stack-protector -mno-check-zero-division \
	  -Wall -Werror -mno-imadd -mno-mad -EL -mips32 -G0 -O0
OBJCPFLAGS := -I binary -O elf32-littlemips -B mips
endif

ifeq ($(ARCH),riscv32)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -ffreestanding -Wno-unused-function \
	  -fno-stack-protector -Wall -Werror -march=rv32im -O0
OBJCPFLAGS := -I binary -O elf32-littleriscv -B riscv
endif

CFLAGS += -I ../include -I include
ASFLAGS := -EL
LDFLAGS := -EL -N -e start -T user.ld

DIRS := bin elf obj disassembly sim
DIR_OBJS := $(foreach obj,$(DIRS),$(ARCH)/$(obj))

TARGET := sw_conv sw_conv_mul hw_conv
ELFS   := $(addprefix $(ARCH)/elf/,$(TARGET))

COMMON := $(wildcard ../common/$(ARCH)/*.S)
LIB    := $(wildcard ../common/*.c)

OBJS   := $(patsubst ../common/$(ARCH)/%.S,$(ARCH)/obj/%.o,$(COMMON)) \
	  $(patsubst ../common/%.c,$(ARCH)/obj/%.o,$(LIB))

CFLAGS_sw_conv_mul  := -DUSE_MUL
CFLAGS_hw_conv      := -DUSE_HW_ACCEL

.PHONY: FORCE

all: $(ELFS)

$(ARCH)/elf/%: $(OBJS) $(ARCH)/obj/%/conv.o $(ARCH)/obj/data/%/data.o $(ARCH)/obj/data/%/weight.o $(ARCH)/obj/data/%/result.o
	@mkdir -p $(DIR_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	@cd $(ARCH) && \
		$(OBJDUMP) -DS ../$@ > disassembly/$(patsubst $(ARCH)/elf/%,%,$@).S

$(ARCH)/obj/%/conv.o: src/conv.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/$(patsubst $(ARCH)/obj/%/conv.o,%,$@)
	$(CC) -c $(CFLAGS) $(CFLAGS_$(patsubst $(ARCH)/obj/%/conv.o,%,$@)) -O2 -o $@ $<

$(ARCH)/obj/data/%/data.o: $(ARCH)/obj/data/%/data.bin
	@mkdir -p $(DIR_OBJS)
	$(OBJCOPY) $(OBJCPFLAGS) --rename-section .data=.input.data $< $@

$(ARCH)/obj/data/%/data.bin: FORCE
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/data/$(patsubst $(ARCH)/obj/data/%/data.bin,%,$@)
	@cp data/$(shell echo $(patsubst $(ARCH)/obj/data/%/data.bin,%,$@) | awk -F "_" '{print $$1}')/data.bin $@

$(ARCH)/obj/data/%/weight.o: $(ARCH)/obj/data/%/weight.bin
	@mkdir -p $(DIR_OBJS)
	$(OBJCOPY) $(OBJCPFLAGS) --rename-section .data=.input.weight $< $@

$(ARCH)/obj/data/%/weight.bin: FORCE
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/data/$(patsubst $(ARCH)/obj/data/%/weight.bin,%,$@)
	@cp data/$(shell echo $(patsubst $(ARCH)/obj/data/%/weight.bin,%,$@) | awk -F "_" '{print $$1}')/weight.bin $@

$(ARCH)/obj/data/%/result.o: data/result.bin
	@mkdir -p $(DIR_OBJS)
	$(OBJCOPY) $(OBJCPFLAGS) --rename-section .data=.input.result $< $@ 

$(ARCH)/obj/%.o: ../common/$(ARCH)/%.S
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -o $@ $<

$(ARCH)/obj/%.o: ../common/%.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

clean:
	@rm -rf $(DIR_OBJS)

