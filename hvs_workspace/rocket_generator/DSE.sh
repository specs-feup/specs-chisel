#!/bin/bash

#Type 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP , 4 -> Complex, 5 -> Complex-FixedPoint

#config=CustomTinyConfig
config=Rocket32t1
type=0
binarypoint=0
width=32

order_array=(5 10 20 50 100 200 500)
data_array=(20 50 100 200 500 1000 1500 2000)
type_array=(0 1 2 3)

order=5

tmp_file=./results/tmp_file.txt #Workaround temporario pelo facto de print ter de levar \n se não não aparece

max_freq_file=./results/max_freqs_order_$order.csv


hw_accel_dir=./HW_accelerators/fir

optimization_flag=-O0

#data_array=(10 20)
#order_array=(5 10 20)
#order_array=(5 10 20 50 100 200 500 1000)


rm $max_freq_file
printf "### MAXIMUM SYSTEM FREQUENCIES ###\n" >> $max_freq_file
printf "ORDER\tMAXIMUM FREQUENCY\n" >> $max_freq_file
make verilog order=$order width=$width type=$type binarypoint=$binarypoint
make implementation board=vc707 config=$config max_freq_file=$max_freq_file selected_frequency=160 order=$order


#for type in "${type_array[@]}"; do
#sudo rm $tmp_file
#printf "### UNSIGNED VALUES (NO OPTIMIZATION) ###\n" >> ./results/no_optimization/type_${type}/x_order/cycle_count_${type}.csv
#for data in "${data_array[@]}"; do
 # printf "ORDER(@data=$data)\tBASELINE\tACCELERATOR\n" >> ./results/no_optimization/type_${type}/x_order/cycle_count_${type}.csv
#	for order in "${order_array[@]}"; do
#		printf "$order\t" >> ./results/no_optimization/type_${type}/x_order/cycle_count_${type}.csv
 #   		sudo make clean
#		    sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
 #       sudo make simulate config=$config binary=baseline.riscv file=$tmp_file
  #      sudo make clean
   #     sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
   #     sudo make simulate config=$config binary=fir_benchmark.riscv file=$tmp_file
    #    baseline_val=$(sed -n '1p' $tmp_file)
     #   accel_val=$(sed -n '2p' $tmp_file)
      #  printf "$baseline_val\t$accel_val\n" >> ./results/no_optimization/type_${type}/x_order/cycle_count.csv
     #   sudo rm $tmp_file
#	done
 # ./scripts/plot_cycles.py ./results/no_optimization/type_${type}/x_order/cycle_count_${type}.csv
#done
#done
