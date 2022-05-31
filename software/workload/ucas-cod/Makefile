
EXPORT_CC_PATH := export PATH=$(COMPILER_PATH):$$PATH

# MIPS 32 or RISC-V 32 benchmarks on simple CPU prototyping
obj-y := perf_test simple_test
obj-bench-y := $(foreach obj,$(obj-y),$(obj).bench)
obj-bench-clean-y := $(foreach obj,$(obj-y),$(obj).clean)

# Host tools on ARMv8 of Zynq MPSoC on NF card
obj-host-y := example reg_file alu simple_cpu custom_cpu
obj-tool-y := $(foreach obj,$(obj-host-y),$(obj).tool)
obj-tool-clean-y := $(foreach obj,$(obj-host-y),$(obj).toolclean)

.PHONY: FORCE

ifeq ($(ARCH),)
all: $(obj-tool-y)
else
all: $(obj-bench-y)
endif

%.bench: FORCE 
	@mkdir -p $(INSTALL_LOC)/$(patsubst %.bench,benchmark/%,$@)
	$(MAKE) -C $(patsubst %.bench,benchmark/%,$@) \
		ARCH=$(ARCH) COMPILER_PATH=$(COMPILER_PATH) \
		CROSS_COMPILE=$(CROSS_COMPILE)

%.tool: FORCE
	@mkdir -p $(INSTALL_LOC)/$(patsubst %.tool,host/%,$@)

	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.tool,host/%,$@) ROLE_ID=0
	$(MAKE) -C $(patsubst %.tool,host/%,$@) clean

	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.tool,host/%,$@) ROLE_ID=1
	$(MAKE) -C $(patsubst %.tool,host/%,$@) clean

	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.tool,host/%,$@) ROLE_ID=2
	$(MAKE) -C $(patsubst %.tool,host/%,$@) clean

	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.tool,host/%,$@) ROLE_ID=3
	$(MAKE) -C $(patsubst %.tool,host/%,$@) clean

	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.tool,host/%,$@) ROLE_ID=4
	$(MAKE) -C $(patsubst %.tool,host/%,$@) clean

	@cp -r $(patsubst %.tool,host/%,$@)/elf/* \
		$(INSTALL_LOC)/$(patsubst %.tool,host/%,$@)

ifeq ($(ARCH),)
clean: $(obj-tool-clean-y)
else
clean: $(obj-bench-clean-y)
endif

%.clean:
	$(MAKE) -C $(patsubst %.clean,benchmark/%,$@) clean
	@rm -rf $(INSTALL_LOC)/$(patsubst %.clean,benchmark/%,$@)

%.toolclean:
	$(MAKE) -C $(patsubst %.toolclean,host/%,$@) clean
	@rm -rf $(INSTALL_LOC)/$(patsubst %.toolclean,host/%,$@)

