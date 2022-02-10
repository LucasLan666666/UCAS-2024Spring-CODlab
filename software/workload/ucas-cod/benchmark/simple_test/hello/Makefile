
CC      := $(CROSS_COMPILE)gcc
AS      := $(CROSS_COMPILE)as
LD      := $(CROSS_COMPILE)ld
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

ifeq ($(ARCH),mips)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -fno-stack-protector -mno-check-zero-division \
	  -Wall -Werror -mno-imadd -mno-mad -EL -mips32 -G0 -O0
endif

ifeq ($(ARCH),riscv32)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -ffreestanding -Wno-unused-function \
	  -fno-stack-protector -Wall -Werror -march=rv32i -O0
endif
CFLAGS += -I ../include
ASFLAGS := -EL
LDFLAGS := -EL -N -e start -T user.ld

DIRS := bin elf obj disassembly sim
DIR_OBJS := $(foreach obj,$(DIRS),$(ARCH)/$(obj))

TARGET := $(patsubst src/%.c,%,$(wildcard src/*.c))
ELFS := $(addprefix $(ARCH)/elf/,$(TARGET))

all: $(ELFS)

$(ARCH)/elf/%: $(ARCH)/obj/common/start.o $(ARCH)/obj/common/printf.o $(ARCH)/obj/%.o
	@mkdir -p $(DIR_OBJS)
	$(LD) $(LDFLAGS) -o $@ $^
	@cd $(ARCH) && \
		$(OBJDUMP) -DS ../$@ > disassembly/$(patsubst $(ARCH)/elf/%,%,$@).S && \
		$(OBJCOPY) -S -O binary \
		    -j .text -j .text.startup -j .MIPS.abiflags \
		    -j .data -j .rodata -j .sdata -j .rodata.str1.4 \
		    -j .bss --set-section-flags .bss=alloc,contents \
		    -j .sbss --set-section-flags .sbss=alloc,contents \
		    -j .scommon --set-section-flags .scommon=alloc,contents \
		    ../$@ bin/$(patsubst $(ARCH)/elf/%,%,$@).bin
	@cd $(ARCH) && xxd -e -c 4 bin/$(patsubst $(ARCH)/elf/%,%,$@).bin | awk -F ":" '{print $$2}' | awk -F " " '{print $$1}' \
				> sim/$(patsubst $(ARCH)/elf/%,%,$@).mem

$(ARCH)/obj/%.o: src/%.c
	@mkdir -p $(DIR_OBJS)
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

$(ARCH)/obj/common/start.o: ../common/$(ARCH)/start.S
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -o $@ $<

$(ARCH)/obj/common/printf.o: ../common/printf.c
	@mkdir -p $(ARCH)/obj/common
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

clean:
	@rm -rf $(DIR_OBJS)

