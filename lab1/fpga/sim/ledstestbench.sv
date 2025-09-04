// lab 1: FPGA and MCU setup and testing 
//This test bench tests the LED module 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module ledtestbench();
    logic clk, reset;
    logic [3:0] s;
    logic [2:0] led;
    logic [2:0] led_expected;
    logic [31:0] vectornum, errors;
    logic [6:0] testvectors[20:0];

    // dut instansiation
   leds dut(s, reset, led);

    // clock generation
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // Load test vectors and initialize
    initial begin
        $readmemb("testvectorsleds.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 0; #22; reset = 1;
    end

    // Apply test vectors on rising edge
    always @(posedge clk) begin
        #1;
        {s, led_expected[2:0]} = testvectors[vectornum];
    end

    // Check results on falling edge
    always @(negedge clk)
    if (reset) begin
        if (led[1:0] !== led_expected[1:0]) begin
            $display("Error: inputs = %b", s);
            $display(" outputs = %b (%b expected)", led[1:0], led_expected[1:0]);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 7'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule