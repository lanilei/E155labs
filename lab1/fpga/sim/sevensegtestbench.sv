// lab 1: FPGA and MCU setup and testing 
//This module tests the seven segment display 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module sevensegtestbench();
    logic clk, reset;
    logic [3:0] s;
    logic [6:0] seg, seg_expected;
    logic [31:0] vectornum, errors;
    logic [10:0] testvectors[20:0];

    // dut instansiation
   sevenseg dut(s, seg);

    // clock generation
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // Load test vectors and initialize
    initial begin
        $readmemb("testvectorssevenseg.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 0; #22; reset = 1;
    end

    // Apply test vectors on rising edge
    always @(posedge clk) begin
        #1;
        {s, seg_expected} = testvectors[vectornum];
    end

    // Check results on falling edge
    always @(negedge clk)
    if (reset) begin
        if ( seg !== seg_expected) begin
            $display("Error: inputs = %b", s);
            $display(" outputs =  %b ( %b expected)", seg, seg_expected);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 11'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule