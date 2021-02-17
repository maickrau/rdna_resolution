#!/usr/bin/python

import sys

# params: num_graphs graph1.gfa graph2.gfa num_edges edge1_from_index,edge1_to_index edge2_from_index,edge2_to_index
# edge indices are one based
# eg 3 graph1.gfa graph2.gfa graph3.gfa 2 1,2 2,3
# gfa to stdout

num_allele_graphs = int(sys.argv[1])
allele_graphs = []
for i in range(0, num_allele_graphs):
	allele_graphs.append(sys.argv[2+i])
num_edges = int(sys.argv[2 + num_allele_graphs])
edges = []
for i in range(0, num_edges):
	edges.append(sys.argv[3 + num_allele_graphs + i].split(','))

graph_end_node = {}
graph_start_node = {}

for i in range(0, len(allele_graphs)):
	has_out_edge = {}
	has_in_edge = {}
	with open(allele_graphs[i]) as f:
		for l in f:
			parts = l.strip().split('\t')
			if parts[0] == 'S':
				parts[1] = str(i) + "_" + parts[1]
				print("\t".join(parts))
				assert parts[1] not in has_out_edge
				assert parts[1] not in has_in_edge
				has_out_edge[parts[1]] = False
				has_in_edge[parts[1]] = False
			if parts[0] == 'L':
				parts[1] = str(i) + "_" + parts[1]
				parts[3] = str(i) + "_" + parts[3]
				assert parts[1] in has_out_edge
				assert parts[3] in has_in_edge
				has_out_edge[parts[1]] = True
				has_in_edge[parts[3]] = True
				print("\t".join(parts))
	for node in has_out_edge:
		if not has_out_edge[node]:
			assert str(i+1) not in graph_end_node
			graph_end_node[str(i+1)] = node
		assert node in has_in_edge
		if not has_in_edge[node]:
			assert str(i+1) not in graph_start_node
			graph_start_node[str(i+1)] = node
	assert str(i+1) in graph_start_node
	assert str(i+1) in graph_end_node

for (fromallele, toallele) in edges:
	assert fromallele in graph_end_node
	assert toallele in graph_start_node
	print("L\t" + graph_end_node[fromallele] + "\t+\t" + graph_start_node[toallele] + "\t+\t0M")

