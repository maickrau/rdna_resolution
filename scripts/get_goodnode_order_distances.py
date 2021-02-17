#!/usr/bin/python

import sys

gfafile = sys.argv[1]
goodnodefile = sys.argv[2]
startnode = sys.argv[3] # format 123 without <>

node_lens = {}
one_outedge = {}

with open(gfafile) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_lens[parts[1]] = len(parts[2])
		elif parts[0] == 'L':
			if parts[2] == "-":
				assert parts[4] == "-"
				(parts[1], parts[3]) = (parts[3], parts[1])
				(parts[2], parts[4]) = (parts[4], parts[2])
				parts[2] = "+"
				parts[4] = "+"
			assert parts[2] == "+"
			assert parts[4] == "+"
			fromnode = parts[1]
			tonode = parts[3]
			if fromnode not in one_outedge: one_outedge[fromnode] = tonode
			if tonode[0:4] == "end_": one_outedge[fromnode] = tonode

goodnodes = set()
with open(goodnodefile) as f:
	for l in f:
		goodnodes.add(l.strip())

pos = startnode
path = []
distance = 0
while pos in one_outedge:
	if pos in goodnodes:
		path.append((pos, distance))
		distance = 0
	else:
		distance += node_lens[pos]
	pos = one_outedge[pos]

for n in path:
	print(n[0] + "\t" + str(n[1]))
