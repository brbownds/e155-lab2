// Broderick Bownds
// brbownds@hmc.edu
// 9/6/2025


// This module contains our HSOSC and instaniates our select and adder modules.
// This is where we divide our clock to generate a slower clock signal so we don't bleed
// or ghost when flickering. 

module lab2_bb( input logic reset,
				input  logic [3:0] s0,
				input  logic [3:0] s1,
				output logic [4:0] led,
				output logic [6:0] seg,
				output logic disp0, disp1); 
				
				logic select_mux;
				logic int_osc;
				logic [3:0] s;
				logic [24:0] counter;

// Instantiate our HSOSC 
// Internal high-speed oscillator, divides 48MHz into 24MHz because of 2'b01
   HSOSC #(.CLKHF_DIV(2'b01)) 
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
	
	select s2(s0, s1, select_mux, s);
	
	sevenseg ss_display(s, seg);
  
  // Counter
   always_ff @(posedge int_osc) begin
	   if (reset == 0) 
		   counter <=0; 
     else if(counter == 524288) begin
		 counter <= 0; 
		 select_mux <= ~select_mux;
		 end
     else           
		 counter <= counter + 1;
		
   end
		assign disp0 = select_mux;
		 assign disp1 = ~select_mux;
endmodule	





