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
  logic [3:0]  s0, s1;
  logic [4:0]  leds;
  logic [6:0]  segs;
  logic        disp0, disp1;

  // Instantiate the device under test
  top dut(.*);

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end

  // Apply test vectors
  initial begin
    reset = 1; #27; reset = 0; #500
    s0=4'b0000; s1=4'b0000; #1000000;
    s0=4'b0001; s1=4'b0000; #1000000;
    s0=4'b0000; s1=4'b0001; #1000000;
    s0=4'b0001; s1=4'b0001; #1000000;
    s0=4'b1111; s1=4'b0000; #1000000;
    s0=4'b0000; s1=4'b1111; #1000000;
    s0=4'b1111; s1=4'b1111; #1000000;
    s0=4'b0100; s1=4'b0010; #1000000;
  end