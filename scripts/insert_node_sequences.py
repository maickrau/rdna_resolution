#!/usr/bin/python

import sys

node_seq_fasta = sys.argv[1]
input_gfa = sys.argv[2]
# gfa to stdout

node_seqs = {}
current_name = ""
current_seq = ""
with open(node_seq_fasta) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				assert current_name not in node_seqs
				node_seqs[current_name] = current_seq
			current_name = l[1:].strip()
			current_seq = ""
		else:
			current_seq += l.strip()
if len(current_seq) > 0:
	node_seqs[current_name] = current_seq

with open(input_gfa) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			assert parts[2] == "*"
			parts[2] = node_seqs[parts[1]]
			print("\t".join(parts))
		else:
			print(l.strip())
