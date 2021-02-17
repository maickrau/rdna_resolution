#!/usr/bin/python

import sys

kmer_size = int(sys.argv[1])
# loop passes from stdin
# output to stdout

readnodes = {}

for l in sys.stdin:
	parts = l.strip().split('\t')
	readname = "_".join(parts[0].split('_')[:-1])
	loopnum = int(parts[0].split('_')[-1])
	node = parts[1]
	if readname not in readnodes: readnodes[readname] = []
	readnodes[readname].append((loopnum, node))

readpaths = []
for read in readnodes:
	path = []
	nodes = readnodes[read]
	nodes.sort(key=lambda x: x[0])
	nodepath = [n[1] for n in nodes]
	for i in range(0, len(nodepath) - kmer_size + 1):
		path.append(tuple(nodepath[i:i+kmer_size]))
	readpaths.append((read, path))

edgecoverage = {}
node_coverage = {}

for (read, path) in readpaths:
	for node in path:
		if "".join(node) not in node_coverage: node_coverage["".join(node)] = 0
		node_coverage["".join(node)] += 1
	for i in range(1, len(path)):
		key = (path[i-1], path[i])
		if key not in edgecoverage: edgecoverage[key] = 1
		edgecoverage[key] += 1

for node in node_coverage:
	print("S\t" + node + "\t*\tLN:i:1\tFC:f:" + str(node_coverage[node]))

for edge in edgecoverage:
	print("L\t" + "".join(edge[0]) + "\t+\t" + "".join(edge[1]) + "\t+\t0M\tFC:i:" + str(edgecoverage[edge]))

for (read, path) in readpaths:
	print("P\t" + read + "\t" + ",".join("".join(n) + "+" for n in path) + "\t" + ",".join("*" for n in path))
