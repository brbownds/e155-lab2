//Broderick Bownds
// brbownds@hmc.edu
// 9/8/2025

//This module is our testbench for the top module: lab2_bb
`timescale 1ns/1ns

module lab2_bbtb();
  logic         clk, reset;
  logic [3:0]  s0, s1;
  logic [4:0]  led;
  logic [6:0]  seg;
  logic        disp0, disp1;
  
  // Instantiate the device under test
  lab2_bb dut(reset, s0, s1, led, seg, disp0, disp1);
  //clk
 always #5 clk = ~clk;

function automatic [6:0] segexpected (input [3:0] value_holder);
        case(value_holder)
            4'b0000: segexpected = 7'b1000000; // 0 
			4'b0001: segexpected = 7'b1111001; // 1 
			4'b0010: segexpected = 7'b0100100; // 2 
			4'b0011: segexpected = 7'b0110000; // 3 	
			4'b0100: segexpected = 7'b0011001; // 4 		
			4'b0101: segexpected = 7'b0010010; // 5 			
			4'b0110: segexpected = 7'b0000010; // 6 			
			4'b0111: segexpected = 7'b1111000; // 7 		
			4'b1000: segexpected = 7'b0000000; // 8			
			4'b1001: segexpected = 7'b0011000; // 9 			
			4'b1010: segexpected = 7'b0001000; // A (10)		
			4'b1011: segexpected = 7'b0000011; // B (11) 			
			4'b1100: segexpected = 7'b1000110; // C (12) 		
			4'b1101: segexpected = 7'b0100001; // D (13) 		
			4'b1110: segexpected = 7'b0000110; // E (14) 	
			4'b1111: segexpected = 7'b0001110; // F (15) 
			default: segexpected = 7'b1111111; // default case
endcase
endfunction

  // Generate clock signal with a period of 10 timesteps.
  always begin
    clk = 1; #5;
    clk = 0; #5;
  end


  initial begin
    // Apply reset
    reset = 0;
    #20;
    reset = 1;

    // test all 256 cases
    for (int i = 0; i < 16; i++) begin
      for (int j = 0; j < 16; j++) begin
        s0 = i;
        s1 = j;
        #20; // wait for signals to propagate (adjust if needed)

        // Optional: check expected result
        if (led !== i + j) begin
          $display("ERROR: s0=%0d, s1=%0d, got led=%0d, ledexpected=%0d", i, j, led, i + j);
		
		  if (disp0 !== ~disp1) begin
          $display("ERROR: disp0=%b, disp1=%b", disp0, disp1);
		  
		  if (disp0) begin
			  if (seg !== segexpected(s0))
				  $display("ERROR: s0=%b expected=%b got=%b", s0, segexpected(s0), seg);
			  end
			else begin
				if  (seg !== segexpected(s1))
				  $display("ERROR: s1=%b expected=%b got=%b", s1, segexpected(s1), seg);
			end
			end
		end
		end
	end

    $display("All 256 cases tested.");
    $finish;
  end
  

endmodule 
