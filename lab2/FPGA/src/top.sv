// lab 2: Multiplexed 7-segment display
// top calls all neccescary modules
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25


module top ( input logic s1[3:0], 
			 input logic s2[3:0],
			 input logic clk,
			 input logic reset,
			 output logic seg[6:0],
			 output logic leds[4:0],
			 output logic dis1[1:0],
			 output logic dis2[1:0]);
			 
			logic [3:0] s;
			

/// call seven segment 

sevenseg segseven (s, seg); 

//call sum to display sum via leds																	
  sum sums (.s1, .s2, .sum(leds));

//switch displays 
switch #(100000) switch (.clk, .reset, .dis1, .dis2, .s, .s1, .s2); 

endmodule



