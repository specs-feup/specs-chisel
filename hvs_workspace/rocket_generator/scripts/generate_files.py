#!/usr/bin/python

import csv, os, re, subprocess, sys

files = []
order=[]
data=[]
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

def reorganize_values(file_dir):
    with open(file_dir, "r") as f:
        csvreader=csv.reader(f)
        for o in order:
            for row in csvreader:
                row_list=row[0].split("\t")
                if o == row_list[0]:
                    baseline.append(int(row_list[1]))
                    accelerated.append(int(row_list[2]))
            f.seek(0)
    f.close()

def process_x_data(file_dir):
    with open(file_dir, "r") as in_file:
        with open(os.path.dirname(file_dir) + "/" + "cycle_count_data.csv", "w") as out_file:
            csvreader = csv.reader(in_file)
            csvwriter=csv.writer(out_file)
            first_line = next(csvreader)
            csvwriter.writerow(first_line)
            csvwriter.writerow("DATA(@order={})\tBASELINE\tACCELERATOR".format(order[0]).split('\t'))
            index = 0
            data_index = 0
            order_index = 1
            while index < len(baseline):
                if data_index == len(data) and order_index < len(order):
                    data_index = 0
		    out_file.write("DATA(@order={})\tBASELINE\tACCELERATOR\n".format(order[order_index]))
                    order_index = order_index + 1
                else:
		    out_file.write("{}\t{}\t{}\n".format(str(data[data_index]), str(baseline[index]), str(accelerated[index])))
                    data_index = data_index + 1
                    index = index + 1
        out_file.close()
    in_file.close()



def main(target):
    dirName='./accelerators/{}/results'.format(target)
    getListOfFiles(dirName)
    new_files = [file for file in files if "cycle" in file and "data" not in file]
    get_values(new_files[0])
    for file in new_files:
        reorganize_values(file)
        process_x_data(file)
        del baseline[:]
        del accelerated[:]


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: <command> <target>")
        sys.exit(1)
    main(sys.argv[1])
