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

def process_data(baseline_frequency, file_dir, file):
    index = 0
    with open("./results/tmp.csv", "w") as out_file:
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
				print freqs[index]
                                print row_list[1]
				print row_list[2]
				accelerated_time=str(int(float(row_list[2]) * float(1/freqs[index])))
				print baseline_time
 				print accelerated_time
				out_file.write("{}\t{}\t{}\n".format(str(row_list[0]), baseline_time, accelerated_time))
				#csvwriter.writerow(("{}\t{}\t{}".format(str(row_list[0]), baseline_time, accelerated_time)).split("\t"))
    out_file.close()
    in_file.close()
    os.system("mv ./results/tmp.csv {}/time_count_{}.csv".format(file_dir, (file.split("_")[-1]).split(".")[-2]))
    del file_info[:]


def process_order(baseline_frequency, file_dir, file):
    index = 0
    with open("./results/tmp.csv", "w") as out_file:
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
    os.system("mv ./results/tmp.csv {}/time_count_{}.csv".format(file_dir, (file.split("_")[-1]).split(".")[-2]))
    del file_info[:]



def process(file):
    file_dir = os.path.dirname(os.path.realpath(file))
    os.system("touch ./results/tmp.csv")
    files = os.listdir("./results")
    data_type = "_" + (file.split("/")[-2]).split("_")[-1]
    freq_file = os.path.join("./results/", "".join([file_name for file_name in files if data_type in file_name and 'freqs' in file_name]))
    if freq_file != "./results/":
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
    	if "order" in file: process_order(baseline_frequency, file_dir, file)
    	elif "data" in file: process_data(baseline_frequency, file_dir, file)


def main():
    dirName='./results'
    getListOfFiles(dirName)
    new_files = [file for file in files if "cycle" in file]
    for file in new_files:
        process(file)

if __name__ == "__main__":main()
