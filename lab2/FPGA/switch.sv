// lab 2: Multiplexed 7-segment display
// switch switches quickly between both displays
// Leilani Elkaslasy
//lelkaslasy@g.hmc.edu
// 09/04/25



module switch #(parameter THRESHOLD = 1000) (
  input  logic  reset,
  input  logic [3:0] s1, s2,
  output logic [3:0] s,
  output logic [1:0] dis1, dis2);
  
         logic        clk, clk_switch;
         logic [31:0] counter;

// Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01))
   hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));


  // slow down the clock signal
  always_ff @(posedge clk)
    clk_switch<= (counter == THRESHOLD-1'b1);

  // switcj 7 segs when the counter reaches the threshold
  always_ff @(posedge clk) begin
    if (clk_switch) begin
      dis1 <= ~dis1;
      s = dis1 ? s1 : s2; // mux selected by time
      counter <= 0;
    end else if (reset) begin
      counter <= 0;
      dis1 <= 0;
    end else
      counter <= counter + 1;
  end

  // ensure there is only one display on
   assign dis1 = dis1;
  assign dis2 = ~dis1;
endmodule