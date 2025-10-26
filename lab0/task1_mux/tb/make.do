vlib work

vlog ../rtl/mux_top.v
vlog -sv mux_top_tb.sv

vsim -novopt mux_top_tb

add log -r /*
add wave -r *
run -all