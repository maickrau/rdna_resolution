#!/usr/bin/python

import sys

first_csv_file = sys.argv[1]
second_csv_file = sys.argv[2]

first_coverages = {}
with open(first_csv_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == "node": continue
		first_coverages[parts[0]] = parts[2]

print("node\tfirst\tsecond")
with open(second_csv_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == "node": continue
		print(parts[0] + "\t" + first_coverages[parts[0]] + "\t" + parts[2])
