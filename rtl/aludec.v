`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:27:24
// Design Name: 
// Module Name: aludec
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
module aludec(
	input wire[5:0] funct,
	input wire[3:0] aluop,
	output reg[4:0] alucontrol
    );
	always @(*) begin
		case (aluop)
			`R_TYPE_OP:
			case(funct)
				`SLL:alucontrol <= `SLL_CONTROL; 

				`AND:  alucontrol <= `AND_CONTROL; //and
				`OR:   alucontrol <= `OR_CONTROL;  //or
				`XOR:  alucontrol <= `XOR_CONTROL; //xor
				`NOR:  alucontrol <= `NOR_CONTROL; //nor
				`ADD:  alucontrol <= `ADD_CONTROL; //add
				`ADDU: alucontrol <= `ADDU_CONTROL;//addu
				`SUB:  alucontrol <= `SUB_CONTROL; //sub
				`SUBU: alucontrol <= `SUBU_CONTROL;//subu
				`SLT:  alucontrol <= `SLT_CONTROL; //slt
				`SLTU: alucontrol <= `SLTU_CONTROL;//sltu
				default:  alucontrol <= 5'b00000;
			endcase
        `ANDI_OP: alucontrol <= `AND_CONTROL;
        `XORI_OP: alucontrol <= `ADDU_CONTROL;
        `SLTI_OP: alucontrol <= `SLT_CONTROL;
        `SLTIU_OP:alucontrol <= `XOR_CONTROL;
        `LUI_OP:  alucontrol <= `LUI_CONTROL;
        `ORI_OP:  alucontrol <= `OR_CONTROL;
        
        `ADDI_OP: alucontrol <= `ADD_CONTROL;
        `ADDIU_OP:alucontrol <= `SLTU_CONTROL;
        default:  alucontrol<=5'b00000;	
        endcase
	end
endmodule
