
// Broderick Bownds
// brbownds@hmc.edu
// 9/7/2025

// This testbench module is for the top level module for Lab 2 which runs
// our testvectors within the testbench only testing certain cases to validate
// that the circuit works. 

`timescale 1ns/1ns

module lab2_bbtb();
  logic        clk, reset;
  logic [3:0]  s0, s1;
  logic [4:0]  led;
  logic [6:0]  seg;
  logic        disp0, disp1;

  // Instantiate the device under test
  lab2_bb dut(.*);

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end

// this is where we can apply test vectors: assert reset (active high) then wait 27 ns,
// then return to normal and wait 500 ns before doing else
  initial begin
    reset = 1; #27; reset = 0; #500
    s0=4'b0000; s1=4'b0000; #1000000; // 0 + 0 = 0
    s0=4'b0001; s1=4'b0000; #1000000; // 1 + 0 = 1
    s0=4'b0000; s1=4'b0001; #1000000; // 0 + 1 = 1
    s0=4'b0001; s1=4'b0001; #1000000; // 1 + 1 = 2
    s0=4'b1111; s1=4'b0000; #1000000; // 15 + 0 = 15
    s0=4'b0000; s1=4'b1111; #1000000; // 0 + 15 = 15
    s0=4'b1111; s1=4'b1111; #1000000; // 15 + 15 = 30 (max sum)
    s0=4'b0100; s1=4'b0010; #1000000; // 4 + 2 = 6
  end

endmodule
