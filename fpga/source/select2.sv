// Broderick Bownds
// brbownds@hmc.edu
// 9/2/2025

module select(
  input  logic        reset,
  input  logic [3:0]  s0,
  input  logic [3:0]  s1,
  input  logic       select,
  output logic [3:0]  s);


assign data_out = s ? s1 : s0; // If sel is 1, data_out = s1 else
                  // if sel is 0 data_out = s0


endmodule
