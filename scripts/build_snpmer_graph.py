#!/usr/bin/python

import sys

snpmer_keys_file = sys.argv[1]
min_edge_coverage = int(sys.argv[2])
# read snp paths from stdin
# graph to stdout

snpmer_keys = set()
snpmer_coverages = {}
with open(snpmer_keys_file) as f:
	for l in f:
		key = "-".join(tuple(l.strip().split(',')))
		snpmer_keys.add(key)
		snpmer_coverages[key] = 0

edge_coverages = {}
read_paths = []

for l in sys.stdin:
	path = l.strip().split('\t')[1].split(',')
	snpmer_path = []
	readname = l.strip().split('\t')[0]
	for i in range(0, len(path)):
		for j in range(i, len(path)):
			key = "-".join(tuple(path[i:j+1]))
			if key in snpmer_keys:
				snpmer_path.append(key)
	for i in range(0, len(snpmer_path)):
		assert snpmer_path[i] in snpmer_coverages
		snpmer_coverages[snpmer_path[i]] += 1
	for i in range(1, len(snpmer_path)):
		fromkey = snpmer_path[i-1]
		tokey = snpmer_path[i]
		if (fromkey, tokey) not in edge_coverages: edge_coverages[(fromkey, tokey)] = 0
		edge_coverages[(fromkey, tokey)] += 1
	read_paths.append((readname, snpmer_path))

for key in snpmer_keys:
	print("S\t" + key + "\t*\tLN:i:1\tKC:i:" + str(snpmer_coverages[key]))
for edge in edge_coverages:
	if edge_coverages[edge] < min_edge_coverage: continue
	print("L\t" + edge[0] + "\t+\t" + edge[1] + "\t+\t0M")
for (read, path) in read_paths:
	print("P\t" + read + "\t" + ",".join(key + "+" for key in path) + "\t" + ",".join("*" for key in path))
