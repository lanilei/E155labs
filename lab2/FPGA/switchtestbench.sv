// lab 1: FPGA and MCU setup and testing 
//This module tests the seven segment display 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

//Modelsim-ASE requires a timescale directive
`timescale 1 ns / 1 ns

module switchtestbench();
	logic clk; 
	logic [31:0] counter;
    logic [3:0] s1, s2;
    logic [4:0]sum;
	logic dis1;
	logic dis1_expected;
	logic reset; 
	logic clk_switch;
    // dut instansiation
   switch dut(reset, s1,s2, s, dis1, dis2); 
   
always begin
	clk = 1; #10000;
	clk = 0; #10000;
end
 
initial begin 
    reset =0;
    #50;
    reset = 1;
end 


  // switcj 7 segs when the counter reaches the threshold
  always_ff @(posedge clk) begin
    if (clk_switch) begin
      dis1_expected <= ~dis1_expected;
      counter <= 0;
    end else if (reset) begin
      counter <= 0;
      dis1_expected <= 0;
    end else
      counter <= counter + 1;
  end



always_ff @(*) begin 
    assert(dis1 == dis1_expected) else $error("test 1 failed %d  %d ", dis1, dis1_expected);
	end 

endmodule

