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
// CREATED		"Fri Nov 07 22:19:21 2025"

module delay_15_top(
	data_i,
	clk_i,
	rst_i,
	data_delay_i,
	data_o
);


input wire	data_i;
input wire	clk_i;
input wire	rst_i;
input wire	[3:0] data_delay_i;
output wire	data_o;

wire	[3:0] sel;
reg	SYNTHESIZED_WIRE_0;
reg	SYNTHESIZED_WIRE_1;
reg	SYNTHESIZED_WIRE_2;
reg	SYNTHESIZED_WIRE_3;
reg	SYNTHESIZED_WIRE_4;
reg	SYNTHESIZED_WIRE_5;
reg	SYNTHESIZED_WIRE_6;
reg	SYNTHESIZED_WIRE_7;
reg	DFF_inst15;
reg	SYNTHESIZED_WIRE_8;
reg	SYNTHESIZED_WIRE_9;
reg	SYNTHESIZED_WIRE_10;
reg	SYNTHESIZED_WIRE_11;
reg	SYNTHESIZED_WIRE_12;
reg	SYNTHESIZED_WIRE_13;
reg	SYNTHESIZED_WIRE_14;




assign	sel[0] = data_delay_i[0];



always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_0 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_0 <= data_i;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_7 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_7 <= SYNTHESIZED_WIRE_0;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_2 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_1;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_3 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_2;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_4 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_4 <= SYNTHESIZED_WIRE_3;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_5 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_5 <= SYNTHESIZED_WIRE_4;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_6 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_6 <= SYNTHESIZED_WIRE_5;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	DFF_inst15 <= 0;
	end
else
	begin
	DFF_inst15 <= SYNTHESIZED_WIRE_6;
	end
end

assign	sel[1] = data_delay_i[1];


assign	sel[2] = data_delay_i[2];


assign	sel[3] = data_delay_i[3];



always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_14 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_14 <= SYNTHESIZED_WIRE_7;
	end
end


mux161	b2v_inst23(
	.data15(DFF_inst15),
	.data14(SYNTHESIZED_WIRE_6),
	.data13(SYNTHESIZED_WIRE_5),
	.data12(SYNTHESIZED_WIRE_4),
	.data11(SYNTHESIZED_WIRE_3),
	.data10(SYNTHESIZED_WIRE_2),
	.data9(SYNTHESIZED_WIRE_1),
	.data8(SYNTHESIZED_WIRE_8),
	.data7(SYNTHESIZED_WIRE_9),
	.data6(SYNTHESIZED_WIRE_10),
	.data5(SYNTHESIZED_WIRE_11),
	.data4(SYNTHESIZED_WIRE_12),
	.data3(SYNTHESIZED_WIRE_13),
	.data2(SYNTHESIZED_WIRE_14),
	.data1(SYNTHESIZED_WIRE_7),
	.data0(SYNTHESIZED_WIRE_0),
	.sel(sel),
	.result(data_o));


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_13 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_13 <= SYNTHESIZED_WIRE_14;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_12 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_12 <= SYNTHESIZED_WIRE_13;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_11 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_11 <= SYNTHESIZED_WIRE_12;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_10 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_11;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_9 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_9 <= SYNTHESIZED_WIRE_10;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_8 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_8 <= SYNTHESIZED_WIRE_9;
	end
end


always@(posedge clk_i or negedge rst_i)
begin
if (!rst_i)
	begin
	SYNTHESIZED_WIRE_1 <= 0;
	end
else
	begin
	SYNTHESIZED_WIRE_1 <= SYNTHESIZED_WIRE_8;
	end
end


endmodule
