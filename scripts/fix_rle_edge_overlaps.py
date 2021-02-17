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
	assert position_difference > 0
	from_rle_mapping = [0]
	for i in range(1, len(node_seqs[fromnode])):
		if node_seqs[fromnode][i] != node_seqs[fromnode][i-1]:
			from_rle_mapping.append(i)
	line[5] = str(len(node_seqs[fromnode]) - from_rle_mapping[position_difference]) + "M"
	print("\t".join(line))
