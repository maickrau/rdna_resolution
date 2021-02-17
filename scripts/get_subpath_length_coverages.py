#!/usr/bin/python

import sys

graph_file = sys.argv[1]
# gaf from stdin

node_lens = {}
with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_lens[parts[1]] = len(parts[2])

subpath_coverage = {}

for l in sys.stdin:
	parts = l.strip().split('\t')
	path = parts[5].replace('<', '\t<').replace('>', '\t>').strip().split('\t')
	for i in range(1, len(path)-1):
		for j in range(i+1, len(path)-1):
			key = tuple(path[i:j])
			if key not in subpath_coverage: subpath_coverage[key] = 0
			subpath_coverage[key] += 1

print("length\tcoverage\tpath")
for subpath in subpath_coverage:
	print(str(sum(node_lens[p[1:]] for p in subpath)) + "\t" + str(subpath_coverage[subpath]) + "\t" + "".join(subpath))
