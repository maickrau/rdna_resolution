#!/usr/bin/python

import sys

valid_nodes_file = sys.argv[1]
gaf_file = sys.argv[2]
reads_fasta_file = sys.argv[3]
# picked reads to stdout as fasta

valid_nodes = set()
with open(valid_nodes_file) as f:
	for l in f:
		valid_nodes.add(l.strip())

valid_reads = set()
with open(gaf_file) as f:
	for l in f:
		path = l.strip().split('\t')[5].replace('<', '\t').replace('>', '\t').strip().split('\t')
		for node in path:
			if node in valid_nodes: valid_reads.add(l.strip().split('\t')[0].split(' ')[0])

printing = False
with open(reads_fasta_file) as f:
	for l in f:
		if l[0] == '>':
			read_name = l[1:].strip().split(' ')[0]
			if read_name in valid_reads:
				printing = True
			else:
				printing = False
		if printing: print(l.strip())
