#!/usr/bin/python

import sys

valid_unitigs_file = sys.argv[1]
# read gaf from stdin

valids = set()
with open(valid_unitigs_file) as f:
	for l in f:
		valids.add(l.strip())

picked_reads = set()
for l in sys.stdin:
	parts = l.strip().split('\t')
	path = parts[5].replace('>', '\t').replace('<', '\t').strip().split('\t')
	for node in path:
		if node in valids:
			picked_reads.add(parts[0].split(' ')[0])

for read in picked_reads:
	print(read.strip())
