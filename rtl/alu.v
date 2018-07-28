`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/02 14:52:16
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "defines.h"
module alu(
	input wire[31:0] a,b,
	input wire[4:0] alucontrol,
	output reg[31:0] y,
	output reg overflow,
	output reg zero
    );
	
	assign zero = (y == 32'b0);
	always @(*) begin
		case (alucontrol)
			`AND_CONTROL:  y <= a & b;
			`OR_CONTROL:   y <= a | b;
			`XOR_CONTROL:  y <= a ^ b;
			`NOR_CONTROL:  y <= ~(a | b);

			`ADD_CONTROL, `ADDU_CONTROL: y <= a + b;
			`SUB_CONTROL, `SUBU_CONTROL: y <= a - b;
			`SLT_CONTROL:  y <= (a<b)? 1 : 0;
			`SLTU_CONTROL: y <= ({1'b0,a}<{1'b0,b})? 1 : 0;
			`LUI_CONTROL:  y <= {b[15:0], 16'b0};
			default : y <= 32'b0;
		endcase	
	end

	always @(*) begin
		case (alucontrol)
			`ADD_CONTROL, `SUB_CONTROL: overflow <= a[31] & b[31] & ~y[31] | ~a[31] & ~b[31] & y[31];
			`ADDU_CONTROL:overflow <= 0;
			`SUBU_CONTROL:overflow <= 0;
			default: overflow <= 0;
	end
endmodule
