#!/usr/bin/tclsh

if { $argc != 5 } {
  puts "Usage: <command> <number_of_data_inputs> <filter_order> <data_type (0, 1, 2 or 3)> <base period> <scie period>"
}

set data [expr [lindex $argv 0]]
set order [expr [lindex $argv 1]]
set type [expr [lindex $argv 2]]
set base_period [expr [lindex $argv 3]]
set scie_period [expr [lindex $argv 4]]
set data_type_dict [dict create 0 "unsigned" 1 "signed" 2 "fixed_point"]
create_project -force project ./power_eval/project -part xc7vx485tffg1761-2
set script_data [format {s/`define\s*DATA\s*[0-9]*/`define DATA %s/g} $data]
set script_order [format {s/`define\s*ORDER\s*[0-9]*/`define ORDER %s/g} $order]
set script_type [format {s/`define\s*TYPE\s*[0-9]*/`define TYPE %s/g} $type]
set base_script_freq_xdc [format {s/period\s*[0-9]*/period %s/g} $base_period]
set scie_script_freq_xdc [format {s/period\s*[0-9]*/period %s/g} $scie_period]
set scie_script_freq [format {s/[0-9]*\.*[0-9]*\sclock\s*=\s*~clock/%s clock=~clock/g} $scie_period]
set base_script_freq [format {s/[0-9]*\.*[0-9]*\sclock\s*=\s*~clock/%s clock=~clock/g} $base_period]
set source_files [format {./power_eval/src/system_top.v ./power_eval/src/SCIEDecoder.v ./power_eval/src/SCIEUnpipelined.v \
 ./power_eval/src/SCIEPipelined_type\=%s\_order\=%s.v ./power_eval/src/MulDiv.v ./power_eval/src/ALU.v} $type $order]
import_files -fileset constrs_1 ./power_eval/constraints/wave_gen.xdc

exec sed -i $script_data ./power_eval/src/scie_tb.v
exec sed -i $script_order ./power_eval/src/scie_tb.v
exec sed -i $script_type ./power_eval/src/scie_tb.v
exec sed -i $scie_script_freq ./power_eval/src/scie_tb.v

exec sed -i $script_data ./power_eval/src/base_tb.v
exec sed -i $script_order ./power_eval/src/base_tb.v
exec sed -i $script_type ./power_eval/src/base_tb.v
exec sed -i $base_script_freq ./power_eval/src/base_tb.v

exec sed -i $base_script_freq_xdc ./power_eval/constraints/wave_gen.xdc

add_files -fileset sources_1 $source_files
add_files -fileset sim_1 ./power_eval/src/scie_tb.v ./power_eval/src/base_tb.v
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property top system_top [current_fileset]
update_compile_order -fileset sources_1

set_property -name {xsim.simulate.runtime} -value {1000us} -objects [get_filesets sim_1]
set_property target_constrs_file /home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/constraints/wave_gen.xdc [current_fileset -constrset]
synth_design -rtl -rtl_skip_mlo -name rtl_1
set_param general.maxThreads 4
launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1
wait_on_run impl_1
open_run impl_1


set verbose_data_type [dict get $data_type_dict $type]
puts [format "\n\n\n\n### BASELINE SIMULATION (type=%s; data=${data}; order=${order}) ###\n\n\n\n" $verbose_data_type]
set_property top base_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property -name {xsim.simulate.saif} -value {base.saif} -objects [get_filesets sim_1]
launch_simulation -mode post-implementation -type functional
read_saif -verbose {./power_eval/project/project.sim/sim_1/impl/func/xsim/base.saif}
set verbose_data_type [dict get $data_type_dict $type]
set report_file [format {./checkpoints/baseline_power_report_type=%s_data=%s_order=%s.rpt} $verbose_data_type $data $order]
report_power -file $report_file

exec sed -i $scie_script_freq_xdc ./power_eval/constraints/wave_gen.xdc

set_property target_constrs_file /home/specs/Desktop/specs-chisel/hvs_workspace/rocket_generator/power_eval/constraints/wave_gen.xdc [current_fileset -constrset]
synth_design -rtl -rtl_skip_mlo -name rtl_1
set_param general.maxThreads 4
reset_run synth_1
launch_runs synth_1
wait_on_run synth_1

launch_runs impl_1
wait_on_run impl_1
open_run impl_1


set verbose_data_type [dict get $data_type_dict $type]
puts [format "\n\n\n\n### ACCELERATED SIMULATION (type=%s; data=${data}; order=${order}) ###\n\n\n\n" $verbose_data_type]
set_property top scie_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property -name {xsim.simulate.saif} -value {scie.saif} -objects [get_filesets sim_1]
launch_simulation -mode post-implementation -type functional

read_saif -verbose {./power_eval/project/project.sim/sim_1/impl/func/xsim/scie.saif}
set verbose_data_type [dict get $data_type_dict $type]
set report_file [format {./checkpoints/scie_power_report_type=%s_data=%s_order=%s.rpt} $verbose_data_type $data $order]
report_power -file $report_file
