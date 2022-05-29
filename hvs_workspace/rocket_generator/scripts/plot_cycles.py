#!/usr/bin/python

import os, sys, csv, re, matplotlib.pyplot as plt

x_value=""
optimization_flag =""
order=[]
data=[]
accel_values=[]
baseline_values=[]
speedup=[]
file_info=[]

def terminate(message):
    print(message)
    sys.exit()

def init(f):
    csvreader = csv.reader(f)
    first_line = next(csvreader)
    if("UNSIGNED" in first_line[0]): file_info.append("unsigned")
    elif("SIGNED" in first_line[0]): file_info.append("signed")
    elif("FIXEDPOINT" in first_line[0]): file_info.append("fixedpoint")
    else: terminate("Wrong data type\n")

    if("NO OPTIMIZATION" in first_line[0]): file_info.append("no_optimization")
    elif("OPTIMIZATION" in first_line[0]): file_info.append("optimization")
    else: terminate("CSV file has wrong type of optimization")

    second_line=next(csvreader)
    if("ORDER" in second_line[0]):
        x_value="order"
        process_order_file(csvreader, second_line)
    elif("DATA" in second_line[0]):
        x_value="data"
        process_data_file(csvreader)
    else: terminate("CSV file has wrong x value plot information\n")

def plot_graph(x_value):
    fig, ax = plt.subplots()
    baseline = ax.plot(x_value, baseline_values, "--o", label='Baseline')
    accel = ax.plot(x_value, accel_values, "--o", label='Accelerated')
    plt.yscale('log')
    handles, labels = ax.get_legend_handles_labels()
    ax.legend(handles, labels)
    ax.set_xlabel('Filter order')
    ax.set_ylabel('Performance (number of cycles)')
    ax.grid(True)
    plt.savefig("./results/{}.png".format("_".join(file_info)), bbox_inches='tight')

    fig, ax = plt.subplots()
    ax.plot(order, speedup, "--o")
    ax.set_xlabel('Filter order')
    ax.set_ylabel('Speedup')
    ax.grid(True)
    plt.ylim(0, 1000)
    plt.savefig("./results/{}_speedup.png".format("_".join(file_info)), bbox_inches='tight')

    del file_info[-1]
    del order[:]
    del data[:]
    del baseline_values[:]
    del accel_values[:]
    del speedup[:]

def process_order_file(csvreader, line):
    file_info.append("@data={}".format(re.search(r'\d+', line[0]).group()))
    for row in csvreader:
        row_list = row[0].split("\t")
        if("ORDER" in row_list[0]):
            plot_graph(order)
            file_info.append("@data={}".format(re.search(r'\d+', row_list[0]).group()))
        else:
            order.append(int(row_list[0]))
            baseline_values.append(int(row_list[1]))
            accel_values.append(int(row_list[2]))
            speedup.append(int(row_list[1])/int(row_list[2]))
    plot_graph(order)        

def process_data_file(csvreader, line):
    file_info.append("@order={}".format(re.search(r'\d+', line[0]).group()))
    for row in csvreader:
        row_list = row[0].split("\t")
        if("DATA" in row_list[0]):
            plot_graph(data)
            file_info.append("@order={}".format(re.search(r'\d+', row_list[0]).group()))
        else:
            data.append(row_list[0])
            baseline_values.append(int(row_list[1]))
            accel_values.append(int(row_list[2]))
            speedup.append(int(row_list[1])/int(row_list[2]))
        plot_graph(data)

def main(file):
    with open(file, "r") as f:
        init(f)

if __name__ == "__main__":
    if len(sys.argv) < 2: terminate("Usage: <Command> <file_to_read>\n")
    else: main(sys.argv[1])
