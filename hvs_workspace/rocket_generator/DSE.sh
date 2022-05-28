#!/bin/bash

#Type 0 -> UInt, 1 -> SInt, 2 -> FixedPoint, 3 -> FP , 4 -> Complex, 5 -> Complex-FixedPoint

#config=TinyConfig
config=CustomTinyConfig
type=0
binarypoint=0
width=32

#order_array=(5 10 20 50 100 200 500 1000)
#data_array=(20 50 100 200 500 1000 1500 2000)
type_array=(0 1 2 3)

tmp_file=./results/tmp_file.txt #Workaround temporario pelo facto de print ter de levar \n se não não aparece

file=./results/output_unsigned_O0.csv

hw_accel_dir=./HW_accelerators/fir

optimization_flag=-O0

data_array=(10 20)
order_array=(5 10)
#order_array=(5 10 20 50 100 200 500 1000)

#for order in "${order_array[@]}"; do
#  sudo make verilog order=$order width=$width config=$config type=$type binarypoint=$binarypoint
#  cp $hw_accel_dir/SCIEPipelined.v ./rocket-verilog/SCIEPipelined_order_$order.v
#done


sudo rm $file $tmp_file
printf "### UNSIGNED VALUES (NO OPTIMIZATION) ###\n" >> $file
for data in "${data_array[@]}"; do
  printf "ORDER(@data=$data)\tBASELINE\tACCELERATOR\n" >> $file
	for order in "${order_array[@]}"; do
		printf "$order\t" >> $file
    sudo make clean
		sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
		sudo make simulate config=$config binary=baseline.riscv file=$tmp_file
    sudo make clean
    sudo make build order=$order data=$data width=$width config=$config type=$type binarypoint=$binarypoint optimization_flag=$optimization_flag
		sudo make simulate config=$config binary=fir_benchmark.riscv file=$tmp_file
    baseline_val=$(sed -n '1p' $tmp_file)
    accel_val=$(sed -n '2p' $tmp_file)
    printf "$baseline_val\t$accel_val\n" >> $file
    sudo rm $tmp_file
	done
  ./scripts/plot.py $file
done
