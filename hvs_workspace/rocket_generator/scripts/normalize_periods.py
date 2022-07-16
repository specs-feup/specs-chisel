#!/usr/bin/python

import csv, os

def calc_period(freq):
	return str(int(1000/freq))	
	

def main():
    data_list=["unsigned", "signed", "fixed_point"]
    os.remove("./results/freqs/normalized_baseline_periods.csv")
    for data_type in data_list:
        with open("./results/freqs/max_freqs_{}.csv".format(data_type), "r") as in_file:
            with open("./results/freqs/normalized_periods_{}.csv".format(data_type), "w") as out_file:
		with open("./results/freqs/normalized_baseline_periods.csv", "a") as out_base_file:
                	csvreader = csv.reader(in_file)
                	_ = next(csvreader)
                	_ = next(csvreader)
                	for row in csvreader:
                    	   row_list=row[0].split("\t")
		   	   if row_list[0] == "0":
		              out_base_file.write(calc_period(float(row_list[1]) - 5.0)+"\n")
		           elif row_list[0] == "500":
			      continue #Ordem 500 e ignorada porque manda abaixo a simulacao pos-implementacao 
			   else:	
                              out_file.write(calc_period(float(row_list[1]) - 5.0)+"\n")

if __name__ == "__main__": main()
