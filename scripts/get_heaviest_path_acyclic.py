#!/usr/bin/python

import sys

path_name = sys.argv[1]
# gfa from stdin
# sequence to stdout
# no path outputed!

def revnode(n):
	return (">" if n[0] == "<" else "<") + n[1:]

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

edges = {}
node_seqs = {}
node_coverages = {}
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == "S":
		node_seqs[parts[1]] = parts[2]
		node_coverages[parts[1]] = float(parts[4][5:]) / len(parts[2])
	if parts[0] == 'L':
		fromnode = (">" if parts[2] == "+" else "<") + parts[1]
		tonode = (">" if parts[4] == "+" else "<") + parts[3]
		if fromnode not in edges: edges[fromnode] = set()
		edges[fromnode].add(tonode)
		if revnode(tonode) not in edges: edges[revnode(tonode)] = set()
		edges[revnode(tonode)].add(revnode(fromnode))

topo_order = []
seen = set()
stack = []
for node in node_seqs:
	if ">" + node not in edges:
		topo_order.append("<" + node)
		seen.add("<" + node)
		if "<" + node in edges:
			for edge in edges["<" + node]:
				stack.append(edge)
	if "<" + node not in edges:
		topo_order.append(">" + node)
		seen.add(">" + node)
		if ">" + node in edges:
			for edge in edges[">" + node]:
				stack.append(edge)

while len(stack) > 0:
	node = stack.pop()
	if node in seen: continue
	assert revnode(node) in edges
	has_unexplored_inneighbor = False
	for edge in edges[revnode(node)]:
		if revnode(edge) not in seen:
			has_unexplored_inneighbor = True
			break
	if has_unexplored_inneighbor: continue
	topo_order.append(node)
	seen.add(node)
	if node in edges:
		for edge in edges[node]:
			stack.append(edge)

assert len(seen) == len(node_seqs) * 2 # forward and backward
assert len(seen) == len(topo_order)

max_path_len = {}
max_node = None

for node in topo_order:
	max_in_length = 0
	if revnode(node) in edges:
		for edge in edges[revnode(node)]:
			assert revnode(edge) in max_path_len
			max_in_length = max(max_in_length, max_path_len[revnode(edge)])
	max_path_len[node] = max_in_length + len(node_seqs[node[1:]])
	if max_node is None or max_path_len[node] > max_path_len[max_node]:
		max_node = node

assert max_node is not None
start_node = revnode(max_node)
max_len_cov_sum = {}
max_len_cov_sum[start_node] = len(node_seqs[start_node[1:]]) * node_coverages[start_node[1:]]
max_end = None
for node in topo_order:
	max_in_value = None
	if revnode(node) in edges:
		for edge in edges[revnode(node)]:
			if revnode(edge) not in max_len_cov_sum: continue
			if max_in_value is None or max_len_cov_sum[revnode(edge)] > max_in_value:
				max_in_value = max_len_cov_sum[revnode(edge)]
	if max_in_value is None: continue
	max_len_cov_sum[node] = max_in_value + len(node_seqs[node[1:]]) * node_coverages[node[1:]]

for node in topo_order:
	if node not in max_len_cov_sum: continue
	if max_end is None or max_len_cov_sum[node] > max_len_cov_sum[max_end]: max_end = node

assert max_end is not None

seq = ""
pos = max_end
while pos != start_node:
	add = node_seqs[pos[1:]]
	if pos[0] == "<": add = revcomp(add)
	seq = add + seq
	max_in_neighbor = None
	assert revnode(pos) in edges
	for revedge in edges[revnode(pos)]:
		neighbor = revnode(revedge)
		if neighbor not in max_len_cov_sum: continue
		if max_in_neighbor is None or max_len_cov_sum[neighbor] > max_len_cov_sum[max_in_neighbor]:
			max_in_neighbor = neighbor
	assert max_in_neighbor is not None
	pos = max_in_neighbor

assert pos == start_node
add = node_seqs[pos[1:]]
if pos[0] == "<": add = revcomp(add)
seq = add + seq

print(">" + path_name)
print(seq)
