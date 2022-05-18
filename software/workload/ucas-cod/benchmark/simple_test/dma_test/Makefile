
CC := $(CROSS_COMPILE)gcc
AS := $(CROSS_COMPILE)as
LD := $(CROSS_COMPILE)ld
OBJDUMP := $(CROSS_COMPILE)objdump
OBJCOPY := $(CROSS_COMPILE)objcopy

ifeq ($(ARCH),mips)
CFLAGS = -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
		-fno-stack-protector -mno-check-zero-division \
		-Wall -Werror -mno-imadd -mno-mad -EL -mips32 -G0 -O0
endif

ifeq ($(ARCH),riscv32)
CFLAGS := -fno-pic -static -fno-strict-aliasing -fno-delayed-branch -fno-builtin \
	  -ffreestanding -Wno-unused-function \
	  -fno-stack-protector -Wall -Werror -march=rv32i -O0
endif

CFLAGS += -I include -I ../include
ASFLAGS := -EL
LDFLAGS := -EL -N -e start -T user.ld

DIRS := bin elf obj disassembly sim
DIR_OBJS := $(foreach obj,$(DIRS),$(ARCH)/$(obj))

TARGET := data_mover_dma data_mover_dma_simu data_mover_no_dma
ELFS := $(addprefix $(ARCH)/elf/,$(TARGET))

LIB    := $(wildcard ../common/*.c)
COMMON := $(wildcard $(ARCH)/common/*.S)

OBJS   := $(patsubst %.S,%.o,$(COMMON)) \
	  $(patsubst ../common/%.c,$(ARCH)/obj/%.o,$(LIB))

CFLAGS_data_mover_dma      := -DUSE_DMA
CFLAGS_data_mover_dma_simu := -DUSE_DMA -DDMA_SIMU

all: $(ELFS)

$(ARCH)/elf/%: $(OBJS) $(ARCH)/obj/%/data_mover.o 
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

$(ARCH)/obj/%/data_mover.o: src/data_mover.c
	@mkdir -p $(DIR_OBJS)
	@mkdir -p $(ARCH)/obj/$(patsubst $(ARCH)/obj/%/data_mover.o,%,$@)
	$(CC) -c $(CFLAGS) $(CFLAGS_$(patsubst $(ARCH)/obj/%/data_mover.o,%,$@)) -O2 -o $@ $<

$(ARCH)/obj/%.o: ../common/%.c
	@mkdir -p $(DIR_OBJS)
	$(CC) -c $(CFLAGS) -O2 -o $@ $<

$(ARCH)/common/%.o: $(ARCH)/common/%.S
	$(CC) -c $(CFLAGS) -o $@ $<

clean:
	@rm -rf $(DIR_OBJS)

