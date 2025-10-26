// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Sun Oct 26 01:39:19 2025"

module mux_top(
	data0_i,
	data1_i,
	data2_i,
	data3_i,
	direction_i,
	data_o
);


input wire	[1:0] data0_i;
input wire	[1:0] data1_i;
input wire	[1:0] data2_i;
input wire	[1:0] data3_i;
input wire	[1:0] direction_i;
output wire	[1:0] data_o;

wire	[1:0] data_o_ALTERA_SYNTHESIZED;
wire	sel;
wire	sel0;
wire	sel1;
wire	sel2;
wire	sel3;
wire	sel_data;
wire	sel_data_0_0;
wire	sel_data_0_1;
wire	sel_data_1_0;
wire	sel_data_1_1;
wire	sel_data_2_0;
wire	sel_data_2_1;
wire	sel_data_3_0;
wire	sel_data_3_1;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;




assign	sel0 = SYNTHESIZED_WIRE_0 & SYNTHESIZED_WIRE_1;

assign	sel_data_0_0 = data0_i[0] & sel0;

assign	sel_data_0_1 = data0_i[1] & sel0;

assign	sel_data_1_0 = data1_i[0] & sel1;

assign	sel_data_1_1 = data1_i[1] & sel1;

assign	sel_data_2_0 = data2_i[0] & sel2;

assign	sel_data_2_1 = data2_i[1] & sel2;

assign	sel_data_3_0 = data3_i[0] & sel3;

assign	sel_data_3_1 = data3_i[1] & sel3;

assign	data_o_ALTERA_SYNTHESIZED[0] = sel_data_0_0 | sel_data_2_0 | sel_data_3_0 | sel_data_1_0;

assign	data_o_ALTERA_SYNTHESIZED[1] = sel_data_0_1 | sel_data_2_1 | sel_data_3_1 | sel_data_1_1;

assign	sel1 = direction_i[0] & SYNTHESIZED_WIRE_2;

assign	sel2 = SYNTHESIZED_WIRE_3 & direction_i[1];

assign	sel3 = direction_i[0] & direction_i[1];

assign	SYNTHESIZED_WIRE_0 =  ~direction_i[0];

assign	SYNTHESIZED_WIRE_1 =  ~direction_i[1];

assign	SYNTHESIZED_WIRE_2 =  ~direction_i[1];

assign	SYNTHESIZED_WIRE_3 =  ~direction_i[0];

assign	data_o = data_o_ALTERA_SYNTHESIZED;

endmodule
