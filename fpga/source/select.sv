// Broderick Bownds
// brbownds@hmc.edu
// 9/2/2025

// This module select is a mux where it chooses which 4-bit input goes into
// our seven segment display module. From the instructions it chooses which
// display turns on. 

module select(
  input  logic [3:0]  s0,
  input  logic [3:0]  s1,
  input  logic       select_mux,
  output logic [3:0]  s);

assign s = select_mux ? s1 : s0; // If select_mux is 1, s = s1 else 
									               // if select_mux is 0 s = s0

endmodule
