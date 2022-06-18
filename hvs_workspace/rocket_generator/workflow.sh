#!/bin/bash
type_verbose_array=(unsigned signed fixed-point floating-point)
target=fir
config=Rocket32t1
binarypoint=0
width=32
optimization_flag=(-O0)
type=(0)
tmp_file=./../../accelerators/fir/results/tmp_file.txt

find ./accelerators/fir/results ! -name '.*' ! -type d -exec rm -- {} +

### Cycle calculation (with respect to ###
for loop_0_var in "${optimization_flag[@]}"; do
	rm ./accelerators/fir/results/tmp_file.txt
	for loop_1_var in "${type[@]}"; do
		printf "### ${type_verbose_array[$loop_1_var]} VALUES (${loop_0_var}) ###\n" >> ./accelerators/fir/results/${loop_0_var}/${type_verbose_array[$loop_1_var]}/cycle_count_type.csv
				make -C ./accelerators/fir clean
					make -C ./accelerators/fir functional_workflow optimization_flag=$loop_0_var type=$loop_1_var target=fir config=Rocket32t1 binarypoint=0 width=32 file=$tmp_file baseline_binary=baseline.riscv accelerated_binary=fir_benchmark.riscv
					baseline_var=$(sed -n '1p' ./accelerators/fir/results/tmp_file.txt)
					accel_var=$(sed -n '2p' ./accelerators/fir/results/tmp_file.txt)
					printf "$loop_1_var\t$baseline_var\t$accel_var\n" >> ./accelerators/fir/results/${loop_0_var}/${type_verbose_array[loop_1_var]}/cycle_count_type.csv
					rm ./accelerators/fir/results/tmp_file.txt
		done
	done

./scripts/generate_files.py fir

type=(0)
order=(0 5)
selected_frequency=200.0

## frequency, area and power measurements ###
rm ./accelerators/fir/results/*.csv
for loop_0_var in "${type[@]}"; do
	printf "### MAXIMUM FREQUENCIES ###\n" >> ./accelerators/fir/results/max_freqs_${type_verbose_array[$loop_0_var]}
	printf "order\tMAXIMUM FREQUENCY\n" >> ./accelerators/fir/results/max_freqs_${type_verbose_array[$loop_0_var]}
	for loop_1_var in "${order[@]}"; do
		make -C ./accelerators/fir vivado_workflow type=$loop_0_var order=$loop_1_var board=vc707 config=Rocket32t1 selected_frequency=200.0 file=./accelerators/fir/results/max_freqs_${loop_0_var}.csv
		done
	done

