SHELL := /bin/bash
target_accelerator=fir
base_dir = .
vivado_dir = $(base_dir)/vivado-risc-v
vsim_dir = $(vivado_dir)/rocket-chip/vsim
emu_dir = $(vivado_dir)/rocket-chip/emulator
bench_dir = $(base_dir)/$(target_accelerator)/benchmarks
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
