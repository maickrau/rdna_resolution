#!/usr/bin/python

import sys

# snp groups from sys.argv, eg ./get_snpmatch_paths.py snp_groups/snp_*.txt
# must be snp_123_A.txt
# paths to stdout

read_snp_groups = {}
positions = set()

for file in sys.argv[1:]:
	filename = file.split('/')[-1]
	name = filename.split('.')[0]
	index = int(name.split('_')[1])
	allele = name.split('_')[2]
	positions.add(index)
	with open(file) as f:
		for l in f:
			readname = l.strip()
			if readname not in read_snp_groups: read_snp_groups[readname] = set()
			read_snp_groups[readname].add((index, allele))

sorted_positions = list(positions)
sorted_positions.sort()

for read in read_snp_groups:
	path = list(read_snp_groups[read])
	path.sort(key=lambda x: x[0])
	if path[0][0] == sorted_positions[0] and path[-1][0] == sorted_positions[-1]:
		for i in range(0, len(sorted_positions)):
			if path[i][0] != sorted_positions[i]:
				path = path[i:] + path[:i]
				break
	print(read + "\t" + ",".join(str(c[0]) + "_" + c[1] for c in path))
