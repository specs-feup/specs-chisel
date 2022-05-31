#!/usr/bin/python

import os, sys, csv, re, matplotlib.pyplot as plt

optimization_flag =""
order=[]
data=[]
accel_values=[]
baseline_values=[]
cycle_speedup=[]
time_speedup=[]
file_info=[]
freqs = []
file=""

def terminate(error_message):
    print(error_message)
    sys.exit()


def read_freqs():
	with open("./results/max_freqs_{}.csv".format(file_info[1]), "r") as f:
		csvreader = csv.reader(f)
		first_line=next(csvreader)
		second_line=next(csvreader)
		for row in csvreader:
			freqs.append(float(row[1]))
    f.close()

def init(f):
    csvreader = csv.reader(f)
    first_line = next(csvreader)

    if("NO OPTIMIZATION" in first_line[0]): file_info.append("no_optimization")
    elif("OPTIMIZATION" in first_line[0]): file_info.append("optimization")
    else: terminate("CSV file has wrong type of optimization")

    if("UNSIGNED" in first_line[0]): file_info.append("unsigned")
    elif("SIGNED" in first_line[0]): file_info.append("signed")
    elif("FIXEDPOINT" in first_line[0]): file_info.append("fixedpoint")
    else: terminate("Wrong data type\n")

    second_line=next(csvreader)
    read_freqs()
    if("ORDER" in second_line[0]):
        process_order_file(csvreader, second_line)
    elif("DATA" in second_line[0]):
        process_data_file(csvreader)
    else: terminate("CSV file has wrong x value plot information\n")

def plot_graph(values, y_value):
	if y_value == "cycles":
    		fig, ax = plt.subplots()
    		baseline = ax.plot(values, baseline_values, "--o", label='Baseline')
    		accel = ax.plot(values, accel_values, "--o", label='Accelerated')
    		plt.yscale('log')
    		handles, labels = ax.get_legend_handles_labels()
    		ax.legend(handles, labels)
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Performance (number of cycles)')
    		ax.grid(True)
    		plt.savefig("./results/{}_cycles.png".format("_".join(file_info)), bbox_inches='tight')

    		fig, ax = plt.subplots()
    		ax.plot(order, cycle_speedup, "--o")
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Speedup')
    		ax.grid(True)
    		plt.ylim(0, 1000)
    		plt.savefig("./results/{}_speedup_cycles.png".format("_".join(file_info)), bbox_inches='tight')

	elif y_value == "freq":
		fig, ax = plt.subplots()
    		accel = ax.plot(order, values, "--o")
    		ax.grid(True)
		#plt.gca().invert_yaxis()
    		plt.savefig("./results/max_freqs_{}.png".format("_".join(file_info[1])), bbox_inches='tight')

	elif y_value == "time":
		time_accel = []
		time_baseline = []
		example_freq = 100.0 #temporario
		for count, (freq, value) in enumerate(zip(freqs, accel_values)):
			time_accel.append((float(1/(freq)) * float(accel_values[count])));#print("{} * {} = {}".format(freq, accel_values[count], time_accel))
			time_baseline.append((float(1/example_freq) * float(baseline_values[count])));#print("{} * {} = {}".format(freq, baseline_values[count], time_baseline))
			time_speedup.append(float(time_baseline[count]/time_accel[count]))
		fig, ax = plt.subplots()
    		baseline = ax.plot(values, time_baseline, "--o", label='Baseline')
    		accel = ax.plot(values, time_accel, "--o", label='Accelerated')
    		plt.yscale('log')
    		handles, labels = ax.get_legend_handles_labels()
    		ax.legend(handles, labels)
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Performance (in seconds)')
    		ax.grid(True)
    		plt.savefig("./results/{}_time.png".format("_".join(file_info)), bbox_inches='tight')

    		fig, ax = plt.subplots()
    		ax.plot(order, time_speedup, "--o")
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Speedup')
    		ax.grid(True)
    		plt.ylim(0, 1000)
    		plt.savefig("./results/{}_speedup_time.png".format("_".join(file_info)), bbox_inches='tight')

    		del file_info[-1]
    		del order[:]
    		del data[:]
    		del baseline_values[:]
    		del accel_values[:]
    		del cycle_speedup[:]
		del time_speedup[:]
	else: terminate("Invalid y values")

def process_order_file(csvreader, line):
    file_info.append("@data={}".format(re.search(r'\d+', line[0]).group()))
    for row in csvreader:
        row_list = row[0].split("\t")
        if("ORDER" in row_list[0]):
            plot_graph(order, "cycles")
	    plot_graph(order, "time")
            file_info.append("@data={}".format(re.search(r'\d+', row_list[0]).group()))
        else:
            order.append(int(row_list[0]))
            baseline_values.append(int(row_list[1]))
            accel_values.append(int(row_list[2]))
            cycle_speedup.append(int(row_list[1])/int(row_list[2]))
    plot_graph(order, "cycles")
    plot_graph(freqs, "freq")
    plot_graph(order, "time")

def process_data_file(csvreader, line):
    file_info.append("@order={}".format(re.search(r'\d+', line[0]).group()))
    for row in csvreader:
        row_list = row[0].split("\t")
        if("DATA" in row_list[0]):
            plot_graph(data, "cycles")
            plot_graph(data, "time")
            file_info.append("@order={}".format(re.search(r'\d+', row_list[0]).group()))
        else:
            data.append(row_list[0])
            baseline_values.append(int(row_list[1]))
            accel_values.append(int(row_list[2]))
            cycle_speedup.append(int(row_list[1])/int(row_list[2]))
    plot_graph(data, "cycles")
    plot_graph(freqs, "freq")
    plot_graph(data, "time")

def main(file_to_read):
    file=file_to_read
    with open(file_to_read, "r") as f:
        init(f)
    f.close()    

if __name__ == "__main__":
    if len(sys.argv) < 2: terminate("Usage: <Command> <file_to_read>\n")
    else: main(sys.argv[1])
