///Broderick Bownds
// brbownds@hmc.edu
// 9/1/2025

//This testbench is extracted from Lab 1 since the function is the same.
// testbench written so we can test and validate the module sevenseg before moving on
// to our top module: lab2_bb.

`timescale 1ns/1ps

module sevenseg_tb();
	logic clk, reset;
    logic [3:0] s;
    logic [6:0] seg;
	logic [6:0] seg_expected;

    logic [31:0] vectornum, errors;
    logic [10:0] testvectors[10000:0];  
    // 4-bit inputs + 1 expected outputs

    // Instantiate DUT
    seven_segdis s1(s, seg);
	
	   always begin
        clk = 0; #5;
        clk = 1; #5;
    end

    // Initialize and load test vectors
    initial begin
        $readmemb("./seven_segdis2.tv", testvectors);
        vectornum = 0;
        errors = 0;
        reset = 1; #22; 
		reset = 0;
    end

    // Apply test vectors
    always @(posedge clk) begin
        #1;
        {s, seg_expected} = testvectors[vectornum][5:0]; 
    end

    // Check outputs
    always @(negedge clk) if (reset) begin
        if ({seg[6:0]} !== seg_expected[1:0]) begin
            $display("Error: input s=%b, led=%b (expected %b)", s, {seg[6:0]}, seg_expected[6:0]);
            errors = errors + 1;
        end
        vectornum = vectornum + 1;
        if (testvectors[vectornum] === 11'bx) begin
            $display("%d tests completed with %d errors", vectornum, errors);
            $stop;
        end
    end
endmodule