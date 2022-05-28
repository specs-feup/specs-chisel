#!/usr/bin/python

import os, sys

def terminate(error_message):
	print(error_message)
	exit(1)


def main(file_to_read):
	with open(file_to_read, "r") as f:
		



if __name__ == "__main__":
	if len(sys.argv) < 2: terminate("Usage: <command> <file_to_process>")
	else: main(sys.argv[1])	
