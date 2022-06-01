import os, csv, sys

x_value=[]
freqs=[]
files = []
file_info = []

def terminate(error_message):
	print(error_message)
	sys.exit()

def getListOfFiles(dirName):
    listOfFile = os.listdir(dirName)
    for entry in listOfFile:
        fullPath = os.path.join(dirName, entry)
        if os.path.isdir(fullPath):
            getListOfFiles(fullPath)
        else:
            files.append(fullPath)

def process(file, baseline_frequency):
    types = {
    "type_0" : "_unsigned",
    "type_1" : "_signed",
    "type_2" : "_fixed-point"
    }
    file_dir = os.path.dirname(os.path.realpath(file))
    os.system("touch ./results/tmp.csv")
    files = os.listdir("./results")
    type = file.split("/")[-3]
    freq_file = os.path.join("./results/", "".join([file_name for file_name in files if types[type] in file_name and 'freqs' in file_name]))
    with open(freq_file, "r") as f:
        csvreader = csv.reader(f)
        first_line=next(csvreader)
        second_line=next(csvreader)
        for row in csvreader:
            freqs.append(float(row[1]))
    f.close()
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
			data_to_write = [str(row_list[0]) + "\t" + str(int(float(row_list[1]) * float(1/baseline_frequency))) + "\t" + str(int(float(row_list[2]) * float(1/freqs[index])))]                 
			csvwriter.writerow(data_to_write)
                        index = index + 1
    out_file.close()
    in_file.close()
    os.system("mv ./results/tmp.csv {}/time_count.csv".format(file_dir))
    del file_info[:]

def main(baseline_frequency):
    dirName='./results'
    getListOfFiles(dirName)
    new_files = [file for file in files if "cycle" in file]
    for file in new_files:
        process(file, baseline_frequency)

if __name__ == "__main__":
    if len(sys.argv) < 2: terminate("Usage: <command> <baseline_frequency>")	
    else: main(float(sys.argv[1]))
