`timescale 10ns / 1ns

module adder_test
();

  reg  [7:0]      operand0;
  reg  [7:0]      operand1;

  wire [7:0]          result;
  wire [7:0]          result_reference;

  initial begin
    $display("============== Testbench Log Start ==============");
    operand0 = 0;
    operand1 = 0;
    forever begin
      #5
      if (operand0 === 255) begin
        if (operand1 === 255) begin
          $display("Testbench Succeeded!");
          $display("============== Testbench Log Ended ==============");
          $finish;
        end
        operand0 <= 0;
        operand1 <= operand1 + 1;
      end else begin
        operand0 <= operand0 + 1;
      end
      #5
      if (result !== result_reference) begin
        $display("ERROR: 0x%02h + 0x%02h, golden result: 0x%02h, current result: 0x%02h.", operand0, operand1, result_reference, result);
        $display("============== Testbench Log Ended ==============");
        $finish;
      end
    end
  end


    adder u_adder (
        .operand0(operand0),
        .operand1(operand1),

        .result(result)
    );
    adder_reference u_adder_reference (
        .operand0(operand0),
        .operand1(operand1),

        .result(result_reference)
    );

    reg [4095:0] dumpfile;
    initial begin
        if ($value$plusargs("DUMP=%s", dumpfile)) begin
            $dumpfile(dumpfile);
            $dumpvars();
        end
    end
endmodule
