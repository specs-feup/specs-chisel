#!usr/bin/python
import sys, os, csv, re

files=[]
file_info=[]
SELECTED_FREQUENCY=200.0


def terminate(error_message):
    print(error_message)
    sys.exit(1)

def get_selected_period(selected_frequency):
	return float((1/float(SELECTED_FREQUENCY)) * 1000)

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

def output_to_freq(file):
    max_delay_slack=find_timing_info(file)
    max_freq=(1/(get_selected_period(SELECTED_FREQUENCY) - max_delay_slack)) * 1000 #In MHz
    with open("./results/max_freqs_{}.csv".format(file_info[0]), "a") as output_file:
        csvwriter=csv.writer(output_file)
        csvwriter.writerow("{}\t{}".format(file_info[1], str(max_freq)).split("\t"))
    output_file.close()

def output_to_utilisation(file):
    resources = find_utilisation_info(file)
    with open("./results/utilisation_{}.csv".format(file_info[0]), "a") as output_file:
        csvwriter=csv.writer(output_file)
        csvwriter.writerow(("{}\t{}\t{}\t{}\t{}".format(file_info[1], resources[0], resources[1], resources[2], resources[3])).split("\t"))
    output_file.close()

def output_to_power(file):
    design_power = find_power_info(file)
    with open("./results/power_{}.csv".format(file_info[0]), "a") as output_file:
        csvwriter = csv.writer(output_file)
        csvwriter.writerow("{}\t{}".format(file_info[1], design_power).split("\t"))
    output_file.close()

def process(file):
    parse_file_info(file)
    if "timing" in file: output_to_freq(file)
    elif "utilisation" in file: output_to_utilisation(file)
    elif "power" in file: output_to_power(file)
    else: terminate("Invalid file (all files have to be either power, timing or utilisation rpt files)")

def main():
    dirName='./checkpoints'
    files.append([entry for entry in os.listdir(dirName)])
    #for file in files:
    process("./checkpoints/post_impl_utilisation_unsigned_0.rpt")

if __name__ == "__main__":
    main()
