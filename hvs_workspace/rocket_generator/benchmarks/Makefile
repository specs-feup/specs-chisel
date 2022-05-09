XLEN ?= 64

default: all

src_dir = .
em_dir = ../rocket-chip/emulator

#--------------------------------------------------------------------
# Sources
#--------------------------------------------------------------------

bmarks = baseline_complex \
		fir_benchmark_complex \
		baseline \
		fir_benchmark \

#--------------------------------------------------------------------
# Build rules
#--------------------------------------------------------------------

RISCV_PREFIX ?= /opt/riscv/bin/riscv$(XLEN)-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -march=rv32imafc -mabi=ilp32f -DORDER=$(order) -DDATA=$(data) -DWIDTH=$(width) -DTYPE=$(type) -DBINARYPOINT=$(binarypoint) -DPREALLOCATE=1 -mcmodel=medany -static -std=gnu99 $(optimization_flag) -g -ffast-math -fno-common -fno-builtin-printf -I.
RISCV_LINK ?= $(RISCV_GCC) -T $(src_dir)/common/test.ld $(incs)
RISCV_LINK_OPTS ?= -static -nostdlib -nostartfiles -lm -lgcc -T $(src_dir)/common/test.ld
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all --disassemble-zeroes --section=.text --section=.text.startup --section=.text.init --section=.data
RISCV_SIM ?= spike --isa=rv$(XLEN)gc

incs  += -I$(src_dir)/env -I$(src_dir)/common $(addprefix -I$(src_dir)/, $(bmarks))
objs  :=

define compile_template
$(1).riscv: $(wildcard $(src_dir)/$(1)/*) $(wildcard $(src_dir)/common/*)
	@if [ "$(type)" -eq 2 ] || [ "$(type)" -eq 3 ]; then \
		gcc fixed_point_gen.c -o fixed_point_gen -lm -I. ; \
		./fixed_point_gen $(width) $(binarypoint); \
	fi
	#gcc rand_gen.c -o rand_gen -lm
	#./rand_gen $(type) $(binarypoint) $(width)
	$$(RISCV_GCC) $$(incs) $$(RISCV_GCC_OPTS) -o $$@ $(wildcard $(src_dir)/$(1)/*.c) $(wildcard $(src_dir)/common/*.c) $(wildcard $(src_dir)/common/*.S) $$(RISCV_LINK_OPTS)
	cp $(src_dir)/$(1).riscv $(em_dir)
endef

$(foreach bmark,$(bmarks),$(eval $(call compile_template,$(bmark))))

#------------------------------------------------------------
# Build and run benchmarks on riscv simulator

bmarks_riscv_bin  = $(addsuffix .riscv,  $(bmarks))
bmarks_riscv_dump = $(addsuffix .riscv.dump, $(bmarks))
bmarks_riscv_out  = $(addsuffix .riscv.out,  $(bmarks))

$(bmarks_riscv_dump): %.riscv.dump: %.riscv
	$(RISCV_OBJDUMP) $< > $@

$(bmarks_riscv_out): %.riscv.out: %.riscv
	$(RISCV_SIM) $< > $@

riscv: $(bmarks_riscv_dump)
run: $(bmarks_riscv_out)

junk += $(bmarks_riscv_bin) $(bmarks_riscv_dump) $(bmarks_riscv_hex) $(bmarks_riscv_out)

#------------------------------------------------------------
# Default

all: riscv

# Clean up

clean:
	rm -rf $(objs) $(junk) $(em_dir)/*.riscv
	#rm -rf $(objs) $(junk) $(em_dir)/*.riscv *.h
