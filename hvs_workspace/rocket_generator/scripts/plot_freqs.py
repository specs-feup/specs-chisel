import csv, re, os, sys, matplotlib.pyplot as plt

def terminate(error_message):
	print(error_message)
	exit(1)


def plot_freqs(order, freqs):
	fig, ax = plt.subplots()
	ax.plot(order, freqs, "--o")
	ax.set_xlabel('Filter order')
	ax.set_ylabel('Max Freq (MHz)')
	ax.grid(True)
	plt.gca().invert_yaxis()
	plt.savefig("../results/max_freqs.png", bbox_inches='tight')


def main(file_to_read):
	order=[]
	freqs=[]
	with open(file_to_read, "r") as f:
		csvreader=csv.reader(f)
		first_line=next(csvreader)
		second_line=next(csvreader)
		for line in csvreader:
			line_list = line[0].split("\t")
			order.append(int(line_list[0]))
			freqs.append(format(float(line_list[1]),".1f"))
		plot_freqs(order, freqs)		


if __name__ == "__main__":
	if len(sys.argv) < 2: Terminate("Usage: <Command> <csv_file_to_read>")
	else:main(sys.argv[1])
