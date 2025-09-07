// lab 1: FPGA and MCU setup and testing 
//This module tests the seven segment display 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module sumtestbench();
    logic [3:0] s1, s2;
    logic [4:0]sum;

    // dut instansiation
   sum dut(.s1(s1),
            .s2(s2), 
            .sum(sum));
initial begin 
    s1=4'd1; s2=4'd1; #1; 
    assert(sum == 5'd2) else $error(test 1 failed %d + %d != %d", s1, s2, led); // add more

    $display("all tests passed yippee!");
    end
    
endmodule

