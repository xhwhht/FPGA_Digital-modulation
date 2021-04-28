`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:43:03 07/10/2019 
// Design Name: 
// Module Name:    fp 
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
 module fp(clk,rst,clk4096);
 input  rst,clk;
 output clk4096;
 reg [11:0] q;

always@(posedge clk or negedge  rst)
begin
  if(rst==0)
    q<=12'b0000_0000_0000;
  else begin
    if(q==12'b1111_1111_1111) 
	 q<=12'b0000_0000_0000;
	 else
	 q<=q+1;
	 end
end
 
assign clk4096= q[11];
 
endmodule
  