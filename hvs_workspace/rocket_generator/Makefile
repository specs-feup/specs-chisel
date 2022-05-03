
base_dir = .
vsim_dir = $(base_dir)/rocket-chip/vsim
emu_dir = $(base_dir)/rocket-chip/emulator
bench_dir = $(base_dir)/benchmarks
hw_dir = $(base_dir)/HW_accelerators/fir

export RISCV=$(abspath .)/rocket-chip/rocket-tools

base_name = freechips.rocketchip.system

### Calls vsim Makefile ###
verilog:
	make -C $(hw_dir) verilog order=$(order) width=$(width)
	make -C $(vsim_dir) verilog CONFIG=$(base_name).$(config)

.PHONY:verilog-clean
verilog-clean:
	make -C $(vsim_dir) clean

### Calls emulator and benchmark Makefile ###
build:
	make -C $(bench_dir) order=$(order) data=$(data) width=$(width) type=$(type) binarypoint=$(binarypoint)
	make -C $(hw_dir) verilog order=$(order) width=$(width) data=$(data) type=$(type) binarypoint=$(binarypoint)
	make -C $(emu_dir) CONFIG=$(base_name).$(config)

build-debug:
	make -C $(hw_dir) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)
	make debug -C $(emu_dir) CONFIG=$(base_name).$(config)

.PHONY:clean
clean:	
	make -C $(emu_dir) clean
	make -C $(bench_dir) clean
	make -C $(hw_dir) clean	
	
simulate:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config) $(emu_dir)/$(binary) >> $(file)

simulate-debug:
	$(emu_dir)/emulator-$(base_name)-$(base_name).$(config)-debug +verbose -v output.vcd $(emu_dir)/$(binary)
 	
	


	
	

