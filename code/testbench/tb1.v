`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:42:11 07/11/2019
// Design Name:   top
// Module Name:   F:/fpgaaaaaa/DDS/tb1.v
// Project Name:  DDS
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb1;

	// Inputs
	reg clk;
	reg rst;
	reg [2:0] key;

	// Outputs
	wire [9:0] out_da_data;
	wire out_da_clk;
	wire out_da_wr;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.key(key), 
		.out_da_data(out_da_data), 
		.out_da_clk(out_da_clk), 
		.out_da_wr(out_da_wr)
	);

	
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		key = 3'b000;
	end
	always begin
	#12.5 clk=~clk;
	end
	
	initial begin
	#100 rst=1;
	#100 key = 3'b011;
	#819200 key = 3'b101;
	#819200 key = 3'b110;
      end
endmodule

