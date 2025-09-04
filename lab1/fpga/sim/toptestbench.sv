//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module toptestbench();
    logic clk, reset;
    logic [3:0] s;
    logic [6:0] seg, seg_expected;
    logic [2:0] led;
    logic [1:0] led_expected;
    logic [31:0] vectornum, errors;
    logic [13:0] testvectors[20:0];

    // dut instansiation
    top dut(clk, s, led, seg);

    // clock generation
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // Load test vectors and initialize
    initial begin
        $readmemb("testvectors.tv", testvectors);
        vectornum = 0; errors = 0;
        reset = 0; #22; reset = 1;
    end

    // Apply test vectors on rising edge
    always @(posedge clk) begin
        #1;
        {s, led_expected[2:0], seg_expected} = testvectors[vectornum];
    end

    // Check results on falling edge
    always @(negedge clk)
    if (reset) begin
        if (led[1:0] !== led_expected[1:0] || seg !== seg_expected) begin
            $display("Error: inputs = %b", s);
            $display(" outputs = %b %b (%b %b expected)", led[1:0], seg, led_expected[1:0], seg_expected);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 14'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule