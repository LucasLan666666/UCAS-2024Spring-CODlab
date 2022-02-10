# FPGA_ACT list
#==========================================
# prj_gen: Creating Vivado project and generating hardware 
#          definition file (HDF)
# run_syn: Synthesizing design
# bit_gen: Generating bitstream file (.bit) via automatically 
#          launching placement and routing
# dcp_gen: Generate a checkpoint (.dcp) for a specified part in a design
#          and later integrate the .dcp file into the design project via
#          the command read_checkpoint
# dcp_chk: Opening a checkpoint (.dcp) file generated in a certain step 
#          of synthesis, placement and routing. 
#          You can optionally setup hardware debug cores when opening 
#          the synth.dcp
#==========================================
# Default Vivado GUI launching flags if not specified in command line
FPGA_ACT ?= 
FPGA_VAL ?= 

# common targets of FPGA hardware design flow
fpga: $(SYS_HDF) $(BITSTREAM)

fpga_clean:
	@rm -f $(SYS_HDF) $(BITSTREAM)

$(SYS_HDF): FORCE
	$(MAKE) FPGA_ACT=prj_gen FPGA_BD=$(FPGA_BD) FPGA_PRJ=$(FPGA_PRJ) vivado_prj 

$(BITSTREAM): FORCE
	$(MAKE) FPGA_ACT=run_syn FPGA_BD=$(FPGA_BD) FPGA_PRJ=$(FPGA_PRJ) vivado_prj 
	$(MAKE) FPGA_ACT=bit_gen FPGA_BD=$(FPGA_BD) FPGA_PRJ=$(FPGA_PRJ) vivado_prj

# launch Vivado Toolset
vivado_prj: FORCE
	@mkdir -p $(HW_PLATFORM)
	$(MAKE) -C ./fpga VIVADO=$(VIVADO_BIN) FPGA_BD=$(FPGA_BD) FPGA_PRJ=$(FPGA_PRJ) \
		FPGA_ACT=$(FPGA_ACT) FPGA_VAL="$(FPGA_VAL)" O=$(HW_PLATFORM) $@

