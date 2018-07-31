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
	input wire[31:0] instr,
	output wire memtoreg,memwrite,
	output wire branch,alusrc,
	output wire regdst,regwrite,
	output wire jump,
	output wire[3:0] aluop,
	output wire jal,jr,bal,jalr,
	output wire memen
    );
	wire [4:0]rt,ts,rd;
	wire [5:0]op,funct;
	reg[15:0] controls;
	assign op=instr[31:26];
	assign rs=instr[25:21];
	assign rt=instr[20:16];
	assign rd=instr[15:11];
	assign func=instr[5:0];

	assign {regwrite,regdst,alusrc,branch,memwrite,memtoreg,jump,jal,jr,bal,jalr,aluop,memen} = controls;
	always @(*) begin
		case (op)
			`R_TYPE:case (funct)
				`JR:  controls<=16'b0_0_0_0_0_0_0_0_1_0_0_1111_0;
				`JALR:controls<=16'b1_0_0_0_0_0_0_0_0_0_1_1111_0;
				default:controls<=16'b0_0_0_0_0_0_0_0_0_0_0_1000_0;//change
				endcase
			`J:controls<=16'b0_0_0_0_0_0_1_0_0_0_0_1111_0;
			`JAL:controls<=16'b1_0_0_0_0_0_0_1_0_0_0_1111_0;
			// branch instr
			`BEQ:controls<=16'b0_0_0_1_0_0_0_0_0_0_0_1111_0;
			`BNE:controls<=16'b0_0_0_1_0_0_0_0_0_0_0_1111_0;
			`BGTZ:controls<=16'b0_0_0_1_0_0_0_0_0_0_0_1111_0;
			`BLEZ:controls<=16'b0_0_0_1_0_0_0_0_0_0_0_1111_0;

			`ANDI: controls <= {11'b1010000_0000,`ANDI_OP, 1'b0};//ANDI
			`XORI: controls <= {11'b1010000_0000, `XORI_OP, 1'b0};//XORI
			`LUI:  controls <= {11'b1010000_0000, `LUI_OP, 1'b0};//LUI
			`ORI:  controls <= {11'b1010000_0000, `ORI_OP, 1'b0};//ORI
			`ADDI: controls <= {11'b1010000_0000,`ADDI_OP, 1'b0};//ADDI
			`ADDIU:controls <= {11'b1010000_0000,`ADDIU_OP, 1'b0};//ADDIU
			`SLTI: controls <= {11'b1010000_0000, `SLTI_OP, 1'b0};//SLTI
			`SLTIU:controls <= {11'b1010000_0000, `SLTIU_OP, 1'b0};//SLTU

			`REGIMM_INST:case(func)
				`BLTZ:controls<=16'b0_0_0_1_0_0_0_0_0_0_0_1111_0;
				`BLTZAL:controls<=16'b1_0_0_1_0_0_0_0_0_0_0_1111_0;
				`BGEZ:controls<=16'b0_0_0_0_1_0_0_0_0_0_0_1111_0;
				`BGEZAL:controls<=16'b1_0_0_1_0_0_0_0_0_0_0_1111_0;
				default:controls<=16'b0_0_0_0_0_0_0_0_0_0_0_1111_0;
			endcase
			default: controls <= 16'b0_0_0_0_0_0_0_0_0_0_0_0000_0;//illegal op

		endcase
	end
endmodule