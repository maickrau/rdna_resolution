#!/usr/bin/python

import sys

min_coverage = int(sys.argv[1])
# gfa from stdin

node_lines = []
edge_lines = []
node_coverages = {}
edge_coverages = {}
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		node_lines.append((parts[1], l.strip()))
	if parts[0] == 'L':
		assert parts[2] == "+"
		assert parts[4] == "+"
		edge_lines.append((parts[1], parts[3], l.strip()))
	if parts[0] == 'P':
		nodes = parts[2].split(',')
		for i in range(0, len(nodes)):
			assert nodes[i][-1] == "+"
			node = nodes[i][:-1]
			if node not in node_coverages: node_coverages[node] = 0
			node_coverages[node] += 1
		for i in range(1, len(nodes)):
			old_node = nodes[i-1][:-1]
			new_node = nodes[i][:-1]
			if (old_node, new_node) not in edge_coverages: edge_coverages[(old_node, new_node)] = 0
			edge_coverages[(old_node, new_node)] += 1

for (n, l) in node_lines:
	assert n in node_coverages
	if node_coverages[n] < min_coverage: continue
	print(l.strip())

for (n1, n2, l) in edge_lines:
	assert n1 in node_coverages
	assert n2 in node_coverages
	assert (n1, n2) in edge_coverages
	if node_coverages[n1] < min_coverage: continue
	if node_coverages[n2] < min_coverage: continue
	if edge_coverages[(n1, n2)] < min_coverage: continue
	print(l.strip())
