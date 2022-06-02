#!/usr/bin/python

import sys, os, re, csv

def terminate(error_message):
	print(error_message)
	exit(1)

def get_selected_period(selected_frequency):
	return float((1/float(selected_frequency)) * 1000)

def find_slack(order):
	lines_to_process=[]
	with open("./checkpoints/post_impl_{}.rpt".format(order), "r") as f:
		while f.next().strip() != '| Design Timing Summary':		
			continue
		for _ in range(8):
			lines_to_process.append(f.next().strip())
	f.close()
	slack_string = re.search(r'-?([.\d]+)\s*', "".join(lines_to_process)).group()
	return float(slack_string[:-2])

def main(filter_order, selected_frequency):
	max_delay_slack = find_slack(filter_order)
	max_freq=(1/(get_selected_period(selected_frequency) - max_delay_slack)) * 1000 #In MHz
	print(filter_order + "\t" + str(max_freq))

if __name__ == "__main__":
	if len(sys.argv) < 3: terminate("Usage: <Command> <order> <selected_frequency>")
	else: main(sys.argv[1], sys.argv[2])
