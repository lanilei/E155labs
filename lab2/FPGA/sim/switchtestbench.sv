// lab 1: FPGA and MCU setup and testing 
//This module tests the seven segment display 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module switchtestbench();
    logic [3:0] s1, s2;
    logic [4:0]sum;

    // dut instansiation
   switch dut(.clk(clk),/// INPUTS OUTPUTS
            .s2(s2), 
            .sum(sum));
initial begin 
    reset =0;
    #50;
    reset = 1;
end 

initial begin 
    $display ("Time(ns) | reset | switch |dis1 |dis2 ")
    $moniter (%8t |%b |%b |%b |%b 
    $time, reset, dut.swithc, dis1, dis3);

    $display("all tests passed yippee!");
    end

always @ (posedge clk) begin
    if (reset) begin 
        //check
        if dis1 == dis2) begin 
        $error("Outputs not alternating at time %t", $time);
         end 
    end
end
endmodule

