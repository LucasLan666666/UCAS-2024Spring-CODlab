
APP_SRC := software/workload

# Project-specific applications
ifeq ($(ARCH),)
obj-apps-y := $(apps-arm-$(OS)-y)
else
obj-apps-y := $(apps-$(ARCH)-$(OS)-y)
endif
obj-apps-build-y := $(foreach obj,$(obj-apps-y),$(obj).app)
obj-apps-clean-y := $(foreach obj,$(obj-apps-y),$(obj).app.clean)

.PHONY: workload workload_clean
workload: $(obj-apps-build-y)

%.app:
	@mkdir -p $(INSTALL_LOC)/$(ARCH)/$(OS)/$(patsubst %.app,%,$@) 
	$(MAKE) -C $(patsubst %.app,$(APP_SRC)/%,$@) \
		$(SW_COMPILE_FLAG) \
		INSTALL_LOC=$(INSTALL_LOC)/$(ARCH)/$(OS)/$(patsubst %.app,%,$@)

workload_clean: $(obj-apps-clean-y)

%.app.clean:
	$(MAKE) -C $(patsubst %.app.clean,$(APP_SRC)/%,$@) clean
	@rm -rf $(INSTALL_LOC)/$(ARCH)/$(OS)/$(patsubst %.app.clean,%,$@)

