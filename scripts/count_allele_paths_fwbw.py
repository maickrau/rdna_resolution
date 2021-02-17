#!/usr/bin/python

import sys

allele_node_file = sys.argv[1]
# >node1>node2 paths from stdin

def canon(path):
	fwstr = "".join(path)
	rev_path = [(">" if n[0] == "<" else "<") + n[1:] for n in path[::-1]]
	bwstr = "".join(rev_path)
	if bwstr < fwstr: return rev_path

allele_nodes = set()
with open(allele_node_file) as f:
	for l in f:
		allele_nodes.add(l.strip())

counts = {}

for l in sys.stdin:
	nodes = [l.strip()]
	assert "+" not in l.strip()
	assert "-" not in l.strip()
	nodes = l.replace(">", "\t>").replace("<", "\t<").strip().split("\t")
	found = []
	for node in nodes:
		if (node[0] == ">" or node[0] == "<") and node[1:] in allele_nodes: found.append(node)
		if (node[-1] == "+" or node[-1] == "-") and node[:-1] in allele_nodes: found.append(node)
	orient = canon(found)
	key = tuple(found)
	if key not in counts: counts[key] = 0
	counts[key] += 1
	# for i in range(0, len(found)):
	# 	for j in range(i+1, len(found)):
	# 		key = tuple(found[i:j])
	# 		if key not in counts: counts[key] = 0
	# 		counts[key] += 1

for key in counts:
	print(",".join(key) + ": " + str(counts[key]))
