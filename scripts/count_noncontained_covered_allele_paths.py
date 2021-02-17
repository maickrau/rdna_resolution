#!/usr/bin/python

import sys

allele_node_file = sys.argv[1]
min_coverage = int(sys.argv[2])
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
	for i in range(0, len(found)):
		for j in range(i+1, len(found)+1):
			key = tuple(found[i:j])
			if key not in counts: counts[key] = 0
			counts[key] += 1

contained = set()

for key in counts:
	if counts[key] < min_coverage: continue
	for i in range(0, len(key)):
		for j in range(i+1, len(key)+1):
			forbid_key = tuple(list(key)[i:j])
			assert forbid_key in counts
			if forbid_key != key:
				contained.add(forbid_key)

for key in counts:
	if counts[key] < min_coverage: continue
	if key in contained:
		print("contained: " + ",".join(key) + ":" + str(counts[key]))
		continue
	print(",".join(key) + ": " + str(counts[key]))
