#!/usr/bin/python

import sys

graph_file = sys.argv[1]
coverage_csv = sys.argv[2]
avg_coverage = int(sys.argv[3])
start_node = sys.argv[4]
path_file = sys.argv[5]
seq_file = sys.argv[6]

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def reverse(node):
	return ('>' if node[0] == '<' else '<') + node[1:]

edges = {}
node_seqs = {}
with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_seqs[parts[1]] = parts[2]
		elif parts[0] == 'L':
			fromnode = ('>' if parts[2] == "+" else '<') + parts[1]
			tonode = ('>' if parts[4] == "+" else '<') + parts[3]
			if fromnode not in edges: edges[fromnode] = set()
			edges[fromnode].add(tonode)
			if reverse(tonode) not in edges: edges[reverse(tonode)] = set()
			edges[reverse(tonode)].add(reverse(fromnode))

node_coverage = {}
with open(coverage_csv) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'node': continue
		node_coverage[parts[0]] = float(parts[2])

pos = start_node
with open(path_file, 'w') as pathf:
	with open(seq_file, 'w') as seqf:
		seqf.write(">heaviest_path\n")
		while True:
			pathf.write(pos)
			if pos[0] == '>':
				seqf.write(node_seqs[pos[1:]])
			else:
				seqf.write(revcomp(node_seqs[pos[1:]]))
			best_edge = None
			for edge in edges[pos]:
				if best_edge is None or node_coverage[edge[1:]] > node_coverage[best_edge[1:]]:
					best_edge = edge
			if best_edge == start_node: break
			assert node_coverage[best_edge[1:]] > 0
			node_coverage[best_edge[1:]] -= avg_coverage
			pos = best_edge

