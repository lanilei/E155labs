// lab 1: FPGA and MCU setup and testing
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25
module top( input logic     [3:0]s,
			input logic     reset,
			output logic    [2:0]led,
			output logic    [6:0]seg);


   logic int_osc;
   logic [24:0] counter;
// call seven segment module

	 sevenseg seven( s,
			        seg   );

 // cal leds
 leds ledss (s,
			reset,
			led);

endmodule
