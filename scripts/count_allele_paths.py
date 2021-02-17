#!/usr/bin/python

import sys

allele_node_file = sys.argv[1]
# node1+,node2+ paths from stdin
# or >node1>node2 paths from stdin

allele_nodes = set()
with open(allele_node_file) as f:
	for l in f:
		allele_nodes.add(l.strip())

counts = {}

for l in sys.stdin:
	nodes = [l.strip()]
	if "-" in l.strip():
		assert "+" not in l.strip()
		nodes = l.strip().replace("-", "").split(",")[::-1]
	if "+" in l.strip():
		assert "-" not in l.strip()
		nodes = l.strip().replace("+", "").split(',')
	if ">" in l.strip():
		assert "<" not in l.strip()
		nodes = l.replace(">", "\t").strip().split("\t")
	if "<" in l.strip():
		assert ">" not in l.strip()
		nodes = l.replace("<", "\t").strip().split("\t")[::-1]
	found = []
	for node in nodes:
		if node in allele_nodes: found.append(node)
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
