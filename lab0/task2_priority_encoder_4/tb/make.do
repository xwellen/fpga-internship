vlib work

vlog ../rtl/priority_encoder_4_top.v
vlog -sv priority_encoder_4_top_tb.sv

vsim -novopt priority_encoder_4_top_tb

add log -r /*
add wave -r *
run -all