#!/usr/bin/python

import sys

start_position = int(sys.argv[1])
end_position = int(sys.argv[2])
reads_file = sys.argv[3]
# pileup from stdin

read_prefix_seqs = {}
read_suffix_seqs = {}

with open(reads_file) as f:
	for l in f:
		read_prefix_seqs[l.strip()] = ""
		read_suffix_seqs[l.strip()] = ""

for l in sys.stdin:
	parts = l.strip().split('\t')
	position = int(parts[1])
	if start_position < end_position and position < start_position: continue
	if start_position < end_position and position > end_position: continue
	if start_position > end_position and position > end_position and position < start_position: continue
	ref_base = parts[2]
	bases = parts[4]
	bases = bases.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T').replace('.', ref_base).replace(',', ref_base)
	reads = parts[6].split(',')
	read_index = 0
	i = 0
	while i < len(bases):
		base = bases[i]
		if bases[i] == '^':
			i += 2
			continue
		if bases[i] == '$':
			i += 1
			continue
		if i < len(bases)-1 and (bases[i+1] == '-' or bases[i+1] == '+'):
			numstart = i+2
			numend = numstart+1
			while bases[numend] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']: numend += 1
			num = int(bases[numstart:numend])
			base = bases[i+1:num+numend].replace('-', 'D').replace('+', 'I').replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
			if base[0] == 'I':
				base = base[1+numend-numstart:]
				assert len(base) > 0
			if base[0] == 'D':
				base = ""
			base = bases[i] + base
			if base[0] == "*": base = base[1:]
			i = num + numend - 1
		if base == "*": base = ""
		read = reads[read_index]
		if read in read_suffix_seqs:
			if position >= start_position:
				read_prefix_seqs[read] += base
			else:
				read_suffix_seqs[read] += base
		read_index += 1
		i += 1

for read in read_prefix_seqs:
	if len(read_prefix_seqs[read]) == 0 and len(read_suffix_seqs[read]) == 0: continue
	print(">" + read)
	print(read_prefix_seqs[read] + read_suffix_seqs[read])
