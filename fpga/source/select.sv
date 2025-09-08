// Broderick Bownds
// brbownds@hmc.edu
// 9/2/2025

// This module select is a mux where it chooses which 4-bit input goes in

module select(
  input  logic [3:0]  s0,
  input  logic [3:0]  s1,
  input  logic       select_mux,
  output logic [3:0]  s);

assign s = select_mux ? s1 : s0; // If sel is 1, data_out = s1 else 
									// if sel is 0 data_out = s0

endmodule
