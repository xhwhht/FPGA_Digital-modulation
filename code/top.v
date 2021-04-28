`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:56:12 07/02/2019 
// Design Name: 
// Module Name:    top 
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
module top(
input  clk,
input  rst,
input  [2:0] key,
output [9:0] out_da_data,//DA输入
output out_da_clk,//DA模块控制信号
output out_da_wr//DA模块控制信号
);

wire [11:0]phase;
wire [1:0] FreqC2;
wire lod;
wire m1;
/*地址产生DDS发生器*/
PhaseAdder u1(
.mode_m(m1),
.clk (clk),
.rst (rst),
.FreqCtrl (FreqC2),
.key  (key),
.phase (phase),
.load(lod)
);
/***ROM核调用**/
wire [9:0]bx;
DDSROM u2
(
  .clka(clk),    // input clka
  .addra(phase), // input [11 : 0] addra
  .douta(bx)     // output [9 : 0] douta
);
/*分频*/
 fp u3(
 .clk(clk),
 .rst(rst),
 .clk4096(fpp)
 );
 /*m序列产生*/
Mcode u4(
  .clk(fpp),
  .rst(rst),
  .m(m1),
  .load(lod)
 );
	/*三种步进值选择*/ 
ASK_set u7(
    .mode_M(m1),
	 .clk(clk),
	 .key(key),
	 .FreqC(FreqC2)
     ); 
/*DA传递模块产生*/
DA_I  u8(	
         .clk(clk),
         .out_data(bx),

			.out_da_data(out_da_data),
			.out_da_clk(out_da_clk),
			.out_da_wr(out_da_wr)
			);

endmodule
