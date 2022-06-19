SHELL := /bin/bash
main_dir = ./../..
scripts_dir= $(main_dir)/scripts
vivado_dir = $(main_dir)/vivado-risc-v
vsim_dir = $(vivado_dir)/rocket-chip/vsim
emu_dir = $(vivado_dir)/rocket-chip/emulator
bench_dir = ./benchmarks
hw_dir = ./module
rocket_scala_src = $(vivado_dir)/rocket-chip/src/main/scala
verilog_src_dir = $(vivado_dir)/rocket-chip/src/main/resources/vrsc

tmp_file=$(main_dir)/tmp_file.txt

export RISCV=$(abspath $(vivado_dir))/rocket-chip/rocket-tools

base_name = freechips.rocketchip.system

### Calls vsim Makefile ###
verilog:
	make -C $(hw_dir) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)

.PHONY:verilog-clean
verilog-clean:
	make -C $(vsim_dir) clean

### Rocket chip + SCIE + IO FPGA implementation ###
implementation:
	make -C $(vivado_dir) CONFIG=$(config) BOARD=$(board) bitstream
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_timing_summary_routed.rpt $(main_dir)/checkpoints/post_impl_timing_$(type_verbose)_$(order).rpt
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_utilization_placed.rpt $(main_dir)/checkpoints/post_impl_utilization_$(type_verbose)_$(order).rpt
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_power_routed.rpt $(main_dir)/checkpoints/post_impl_power_$(type_verbose)_$(order).rpt

### Calls emulator and benchmark Makefile ###
build:
	make -C $(bench_dir) order=$(order) data=$(data) type=$(type) binarypoint=$(binarypoint) optimization_flag=$(optimization_flag)
	make -C $(hw_dir) verilog order=$(order) width=$(width) data=$(data) type=$(type) binarypoint=$(binarypoint)
	make -C $(emu_dir) CONFIG=$(base_name).$(config)

build-debug:
	make -C $(bench_dir) order=$(order) data=$(data) width=$(width) type=$(type) binarypoint=$(binarypoint)
	make -C $(hw_dir) verilog order=$(order) data=$(data) width=$(width) type=$(type) binarypoint=$(binarypoint)
	make debug -C $(emu_dir) CONFIG=$(base_name).$(config)

.PHONY:clean
clean:
	make -C $(emu_dir) clean
	make -C $(bench_dir) clean
	make -C $(hw_dir) clean

### Simulation ###
simulate:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config) $(emu_dir)/$(binary) >> $(file)
### Simulation (waveform) ###
simulate-debug:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config)-debug -v output.vcd $(emu_dir)/$(binary) >> $(file)

functional_workflow:
	$(MAKE) build order=$(order) data=$(data) type=$(type) binarypoint=$(binarypoint) optimization_flag=$(optimization_flag) config=$(config)
	$(MAKE) simulate config=$(config) binary=$(baseline_binary)
	$(MAKE) simulate config=$(config) binary=$(accelerated_binary) file=$(file)


	### File replacements ###
core-setup:
	cp $(main_dir)/repl_files/interfaces/Standard_interface/RocketCore.scala $(rocket_scala_src)/rocket; \
	cp $(main_dir)/repl_files/interfaces/Standard_interface/SCIE.scala $(rocket_scala_src)/scie; \
	if [ "$(order)" -eq 0 ]; then \
		sed -i 's/useSCIE: Boolean = true,/useSCIE: Boolean = false,/g' $(rocket_scala_src)/rocket/RocketCore.scala; \
		cp $(main_dir)/repl_files/baseline_tcl/vivado.tcl $(vivado_dir); \
	else \
		sed -i 's/useSCIE: Boolean = false,/useSCIE: Boolean = true,/g' $(rocket_scala_src)/rocket/RocketCore.scala; \
		cp $(main_dir)/repl_files/accel_tcl/vivado.tcl $(vivado_dir); \
	fi


vivado_workflow:
	make -C $(vivado_dir) clean
	rm -rf $(vivado_dir)/workspace
	$(MAKE) core-setup order=$(order)
	@if [ "$(order)" -ne 0 ]; then \
		$(MAKE) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint); \
	fi
	$(MAKE) implementation board=$(board) config=$(config) max_freqs_file=$(file) type=$(type) type_verbose=$(type_verbose) order=$(order)
