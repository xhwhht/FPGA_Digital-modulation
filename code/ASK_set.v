`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:00 07/10/2019 
// Design Name: 
// Module Name:    ASK_set 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ASK_set(
    input mode_M,
	 input clk,
	 input [2:0] key,
	 output [1:0]FreqC
	 
    );
	 
reg [1:0]FreqC_reg;
assign FreqC = FreqC_reg;  //ÒÆÎ»¼Ä´æ

always@(posedge clk)
  begin

   if(key == 3'b110)
	begin
	  if(mode_M == 0)
	    FreqC_reg <= 2'b01;
	  else
		 FreqC_reg <= 2'b00;
	end
	
	else if(key == 3'b101)
	begin
	if(mode_M == 0)
	   FreqC_reg <= 1;
	else                                 
		FreqC_reg <= 2;
	end
	
	else if(key == 3'b011 || key == 3'b111)
	   FreqC_reg <= 1;	
  end
endmodule
