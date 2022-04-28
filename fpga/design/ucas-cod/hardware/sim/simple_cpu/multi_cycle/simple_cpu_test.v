`timescale 1ns / 1ps

module simple_cpu_test
();

    reg        cpu_clk;
    reg	       cpu_rst;
    
    initial begin
	    cpu_clk = 1'b0;
	    cpu_rst = 1'b1;
	    # 100
	    cpu_rst = 1'b0;
    end
    
    always begin
	    # 5 cpu_clk = ~cpu_clk;
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

    simple_cpu_top_golden    u_simple_cpu_golden (
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
    
    `define RST u_simple_cpu.u_simple_cpu.rst
    
    `define MEM_WEN   u_simple_cpu.u_simple_cpu.MemWrite
    `define MEM_ADDR  u_simple_cpu.u_simple_cpu.Address
    `define MEM_WSTRB u_simple_cpu.u_simple_cpu.Write_strb
    `define MEM_WDATA u_simple_cpu.u_simple_cpu.Write_data
    `define MEM_READ  u_simple_cpu.u_simple_cpu.MemRead
    
    `define MEM_WEN_GOLDEN   u_simple_cpu_golden.u_simple_cpu.MemWrite
    `define MEM_ADDR_GOLDEN  u_simple_cpu_golden.u_simple_cpu.Address
    `define MEM_WSTRB_GOLDEN u_simple_cpu_golden.u_simple_cpu.Write_strb
    `define MEM_WDATA_GOLDEN u_simple_cpu_golden.u_simple_cpu.Write_data
    `define MEM_READ_GOLDEN  u_simple_cpu_golden.u_simple_cpu.MemRead
    
    `define PC        u_simple_cpu.u_simple_cpu.PC
    `define PC_GOLDEN u_simple_cpu_golden.u_simple_cpu.PC
    
    `define PC_VALID  u_simple_cpu_golden.u_simple_cpu.current_state 

	wire [31:0] wbit_mask = {{8{`MEM_WSTRB_GOLDEN[3]}}, {8{`MEM_WSTRB_GOLDEN[2]}}, {8{`MEM_WSTRB_GOLDEN[1]}}, {8{`MEM_WSTRB_GOLDEN[0]}}};
	reg compare_pc;
	always @(posedge cpu_clk) begin
		if (`RST)
			compare_pc <= 1'b0;
		else if (`PC_VALID == 5'b00100)
			compare_pc <= 1'b1;
		else if (compare_pc)
			compare_pc <= 1'b0;
	end

    always @(posedge cpu_clk)
    begin
	    if(!`RST)
	    begin
			if (compare_pc & `PC !== `PC_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %dns.", $time);
				$display("Yours:     PC = 0x%h", `PC);
				$display("Reference: PC = 0x%h", `PC_GOLDEN);
				$display("=================================================");
				$finish;
			end
		    
		    else if (`MEM_READ_GOLDEN !== `MEM_READ)
		    begin
			    $display("=================================================");
			    $display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
			    $display("Yours:     MemRead = 0x%h", `MEM_READ);
			    $display("Reference: MemRead = 0x%h", `MEM_READ_GOLDEN);
			    $display("=================================================");
			    $finish;
		    end
		    
		    else if (`MEM_WEN_GOLDEN !== `MEM_WEN)
		    begin
			    $display("=================================================");
			    $display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
			    $display("Yours:     MemWrite = 0x%h", `MEM_WEN);
			    $display("Reference: MemWrite = 0x%h", `MEM_WEN_GOLDEN);
			    $display("=================================================");
			    $finish;
		    end
		    
		    else if ((`MEM_READ == 1'b1) & (`MEM_ADDR_GOLDEN !== `MEM_ADDR))
		    begin
			    $display("=================================================");
			    $display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
			    $display("Yours:     MemRead Address = 0x%h", `MEM_ADDR);
			    $display("Reference: MemRead Address = 0x%h", `MEM_ADDR_GOLDEN);
			    $display("=================================================");
			    $finish;
		    end
		    
		    else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR_GOLDEN !== `MEM_ADDR))
		    begin
				$display("=================================================");
				$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemWrite Address = 0x%h", `MEM_ADDR);
				$display("Reference: MemWrite Address = 0x%h", `MEM_ADDR_GOLDEN);
				$display("=================================================");
				$finish;
		    end
		    
		    else if ((`MEM_WEN == 1'b1) & ((`MEM_WDATA_GOLDEN & wbit_mask) !== (`MEM_WDATA & wbit_mask)))
		    begin
			    if ((`MEM_WDATA_GOLDEN != 32'd0) | (`MEM_WDATA !== 32'hxxxxxxxx))
			    begin
				    $display("=================================================");
				    $display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				    $display("Yours:     Write_data = 0x%h", `MEM_WDATA);
				    $display("Reference: Write_data = 0x%h", `MEM_WDATA_GOLDEN);
				    $display("=================================================");
				    $finish;
			    end
		    end
		    
		    else if ((`MEM_WEN == 1'b1) & (`MEM_WSTRB_GOLDEN !== `MEM_WSTRB))
		    begin
			    $display("=================================================");
			    $display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
			    $display("Yours:     Write_strb = 0x%h", `MEM_WSTRB);
			    $display("Reference: Write_strb = 0x%h", `MEM_WSTRB_GOLDEN);
			    $display("=================================================");
			    $finish;
		    end
		    
		    else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR == 32'h0C) & (`MEM_WDATA == 32'h0))
		    begin
			    $display("=================================================");
			    $display("Benchmark simulation passed!!!");
			    $display("=================================================");
			    $finish;
		    end
	    end
    end
    
    reg [4095:0] dumpfile;
    
    initial begin
	    if ($value$plusargs("DUMP=%s", dumpfile)) begin
		    $dumpfile(dumpfile);
		    $dumpvars();
	    end
    end

endmodule


