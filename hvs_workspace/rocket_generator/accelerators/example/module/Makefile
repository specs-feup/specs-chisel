MODULE:=SCIEPipelined

base_dir = .
vrsc_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/resources/vsrc
rocket_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/rocket
scie_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/scie

verilog:
	@echo "\n### GENERATING VERILOG ###\n"
	sbt 'runMain scie.SCIEDecoderGen'
	@sed -i 's/io_//g' *.v
	../parse_scripts/strip_comment.py SCIEPipelined.v SCIEUnpipelined.v
	@sed -i 's/Pipelined/& #(parameter XLEN = 32)/' SCIEPipelined.v
	@sed -i 's/pipelined/& #(parameter XLEN = 32)/' SCIEUnpipelined.v
	cp *.v $(vrsc_dir)

.PHONY: test
test:
	@echo "\n### CHISELTESTER ###\n"
	sbt 'test:runMain scie.SCIETest --params "width=$(width),binarypoint=$(binarypoint),type=$(type)"'

verilate: tb_$(MODULE).cpp
		$(MAKE) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)
		@echo "\n### VERILATING ###\n"
		@if [ "$(type)" -eq 4 ] || [ "$(type)" -eq 5 ]; then \
			verilator --trace -cc $(MODULE).v --exe tb_$(MODULE)_complex.cpp; \
		else \
			verilator --trace -cc $(MODULE).v --exe tb_$(MODULE).cpp; \
		fi
		make -C obj_dir -f V$(MODULE).mk V$(MODULE)
		@./obj_dir/V$(MODULE) $(order) $(width) $(type) $(binarypoint)

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
