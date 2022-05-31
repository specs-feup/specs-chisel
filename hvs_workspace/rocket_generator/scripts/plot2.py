import sys, os, csv, re, matplotlib.pyplot as plt

file_info=[]
order=[]
data=[]
freqs=[]
accel_values=[]
baseline_values=[]
speedup=[]
time_baseline=[]
time_accel=[]

types = {
    "type_0" : "unsigned",
    "type_1" : "signed",
    "type_2" : "fixed_point"
}

def terminate(error_message):
    print(error_message)
    sys.exit()

def get_freqs_data(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        _ = next(csvreader)
        for row in csvreader:
            order.append(int(row[0]))
            freqs.append(float(row[1]))
    f.close()

def plot_graph(values, y_value):
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
    		plt.savefig("./results/{}_cycles.png".format("_".join(file_info)), bbox_inches='tight')

    		fig, ax = plt.subplots()
    		ax.plot(values, speedup, "--o")
    		ax.set_xlabel('Filter order')
    		ax.set_ylabel('Speedup')
    		ax.grid(True)
    		plt.ylim(0, 1000)
    		plt.savefig("./results/{}_speedup_cycles.png".format("_".join(file_info)), bbox_inches='tight')

        elif y_value == "freq":
		fig, ax = plt.subplots()
    		accel = ax.plot(order, values, "--o")
    		ax.grid(True)
    		plt.savefig("./results/max_freqs_{}.png".format("_".join(file_info[1])), bbox_inches='tight')

        elif y_value == "time":
            fig, ax = plt.subplots()
            baseline = ax.plot(values, baseline_values, "--o", label='Baseline')
            accel = ax.plot(values, accel_values, "--o", label='Accelerated')
            plt.yscale('log')
            handles, labels = ax.get_legend_handles_labels()
            ax.legend(handles, labels)
            ax.set_xlabel('Filter order')
            ax.set_ylabel('Performance (in seconds)')
            ax.grid(True)
            plt.savefig("./results/{}_time.png".format("_".join(file_info)), bbox_inches='tight')

            fig, ax = plt.subplots()
            ax.plot(values, speedup, "--o")
            ax.set_xlabel('Filter order')
            ax.set_ylabel('Speedup')
            ax.grid(True)
            plt.ylim(0, 1000)
            plt.savefig("./results/{}_speedup_time.png".format("_".join(file_info)), bbox_inches='tight')

        else:
          terminate("Invalid y values")
        del file_info[-1]
        del order[:]
        del data[:]
        del baseline_values[:]
        del accel_values[:]
        del speedup[:]

def process_order_file(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        second_line = next(csvreader)
        file_info.append("@data={}".format(re.search(r'\d+', second_line[0]).group()))
        for row in csvreader:
            row_list=row[0].split("\t")
            if "ORDER" in row_list[0]:
                if file_info[1] == "cycle": plot_graph(order, "cycle")
                else: plot_graph(order, "time")
                file_info.append("@data={}".format(re.search(r'\d+', row_list[0]).group()))
            else:
                order.append(int(row_list[0]))
                baseline_values.append(int(row_list[1]))
                accel_values.append(int(row_list[2]))
                speedup.append(int(int(row_list[1])/int(row_list[2])))
    if file_info[1] == "cycle": plot_graph(order, "cycle")
    else: plot_graph(order, "time")
    f.close()



def process_data_file(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        second_line = next(csvreader)
        file_info.append("@order={}".format(re.search(r'\d+', second_line[0]).group()))
        for row in csvreader:
            row_list=row[0].split("\t")
            if "DATA" in row_list[0]:
                if file_info[1] == "cycle": plot_graph(data, "cycle")
                else: plot_graph(data, "time")
                file_info.append("@order={}".format(re.search(r'\d+', row_list[0]).group()))
            else:
                data.append(int(row_list[0]))
                baseline_values.append(int(row_list[1]))
                accel_values.append(int(row_list[2]))
                speedup.append(int(int(row_list[1])/int(row_list[2])))
    if file_info[1] == "cycle": plot_graph(data, "cycle")
    else: plot_graph(data, "time")
    f.close()

def get_data(file_dir):
    with open(file_dir, "r") as f:
        csvreader = csv.reader(f)
        _ = next(csvreader)
        if file_info[-2] == "x_order": file_info.append("@data={}".format(re.search(r'\d+', line[0]).group()))
        else: file_info.append("@order={}".format(re.search(r'\d+', line[0]).group()))
        for row in csvreader:
            row_list=row[0].split("\t")
            x_values.append(row_list[0])
            accel_values.append(row_list[1])
            baseline_values.append(row_list[2])


def getFileInfo(file_dir):

    if "freqs" in file_dir:
        if(types.keys()[types.values().index("unsigned")] in file_dir): file_info.append("unsigned")
        elif(types.keys()[types.values().index("signed")]  in file_dir): file_info.append("signed")
        elif(types.keys()[types.values().index("fixed_point")] in file_dir): file_info.append("fixed_point")
        else: terminate("freqs file must be either unsigned, signed or fixed_point")
        get_freqs_data(file_dir)
        plot_graph(freqs, "freq")
    else:
        if("no_optimization" in file_dir): file_info.append("no_optimization")
        elif("optimization" in file_dir): file_info("optimization")
        else: terminate("Invalid directory")

        if("cycle" in file_dir): file_info.append("cycle")
        elif("time" in file_dir): file_info.append("time")
        else: terminate("Invalid type of file (freqs, cycle or time)")

        file_info.append(types[(file_dir.split("/")[-3])])

        if("x_order" in file_dir): file_info.append("order")
        elif("x_data" in file_dir): file_info.append("data")
        else: terminate("Invalid x value")

        if(file_info[-1] == "order"): process_order_file(file_dir)
        else: process_data_file(file_dir)



def main(file_to_read):
    file_dir=os.path.abspath(file_to_read)
    getFileInfo(file_dir)

if __name__ == "__main__":
    if len(sys.argv) < 2: terminate("Usage: <command> <file_to_plot>")
    main(sys.argv[1])
