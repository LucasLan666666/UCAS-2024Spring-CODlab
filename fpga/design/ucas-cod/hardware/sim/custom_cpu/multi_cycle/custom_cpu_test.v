`timescale 1ns / 1ps

module custom_cpu_test
();
        reg	sys_clk;
	reg	sys_reset_n;

	initial begin
		sys_clk = 1'b0;
		sys_reset_n = 1'b0;
		# 100
		sys_reset_n = 1'b1;
	end

	always begin
		# 5 sys_clk = ~sys_clk;
	end

	always begin
		# 20000000 $display("Simulated %d ns", $time);
	end
	
	cpu_test_top    u_cpu_test (
		.sys_clk	(sys_clk),
		.sys_reset_n	(sys_reset_n)
	);
	
	cpu_test_top_golden    u_cpu_test_golden (
		.sys_clk	(sys_clk),
		.sys_reset_n	(sys_reset_n)
	);

	`define RST u_cpu_test.u_cpu.rst

	`define PC              u_cpu_test.u_cpu.PC
	`define INST_REQ_VALID	u_cpu_test.u_cpu.Inst_Req_Valid
	`define INST_REQ_READY	u_cpu_test.u_cpu.Inst_Req_Ready

	`define PC_GOLDEN		u_cpu_test_golden.u_cpu.PC
	`define INST_REQ_VALID_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Req_Valid
	`define INST_REQ_READY_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Req_Ready

	`define INST_VALID	u_cpu_test.u_cpu.Inst_Valid
	`define INST_READY	u_cpu_test.u_cpu.Inst_Ready

	`define INST_VALID_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Valid
	`define INST_READY_GOLDEN	u_cpu_test_golden.u_cpu.Inst_Ready

	`define MEM_WEN		 u_cpu_test.u_cpu.MemWrite
	`define MEM_ADDR	 u_cpu_test.u_cpu.Address
	`define MEM_WSTRB	 u_cpu_test.u_cpu.Write_strb
	`define MEM_WDATA	 u_cpu_test.u_cpu.Write_data
	`define MEM_READ	 u_cpu_test.u_cpu.MemRead
	`define MEM_REQ_READY    u_cpu_test.u_cpu.Mem_Req_Ack

	`define MEM_WEN_GOLDEN	      u_cpu_test_golden.u_cpu.MemWrite
	`define MEM_ADDR_GOLDEN	      u_cpu_test_golden.u_cpu.Address
	`define MEM_WSTRB_GOLDEN      u_cpu_test_golden.u_cpu.Write_strb
	`define MEM_WDATA_GOLDEN      u_cpu_test_golden.u_cpu.Write_data
	`define MEM_READ_GOLDEN	      u_cpu_test_golden.u_cpu.MemRead
	`define MEM_REQ_READY_GOLDEN  u_cpu_test_golden.u_cpu.Mem_Req_Ack

	`define DATA_VALID	u_cpu_test.u_cpu.Read_data_Valid
	`define DATA_READY	u_cpu_test.u_cpu.Read_data_Ready

	`define DATA_VALID_GOLDEN     u_cpu_test_golden.u_cpu.Read_data_Valid
	`define DATA_READY_GOLDEN     u_cpu_test_golden.u_cpu.Read_data_Ready

	`define FIFO_EMPTY  u_cpu_test.u_uart_sim.empty_fifo

	reg benchmark_finish;

	wire [31:0] mask_strb = {{8{`MEM_WSTRB_GOLDEN[3]}},
				 {8{`MEM_WSTRB_GOLDEN[2]}},
				 {8{`MEM_WSTRB_GOLDEN[1]}},
				 {8{`MEM_WSTRB_GOLDEN[0]}}};

	always @(posedge sys_clk)
	begin
		if(`RST)
			benchmark_finish <= 1'b0;
		else // if(!`RST)
		begin
			if (`INST_REQ_VALID !== `INST_REQ_VALID_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %dns.", $time);
				$display("Yours:     Inst_Req_Valid = 0x%h", `INST_REQ_VALID);
				$display("Reference: Inst_Req_Valid = 0x%h", `INST_REQ_VALID_GOLDEN);
				$display("=================================================");
				$finish;
			end

			else if ((`INST_REQ_VALID == 1'b1) & (`PC !== `PC_GOLDEN))
			begin
				$display("=================================================");
				$display("ERROR: at %dns.", $time);
				$display("Yours:     Inst_Req_Valid = 1, PC = 0x%h", `PC);
				$display("Reference: Inst_Req_Valid = 1, PC = 0x%h", `PC_GOLDEN);
				$display("=================================================");
				$finish;
			end

			else if (`INST_READY !== `INST_READY_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				$display("Yours:     Inst_Ready = 0x%h", `INST_READY);
				$display("Reference: Inst_Ready = 0x%h", `INST_READY_GOLDEN);
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

			else if ((`MEM_READ == 1'b1) & (`MEM_ADDR_GOLDEN[31:2] !== `MEM_ADDR[31:2]))
			begin
				$display("=================================================");
				$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemRead Address & 0xfffffffc = 0x%h", {`MEM_ADDR[31:2],        2'b0});
				$display("Reference: MemRead Address & 0xfffffffc = 0x%h", {`MEM_ADDR_GOLDEN[31:2], 2'b0});
				$display("=================================================");
				$finish;
			end

			else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR_GOLDEN[31:2] !== `MEM_ADDR[31:2]))
			begin
				$display("=================================================");
				$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				$display("Yours:     MemWrite Address & 0xfffffffc = 0x%h", {`MEM_ADDR[31:2],        2'b0});
				$display("Reference: MemWrite Address & 0xfffffffc = 0x%h", {`MEM_ADDR_GOLDEN[31:2], 2'b0});
				$display("=================================================");
				$finish;
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

			else if ((`MEM_WEN == 1'b1) & ((`MEM_WDATA_GOLDEN & mask_strb) !== (`MEM_WDATA & mask_strb)))
			begin
				if ((`MEM_WDATA_GOLDEN != 32'd0) | (`MEM_WDATA !== 32'hxxxxxxxx))
				begin
					$display("=================================================");
					$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
					$display("Yours:     Write_data & 0x%h = 0x%h", mask_strb, `MEM_WDATA & mask_strb);
					$display("Reference: Write_data & 0x%h = 0x%h", mask_strb, `MEM_WDATA_GOLDEN & mask_strb);
					$display("=================================================");
					$finish;
				end
			end

			else if (`DATA_READY !== `DATA_READY_GOLDEN)
			begin
				$display("=================================================");
				$display("ERROR: at %dns, PC = 0x%h.", $time, `PC);
				$display("Yours:     Read_data_Ready = 0x%h", `DATA_READY);
				$display("Reference: Read_data_Ready = 0x%h", `DATA_READY_GOLDEN);
				$display("=================================================");
				$finish;
			end

			else if ((`MEM_WEN == 1'b1) & (`MEM_ADDR == 32'h0C) & (`MEM_WDATA == 32'h0))
			begin
				/*$display("");
				$display("=================================================");
				$display("Benchmark simulation passed!!!");
				$display("=================================================");
				$finish;*/
				benchmark_finish <= 1'b1;
			end

			else if (benchmark_finish & `FIFO_EMPTY)
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
