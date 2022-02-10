
EXPORT_CC_PATH := export PATH=$(COMPILER_PATH):$$PATH

include target.mk

obj-y := $(BENCH_GROUP)
obj-bench-y := $(foreach obj,$(obj-y),$(obj).bench)
obj-clean-y := $(foreach obj,$(obj-y),$(obj).clean)

.PHONY: FORCE

all: $(obj-bench-y)

clean: $(obj-clean-y)

%.bench: FORCE
	$(EXPORT_CC_PATH) && $(MAKE) -C $(patsubst %.bench,%,$@) \
		CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH)

%.clean:
	$(MAKE) -C $(patsubst %.clean,%,$@) ARCH=$(ARCH) clean 

