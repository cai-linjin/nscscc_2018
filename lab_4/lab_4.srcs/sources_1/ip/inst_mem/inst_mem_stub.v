// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.1 (win64) Build 2188600 Wed Apr  4 18:40:38 MDT 2018
// Date        : Tue Jul 31 10:40:50 2018
// Host        : DESKTOP-NN4SCG2 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               D:/longxin_project/nscscc_2018/lab_4/lab_4.srcs/sources_1/ip/inst_mem/inst_mem_stub.v
// Design      : inst_mem
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2018.1" *)
module inst_mem(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[5:0],douta[31:0]" */;
  input clka;
  input [5:0]addra;
  output [31:0]douta;
endmodule
