// lab 2: Multiplexed 7-segment display
//test bench 
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25

`timescale 1ns/1ns
`default_nettype none
`define N_TV 10

module lab2_tb();
  // Set up test signals
  logic        clk, reset;
  logic [3:0]  s1, s2, s;
  logic [4:0]  leds, leds_expected;
  logic [6:0]  seg, seg_expected;
  logic        dis1, dis2;
  logic counter ;
  // Instantiate the device under test
  top dut(s1, s2, reset, seg, leds, dis1, dis2);

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end
 initial begin 
	 reset = 0; #10000
	reset = 1; 
end 


    // Apply test vectors on rising edge
    always_ff @(posedge clk, posedge reset) begin
	if (!reset)
		counter <= 8'b0;
    else if (counter != 8'b11111111) begin
			counter <= counter +1; 
			
	assert( leds == leds_expected) else $error("assertion failed leds: %b %b %b", leds, s1, s2); 
	assert(seg == seg_expected) else $error("assetion failed segs: %b %b", segs, segs_expected);
	
	end 
	else begin
		if (s == 2'b01) begin
			s=s1;
		end else begin
			s=s2;
		end
	end
		
	assign leds_expected = s1+s2;


		case (s)
			4'b1111 : seg_expected = 7'b1000000; //0
			4'b1110 : seg_expected = 7'b1111001; //1
			4'b1101 : seg_expected = 7'b0100100; //2
			4'b1100 : seg_expected  = 7'b0110000; //3
			4'b1011 : seg_expected  = 7'b0011001; //4
			4'b1010 : seg_expected  = 7'b0010010; //5
			4'b1001 : seg_expected  = 7'b0000010; //6
			4'b1000 : seg_expected  = 7'b1111000; //7
			4'b0111 : seg_expected  = 7'b1111111; //8
			4'b0110 : seg_expected  = 7'b0011000; //9
			4'b0101 : seg_expected   = 7'b0001000; //10
			4'b0100 : seg_expected  = 7'b0000011; //11
			4'b0011 : seg_expected  = 7'b1000110; //12
			4'b0010 : seg_expected  = 7'b0100001; //13
			4'b0001 : seg_expected  = 7'b0000110; //14
			4'b0000 : seg_expected  = 7'b0001110; //15
		 default    : seg_expected  = 7'b1111111; // all off
		endcase
    end
endmodule