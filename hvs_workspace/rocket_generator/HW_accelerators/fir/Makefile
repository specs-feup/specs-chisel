MODULE:=SCIEPipelined

base_dir = .
vrsc_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/resources/vsrc
rocket_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/rocket
scie_dir = $(base_dir)/../../vivado-risc-v/rocket-chip/src/main/scala/scie
power_dir = $(base_dir)/../../power_eval

verilog:
	@echo "\n### GENERATING VERILOG ###\n"
	sbt 'runMain scie.SCIEPipelinedGen --params "order=$(order),width=$(width),type=$(type),binarypoint=$(binarypoint)"'
	sbt 'runMain scie.SCIEUnpipelinedGen --params "width=$(width)"'
	sbt 'runMain scie.SCIEDecoderGen'
	@sed -i 's/io_//g' *.v
	../parse_scripts/strip_comment.py SCIEPipelined.v SCIEUnpipelined.v
	@sed -i 's/Pipelined/& #(parameter XLEN = 32)/' SCIEPipelined.v
	@sed -i 's/pipelined/& #(parameter XLEN = 32)/' SCIEUnpipelined.v
	cp *.v $(vrsc_dir)
	cp SCIEPipelined.v $(power_dir)/src/SCIEPipelined_type=$(type)_order=$(order).v

.PHONY: test
test:
	@echo "\n### PEEKPOKETESTER ###\n"
	sbt 'test:runMain scie.SCIETest --params "order=$(order),width=$(width),data=$(data),type=$(type),binarypoint=$(binarypoint)"'

verilate: tb_$(MODULE).cpp
		$(MAKE) verilog order=$(order) width=$(width) type=$(type) binarypoint=$(binarypoint)
		@echo "\n### VERILATING ###\n"
		verilator --trace -cc $(MODULE).v --exe tb_$(MODULE).cpp; \
		#verilator --trace -cc $(MODULE).v --exe tb_$(MODULE).cpp
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
