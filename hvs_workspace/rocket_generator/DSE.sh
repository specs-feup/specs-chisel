#!/bin/bash

config=TinyConfig
width=32

echo "#### DESIGN SPACE EXPLORATION ####\n"
echo "## Bit width of $width##"
  for order in 5 10 20 50 100
    do
      echo "FIR filter order of $order"
      sudo make build order=$order width=$width config=$config
      sudo make simulate config=$config binary=baseline.riscv
      sudo make simulate config=$config binary=fir_benchmark.riscv
      sudo make clean
    done
