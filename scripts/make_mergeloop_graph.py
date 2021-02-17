#!/usr/bin/python

import sys

loop_name_file = sys.argv[1]
max_cluster_size = int(sys.argv[2])
min_coverage = int(sys.argv[3])
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
	global max_cluster_size
	assert len(cluster) > max_cluster_size
	active_edges = []
	for edge in edges:
		if edge[0] in cluster and edge[1] in cluster:
			active_edges.append(edge)
	active_edges.sort(key=lambda x: x[2])
	assert active_edges[0][2] <= active_edges[-1][2]
	assert len(active_edges) > 0
	while True:
		splut = get_splut(cluster, active_edges)
		if len(splut) > 1: return splut
		assert len(active_edges) > 0
		max_score = active_edges[-1][2]
		while len(active_edges) > 0 and active_edges[-1][2] == max_score:
			active_edges = active_edges[:-1]
	assert False

def get_cluster_name(index):
	global final_clusters
	global read_nodes
	for c in final_clusters[index]:
		return "loop_" + str(index) + "_" + read_nodes[c]

edges = []
clusters = [set()]
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
		clusters[0].add(parts[0])


for l in sys.stdin:
	parts = l.strip().split('\t')
	n1 = parts[0]
	n2 = parts[1]
	distance = int(parts[2])
	edges.append((n1, n2, distance))

final_clusters = []

while len(clusters) > 0:
	top = clusters.pop()
	splut = split_cluster(top)
	assert len(splut) >= 2
	for clust in splut:
		assert len(clust) < len(top)
		if len(clust) > max_cluster_size:
			clusters.append(clust)
		else:
			final_clusters.append(clust)

belongs_to_clust = {}
for i in range(0, len(final_clusters)):
	for n in final_clusters[i]:
		belongs_to_clust[n] = get_cluster_name(i)

for i in range(0, len(final_clusters)):
	print("S\t" + get_cluster_name(i) + "\t*\tLN:i:1\tFC:i:" + str(len(final_clusters[i])))

edge_coverage = {}

for read in readparts:
	parts = list(readparts[read])
	parts.sort(key=lambda x: x[0])
	for i in range(1, len(parts)):
		assert parts[i-1][0] == parts[i][0] - 1
		key = (belongs_to_clust[parts[i-1][1]], belongs_to_clust[parts[i][1]])
		if key not in edge_coverage: edge_coverage[key] = 0
		edge_coverage[key] += 1

existing_edges = set()
for edge in edge_coverage:
	if edge_coverage[edge] < min_coverage: continue
	existing_edges.add(edge)
	print("L\t" + edge[0] + "\t+\t" + edge[1] + "\t+\t0M")

for read in readparts:
	path = []
	parts = list(readparts[read])
	parts.sort(key=lambda x: x[0])
	for part in parts:
		path.append(belongs_to_clust[part[1]])
	subpaths = []
	last_break = 0
	for i in range(1, len(path)):
		assert parts[i-1][0] == parts[i][0] - 1
		if (path[i-1], path[i]) not in existing_edges:
			subpaths.append(path[last_break:i])
			last_break = i
	subpaths.append(path[last_break:])
	start_pos = 0
	for subpath in subpaths:
		print("P\t" + read + "_" + str(start_pos) + "_" + str(start_pos + len(subpath)) + "_" + str(len(path)) + "\t" + ",".join(n + "+" for n in subpath) + "\t" + ",".join("*" for n in subpath))
		start_pos += len(subpath)
