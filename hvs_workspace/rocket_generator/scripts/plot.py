#!/usr/bin/python
import sys, os, csv, re, matplotlib.pyplot as plt

file_info=[]
order=[]
data=[]
freqs=[]
power=[]

luts=[]
register=[]
dsps=[]
bram=[]

accel_values=[]
baseline_values=[]
speedup=[]
time_baseline=[]
time_accel=[]

def terminate(error_message):
    print(error_message)
    sys.exit()


def get_power_data(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        _ = next(csvreader)
        for row in csvreader:
            row_list=row[0].split("\t")
            order.append(int(row_list[0]))
            power.append(float(row_list[1]))
    f.close()


def get_utilisation_data(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        _ = next(csvreader)
        for row in csvreader:
            row_list=row[0].split("\t")
            order.append(int(row_list[0]))
            luts.append(row_list[1])
            register.append(row_list[2])
            dsps.append(row_list[3])
            bram.append(row_list[4])
    f.close()


def get_freq_data(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        _ = next(csvreader)
        for row in csvreader:
            row_list=row[0].split("\t")
            order.append(int(row_list[0]))
            freqs.append(float(row_list[1]))
    f.close()

def plot_graph(values, y_value, target):
	if y_value == "cycle":
    		fig, ax = plt.subplots()
    		baseline = ax.plot(values, baseline_values, "--o", label='Baseline')
    		accel = ax.plot(values, accel_values, "--o", label='Accelerated')
    		plt.yscale('log')
    		handles, labels = ax.get_legend_handles_labels()
    		ax.legend(handles, labels)
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Performance (number of cycles)')
    		ax.grid(True)
    		plt.savefig("./accelerators/{}/results/{}.png".format(target, "_".join(file_info), bbox_inches='tight')

    		fig, ax = plt.subplots()
    		ax.plot(values, speedup, "--o")
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Speedup')
    		ax.grid(True)
    		plt.ylim(0, 1000)
    		plt.savefig("./accelerators/{}/results/{}_speedup.png".format(target, "_".join(file_info), bbox_inches='tight')

        elif y_value == "utilisation":
            pass

        elif y_value == "power":
            fig, ax = plt.subplots()
            _ = ax.plot(order, values, "--o")
	    ax.set_xlabel('Filter order')
    	    ax.set_ylabel('Power (W)')
            ax.grid(True)
            plt.savefig("./accelerators/{}/results/power_{}.png".format(target, file_info[0]), bbox_inches='tight')

        elif y_value == "freq":
            fig, ax = plt.subplots()
            _ = ax.plot(order, values, "--o")
	    ax.set_xlabel('Filter order')
    	    ax.set_ylabel('Maximum frequency (MHz)')
            ax.grid(True)
            plt.savefig("./accelerators/{}/results/max_freqs_{}.png".format(target, file_info[0]), bbox_inches='tight')

        elif y_value == "time":
            fig, ax = plt.subplots()
            baseline = ax.plot(values, baseline_values, "--o", label='Baseline')
            accel = ax.plot(values, accel_values, "--o", label='Accelerated')
            plt.yscale('log')
            handles, labels = ax.get_legend_handles_labels()
            ax.legend(handles, labels)
            ax.set_xlabel('Filter order')
            ax.set_ylabel('Performance (in microseconds)')
            ax.grid(True)
            plt.savefig("./accelerators/{}/results/{}.png".format(target, "_".join(file_info)), bbox_inches='tight')

            fig, ax = plt.subplots()
            ax.plot(values, speedup, "--o")
            ax.set_xlabel('Filter order')
            ax.set_ylabel('Speedup')
            ax.grid(True)
            plt.ylim(0, 1000)
            plt.savefig("./accelerators/{}/results/{}_speedup.png".format(target, "_".join(file_info), bbox_inches='tight')

        else:
          terminate("Invalid y values")
        del file_info[-1]
        del order[:]
        del data[:]
        del baseline_values[:]
        del accel_values[:]
        del speedup[:]
	del freqs[:]
	del power[:]
	del luts[:]
	del register[:]
	del dsps[:]
	del bram[:]

def process_order_file(file_dir, target):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        second_line = next(csvreader)
        file_info.append("@data={}".format(re.search(r'\d+', second_line[0]).group()))
        for row in csvreader:
            row_list=row[0].split("\t")
            if "ORDER" in row_list[0]:
                if file_info[1] == "cycle": plot_graph(order, "cycle", target)
                else: plot_graph(order, "time", target)
                file_info.append("@data={}".format(re.search(r'\d+', row_list[0]).group()))
            else:
                order.append(int(row_list[0]))
                baseline_values.append(int(row_list[1]))
                accel_values.append(int(row_list[2]))
                speedup.append(int(int(row_list[1])/int(row_list[2])))
    if file_info[1] == "cycle": plot_graph(order, "cycle", target)
    else: plot_graph(order, "time", target)
    f.close()


def process_data_file(file_dir, target):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        second_line = next(csvreader)
        file_info.append("@order={}".format(re.search(r'\d+', second_line[0]).group()))
        for row in csvreader:
            row_list=row[0].split("\t")
            if "DATA" in row_list[0]:
                if file_info[1] == "cycle": plot_graph(data, "cycle", target)
                else: plot_graph(data, "time", target)
                file_info.append("@order={}".format(re.search(r'\d+', row_list[0]).group()))
            else:
                data.append(int(row_list[0]))
                baseline_values.append(int(row_list[1]))
                accel_values.append(int(row_list[2]))
                speedup.append(int(int(row_list[1])/int(row_list[2])))
    if file_info[1] == "cycle": plot_graph(data, "cycle", target)
    else: plot_graph(data, "time", target)
    f.close()


def getFileInfo(file_dir, target):
    if "freqs" in file_dir:
        file_info.append(((file_dir.split("/")[-1]).split("_")[-1]).split(".")[-2])
        get_freq_data(file_dir)
        plot_graph(freqs, "freq", target)
    elif "utilisation" in file_dir or "utilization" in file_dir:
        file_info.append(((file_dir.split("/")[-1]).split("_")[-1]).split(".")[-2])
        get_utilisation_data(file_dir)
        plot_graph(freqs, "utilisation", target)
    elif "power" in file_dir:
        file_info.append(((file_dir.split("/")[-1]).split("_")[-1]).split(".")[-2])
        get_power_data(file_dir)
        plot_graph(power, "power", target)
    else:
        if("-O0" in file_dir): file_info.append("optimization_-O0")
        elif("-O3" in file_dir): file_info.append("optimization_-O3")
        else: terminate("Invalid directory")

        if("cycle" in file_dir): file_info.append("cycle")
        elif("time" in file_dir): file_info.append("time")
        else: terminate("Invalid type of file (freqs, cycle or time)")

        file_info.append((file_dir.split("/")[-2]).split("_")[-1])

        file_info.append(((file_dir.split("/")[-1]).split(".")[-2]).split("_")[-1])


        if(file_info[-1] == "order"): process_order_file(file_dir, target)
        else: process_data_file(file_dir, target)



def main(file_to_read):
    target=file_to_read.split("/")[2]
    file_dir=os.path.abspath(file_to_read)
    getFileInfo(file_dir, target)

if __name__ == "__main__":
    if len(sys.argv) < 2: terminate("Usage: <command> <file_to_plot> <accelerator_target>")
    main(sys.argv[1])
