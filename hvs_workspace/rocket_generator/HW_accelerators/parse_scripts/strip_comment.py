#!/usr/bin/env python3

import os, sys
out = ""
if len(sys.argv) < 2:
    print("Usage: <Command> <file_to_parse>\n")
else:
    for i in range(1, len(sys.argv)):
        with open(sys.argv[i], 'r') as fp:
            lines = fp.readlines()
            for idx, line in enumerate(lines):
                end = line.find(" // @[")
                line = line[:end] + '\n'
                out += line
        with open(sys.argv[i], 'w') as fp:
            fp.write(out)
        fp.close()
        out = ""
