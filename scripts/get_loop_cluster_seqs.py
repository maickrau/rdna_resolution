#!/usr/bin/python

import sys

loop_name_file = sys.argv[1]
graph_file = sys.argv[2]
max_distance = int(sys.argv[3])
# loop distances from stdin
cluster_to_chromosome_mapping = { "clust1": "chr15", "clust2": "chr14", "clust3": "chr13", "clust4": "chr21", "clust5": "chr22", "chr13": "chr13", "chr14": "chr14", "chr15": "chr15", "chr21": "chr21", "chr22": "chr22" }

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def find(parent, n):
	while parent[n] != parent[parent[n]]: parent[n] = parent[parent[n]]
	return parent[n]

def merge(parent, rank, n1, n2):
	n1 = find(parent, n1)
	n2 = find(parent, n2)
	assert parent[n1] == n1
	assert parent[n2] == n2
	if rank[n1] < rank[n2]: (n1, n2) = (n2, n1)
	parent[n2] = n1
	if rank[n1] == rank[n2]: rank[n1] += 1

def get_splut(cluster, active_edges):
	parent = {}
	rank = {}
	for n in cluster:
		parent[n] = n
		rank[n] = 1
	for edge in active_edges:
		merge(parent, rank, edge[0], edge[1])
	splut = {}
	for n in cluster:
		if find(parent, n) not in splut: splut[find(parent, n)] = set()
		splut[find(parent, n)].add(n)
	result = []
	for s in splut:
		result.append(splut[s])
	return result

def split_cluster(cluster):
	global edges
	global max_distance
	active_edges = []
	for edge in edges:
		if edge[2] <= max_distance: active_edges.append(edge)
	active_edges.sort(key=lambda x: x[2])
	assert active_edges[0][2] <= active_edges[-1][2]
	assert len(active_edges) > 0
	splut = get_splut(cluster, active_edges)
	return splut

def get_cluster_name(index):
	global final_clusters
	global read_nodes
	for c in final_clusters[index]:
		return "loop_" + str(index) + "_" + read_nodes[c]

node_seqs = {}
with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] != 'S': continue
		node_seqs[parts[1]] = parts[2]

edges = []
nodes = set()
readparts = {}
read_nodes = {}

with open(loop_name_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		read = "_".join(parts[0].split('_')[:-1])
		index = int(parts[0].split('_')[-1])
		if read not in readparts: readparts[read] = set()
		readparts[read].add((index, parts[0]))
		read_nodes[parts[0]] = parts[1]
		nodes.add(parts[0])

for l in sys.stdin:
	parts = l.strip().split('\t')
	n1 = parts[0]
	n2 = parts[1]
	distance = int(parts[2])
	edges.append((n1, n2, distance))

final_clusters = split_cluster(nodes)

chromosome_count = {}

for clust in final_clusters:
	if len(clust) < 5: continue
	chromosome = None
	is_loop = True
	for n in clust:
		clust_name = read_nodes[n].replace('>', '\t').replace('<', '\t').strip().split('\t')[0].split('_')[0]
		assert clust_name in cluster_to_chromosome_mapping
		found_chromosome = cluster_to_chromosome_mapping[clust_name]
		assert chromosome is None or found_chromosome == chromosome
		chromosome = found_chromosome
		nodes = read_nodes[n].replace('>', '\t>').replace('<', '\t<').strip().split('\t')
		if nodes[0] != nodes[-1]:
			is_loop = False
			break
	if not is_loop: continue
	if chromosome not in chromosome_count: chromosome_count[chromosome] = 0
	chromosome_count[chromosome] += 1
	allele_num = chromosome_count[chromosome]
	coverage = len(clust)
	name = chromosome + "_allele" + str(allele_num) + "_coverage" + str(coverage)
	with open(name + "_loops.fa", 'w') as f:
		loop_num = 0
		for n in clust:
			f.write(">" + name + "_loop_" + str(loop_num) + "\n")
			loop_seq = ""
			nodes = read_nodes[n].replace('>', '\t>').replace('<', '\t<').strip().split('\t')
			for node in nodes[:-1]:
				if node[0] == ">":
					loop_seq += node_seqs[node[1:]]
				else:
					loop_seq += revcomp(node_seqs[node[1:]])
			f.write(loop_seq + "\n")
			loop_num += 1


# multinodes = set()
# for clust in final_clusters:
# 	for n in clust:
# 		nodes = read_nodes[n].replace('>', '\t>').replace('<', '\t<').strip().split('\t')
# 		if nodes[0] != nodes[-1]:
# 			not_loop = True
# 			break
# 		found = set()
# 		for node in nodes:
# 			if node in found: multinodes.add(node)
# 			found.add(node)

# print(multinodes)

# loop_num = 0
# belongs_to_clust = {}
# for i in range(0, len(final_clusters)):
# 	edge_coverages = {}
# 	if len(final_clusters[i]) < 5: continue
# 	startnode = None
# 	max_path_len = 0
# 	coverage = len(final_clusters[i])
# 	not_loop = False
# 	for n in final_clusters[i]:
# 		nodes = read_nodes[n].replace('>', '\t>').replace('<', '\t<').strip().split('\t')
# 		if nodes[0] != nodes[-1]:
# 			not_loop = True
# 			break
# 		multinode_count = {}
# 		for j in range(0, len(nodes)):
# 			if nodes[j] not in multinodes: continue
# 			if nodes[j] not in multinode_count: multinode_count[nodes[j]] = 0
# 			multinode_count[nodes[j]] += 1
# 			nodes[j] = nodes[j] + ":" + str(multinode_count[nodes[j]])
# 		max_path_len = max(max_path_len, len(nodes))
# 		assert startnode is None or nodes[0] == startnode
# 		startnode = nodes[0]
# 		for j in range(1, len(nodes)):
# 			fromnode = nodes[j-1]
# 			tonode = nodes[j]
# 			if fromnode not in edge_coverages: edge_coverages[fromnode] = {}
# 			if tonode not in edge_coverages[fromnode]: edge_coverages[fromnode][tonode] = 0
# 			edge_coverages[fromnode][tonode] += 1
# 	if not_loop: continue
# 	pos = startnode
# 	path = [startnode]
# 	while True:
# 		max_edge = (None, 0)
# 		assert pos in edge_coverages
# 		for edge in edge_coverages[pos]:
# 			if edge_coverages[pos][edge] > max_edge[1]:
# 				max_edge = (edge, edge_coverages[pos][edge])
# 		assert max_edge[0] is not None
# 		edge_coverages[pos][max_edge[0]] -= coverage
# 		pos = max_edge[0]
# 		if pos == startnode: break
# 		path.append(pos)
# 		assert len(path) <= max_path_len * 2
# 	print(">loop_" + str(loop_num) + "_coverage_" + str(coverage) + "_path_" + "".join(path))
# 	seq = ""
# 	for n in path:
# 		if n[0] == '>':
# 			seq += node_seqs[n[1:]]
# 		else:
# 			seq += revcomp(node_seqs[n[1:]])
# 	print(seq)
# 	loop_num += 1
