module leds( input logic    [3:0]s,
			input logic     reset,
			output logic    [2:0]led);
  logic int_osc;
  logic [24:0] counter;
 // led 0

  assign led[0] = s[1]^s[0];


  // led 1

  assign led[1] = s[2] & s[3];

  // LED 2
   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));

   // Counter
   always_ff @(posedge int_osc) begin
     if (reset == 1'b0) begin
		counter<= 24'b0;
		led[2]<= 24'b0; end
	 else if (counter == 24'd5000000)
		       begin counter <= 0;
			   led[2] <= ~led[2]; end
     else     counter <= counter + 1;


   end
endmodule



