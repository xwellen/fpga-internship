vmap lpm_ver $env(QUARTUS_ROOTDIR)/../modelsim_ase/altera/verilog/220model

vlib work
vlib lpm_ver

vlog ../rtl/mux161.v
vlog ../rtl/delay_15_top.v
vlog -sv delay_15_top_tb.sv

vsim -novopt delay_15_top_tb -L lpm_ver

#add log -r /*
#add wave -r *
add log /*
add wave *
run -all