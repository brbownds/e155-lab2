// Broderick Bownds
// brbownds@hmc.edu
// 9/2/2025

// This module is a mux connected to a clk which divides so it't not going too fast
// and uses the select to display at least one side of the dual seven segment display

module pulse #(
  parameter int THRESHOLD = 12000
) // establish a threshold based on clock frequency because
 // THR = clock_freq/(2*toggle_freq) and toggle we declared that as 1kHz
 // based on if we see ghosting or bleeding, we can adjust later on

(
  input  logic        clk,
  input  logic        reset,
  input  logic [3:0]  s0,
  input  logic [3:0]  s1,
  output logic        digit_00,
  output logic        digit_01,
  output logic [3:0]  s
);

  // Counter sized precisely for the threshold
  logic [23:0] counter;

  always_ff @(posedge clk or posedge reset) begin
    if (reset) begin
      counter <= 0;
      digit_00   <= 0;
      s       <= s0;
    end else if (counter == THRESHOLD - 1) begin
      counter <= 0;
      digit_00   <= ~digit_00;
      s   <= digit_00 ? s1 : s0;
    end else begin
      counter <= counter + 1;
    end
  end

  // Only one number displayed (LED ON)
  assign digit_00 = ~digit_01;


endmodule
