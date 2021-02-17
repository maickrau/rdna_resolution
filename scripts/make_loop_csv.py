#!/usr/bin/python

import sys

graphfile = sys.argv[1]
# loops from stdin
# csv to stdout

node_lens = {}
with open(graphfile) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_lens[parts[1]] = len(parts[2])

lines = []
column_vals = {}
for node in node_lens:
	column_vals[node] = set()
for l in sys.stdin:
	parts = l.strip().split('\t')
	name = parts[0]
	nodes = set(parts[1].replace('>', ' ').replace('<', ' ').split(' '))
	this_line = [name]
	nodestr = name
	for node in node_lens:
		if node in nodes:
			this_line.append(str(node_lens[node]))
			column_vals[node].add(node_lens[node])
		else:
			this_line.append("0")
			column_vals[node].add(0)
	lines.append(this_line)

header = "node"
for node in node_lens:
	if len(column_vals[node]) == 1: continue
	header += "," + node
print(header)

for line in lines:
	linestr = line[0]
	index = 0
	for node in node_lens:
		index += 1
		if len(column_vals[node]) == 1: continue
		linestr += "," + line[index]
	print(linestr)
