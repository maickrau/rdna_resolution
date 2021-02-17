#!/usr/bin/python

import sys

rle_seq_length = int(sys.argv[1])
# gfa from stdin
# gfa to stdout

node_seqs = {}
edge_lines = []

for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		node_seqs[parts[1]] = parts[2]
		print(l.strip())
	if parts[0] == 'L':
		edge_lines.append(parts)
	else:
		print(l.strip())

for line in edge_lines:
	assert line[2] == "+"
	assert line[4] == "+"
	fromnode = line[1]
	tonode = line[3]
	fromseq = node_seqs[fromnode]
	toseq = node_seqs[tonode]
	frompos = int(fromnode.split('_')[0])
	topos = int(tonode.split('_')[0])
	if topos < frompos: topos += rle_seq_length
	position_difference = topos - frompos
	line[5] = str(len(node_seqs[fromnode]) - position_difference) + "M"
	print("\t".join(line))
