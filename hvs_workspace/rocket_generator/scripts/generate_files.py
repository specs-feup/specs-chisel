#!/usr/bin/python

import csv, os, re, subprocess

files = []
order=[]
data=[]
power_order=[]
power_data=[]
baseline=[]
accelerated=[]

def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    for entry in listOfFile:
        fullPath = os.path.join(dirName, entry)
        if os.path.isdir(fullPath):
            getListOfFiles(fullPath)
        else:
            files.append(fullPath)

def get_values(file_dir):
    with open(file_dir, "r") as f:
        csvreader=csv.reader(f)
        _ =next(csvreader)
        for row in csvreader:
            row_list=row[0].split("\t")
            if "BASELINE" in row_list:
                data.append(re.search(r'\d+', row_list[0]).group())
                del order[:]
            else:
                order.append(row_list[0])
    f.close()


def get_power_values(file_dir):
    with open(file_dir, "r") as f:
        csvreader=csv.reader(f)
        _ =next(csvreader)
        for row in csvreader:
            row_list=row[0].split("\t")
            if "BASELINE" in row_list:
                power_data.append(re.search(r'\d+', row_list[0]).group())
                del power_order[:]
            else:
                power_order.append(row_list[0])
    f.close()


def reorganize_values(file_dir):
    with open(file_dir, "r") as f:
        csvreader=csv.reader(f)
        for o in order:
            for row in csvreader:
                row_list=row[0].split("\t")
                if o == row_list[0]:
                    baseline.append(row_list[1])
                    accelerated.append(row_list[2])
            f.seek(0)
    f.close()

def process_x_data(file_dir, file_type):
    with open(file_dir, "r") as in_file:
        with open(os.path.dirname(file_dir) + "/" + "{}_data.csv".format(file_type), "w") as out_file:
            csvreader = csv.reader(in_file)
            csvwriter=csv.writer(out_file)
            first_line = next(csvreader)
            csvwriter.writerow(first_line)
            csvwriter.writerow("DATA(@order={})\tBASELINE\tACCELERATOR".format(order[0]).split('\t'))
            index = 0
            data_index = 0
            order_index = 1
            while index < len(baseline):
                if data_index == len(data):
                    data_index = 0
		    out_file.write("DATA(@order={})\tBASELINE\tACCELERATOR\n".format(order[order_index]))
                    order_index = order_index + 1
                else:
		    out_file.write("{}\t{}\t{}\n".format(str(data[data_index]), str(baseline[index]), str(accelerated[index])))
                    data_index = data_index + 1
                    index = index + 1
        out_file.close()
    in_file.close()



def process_x_power_data(file_dir, file_type):
    with open(file_dir, "r") as in_file:
        with open(os.path.dirname(file_dir) + "/" + "{}_data.csv".format(file_type), "w") as out_file:
            csvreader = csv.reader(in_file)
            csvwriter=csv.writer(out_file)
            first_line = next(csvreader)
            csvwriter.writerow(first_line)
            csvwriter.writerow("DATA(@order={})\tBASELINE\tACCELERATOR".format(power_order[0]).split('\t'))
            index = 0
            data_index = 0
            order_index = 1
            while index < len(baseline):
                if data_index == len(power_data):
                    data_index = 0
		    out_file.write("DATA(@order={})\tBASELINE\tACCELERATOR\n".format(power_order[order_index]))
                    order_index = order_index + 1
                else:
		    out_file.write("{}\t{}\t{}\n".format(str(power_data[data_index]), str(baseline[index]), str(accelerated[index])))
                    data_index = data_index + 1
                    index = index + 1
        out_file.close()
    in_file.close()




def main():
    dirName='./results'
    getListOfFiles(dirName)
    new_files = [file for file in files if "cycle_count_order" in file or "power_count_order" in file or "energy_count" in file and "order" in file]
    get_values([file for file in new_files if "energy_count" not in file][0])
    get_power_values([file for file in new_files if "energy_count" in file][0])
    for file in new_files:
        reorganize_values(file)
	if "power_count" in file: process_x_data(file, "power_count")
	elif "cycle_count" in file: process_x_data(file, "cycle_count")
	else:
		if "unsigned" in file: process_x_power_data(file, "energy_count_unsigned")
		elif "signed" in file: process_x_power_data(file, "energy_count_signed")
		elif "fixed_point" in file: process_x_power_data(file, "energy_count_fixed_point")
		else: print "Invalid energy data type"

        del baseline[:]
        del accelerated[:]


if __name__ == "__main__": main()
