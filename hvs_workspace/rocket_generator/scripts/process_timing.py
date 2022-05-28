#!/usr/bin/python

import sys, re, os

SELECTED_PERIOD = 5 #Depends on selected freq

def terminate(error_message):
	print(error_message)
	exit(1)
	
def find_slack(file_to_read):
	lines_to_process = []
	with open(file_to_read, "r") as f:
    		while f.next().strip() != 'Max Delay Paths':
        		continue
    		for _ in range(3):
        		lines_to_process.append(f.next().strip())	
        slack_string = re.search(r'-?([.\d]+)\s*(?:ns)', "".join(lines_to_process)).group()	
	return float(slack_string[:-2])


def read_files(checkpoint_dir):
	impl_files = []
	files = os.listdir(checkpoint_dir)
	for file in files:
		if "post_impl" in file: 
			impl_files.append(file)
	impl_files.sort(key=lambda x : int(''.join(filter(str.isdigit, x))))
	return impl_files
		

def main(checkpoint_dir):
	impl_files_list = read_files(checkpoint_dir)
	for impl_file in impl_files_list:
		file_path=""
		file_path = "".join(checkpoint_dir + "/" + str(impl_file))
		max_delay_slack = find_slack(file_path)
		filter_order = re.search(r'\d+', file_path).group()		
		max_freq=(1/(SELECTED_PERIOD - max_delay_slack)) * 1000 #In MHz 
		print(filter_order + "\t" + str(max_freq))	
	
	#max_delay_slack = find_slack(file_to_read)
	#filter_order = re.search(r'\d+', file_to_read).group()		
	#max_freq=(1/(SELECTED_PERIOD - max_delay_slack)) * 1000 #In MHz 
	#print(filter_order + "\t" + str(max_freq) + "\n")
		
if __name__ == "__main__":
	if len(sys.argv) < 2: terminate("Usage: <command> <checkpoint_directory>")
	#elif sys.argv[1][-4:] != ".rpt": terminate("Wrong file format (must be .rpt)")
	else: main(sys.argv[1])	
