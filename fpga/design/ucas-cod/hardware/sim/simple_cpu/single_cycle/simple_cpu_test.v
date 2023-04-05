`timescale 10ns / 1ns

module simple_cpu_test
();

    reg       cpu_clk;
    reg       cpu_rst;
    
    initial begin
	    cpu_clk = 1'b0;
	    cpu_rst = 1'b1;
	    # 3
	    cpu_rst = 1'b0;
	    
	    # 2000000
	    $finish;
    end
    
    always begin
	    # 1 cpu_clk = ~cpu_clk;
    end

    simple_cpu_top    u_simple_cpu (
	//AXI AR Channel
        .simple_cpu_axi_if_araddr    ('d0),
	.simple_cpu_axi_if_arvalid   ('d0),

	//AXI AW Channel
        .simple_cpu_axi_if_awaddr    ('d0),
        .simple_cpu_axi_if_awvalid   ('d0),

	//AXI B Channel
	.simple_cpu_axi_if_bready    ('d0),

	//AXI R Channel
	.simple_cpu_axi_if_rready    ('d0),

	//AXI W Channel
        .simple_cpu_axi_if_wdata     ('d0),
        .simple_cpu_axi_if_wstrb     ('d0),
        .simple_cpu_axi_if_wvalid    ('d0),

        .clk        (cpu_clk),
	.resetn     (~cpu_rst),
        .cpu_rst    (cpu_rst)
    );

    `define RST       u_simple_cpu.u_simple_cpu.rst
    
    `define RF_WEN    u_simple_cpu.u_simple_cpu.RF_wen
    `define RF_WADDR  u_simple_cpu.u_simple_cpu.RF_waddr
    `define RF_WDATA  u_simple_cpu.u_simple_cpu.RF_wdata
    
    `define MEM_WEN   u_simple_cpu.u_simple_cpu.MemWrite
    `define MEM_ADDR  u_simple_cpu.u_simple_cpu.Address
    `define MEM_WSTRB u_simple_cpu.u_simple_cpu.Write_strb
    `define MEM_WDATA u_simple_cpu.u_simple_cpu.Write_data
    `define MEM_READ  u_simple_cpu.u_simple_cpu.MemRead
    `define PC        u_simple_cpu.u_simple_cpu.PC
    
    // _ref: format of CPU execution trace
    // bit_cmp: specify whether the bit needs to be compared
    /*
     * type:
     * 1: Write RF    1 PC(32'h) addr(5'd) data(32'h) bit_cmp(32'h) mem_read(1'b)
     * 2: Write Mem   2 PC(32'h) addr(32'h) strb(4'h) data(32'h) bit_cmp(32'h)
     * 3: Branch      3 PC(32'h) new_PC(32'h)
     * 4: jump & link 4 PC(32'h) new_PC(32'h) addr(5'd) data(32'h)
     */
    reg [31:0] PC_ref, new_PC_ref;
    reg [ 4:0] rf_waddr_ref;
    reg [31:0] rf_wdata_ref, rf_bit_cmp_ref;
    reg [31:0] mem_addr_ref, mem_wdata_ref, mem_bit_cmp_ref;
    reg [ 3:0] mem_wstrb_ref;
    reg        mem_read_ref;

    integer trace_file, type_num;
    integer ret;
    
    initial
    begin
	    trace_file = $fopen(`TRACE_FILE, "r");
	    if(trace_file == 0)
	    begin
		    $display("ERROR: open file failed.");
		    $finish;
	    end
    end
    
    always
    begin
	    // Read CPU execution trace file
	    // This is done 1 cycle earlier than comparison so that reference signals & DUT signals are aligned in the waveform
	    ret = $fscanf(trace_file, "%d", type_num);
	    
	    if($feof(trace_file))
	    begin
		    $display("=================================================");
		    $display("INFO: comparing trace finish, PASS!");
		    $display("=================================================");
		    $fclose(trace_file);
		    $finish;
	    end
	    
	    ret = $fscanf(trace_file, "%h", PC_ref);
	    case(type_num)
		    1:	ret = $fscanf(trace_file, "%d %h %h %d", rf_waddr_ref, rf_wdata_ref, rf_bit_cmp_ref, mem_read_ref);
		    2:	ret = $fscanf(trace_file, "%h %h %h %h", mem_addr_ref, mem_wstrb_ref, mem_wdata_ref, mem_bit_cmp_ref);
		    3:	ret = $fscanf(trace_file, "%h", new_PC_ref);
		    4:	ret = $fscanf(trace_file, "%h %d %h", new_PC_ref, rf_waddr_ref, rf_wdata_ref);
		    default:
		    begin
			    $display("ERROR: unkonwn type.");
			    $fclose(trace_file);
			    $finish;
		    end
	    endcase
	    
	    @(posedge cpu_clk);
	    while (`RST) @(posedge cpu_clk);
	    
	    if(!`RST)
	    begin
		    // Comparison
		    if(`PC !== PC_ref)
		    begin
			    $display("=================================================");
			    $display("ERROR: at %d0ns.", $time);
			    $display("Yours:     PC = 0x%h", `PC);
			    $display("Reference: PC = 0x%h", PC_ref);
			    $display("Please check assignment of PC at previous cycle.");
			    $display("=================================================");
			    $fclose(trace_file);
			    $finish;
		    end
		    
		    case(type_num)
			    1:
			    begin
				    if(`MEM_WEN !== 1'b0)
				    begin
					    $display("=================================================");
					    $display("ERROR: at %d0ns.", $time);
					    $display("MemWrite should be 0 here.");
					    $display("=================================================");
					    $fclose(trace_file);
					    $finish;
				    end
				    
				    if(rf_waddr_ref == 0)
				    begin
					    if((`RF_WEN !== 1'b0) && (`RF_WADDR !== 5'd0))
					    begin
						    $display("=================================================");
						    $display("ERROR: at %d0ns.", $time);
						    $display("Yours:     RF_waddr = %02d", `RF_WADDR);
						    $display("Reference: RF_waddr = %02d", rf_waddr_ref);
						    $display("Either RF_waddr or RF_wen should be 0 here.");
						    $display("=================================================");
						    $fclose(trace_file);
						    $finish;
					    end
					    //  As RF_waddr = 0, the case that mem_read_ref = 1 & MEM_READ = 0 would be true
					    if(!mem_read_ref && (`MEM_READ !== 1'b0))
					    begin
						    $display("=================================================");
						    $display("ERROR: at %d0ns.", $time);
						    $display("MemRead should be 0 here.");
						    $display("=================================================");
						    $fclose(trace_file);
						    $finish;
					    end
				    end
				    else if((`RF_WEN !== 1'b1) || (mem_read_ref !== `MEM_READ))
				    begin
					    $display("=================================================");
					    $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     RF_wen = %1d, MemRead = %1d", `RF_WEN, `MEM_READ);
				            $display("Reference: RF_wen = %1d, MemRead = %1d", 1, mem_read_ref);
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
				    
				    else if ((`RF_WADDR !== rf_waddr_ref) ||
					    ((`RF_WDATA & rf_bit_cmp_ref) !== (rf_wdata_ref & rf_bit_cmp_ref)))
				    begin
					    $display("=================================================");
				            $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     RF_waddr = %02d, (RF_wdata & 0x%h) = 0x%h", 
					             `RF_WADDR, rf_bit_cmp_ref, (`RF_WDATA & rf_bit_cmp_ref));
				            $display("Reference: RF_waddr = %02d, (RF_wdata & 0x%h) = 0x%h",
					             rf_waddr_ref, rf_bit_cmp_ref, (rf_wdata_ref & rf_bit_cmp_ref));
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
			    end
			    
			    2:
			    begin
				    if({`MEM_WEN, `RF_WEN, `MEM_READ} !== 3'b100)
				    begin
					    $display("=================================================");
				            $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     MemWrite = %1d, RF_wen = %1d, MemRead = %1d",
					             `MEM_WEN, `RF_WEN, `MEM_READ);
				            $display("Reference: MemWrite = %1d, RF_wen = %1d, MemRead = %1d", 1, 0, 0);
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
				    
				    if ((`MEM_ADDR !== mem_addr_ref) || (`MEM_WSTRB !== mem_wstrb_ref) ||
			               ((`MEM_WDATA & mem_bit_cmp_ref) !== (mem_wdata_ref & mem_bit_cmp_ref)))
			            begin
					    $display("=================================================");
					    $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     Address = 0x%h, Write_strb = 0x%h, (Write_data & 0x%h) = 0x%h",
					             `MEM_ADDR, `MEM_WSTRB, mem_bit_cmp_ref, (`MEM_WDATA & mem_bit_cmp_ref));
				            $display("Reference: Address = 0x%h, Write_strb = 0x%h, (Write_data & 0x%h) = 0x%h",
					             mem_addr_ref, mem_wstrb_ref, mem_bit_cmp_ref, (mem_wdata_ref & mem_bit_cmp_ref));
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
			    end
			    
			    3:
			    begin
				    if({`MEM_WEN, `RF_WEN, `MEM_READ} !== 3'b000)
				    begin
					    $display("=================================================");
				            $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     MemWrite = %1d, RF_wen = %1d, MemRead = %1d",
					             `MEM_WEN, `RF_WEN, `MEM_READ);
				            $display("Reference: MemWrite = %1d, RF_wen = %1d, MemRead = %1d", 0, 0, 0);
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
			    end
			    
			    4:
			    begin
				    if({`MEM_WEN, `RF_WEN, `MEM_READ} !== 3'b010)
				    begin
					    $display("=================================================");
				            $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     MemWrite = %1d, RF_wen = %1d, MemRead = %1d",
					             `MEM_WEN, `RF_WEN, `MEM_READ);
				            $display("Reference: MemWrite = %1d, RF_wen = %1d, MemRead = %1d", 0, 1, 0);
				            $display("=================================================");
				            $fclose(trace_file);
				            $finish;
				    end
				    
				    if((`RF_WADDR !== rf_waddr_ref) || (`RF_WDATA !== rf_wdata_ref))
				    begin
					    $display("=================================================");
				            $display("ERROR: at %d0ns.", $time);
				            $display("Yours:     RF_waddr = %02d, RF_wdata = 0x%h", `RF_WADDR, `RF_WDATA);
				            $display("Reference: RF_waddr = %02d, RF_wdata = 0x%h",  rf_waddr_ref, rf_wdata_ref);
				            $display("Please check implemention of jal & jalr.");
				            $display("=================================================");
				            $fclose(trace_file);
					    $finish;
				    end
			    end
			    
			    default:
			    begin
				    $display("ERROR: unkonwn type.");
				    $fclose(trace_file);
				    $finish;
			    end
		    endcase
	    end
    end
    
    reg [4095:0] dumpfile;
    initial begin
	    if ($value$plusargs("DUMP=%s", dumpfile))
	    begin
		    $dumpfile(dumpfile);
		    $dumpvars();
	    end
    end

endmodule

