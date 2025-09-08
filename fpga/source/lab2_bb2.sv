// Broderick Bownds
// brbownds@hmc.edu
// 9/6/2025


module lab2_bb( input logic reset,
                input  logic [3:0] s0,
                input  logic [3:0] s1,
                output logic [4:0] led,
                output logic [6:0] seg);
                 
               
                logic int_osc;
                logic [3:0] s;
                logic select, notselect;


    // Instantiate our HSOSC
   
// Internal high-speed oscillator, divides 48MHz into 24MHz because of 2'b01
   HSOSC #(.CLKHF_DIV(2'b01))
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
   
    select select(.s0, .s1, .s);
   
    seven_segdis sevenseg(s, .seg);
 
  // Counter
   always_ff @(posedge int_osc) begin
       if (reset == 0)
           counter <=0;
     else if(counter == 524288) begin
         counter <= 0;
         digit_00 <= ~digit_00;
         end
     else          
         counter <= counter + 1;
   end
     
endmodule
