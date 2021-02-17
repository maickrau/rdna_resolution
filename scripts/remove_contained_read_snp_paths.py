#!/usr/bin/python

import sys

# paths from stdin
# paths to stdout

paths = []

for l in sys.stdin:
	paths.append(l.strip().split(','))

contained = set()
for i in range(0, len(paths)):
	for j in range(0, len(paths)):
		if i == j: continue
		path1_nodes = set(paths[i])
		path2_nodes = set(paths[j])
		if path1_nodes.union(path2_nodes) == path1_nodes: contained.add(j)
		if path1_nodes.union(path2_nodes) == path2_nodes: contained.add(i)

for i in range(0, len(paths)):
	if i in contained: continue
	print(",".join(paths[i]))
