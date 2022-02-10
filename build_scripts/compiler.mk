# Specify cross-compiler for target FPGA board
ifeq ($(ARCH),)
LINUX_GCC_PATH := $($(FPGA_ARCH)_LINUX_GCC_PATH)
LINUX_GCC_PREFIX := $($(FPGA_ARCH)_LINUX_GCC_PREFIX)
else
LINUX_GCC_PATH := $($(ARCH)_LINUX_GCC_PATH)
LINUX_GCC_PREFIX := $($(ARCH)_LINUX_GCC_PREFIX)
endif

ifeq ($(ARCH),)
ELF_GCC_PATH := $($(FPGA_ARCH)_ELF_GCC_PATH)
ELF_GCC_PREFIX := $($(FPGA_ARCH)_ELF_GCC_PREFIX)
else
ELF_GCC_PATH := $($(ARCH)_ELF_GCC_PATH)
ELF_GCC_PREFIX := $($(ARCH)_ELF_GCC_PREFIX)
endif

# Host machine to determine if it is cross compilation for Linux kernel
HOST := $(shell uname -m)

ifneq ($(HOST),aarch64)
SW_COMPILE_FLAG := ARCH=$(ARCH) \
	COMPILER_PATH=$(LINUX_GCC_PATH) \
	CROSS_COMPILE=$(LINUX_GCC_PREFIX)
else
SW_COMPILE_FLAG := 
endif

