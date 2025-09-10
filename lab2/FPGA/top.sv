// lab 2: Multiplexed 7-segment display
// top calls all neccescary modules
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25


module top ( input logic [3:0]s1, 
			 input  logic [3:0]s2,
			 input logic reset,
			 output logic [6:0]seg,
			 output logic [4:0]leds,
			 output logic [1:0]dis1,
			 output logic [1:0]dis2 );
			 
	        logic [3:0]s;
			
//switch displays 
switch switch (.reset, .dis1, .dis2, .s, .s1, .s2); 

/// call seven segment 

sevenseg segseven (s, seg); 

//call sum to display sum via leds																	
 //um sums (.s1, .s2, .leds);
 
 assign leds = s1 + s2;



endmodule



