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

unitigs = []
unitig_found = set()
for node in nodes:
	if node in unitig_found: continue
	if node not in bw_edges or len(bw_edges[node]) != 1:
		assert node not in unitig_found
		unitigs.append([node])
		unitig_found.add(node)
		pos = node
		while True:
			if pos not in fw_edges or len(fw_edges[pos]) != 1: break
			pos = getone(fw_edges[pos])
			assert pos in bw_edges
			if len(bw_edges[pos]) != 1: break
			unitigs[-1].append(pos)
			assert pos not in unitig_found
			unitig_found.add(pos)
	if node not in fw_edges or len(fw_edges[node]) != 1:
		if node not in unitig_found:
			unitigs.append([node])
			unitig_found.add(node)
			pos = node
			while True:
				if pos not in bw_edges or len(bw_edges[pos]) != 1: break
				pos = getone(bw_edges[pos])
				assert pos in fw_edges
				if len(fw_edges[pos]) != 1: break
				unitigs[-1].append(pos)
				assert pos not in unitig_found
				unitig_found.add(pos)
	if node in fw_edges and len(fw_edges[node]) == 1:
		assert getone(fw_edges[node]) in bw_edges
		if len(bw_edges[getone(fw_edges[node])]) != 1:
			if node not in unitig_found:
				unitigs.append([node])
				unitig_found.add(node)
				pos = node
				while True:
					if pos not in bw_edges or len(bw_edges[pos]) != 1: break
					pos = getone(bw_edges[pos])
					assert pos in fw_edges
					if len(fw_edges[pos]) != 1: break
					unitigs[-1].append(pos)
					assert pos not in unitig_found
					unitig_found.add(pos)
	if node in bw_edges and len(bw_edges[node]) == 1:
		assert getone(bw_edges[node]) in fw_edges
		if len(fw_edges[getone(bw_edges[node])]) != 1:
			if node not in unitig_found:
				unitigs.append([node])
				unitig_found.add(node)
				pos = node
				while True:
					if pos not in fw_edges or len(fw_edges[pos]) != 1: break
					pos = getone(fw_edges[pos])
					assert pos in bw_edges
					if len(bw_edges[pos]) != 1: break
					unitigs[-1].append(pos)
					assert pos not in unitig_found
					unitig_found.add(pos)

assert len(unitig_found) == len(nodes)
assert sum(len(u) for u in unitigs) == len(nodes)

node_in_unitig = {}
for i in range(0, len(unitigs)):
	for node in unitigs[i]:
		assert node not in node_in_unitig
		node_in_unitig[node] = i

assert len(node_in_unitig) == len(nodes)

reads_in_unitig = {}
for node in reads_in_node:
	if node not in node_in_unitig: continue
	unitig = node_in_unitig[node]
	if unitig not in reads_in_unitig: reads_in_unitig[unitig] = set()
	for read in reads_in_node[node]:
		reads_in_unitig[unitig].add(read)

for unitig in reads_in_unitig:
	with open("hifi_allele" + str(unitig) + ".txt", "w") as f:
		for read in reads_in_unitig[unitig]:
			f.write(read + "\n")
