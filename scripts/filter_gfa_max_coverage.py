#!/usr/bin/python

import sys

max_coverage = int(sys.argv[1])
# gfa from stdin

nodelines = []
edgelines = []
paths = []
removed_nodes = set()
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		nodelines.append((parts[1], l.strip()))
		assert parts[4][0:5] == "KC:i:"
		coverage_here = int(parts[4][5:])
		if coverage_here > max_coverage: removed_nodes.add(parts[1])
	if parts[0] == 'L':
		edgelines.append((parts[1], parts[3], l.strip()))
	if parts[0] == 'P':
		paths.append(l.strip())

for (node, line) in nodelines:
	if node in removed_nodes: continue
	print(line)

for (node1, node2, line) in edgelines:
	if node1 in removed_nodes: continue
	if node2 in removed_nodes: continue
	print(line)

for line in paths:
	print(line)
