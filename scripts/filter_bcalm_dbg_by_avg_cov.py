#!/usr/bin/python

import sys

min_coverage = float(sys.argv[1])
# contigs from stdin
# contigs to stdout

printing = True
for l in sys.stdin:
	if l[0] == '>':
		parts = l.strip().split(' ')
		for part in parts:
			if len(part) > len("km:f:"):
				if part[0:len("km:f:")] == "km:f:":
					avg_coverage = float(part[len("km:f:"):])
					printing = avg_coverage >= min_coverage
	if printing:
		print(l.strip())
