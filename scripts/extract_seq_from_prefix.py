#!/usr/bin/python

import sys
import re

start_sequence_file = sys.argv[1] # just sequence, not fasta
prefix_size = int(sys.argv[2])
# fasta from stdin

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def print_suffix(readsequence, name):
	if start_sequence not in readsequence:
		rev = revcomp(readsequence)
		if start_sequence not in rev: return
		readsequence = rev
	start_positions = [m.start() for m in re.finditer(start_sequence, readsequence)]
	if len(start_positions) != 1: return
	start = start_positions[0] + len(start_sequence)
	if start < prefix_size: return
	suffix = readsequence[start-prefix_size:]
	print(">" + name + "_" + str(start))
	print(suffix)

with open(start_sequence_file) as f:
	start_sequence = f.readline().strip()

current_seq = ""
current_name = ""
for l in sys.stdin:
	if l[0] == '>':
		if len(current_name) > 0 and len(current_seq) > 0: print_suffix(current_seq, current_name)
		current_name = l[1:].strip()
		current_seq = ""
	else:
		current_seq += l.strip().replace('a', 'A').replace('t', 'T').replace('c', 'C').replace('g', 'G')

if len(current_name) > 0 and len(current_seq) > 0: print_suffix(current_seq, current_name)
