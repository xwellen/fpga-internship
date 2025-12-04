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
// CREATED		"Mon Nov 17 12:51:29 2025"

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

wire	[3:0] data_delay;
reg	[15:0] delay;
wire	[3:0] sel;
wire	SYNTHESIZED_WIRE_15;

assign	SYNTHESIZED_WIRE_15 = 1;




always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[1] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[1] <= 1;
	end
else
	begin
	delay[1] <= data_i;
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[2] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[2] <= 1;
	end
else
	begin
	delay[2] <= delay[1];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[11] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[11] <= 1;
	end
else
	begin
	delay[11] <= delay[10];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[12] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[12] <= 1;
	end
else
	begin
	delay[12] <= delay[11];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[13] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[13] <= 1;
	end
else
	begin
	delay[13] <= delay[12];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[14] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[14] <= 1;
	end
else
	begin
	delay[14] <= delay[13];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[15] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[15] <= 1;
	end
else
	begin
	delay[15] <= delay[14];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[3] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[3] <= 1;
	end
else
	begin
	delay[3] <= delay[2];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[4] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[4] <= 1;
	end
else
	begin
	delay[4] <= delay[3];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[5] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[5] <= 1;
	end
else
	begin
	delay[5] <= delay[4];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[6] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[6] <= 1;
	end
else
	begin
	delay[6] <= delay[5];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[7] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[7] <= 1;
	end
else
	begin
	delay[7] <= delay[6];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[8] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[8] <= 1;
	end
else
	begin
	delay[8] <= delay[7];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[9] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[9] <= 1;
	end
else
	begin
	delay[9] <= delay[8];
	end
end


always@(posedge clk_i or negedge rst_i or negedge SYNTHESIZED_WIRE_15)
begin
if (!rst_i)
	begin
	delay[10] <= 0;
	end
else
if (!SYNTHESIZED_WIRE_15)
	begin
	delay[10] <= 1;
	end
else
	begin
	delay[10] <= delay[9];
	end
end



mux161	b2v_mux0(
	.data15(delay[15]),
	.data14(delay[14]),
	.data13(delay[13]),
	.data12(delay[12]),
	.data11(delay[11]),
	.data10(delay[10]),
	.data9(delay[9]),
	.data8(delay[8]),
	.data7(delay[7]),
	.data6(delay[6]),
	.data5(delay[5]),
	.data4(delay[4]),
	.data3(delay[3]),
	.data2(delay[2]),
	.data1(delay[1]),
	.data0(data_i),
	.sel(sel),
	.result(data_o));

assign	sel[0] = data_delay_i[0];


assign	sel[1] = data_delay_i[1];


assign	sel[2] = data_delay_i[2];


assign	sel[3] = data_delay_i[3];



endmodule
