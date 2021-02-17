#!/usr/bin/python

import sys

graph_file = sys.argv[1]
alignments_file = sys.argv[2]
avg_coverage = int(sys.argv[3])
start_node = sys.argv[4]
path_file = sys.argv[5]
seq_file = sys.argv[6]

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def reverse(node):
	return ('>' if node[0] == '<' else '<') + node[1:]

def canon(fromnode, tonode):
	fw = (fromnode, tonode)
	rev = (reverse(tonode), reverse(fromnode))
	if fw < rev: return fw
	return rev

node_seqs = {}
with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_seqs[parts[1]] = parts[2]

edges = {}
edge_coverage = {}
with open(alignments_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		path = parts[5].replace(">", "\t>").replace("<", "\t<").strip().split('\t')
		for i in range(0, len(path)-1):
			fromnode = path[i]
			tonode = path[i+1]
			if fromnode not in edges: edges[fromnode] = set()
			edges[fromnode].add(tonode)
			if reverse(tonode) not in edges: edges[reverse(tonode)] = set()
			edges[reverse(tonode)].add(reverse(fromnode))
			key = canon(fromnode, tonode)
			if key not in edge_coverage: edge_coverage[key] = 0
			edge_coverage[key] += 1

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
				if best_edge is None or edge_coverage[canon(pos, edge)] > edge_coverage[canon(pos, best_edge)]:
					best_edge = edge
			if best_edge == start_node: break
			assert edge_coverage[canon(pos, best_edge)] > 0
			edge_coverage[canon(pos, best_edge)] -= avg_coverage
			pos = best_edge

