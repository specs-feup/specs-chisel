base_dir = .
vsim_dir = $(base_dir)/vivado-risc-v/rocket-chip/vsim
emu_dir = $(base_dir)/vivado-risc-v/rocket-chip/emulator
bench_dir = $(base_dir)/benchmarks
hw_dir = $(base_dir)/HW_accelerators/fir
rocket_scala_src = $(base_dir)/vivado-risc-v/rocket-chip/src/main/scala
verilog_src_dir = $(base_dir)/vivado-risc-v/rocket-chip/src/main/resources/vrsc

export RISCV=$(abspath .)/vivado-risc-v/rocket-chip/rocket-tools

base_name = freechips.rocketchip.system

### Clones Vivado-risc-v and rocket-chip repository
setup:
	rm -rf vivado-risc-v #temporario
	git clone https://github.com/eugene-tarassov/vivado-risc-v.git
	cd vivado-risc-v &&  make apt-install && make update-submodules && \
	cd rocket-chip && git submodule update --init && export RISCV=`pwd` && \
	git clone https://github.com/freechipsproject/rocket-tools && cd rocket-tools && \
	git submodule update --init --recursive && export MAKEFLAGS="$MAKEFLAGS -j4" && ./build.sh && ./build-rv32ima.sh
	cp $(base_dir)/repl_files/system/* $(rocket_scala_src)/system
	cp $(base_dir)/repl_files/subsystem/* $(rocket_scala_src)/subsystem
	cp $(base_dir)/repl_files/rocket/* $(rocket_scala_src)/rocket
	cp $(base_dir)/repl_files/scie/* $(rocket_scala_src)/scie
	cp $(base_dir)/repl_files/Makefile $(base_dir)/vivado-risc-v

### Calls vsim Makefile ###
verilog:
	make -C $(hw_dir) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)
	#make -C $(vsim_dir) verilog CONFIG=$(base_name).$(config)
	#cp $(wildcard *.v) $(vsim_dir) $(base_dir)/rocket-verilog
	#cp SCIEPipelined.v SCIEUnpipelined.v SCIEDecoder.v plusarg.reader.v AsyncResetReg.v EICG_wrapper.v $(verilog_src_dir) $(base_dir)/rocket-verilog

.PHONY:verilog-clean
verilog-clean:
	make -C $(vsim_dir) clean

## Standalone hardware accelerator FPGA implementation ###
scie-analysis:
	vivado -mode batch -source $(base_dir)/tcl/scie-analysis.tcl -tclargs=$(board)

### Rocket chip + SCIE + IO FPGA implementation ###
implementation:
	make CONFIG=$(config) BOARD=$(board) bitstream
	./process_timing.py
	
### Calls emulator and benchmark Makefile ###
build:
	make -C $(bench_dir) order=$(order) data=$(data) width=$(width) type=$(type) binarypoint=$(binarypoint) optimization_flag=$(optimization_flag)
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
	
simulate:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config) $(emu_dir)/$(binary) >> $(file)

simulate-debug:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config)-debug -v output.vcd $(emu_dir)/$(binary) >> $(file)
