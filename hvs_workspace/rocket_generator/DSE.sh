#!/bin/bash

#Type 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP , 4 -> Complex, 5 -> Complex-FixedPoint

#config=TinyConfig
config=CustomTinyConfig
type=2
binarypoint=0
width=32

#order_array=(5 10 20 50 100 200 500 1000)
#data_array=(20 50 100 200 500 1000 1500 2000)
type_array=(0 1 2 3)

tmp_file=./results/tmp_file.txt #Workaround temporario pelo facto de print ter de levar \n se não não aparece

cycle_count_file=./results/output_unsigned_O0.csv

max_freq_file=./results/max_freqs_fixed_point.csv

hw_accel_dir=./HW_accelerators/fir

optimization_flag=-O0

data_array=(10 20)
order_array=(5 10 20)
#order_array=(5 10 20 50 100 200 500 1000)

for order in "${order_array[@]}"; do
  make verilog order=$order width=$width config=$config type=$type binarypoint=$binarypoint
  cp $hw_accel_dir/SCIEPipelined.v ./rocket-verilog/SCIEPipelined_order_$order.v
done


rm $max_freq_file
printf "### MAXIMUM SYSTEM FREQUENCIES ###\n" >> $max_freq_file
printf "ORDER\tMAXIMUM FREQUENCY\n" >> $max_freq_file
make implementation board=nexys-a7-100t file=$max_freq_file  #TODO adaptar para o workflow do vivado-risc-v


#sudo rm $cycle_count_file $tmp_file
#printf "### UNSIGNED VALUES (NO OPTIMIZATION) ###\n" >> $cycle_count_file
#for data in "${data_array[@]}"; do
#  printf "ORDER(@data=$data)\tBASELINE\tACCELERATOR\n" >> $cycle_count_file
#	for order in "${order_array[@]}"; do
#		printf "$order\t" >> $cycle_count_file
 #   		sudo make clean
#		sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
#		sudo make simulate config=$config binary=baseline.riscv file=$tmp_file
 #   		sudo make clean
  #  		sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
#		sudo make simulate config=$config binary=fir_benchmark.riscv file=$tmp_file
 #   		baseline_val=$(sed -n '1p' $tmp_file)
  #  		accel_val=$(sed -n '2p' $tmp_file)
 #   		printf "$baseline_val\t$accel_val\n" >> $cycle_count_file
 #   		sudo rm $tmp_file
#	done
 # ./scripts/plot.py $cycle_count_file
#done
