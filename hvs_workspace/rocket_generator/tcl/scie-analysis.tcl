#!/usr/bin/tclsh

if { $argc != 1} {
	puts "Usage <Command> <Board (kc705 || vc707 || genesys2 || nexys-video || nexys-a7-100t)>"
	exit 1
}

set fir_order { 5 10 20 50 100 200 500 1000 }
set board_parts [ dict create ]

dict set board_parts "kc705" "xc7k325tffg900-2"
dict set board_parts "vc707" "xc7vx485tffg1761-2"
dict set board_parts "genesys2" "xc7k325tffg900-2" #???
dict set board_parts "nexys-video" "XC7A200T-1SBG484C"
dict set board_parts "nexys-a7-100t" "xc7a100tcsg324-1"


create_project -part [ dict get $board_parts $argv ] -force vivado_scie ../vivado_scie
#set_property board_part xilinx.com:$argv [current_project]
add_files { ../rocket-verilog/SCIEDecoder.v ../rocket-verilog/SCIE_top.v }
add_files -fileset constrs_1 ../constraints/wave_gen_timing.xdc

set_property top SCIEtop [current_fileset]
set_property top_file {../rocket-verilog/SCIE_top.v} [current_fileset]

exec mkdir -p ../checkpoints

foreach order $fir_order {
	puts "### ORDER ${order} ###"
	add_files "../rocket-verilog/SCIEPipelined_order_${order}.v" 
	reset_run synth_1
	reset_run impl_1
	update_compile_order -fileset sources_1
	
	launch_runs synth_1 -jobs 4
	wait_on_run synth_1
	open_run synth_1
	report_timing_summary -file ../checkpoints/post_synth_$order.rpt
	
	launch_runs impl_1 -jobs 4
	wait_on_run impl_1
	open_run impl_1
	report_timing_summary -file ../checkpoints/post_impl_$order.rpt
	
	remove_files "SCIEPipelined_order_${order}.v"
}
