// Broderick Bownds
// brbownds@hmc.edu
// 9/6/2025

// This module computes the sum of the DIP switches and 4 other input pins

module adder ( input  logic [3:0] s0, //DIP
			   input  logic [3:0] s1, // DIP?
			   output logic [4:0] sum); // sum from the 5 LEDs
			   
			   assign sum = s0 + s1;

endmodule