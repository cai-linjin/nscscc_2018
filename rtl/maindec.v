`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/10/23 15:21:30
// Design Name: 
// Module Name: maindec
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
module maindec(
	input wire[5:0] op,

	output wire memtoreg,memwrite,
	output wire branch,alusrc,
	output wire regdst,regwrite,
	output wire jump,
	output wire[3:0] aluop
    );
	reg[11:0] controls;
	assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,aluop} = controls;
	always @(*) begin
		case (op)
			`R_TYPE:controls <= {7'b1100000,`R_TYPE_OP};//R-TYRE
			
			`ANDI:      controls <= {7'b1010000,`ANDI_OP};//ANDI
			`XORI:      controls <= {7'b1010000, `XORI_OP};//XORI
			`LUI:       controls <= {7'b1010000, `LUI_OP};//LUI
			`ORI:       controls <= {7'b1010000, `ORI_OP};//ORI

			`ADDI:      controls <= {7'b1010000,`ADDI_OP};//ADDI
			`ADDIU:     controls <= {7'b1010000,`ADDIU_OP};//ADDIU
			`SLTI:      controls <= {7'b1010000, `SLTI_OP};//SLTI
			`SLTIU:     controls <= {7'b1010000, `SLTIU_OP};//SLTU

			//LW:        controls <= 9'b101001000;//LW
			//SW:        controls <= 9'b001010000;//SW
			//BEQ:       controls <= 9'b000100001;//BEQ
			default:  controls <= 9'b000000000;//illegal op
		endcase
	end
endmodule
