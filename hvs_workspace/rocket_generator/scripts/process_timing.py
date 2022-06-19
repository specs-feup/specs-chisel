#!/usr/bin/python
import os, csv, sys

x_value=[]
freqs=[]
files = []
file_info = []

def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    for entry in listOfFile:
        fullPath = os.path.join(dirName, entry)
        if os.path.isdir(fullPath):
            getListOfFiles(fullPath)
        else:
            files.append(fullPath)

def process_data(baseline_frequency, file_dir, file, target):
    index = 0
    with open("./accelerators/{}/results/tmp.csv".format(target), "w") as out_file:
        	with open(file, "r") as in_file:
            		csvreader = csv.reader(in_file)
            		csvwriter = csv.writer(out_file)
            		for count, row in enumerate(csvreader):
                	    row_list = row[0].split("\t")
                	    if count < 2:
                    	      csvwriter.writerow(row)
                	    else:
                              if "BASELINE" in row_list:
                                index = index + 1
                        	csvwriter.writerow(row)
                    	      else:
				baseline_time=str(int(float(row_list[1]) * float(1/baseline_frequency)))
				accelerated_time=str(int(float(row_list[2]) * float(1/freqs[index])))
				out_file.write("{}\t{}\t{}\n".format(str(row_list[0]), baseline_time, accelerated_time))
    out_file.close()
    in_file.close()
    os.system("mv ./accelerators/{}/results/tmp.csv {}/time_count_{}.csv".format(target, file_dir, (file.split("_")[-1]).split(".")[-2]))
    del file_info[:]


def process_order(baseline_frequency, file_dir, file, target):
    index = 0
    with open("./accelerators/{}/results/tmp.csv".format(target), "w") as out_file:
        	with open(file, "r") as in_file:
            		csvreader = csv.reader(in_file)
            		csvwriter = csv.writer(out_file)
            		for count, row in enumerate(csvreader):
                		row_list = row[0].split("\t")
                		if count < 2:
                    			csvwriter.writerow(row)
                		else:
                    			if "BASELINE" in row_list:
                        			index = 0
                        			csvwriter.writerow(row)
                    			else:
						baseline_time=str(int(float(row_list[1]) * float(1/baseline_frequency)))
						accelerated_time=str(int(float(row_list[2]) * float(1/freqs[index])))
						out_file.write("{}\t{}\t{}\n".format(str(row_list[0]), baseline_time, accelerated_time))
						#csvwriter.writerow(("{}\t{}\t{}".format(str(row_list[0]), baseline_time, accelerated_time)).split("\t"))
                        			index = index + 1
    out_file.close()
    in_file.close()
    os.system("mv ./accelerators/{}/results/tmp.csv {}/time_count_{}.csv".format(target, file_dir, (file.split("_")[-1]).split(".")[-2]))
    del file_info[:]



def process(file, target):
    file_dir = os.path.dirname(os.path.realpath(file))
    os.system("touch ./accelerators/{}/results/tmp.csv".format(target))
    files = os.listdir("./accelerators/{}/results".format(target))
    data_type = "_" + (file.split("/")[-2]).split("_")[-1]
    freq_file = os.path.join("./accelerators/{}/results/".format(target), "".join([file_name for file_name in files if data_type in file_name and 'freqs' in file_name]))
    if freq_file != "./accelerators/{}/results/".format(target):   	
	with open(freq_file, "r") as f:
    	    csvreader = csv.reader(f)
    	    first_line=next(csvreader)
    	    second_line=next(csvreader)
	    row_list=next(csvreader)[0].split("\t")
            baseline_frequency = float(row_list[1])
       	    for row in csvreader:
	   	row_list=row[0].split("\t")
            	freqs.append(float(row_list[1]))
    	f.close()
    	if "order" in file: process_order(baseline_frequency, file_dir, file, target)
    	elif "data" in file: process_data(baseline_frequency, file_dir, file, target)


def main(target):
    dirName='./accelerators/{}/results'.format(target)
    getListOfFiles(dirName)
    new_files = [file for file in files if "cycle" in file]
    for file in new_files:
        process(file, target)

if __name__ == "__main__":
	if len(sys.argv) < 2:
		print "Usage <command> <accelerator_target>"
		sys.exit(1) 	
	main(sys.argv[1])
