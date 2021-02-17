#!/usr/bin/python

import sys

unrle_seq_file = sys.argv[1]
# rle positions from stdin

seq = ""
with open(unrle_seq_file) as f:
	for l in f:
		if l[0] == '>': continue
		seq += l.strip()
seq = seq.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')

rle_pos_mapping = [0]
for i in range(1, len(seq)):
	if seq[i] != seq[i-1]:
		rle_pos_mapping.append(i)

for l in sys.stdin:
	rle_pos = int(l)
	print(str(rle_pos) + "\t" + str(rle_pos_mapping[rle_pos]))
