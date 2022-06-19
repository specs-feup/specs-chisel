#!/usr/bin/python
import sys, os, csv, re

file_info=[]

def terminate(error_message):
    print(error_message)
    sys.exit(1)

def get_selected_period(selected_frequency):
	return float((1/float(selected_frequency)) * 1000)

def parse_file_info(file):
    file_info.append(((file.split("/")[-1]).split(".")[-2]).split("_")[-2])
    file_info.append(((file.split("/")[-1]).split(".")[-2]).split("_")[-1])

def find_timing_info(file):
    lines_to_process=[]
    with open(file, "r") as f:
        while f.next().strip() != '| Design Timing Summary':
            continue
        for _ in range(8):
            lines_to_process.append(f.next().strip())
    f.close()
    slack_string = re.search(r'-?([.\d]+)\s*', "".join(lines_to_process)).group()
    return float(slack_string[:-2])

def find_power_info(file):
    lines_to_process=[]
    with open(file, "r") as f:
        while f.next().strip() != '| Name                   | Power (W) |':
            continue
        for _ in range(7):
            lines_to_process.append(f.next().strip())
    f.close()
    design_power = re.search(r'([.\d]+)\s*', "".join(lines_to_process)).group()
    return design_power

def find_utilisation_info(file):
    relevant_info=["Slice LUTs", "Slice Registers", "Block RAM Tile", "DSPs"]
    resources=[]
    with open(file, "r") as f:
        for info in relevant_info:
            lines=f.readlines()
            for line in lines:
                if info in line:
                    resources.append((re.search(r'([.\d]+)\s*', line)).group())
                    f.seek(0)
                    break
    f.close()
    return resources

def output_to_freq(file, selected_frequency, target):
    max_delay_slack=find_timing_info(file)
    max_freq=(1/(get_selected_period(selected_frequency) - max_delay_slack)) * 1000 #In MHz
    with open("./accelerators/{}/results/max_freqs_{}.csv".format(target, file_info[0]), "a") as output_file:
        output_file.write(("{}\t{}\n".format(file_info[1], str(max_freq))))
    output_file.close()

def output_to_utilisation(file, target):
    resources = find_utilisation_info(file)
    with open("./accelerators/{}/results/utilisation_{}.csv".format(target, file_info[0]), "a") as output_file:
        output_file.write("{}\t{}\t{}\t{}\t{}\n".format(file_info[1], resources[0], resources[1], resources[2], resources[3]))
    output_file.close()

def output_to_power(file, target):
    design_power = find_power_info(file)
    with open("./accelerators/{}/results/power_{}.csv".format(target, file_info[0]), "a") as output_file:
        output_file.write("{}\t{}\n".format(int(file_info[1]), design_power))
    output_file.close()

def create_headers(target, data_types):
    file_types=["max_freqs", "power", "utilisation"]
    for file_type in file_types:
        for data_type in data_types:
            with open("./accelerators/{}/results/{}_{}.csv".format(target,file_type, data_type), "w") as f:
                f.write("### {} {} file ###\n".format(file_type, data_type))
                if file_type == "max_freqs": f.write("ORDER\tMAX_FREQS\n")
                elif file_type == "power": f.write("ORDER\tPOWER\n")
                else: f.write("ORDER\tLUTS\tREGISTERS\tDSPs\tBRAM\n")
            f.close()

def main(selected_frequency, target):
    files=[]
    data_types=[]
    dirName='./checkpoints'
    files = [dirName + '/' + entry for entry in os.listdir(dirName)]
    for file in files:
	data_type=((file.split("/")[-1]).split(".")[-2]).split("_")[-2]
	if data_type not in data_types:
		data_types.append(data_type)
    timing_files = sorted([file for file in files if "timing" in file], key=lambda x: int((x.split("_")[-1]).split(".")[-2]))
    power_files = sorted([file for file in files if "power" in file], key=lambda x: int((x.split("_")[-1]).split(".")[-2]))
    utilisation_files = sorted([file for file in files if "utilisation" in file or "utilization" in file], key=lambda x: int((x.split("_")[-1]).split(".")[-2]))
    create_headers(target, data_types)
    for timing_file in timing_files:
		parse_file_info(timing_file)
		output_to_freq(timing_file, selected_frequency, target)
		del file_info[:]
    for power_file in power_files:
		parse_file_info(power_file)
                output_to_power(power_file, target)
		del file_info[:]
    for utilisation_file in utilisation_files:
		parse_file_info(utilisation_file)
		output_to_utilisation(utilisation_file, target)
		del file_info[:]

if __name__ == "__main__":
    if len(sys.argv) < 3: terminate("Usage: <command> <selected_frequency> <accelerator target>") 
    main(sys.argv[1], sys.argv[2])
