#!/usr/bin/python

import csv, re, os

files=[]
order=[]
data=[]
baseline_power_values=[]
accel_power_values=[]

def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    for entry in listOfFile:
        fullPath = os.path.join(dirName, entry)
        if os.path.isdir(fullPath):
            getListOfFiles(fullPath)
        else:
            files.append(fullPath)

def get_values(power_file):
    with open(power_file, "r") as f:
        csvreader=csv.reader(f)
        _=next(csvreader)
        line=next(csvreader)
        if "@data=" in line:
            data.append(re.search(r'[0-9]+', row[0]).group())
        for row in csvreader:
		row_list=row[0].split("\t")            
		if "@data=" in row_list[0]:
                	data.append(re.search(r'[0-9]+', row_list[0]).group())
                	del order[:]
            	else:
                	order.append(row_list[0])
                	baseline_power_values.append(float(row_list[1]))
                	accel_power_values.append(float(row_list[2]))
    f.close()

def process_files(time_file, power_file, data_type):
    with open(time_file, "r") as time_f:
        with open(power_file, "r") as power_f:
            with open("./results/energy/energy_count_{}_order.csv".format(data_type), "w") as out_f:
                time_reader=csv.reader(time_f)
                power_reader=csv.reader(power_f)
                _=next(time_reader)
                line=next(time_reader)
                out_f.write("### {} ENERGY VALUES ###\n".format(data_type))
                out_f.write(line[0]+"\n")
                count=0
                val_count=0
                for row in time_reader:
                    row_list=row[0].split("\t")
                    if "@data=" not in row_list[0] and count < len(order):
                        curr_order=row_list[0]
                        baseline_energy=int(row_list[1]) * baseline_power_values[val_count]
                        accel_energy=int(row_list[2]) * accel_power_values[val_count]
                        count = count + 1
                        val_count=val_count + 1
                        out_f.write("{}\t{}\t{}\n".format(curr_order, baseline_energy, accel_energy))
                    elif "@data=" in row[0]:
                        out_f.write(row[0]+"\n")
                        count=0
            out_f.close()
        power_f.close()
    time_f.close()



def main():
    data_types=["unsigned", "signed", "fixed_point"]
    time_dir="./results/timing/optimization_-O3"
    power_dir="./results/power"
    for data_type in data_types:
        getListOfFiles(time_dir + "/type_{}".format(data_type))
        time_file = [file for file in files if "time_count_order" in file and data_type in file]
        del files[:]
        getListOfFiles(power_dir + "/type_{}".format(data_type))
        power_file = [file for file in files if "power_count_order" in file and data_type in file]
        get_values(power_file[0])
        del files[:]
        process_files(time_file[0], power_file[0], data_type)
        del baseline_power_values[:]
        del accel_power_values[:]

if __name__ == "__main__": main()
