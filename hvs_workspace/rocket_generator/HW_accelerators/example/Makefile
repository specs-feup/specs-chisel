MODULE:=SCIEPipelined

base_dir = .
vrsc_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/resources/vsrc
rocket_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/rocket
scie_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/scie

verilog:

.PHONY: test
test:


verilate: tb_$(MODULE).cpp


.PHONY: waves
waves: waveform.vcd
	@echo "\n### WAVEFORMS ###\n"
	gtkwave waveform.vcd

.PHONY: lint
lint: $(module).v
	verilator --lint-only $(module).v

.PHONY: clean
clean:
	rm -rf ./obj_dir waveform.vcd *.json *.fir *.v
