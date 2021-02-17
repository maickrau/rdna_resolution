#!/usr/bin/python

import sys

path_graph_file = sys.argv[1]
# out to allele*.txt

def getone(s):
	assert len(s) == 1
	for n in s:
		return n

reads_in_node = {}
fw_edges = {}
bw_edges = {}
nodes = set()
with open(path_graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			nodes.add(parts[1])
		if parts[0] == 'L':
			fromnode = parts[1]
			tonode = parts[3]
			assert parts[2] == "+"
			assert parts[4] == "+"
			if fromnode not in fw_edges: fw_edges[fromnode] = set()
			fw_edges[fromnode].add(tonode)
			if tonode not in bw_edges: bw_edges[tonode] = set()
			bw_edges[tonode].add(fromnode)
		if parts[0] == 'P':
			if len(parts) > 2:
				path = parts[2].split(',')
				for nodeplus in path:
					assert nodeplus[-1] == "+"
					node = nodeplus[:-1]
					if node not in reads_in_node: reads_in_node[node] = set()
					reads_in_node[node].add(parts[1])

next_allele_num = 0
for node in nodes:
	assert node in reads_in_node
	assert len(reads_in_node[node]) > 0
	with open("hifi_allele" + str(next_allele_num) + ".txt", "w") as f:
		for read in reads_in_node[node]:
			f.write(read + "\n")
	print(str(next_allele_num) + "\t" + node)
	next_allele_num += 1
