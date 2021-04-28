`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:09 07/02/2019 
// Design Name: 
// Module Name:    PhaseAdder 
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
module PhaseAdder  (
  input mode_m,
  input clk,
  input rst,
  input [1:0]FreqCtrl, //频率控制字，相位累加步长
  input [2:0] key,
  output [11:0]phase,
  input load
);
reg [11:0]phase_reg;
reg [11:0]phase_reg1;
reg [11:0]phase_reg2;

assign 
phase = phase_reg;

always@(negedge rst or posedge clk)
  begin
   if(rst==0) 
	 begin
    phase_reg <= 12'd0;
	 phase_reg2 <= 12'd0;
	 phase_reg1 <= 12'd2047;
	 end
	else
	begin
	 if(key==3'b110&&load==1)
    phase_reg <= phase_reg + FreqCtrl; //溢出循环
	 
	 else if (key==3'b101&&load==1)
	 phase_reg <= phase_reg + FreqCtrl; //溢出循环
	 
	 else if(key==3'b011&&load==1)     //调香
	 begin
	 if(mode_m==1)
	 begin
	 phase_reg1 <= phase_reg1 + FreqCtrl;
	 phase_reg <=phase_reg1;
	 end
	 else if(mode_m==0)
	 begin
	 phase_reg2 <= phase_reg2 + FreqCtrl;
	 phase_reg <= phase_reg2;
	 end
	 end
	 
	 else if(key==3'b111&&load==1)     
      phase_reg <= phase_reg + FreqCtrl;
   end
  end
 
/*always@(mode_m)
     if(mode_m==1)
	    phase_reg <= 12'd0;
	  else if(mode_m==0)
	    phase_reg <= 12'd2047;
*/
endmodule


	

