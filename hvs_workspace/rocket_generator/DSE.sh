#!/bin/bash

# 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP

config=TinyConfig
type=2
binarypoint=16
width=32
data=2000

order_array=(5 10 20 50 100 200 500 1000)

file=./results/FixedPoint_order_results_bp16_nofpu.txt

#Baseline loop
echo "### BASELINE ###" >> $output_file
for order in "${order_array[@]}"; do
	sudo make build order=1000 data=$data width=$width config=$config type=$type binarypoint=$binarypoint
	sudo make simulate config=$config binary=baseline.riscv file=$file
	sudo make clean
done
#Accelerator loop
#echo "### ACCELERATOR ###" >> $file
#  for order in "${order_array[@]}"; do
#      sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint
#      sudo make simulate config=$config binary=fir_benchmark.riscv file=$file
#      sudo make clean
#  done

#order=100

#output_file=./results/data_results.txt

#data_array=(50 100 200 500 1000 1500 2000)

#echo "#### DESIGN SPACE EXPLORATION ####"
#echo "## Bit width of $width ##"
#echo "### BASELINE ###" >> $output_file
#Baseline loop
#  for data_value in "${data_array[@]}"
#    do
#      sudo make build order=$order data=$data_value width=$width config=$config
#      sudo make simulate config=$config binary=baseline.riscv file=$output_file
#      sudo make clean
#    done
#Accelerator loop
#echo "### ACCELERATOR ###" >> $output_file
#  for data_value in "${data_array[@]}"
#    do
#      sudo make build order=$order data=$data_value width=$width config=$config
#      sudo make simulate config=$config binary=fir_benchmark.riscv file=$output_file
#      sudo make clean
#    done

#config=TinyConfig
#order=100
#data=2000
#width_array=(8 16 32)
#output_file=./results/width_results.txt

#Baseline loop
#  echo "### BASELINE ###" >> $output_file
#  for width in "${width_array[@]}"
#    do
#      sudo make build order=$order data=$data width=$width config=$config
#      sudo make simulate config=$config binary=baseline.riscv file=$output_file
#      sudo make clean
#   done
#Accelerator loop
#  echo "### ACCELERATOR ###" >> $output_file
#  for width in "${width_array[@]}"
#    do
#      sudo make build order=$order data=$data width=$width config=$config
#      sudo make simulate config=$config binary=fir_benchmark.riscv file=$output_file
#      sudo make clean
#    done
