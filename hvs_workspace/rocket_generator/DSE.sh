#!/bin/bash

config=TinyConfig
width=32

order_array=(5 10 20 50 100 200 500 1000)

#echo "#### DESIGN SPACE EXPLORATION ####"
#echo "## Bit width of $width ##"
echo "### BASELINE ###" >> results.txt
#Baseline loop
  for order in "${order_array[@]}"
    do
      sudo make build order=$order width=$width config=$config
      sudo make simulate config=$config binary=baseline.riscv
      sudo make clean
    done
#Accelerator loop
echo "### ACCELERATOR ###" >> results.txt
  for order in "${order_array[@]}"
    do
      sudo make build order=$order width=$width config=$config
      sudo make simulate config=$config binary=fir_benchmark.riscv
      sudo make clean
    done
