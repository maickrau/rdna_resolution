#!/usr/bin/python

import sys

snpmer_keys_file = sys.argv[1]
min_edge_coverage = int(sys.argv[2])
stride = int(sys.argv[3])
# read snp paths from stdin
# graph to stdout

snpmer_coverages = {}
snpmer_name_mapping = {}
with open(snpmer_keys_file) as f:
	for l in f:
		parts = l.strip().split(',')
		start_pos = int(parts[0].split('_')[0])
		key = "-".join(tuple(l.strip().split(',')))
		snpmer_name_mapping[tuple(parts[1:-1])] = key
		snpmer_coverages[key] = 0

edge_coverages = {}
read_paths = []

for l in sys.stdin:
	path = l.strip().split('\t')[1].split(',')
	readname = l.strip().split('\t')[0]
	snpmer_path = []
	for i in range(0, len(path)):
		for j in range(0, len(path)):
			key = path[i:i+j]
			if i+j > len(path):
				key += path[:i+j-len(path)]
			key = tuple(key)
			if key in snpmer_name_mapping:
				snpmer_path.append(snpmer_name_mapping[key])
	for i in range(0, len(snpmer_path)):
		assert snpmer_path[i] in snpmer_coverages
		snpmer_coverages[snpmer_path[i]] += 1
	for i in range(1, len(snpmer_path)):
		fromkey = snpmer_path[i-1]
		tokey = snpmer_path[i]
		if (fromkey, tokey) not in edge_coverages: edge_coverages[(fromkey, tokey)] = 0
		edge_coverages[(fromkey, tokey)] += 1
	read_paths.append((readname, snpmer_path))

for key in snpmer_coverages:
	print("S\t" + key + "\t*\tLN:i:1\tKC:i:" + str(snpmer_coverages[key]))
for edge in edge_coverages:
	if edge_coverages[edge] < min_edge_coverage: continue
	print("L\t" + edge[0] + "\t+\t" + edge[1] + "\t+\t0M")
for (read, path) in read_paths:
	print("P\t" + read + "\t" + ",".join(key + "+" for key in path) + "\t" + ",".join("*" for key in path))
