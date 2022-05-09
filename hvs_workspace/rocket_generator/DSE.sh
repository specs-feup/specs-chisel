#!/bin/bash

#Type 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP , 4 -> Complex, 5 -> Complex-FixedPoint

config=TinyConfig
type=3
binarypoint=8
width=32

order_array=(5 10 20 50 100 200 500 1000)
data_array=(50 100 200 500 1000 1500 2000)

file=./results/output.txt

optimization_flag=-O0

sudo make clean

#for data in "${data_array[@]}"; do
#  sudo rm $file
#  echo "### BASELINE ###" >> $file
#  for order in "${order_array[@]}"; do
#    sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
#    sudo make simulate config=$config binary=baseline.riscv file=$file
#  done
#  echo "### ACCELERATOR ###" >> $file
#  for order in "${order_array[@]}"; do
#      sudo make simulate config=$config binary=fir_benchmark.riscv file=$file
#  done
#  ./plot.py order order_output_$data
#done

data=5
order=5

sudo rm $file
echo "### BASELINE ###" >> $file
sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
sudo make simulate config=$config binary=baseline.riscv file=$file

type=2

sudo make clean
sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
sudo make simulate config=$config binary=baseline.riscv file=$file

#echo "### ACCELERATOR ###" >> $file
#sudo make simulate config=$config binary=fir_benchmark.riscv file=$file
#for order in "${order_array[@]}"; do
#	sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint
#	sudo make simulate config=$config binary=baseline.riscv file=$file
#	sudo make clean
#done
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
