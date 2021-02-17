#!/usr/bin/python

import sys

clusterable_nodes_file = sys.argv[1]
chr13_gaf = sys.argv[2]
chr14_gaf = sys.argv[3]
chr15_gaf = sys.argv[4]
chr21_gaf = sys.argv[5]
chr22_gaf = sys.argv[6]
hifi_gaf = sys.argv[7]
read_clustering_outfile = sys.argv[8]
node_clustering_outfile = sys.argv[9]

clusterables = set()
read_nodes = {}
node_reads = {}

with open(clusterable_nodes_file) as f:
	for l in f:
		clusterables.add(l.strip())
		node_reads[l.strip()] = set()

chr_counts = {}

with open(chr13_gaf) as f:
	for l in f:
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			if node not in chr_counts: chr_counts[node] = {}
			if 13 not in chr_counts[node]: chr_counts[node][13] = 0
			chr_counts[node][13] += 1
with open(chr14_gaf) as f:
	for l in f:
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			if node not in chr_counts: chr_counts[node] = {}
			if 14 not in chr_counts[node]: chr_counts[node][14] = 0
			chr_counts[node][14] += 1
with open(chr15_gaf) as f:
	for l in f:
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			if node not in chr_counts: chr_counts[node] = {}
			if 15 not in chr_counts[node]: chr_counts[node][15] = 0
			chr_counts[node][15] += 1
with open(chr21_gaf) as f:
	for l in f:
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			if node not in chr_counts: chr_counts[node] = {}
			if 21 not in chr_counts[node]: chr_counts[node][21] = 0
			chr_counts[node][21] += 1
with open(chr22_gaf) as f:
	for l in f:
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			if node not in chr_counts: chr_counts[node] = {}
			if 22 not in chr_counts[node]: chr_counts[node][22] = 0
			chr_counts[node][22] += 1

node_assigned_to_chromosome = {}
for node in clusterables:
	node_assigned_to_chromosome[node] = None
	if node not in chr_counts: continue
	if len(chr_counts[node]) != 1: continue
	for ch in chr_counts[node]:
		assert node_assigned_to_chromosome[node] == None
		node_assigned_to_chromosome[node] = ch

read_assigned_to_chromosome = {}
with open(hifi_gaf) as f:
	for l in f:
		readname = l.strip().split('\t')[0]
		read_assigned_to_chromosome[readname] = None
		if readname not in read_nodes: read_nodes[readname] = set()
		nodes = l.strip().split('\t')[5].replace('>', '\t').replace('>', '\t').strip().split('\t')
		for node in nodes:
			if node not in clusterables: continue
			read_nodes[readname].add(node)
			node_reads[node].add(readname)

nodes_assigned = 0
for node in node_assigned_to_chromosome:
	if node_assigned_to_chromosome[node] is not None: nodes_assigned += 1
print("initially " + str(nodes_assigned) + "/" + str(len(node_assigned_to_chromosome)) + " nodes assigned")

iteration = 0
while iteration < 15:
	reads_assigned = 0
	reads_multiassigned = 0
	reads_not_assigned = 0
	for read in read_nodes:
		chr_counts = set()
		for node in read_nodes[read]:
			assert node in node_assigned_to_chromosome
			if node_assigned_to_chromosome[node] is None: continue
			ch = node_assigned_to_chromosome[node]
			chr_counts.add(ch)
		if len(chr_counts) == 1:
			reads_assigned += 1
			for ch in chr_counts:
				read_assigned_to_chromosome[read] = ch
		elif len(chr_counts) == 0:
			reads_not_assigned += 1
			read_assigned_to_chromosome[read] = None
		else:
			reads_multiassigned += 1
			read_assigned_to_chromosome[read] = None
	nodes_assigned = 0
	nodes_multiassigned = 0
	nodes_not_assigned = 0
	for node in clusterables:
		chr_counts = {}
		for read in node_reads[node]:
			assert read in read_assigned_to_chromosome
			if read_assigned_to_chromosome[read] is None: continue
			ch = read_assigned_to_chromosome[read]
			if ch not in chr_counts: chr_counts[ch] = 0
			chr_counts[ch] += 1
		possible_chr = set()
		for ch in chr_counts:
			if chr_counts[ch] >= 3: possible_chr.add(ch)
		if len(possible_chr) == 1:
			nodes_assigned += 1
			for ch in possible_chr:
				node_assigned_to_chromosome[node] = ch
		elif len(possible_chr) == 0:
			nodes_not_assigned += 1
			node_assigned_to_chromosome[node] = None
		else:
			nodes_multiassigned += 1
			node_assigned_to_chromosome[node] = None
	print("iteration " + str(iteration) + " " + str(reads_assigned) + "/" + str(len(read_assigned_to_chromosome)) + " reads assigned (" + str(reads_multiassigned) + " multi, " + str(reads_not_assigned) + " none), " + str(nodes_assigned) + "/" + str(len(node_assigned_to_chromosome)) + " nodes assigned (" + str(nodes_multiassigned) + " multi, " + str(nodes_not_assigned) + " none)")
	if reads_assigned == len(read_assigned_to_chromosome): break
	iteration += 1

with open(read_clustering_outfile, 'w') as f:
	for read in read_assigned_to_chromosome:
		f.write(read + "\tchr" + str(read_assigned_to_chromosome[read]) + "\n")

with open(node_clustering_outfile, 'w') as f:
	for node in node_assigned_to_chromosome:
		f.write(node + "\tchr" + str(node_assigned_to_chromosome[node]) + "\n")

