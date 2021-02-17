#!/usr/bin/python

import sys

allowed_paths_file = sys.argv[1]
# read paths from stdin, format: name 123_A,234_T


path_alleles = []
path_positions = []
with open(allowed_paths_file) as f:
	for l in f:
		path_alleles.append(set(l.strip().split(',')))
		path_positions.append(set(n.split("_")[0] for n in l.strip().split(',')))

reads_per_allele = {}

for l in sys.stdin:
	path = l.strip().split('\t')[1].split(',')
	read = l.strip().split('\t')[0]
	for i in range(0, len(path_alleles)):
		overlap_size = 0
		has_conflict = False
		for n in path:
			if n.split('_')[0] not in path_positions[i]:
				continue
			overlap_size += 1
			if n not in path_alleles[i]: has_conflict = True
		if has_conflict:
			continue
		if overlap_size < len(path_alleles[i]):
			continue
		if i not in reads_per_allele: reads_per_allele[i] = set()
		reads_per_allele[i].add(read)

for i in range(0, len(path_alleles)):
	if i not in reads_per_allele: continue
	with open("hifi_allele" + str(i) + ".txt", "w") as f:
		for read in reads_per_allele[i]:
			f.write(read.strip() + "\n")

