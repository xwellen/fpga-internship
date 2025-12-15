vlib work

vlog ../rtl/top_crc_16_ansi.v
vlog -sv top_crc_16_ansi_tb.sv

vsim -novopt top_crc_16_ansi_tb

add log -r /*
add wave -r *

radix -hexadecimal
run -all