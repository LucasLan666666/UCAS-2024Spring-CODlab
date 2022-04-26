`timescale 1ns / 1ps

module ClockGate(
    input CLK,
    input EN,
    output GCLK
);

    BUFGCE u_bufgce (
        .O(GCLK),
        .CE(EN),
        .I(CLK)
    );

endmodule
