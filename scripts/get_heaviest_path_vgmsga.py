#!/usr/bin/python

import sys

graph_file_gfa = sys.argv[1]
path_file = sys.argv[2]
# fasta to stdout

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
edges = {}
edge_coverage = {}
start_node = None
num_seqs = 0
with open(graph_file_gfa) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_seqs[parts[1]] = parts[2]
		if parts[0] == 'P':
			num_seqs += 1
			path = parts[2].strip().split(',')
			nodes = [(">" if n[-1] == "+" else "<") + n[:-1] for n in path]
			assert start_node is None or nodes[0] == start_node
			start_node = nodes[0]
			for i in range(1, len(nodes)):
				fromnode = nodes[i-1]
				tonode = nodes[i]
				if fromnode not in edges: edges[fromnode] = set()
				edges[fromnode].add(tonode)
				key = canon(fromnode, tonode)
				if key not in edge_coverage: edge_coverage[key] = 0
				edge_coverage[key] += 1

pos = start_node
seq = ""
with open(path_file, 'w') as pathf:
	while True:
		pathf.write(pos)
		if pos[0] == '>':
			seq += node_seqs[pos[1:]]
		else:
			seq += revcomp(node_seqs[pos[1:]])
		if pos not in edges: break
		best_edge = None
		for edge in edges[pos]:
			if best_edge is None or edge_coverage[canon(pos, edge)] > edge_coverage[canon(pos, best_edge)]:
				best_edge = edge
		if best_edge == start_node: break
		# assert edge_coverage[canon(pos, best_edge)] > 0
		edge_coverage[canon(pos, best_edge)] -= num_seqs
		pos = best_edge

assert len(seq) > 0

print(">heaviest_path")
print(seq)
