#!/usr/bin/python

import sys

loop_seq_file = sys.argv[1]
max_distance = int(sys.argv[2])
min_cluster_size = int(sys.argv[3])
# loop distances from stdin

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
	global read_seqs
	for c in final_clusters[index]:
		return "loop_" + str(index) + "_" + read_seqs[c]

edges = []
nodes = set()
readparts = {}
read_seqs = {}

with open(loop_seq_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		read = "_".join(parts[0].split('_')[:-1])
		index = int(parts[0].split('_')[-1])
		if read not in readparts: readparts[read] = set()
		readparts[read].add((index, parts[0]))
		read_seqs[parts[0]] = parts[1]
		nodes.add(parts[0])

for l in sys.stdin:
	parts = l.strip().split('\t')
	n1 = parts[0]
	n2 = parts[1]
	distance = int(parts[2])
	edges.append((n1, n2, distance))

final_clusters = split_cluster(nodes)

allele_count = 0

for clust in final_clusters:
	if len(clust) < min_cluster_size: continue
	allele_num = allele_count
	allele_count += 1
	coverage = len(clust)
	name = "allele" + str(allele_num) + "_coverage" + str(coverage)
	with open(name + "_loops.fa", 'w') as f:
		loop_num = 0
		for n in clust:
			f.write(">" + name + "_loop_" + str(loop_num) + "\n")
			loop_seq = read_seqs[n]
			f.write(loop_seq + "\n")
			loop_num += 1
