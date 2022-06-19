#!/bin/bash
type_verbose_array=(unsigned signed fixed-point floating-point)
target=fir
config=Rocket32t1
binarypoint=0
width=32
optimization_flag=(-O0)
type=(0)
data=(5)
order=(5)
tmp_file=./../../accelerators/fir/results/tmp_file.txt

find ./accelerators/fir/results ! -name '.*' ! -type d -exec rm -- {} +

### Cycle calculation (with respect to ###
for loop_0_var in "${optimization_flag[@]}"; do
	rm ./accelerators/fir/results/tmp_file.txt
	for loop_1_var in "${type[@]}"; do
		printf "### ${type_verbose_array[$loop_1_var]} VALUES (${loop_0_var}) ###\n" >> ./accelerators/fir/results/_${loop_0_var}/${type_verbose_array[$loop_1_var]}/cycle_count_order.csv
		for loop_2_var in "${data[@]}"; do
			printf "order(@data=$loop_2_var)\tBASELINE\tACCELERATOR\n" >> ./accelerators/fir/results/_${loop_0_var}/${type_verbose_array[$loop_1_var]}/cycle_count_order.csv
			for loop_3_var in "${order[@]}"; do
					make -C ./accelerators/fir clean
					make -C ./accelerators/fir functional_workflow optimization_flag=$loop_0_var type=$loop_1_var data=$loop_2_var order=$loop_3_var target=fir config=Rocket32t1 binarypoint=0 width=32 file=$tmp_file baseline_binary=baseline.riscv accelerated_binary=fir_benchmark.riscv
					baseline_var=$(sed -n '1p' ./accelerators/fir/results/tmp_file.txt)
					accel_var=$(sed -n '2p' ./accelerators/fir/results/tmp_file.txt)
					printf "$loop_3_var\t$baseline_var\t$accel_var\n" >> ./accelerators/fir/results/_${loop_0_var}/${type_verbose_array[loop_1_var]}/cycle_count_order.csv
					rm ./accelerators/fir/results/tmp_file.txt
				done
			done
		done
	done

./scripts/generate_files.py fir

type=(0)
order=(0 5)
selected_frequency=200.0

## frequency, area and power measurements ###
rm ./checkpoints/*.rpt
rm ./accelerators/fir/results/*.csv
for loop_0_var in "${type[@]}"; do
	printf "### MAXIMUM FREQUENCIES ###\n" >> ./accelerators/fir/results/max_freqs_${type_verbose_array[$loop_0_var]}.csv
	printf "order\tMAXIMUM FREQUENCY\n" >> ./accelerators/fir/results/max_freqs_${type_verbose_array[$loop_0_var]}.csv
	for loop_1_var in "${order[@]}"; do
		make -C ./accelerators/fir vivado_workflow type=$loop_0_var order=$loop_1_var type_verbose=${type_verbose_array[$loop_0_var]} board=vc707 config=Rocket32t1 file=./results/max_freqs_${type_verbose_array[$loop_0_var]}.csv target=fir config=Rocket32t1 binarypoint=0 width=32 
		done
	done

./scripts/process_checkpoints.py 200.0 fir
./scripts/process_timing.py fir
