#!/usr/bin/python

import os, sys, re

def main(data, order, type):
    scie_power = 0; base_power = 0
    with open("./checkpoints/scie_power_report_type={}_data={}_order={}.rpt".format(type, data, order), "r") as f:
        lines=f.readlines()
        for line in lines:
            if '| Dynamic (W)              |' in line:
                scie_power = re.search(r'[0-9]+\.[0-9]*', line).group()
                break

    with open("./checkpoints/baseline_power_report_type={}_data={}_order={}.rpt".format(type, data, order), "r") as f:
        lines=f.readlines()
        for line in lines:
            if '| Dynamic (W)              |' in line:
                base_power = re.search(r'[0-9]+\.[0-9]*', line).group()
                break
    with open("./results/power/type_{}/power_count_order.csv".format(type), "a") as f:
        f.write("{}\t{}\t{}\n".format(int(order), float(base_power),float(scie_power)))



if __name__ == "__main__":
     if len(sys.argv) < 4:
        print "Usage: <command> <data> <order> <type>"
        sys.exit(1)
     main(sys.argv[1], sys.argv[2], sys.argv[3])
