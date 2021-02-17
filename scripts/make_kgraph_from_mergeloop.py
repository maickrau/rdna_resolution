#!/usr/bin/python

import sys

k = int(sys.argv[1])
min_coverage = int(sys.argv[2])
# graph from stdin

kmer_coverage = {}
read_kmer_paths = []
edge_coverage = {}
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] != 'P': continue
	readname = parts[1]
	path = parts[2].replace("+","").split(',')
	kmer_path = []
	for i in range(0, len(path)-k+1):
		kmer = "v".join(path[i:i+k])
		if kmer not in kmer_coverage: kmer_coverage[kmer] = 0
		kmer_coverage[kmer] += 1
		kmer_path.append(kmer)
	for i in range(0, len(kmer_path)-1):
		edgemer = (kmer_path[i], kmer_path[i+1])
		if edgemer not in edge_coverage: edge_coverage[edgemer] = 0
		edge_coverage[edgemer] += 1
	read_kmer_paths.append((readname, kmer_path))

for kmer in kmer_coverage:
	if kmer_coverage[kmer] < min_coverage: continue
	print("S\t" + kmer + "\t*\tLN:i:1\tFC:i:" + str(kmer_coverage[kmer]))

for edge in edge_coverage:
	if edge_coverage[edge] < min_coverage: continue
	print("L\t" + edge[0] + "\t+\t" + edge[1] + "\t+\t0M\trc:i:" + str(edge_coverage[edge]))
