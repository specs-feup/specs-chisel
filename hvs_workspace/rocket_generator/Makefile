SHELL := /bin/bash
base_dir = .
vivado_dir = $(base_dir)/vivado-risc-v
vsim_dir = $(vivado_dir)/rocket-chip/vsim
emu_dir = $(vivado_dir)/rocket-chip/emulator
bench_dir = $(base_dir)/benchmarks
hw_dir = $(base_dir)/HW_accelerators/fir
rocket_scala_src = $(vivado_dir)/rocket-chip/src/main/scala
verilog_src_dir = $(vivado_dir)/rocket-chip/src/main/resources/vrsc

export RISCV=$(abspath .)/vivado-risc-v/rocket-chip/rocket-tools

base_name = freechips.rocketchip.system

### Clones Vivado-risc-v and rocket-chip repository
setup:
	rm -rf vivado-risc-v #temporario
	git config --global url.https://git.qemu.org/git.insteadOf https://git.qemu-project.org
	git config --global url.https://git.qemu.org/git.insteadOf git://git.qemu-project.org
	git config --global url.https://github.com/.insteadOf git://github.com/
	git config --global url.https://github.com/.insteadOf git@github.com:
	git config --global url.https://anongit.freedesktop.org/git.insteadOf git://anongit.freedesktop.org
	git config --global url.https://github.com/rth7680/qemu-palcode.git.insteadOf git://github.com/rth7680/qemu-palcode.git
	git clone https://github.com/eugene-tarassov/vivado-risc-v.git
	cd vivado-risc-v &&  make apt-install && make update-submodules && \
	cd rocket-chip && git submodule update --init && export RISCV=`pwd` && \
	git clone https://github.com/freechipsproject/rocket-tools && \
	cd rocket-tools && \
	git submodule update --init --recursive && export RISCV=`pwd` && export MAKEFLAGS="$MAKEFLAGS -j4" && ./build.sh && ./build-rv32ima.sh
	cp $(base_dir)/repl_files/system/* $(rocket_scala_src)/system
	cp $(base_dir)/repl_files/subsystem/* $(rocket_scala_src)/subsystem
	cp $(base_dir)/repl_files/rocket/* $(rocket_scala_src)/rocket
	cp $(base_dir)/repl_files/scie/* $(rocket_scala_src)/scie
	cp $(base_dir)/repl_files/Makefile $(base_dir)/vivado-risc-v
	cp $(base_dir)/repl_files/accel_tcl/vivado.tcl $(base_dir)/vivado-risc-v
	cp $(base_dir)/repl_files/rocket.scala $(base_dir)/vivado-risc-v/src/main/scala

### File replacements ###
core-setup:
	#Type 4 and 5 (complex numbers) not implemented
	if [ "$(type)" -eq 4 ] || [ "$(type)" -eq 5 ]; then \
		cp ./repl_files/interfaces/Complex_interface/RocketCore.scala $(rocket_scala_src)/rocket; \
		cp ./repl_files/interfaces/Complex_interface/SCIE.scala $(rocket_scala_src)/scie; \
	else \
		cp ./repl_files/interfaces/Standard_interface/RocketCore.scala $(rocket_scala_src)/rocket; \
		cp ./repl_files/interfaces/Standard_interface/SCIE.scala $(rocket_scala_src)/scie; \
	fi
	if [ "$(order)" -eq 0 ]; then \
		sed -i 's/useSCIE: Boolean = true,/useSCIE: Boolean = false,/g' $(rocket_scala_src)/rocket/RocketCore.scala; \
		cp ./repl_files/baseline_tcl/vivado.tcl $(vivado_dir); \
	else \
		sed -i 's/useSCIE: Boolean = false,/useSCIE: Boolean = true,/g' $(rocket_scala_src)/rocket/RocketCore.scala; \
		cp ./repl_files/accel_tcl/vivado.tcl $(vivado_dir); \
	fi

### Calls vsim Makefile ###
verilog:
	make -C $(hw_dir) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)

.PHONY:verilog-clean
verilog-clean:
	make -C $(vsim_dir) clean

### Rocket chip + SCIE + IO FPGA implementation ###
implementation:
	make -C $(vivado_dir) CONFIG=$(config) BOARD=$(board) ORDER=$(order) bitstream
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_timing_summary_routed.rpt $(base_dir)/checkpoints/post_impl_timing_$(type)_$(order).rpt
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_utilization_placed.rpt $(base_dir)/checkpoints/post_impl_utilization_$(type)_$(order).rpt
	cp $(vivado_dir)/workspace/$(config)/vivado-$(board)-riscv/$(board)-riscv.runs/impl_1/riscv_wrapper_power_routed.rpt $(base_dir)/checkpoints/post_impl_power_$(type)_$(order).rpt
	$(base_dir)/scripts/find_max_freq.py $(order) $(type) $(selected_frequency) >> $(max_freqs_file)

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
	#$(emu_dir)/emulator-$(base_name)-$(base_name).$(config) $(emu_dir)/$(binary) >> $(file)
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config) $(emu_dir)/$(binary)
### Simulation (waveform) ###
simulate-debug:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config)-debug -v output.vcd $(emu_dir)/$(binary) >> $(file)
