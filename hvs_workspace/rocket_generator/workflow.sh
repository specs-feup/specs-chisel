#!/bin/bash

#Type 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP , 4 -> FloatingPoint

config=Rocket32t1
binarypoint=0

optimization_array=(-O0 -O3)
order_array=(5 10 20 50 100 200 500)
data_array=(20 50 100 200 500 1000 1500 2000)
type_array=(0 1 2 3)
type_verbose_array=(unsigned signed fixed-point floating-point)

tmp_file=./results/tmp_file.txt #Temporary workaround


#find ./results ! -name '.*' ! -type d -exec rm -- {} +

### Cycle calculation (with respect to filter order) ###
for optimization_flag in "${optimization_flag[@]}"; do
	rm $tmp_file
	printf "### ${type_verbose_array[type]} VALUES (OPTIMIZATION ${optimization_flag}) ###\n" >> ./results/optimization_${optimization_flag}/type_${type_verbose_array[type]}/cycle_count_order.csv
	for type in "${type_array}"; do
			for data in "${data_array}"; do
				printf "ORDER(@data=$data)\tBASELINE\tACCELERATOR\n" >> ./results/optimization_${optimization_flag}/type_${type_verbose_array[type]}/cycle_count_order.csv
				for order in "${order[@]}"; do
					make clean
					make build order=$order data=$data width=32 config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
					make simulate config=$config binary=baseline.riscv file=$tmp_file
					make simulate config=$config binary=fir_benchmark.riscv file=$tmp_file
					baseline_val=$(sed -n '1p' $tmp_file)
				  accel_val=$(sed -n '2p' $tmp_file)
				  printf "$baseline_val\t$accel_val\n" >> ./results/optimization_${optimization_flag}/type_${type_verbose_array[type]}/cycle_count_order.csv
				  rm $tmp_file
				done
     done
	done
done

./scripts/generate_files.py

########################################################

#order_array=(0 5 10 20 50 100 200 500) #For Vivado workflow order 0 is the baseline
#selected_frequency= 200.0 #Chosen frequency for synthesis

## frequency, area and power measurements ###
rm ./results/*.csv
for type in "${type_array[@]}"; do
printf "### MAXIMUM SYSTEM FREQUENCIES ###\n" >> ./results/max_freqs_${type_verbose_array[type]}.csv
printf "ORDER\tMAXIMUM FREQUENCY\n" >> ./results/max_freqs_${type_verbose_array[type]}.csv
	for order in "${order_array[@]}"; do
		make -C ./vivado-risc-v	clean
		rm -rf ./vivado-risc-v/workspace
		make core-setup type=$type order=$order
		if [ $order -ne 0 ]; then
			make verilog order=$order width=32 type=$type binarypoint=$binarypoint
		fi
			make implementation board=vc707 config=$config max_freqs_file=./results/max_freqs_${type_verbose_array[type]}.csv type=${type_verbose_array[type]} selected_frequency=$selected_frequency order=$order
		done
done

./scripts/process_checkpoints.py $selected_frequency
./scripts/process_timing.py
