#!/usr/bin/python

import sys

sequence_fasta_file = sys.argv[1]
graph_file = sys.argv[2]

node_sequences = {}

current_seq = ""
current_name = ""
with open(sequence_fasta_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				assert current_name not in node_sequences
				node_sequences[current_name] = current_seq
			current_seq = ""
			current_name = l[1:].strip()
		else:
			current_seq += l.strip()

if len(current_seq) > 0:
	assert current_name not in node_sequences
	node_sequences[current_name] = current_seq

with open(graph_file) as f:
	for l in f:
		if l[0] == 'S':
			parts = l.strip().split('\t')
			assert parts[1] in node_sequences
			assert parts[2] == "*"
			parts[2] = node_sequences[parts[1]]
			print("\t".join(parts))
		else:
			print(l.strip())
