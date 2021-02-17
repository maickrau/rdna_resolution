#!/usr/bin/python

import sys

snp_position_file = sys.argv[1]
# hifi pileup from stdin
# snp masked hifi reads to stdout

read_suffix = {}
read_prefix = {}

snp_positions = set()
with open(snp_position_file) as f:
	for l in f:
		snp_positions.add(int(l.strip()))

suffix_reads = set()
for l in sys.stdin:
	parts = l.strip().split('\t')
	position = int(parts[1])
	ref_base = parts[2]
	bases = parts[4]
	reads = parts[6].split(',')
	if position == 1:
		suffix_reads = set(reads)
	read_index = 0
	i = 0
	while i < len(bases):
		if bases[i] == '^':
			i += 2
		base = bases[i]
		if i < len(bases)-1 and bases[i+1] == '$':
			if reads[read_index] in suffix_reads: suffix_reads.remove(reads[read_index])
			i += 2
			read_index += 1
			continue
		if base == "." or base == ",": base = ref_base
		if i < len(bases)-1 and (bases[i+1] == '-' or bases[i+1] == '+'):
			numstart = i+2
			numend = numstart+1
			while bases[numend] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']: numend += 1
			num = int(bases[numstart:numend])
			i = num + numend - 1
		if position not in snp_positions:
			base = ref_base
		if base == '*': base = ""
		if base == 'a': base = 'A'
		if base == 'c': base = 'C'
		if base == 'g': base = 'G'
		if base == 't': base = 'T'
		if read_index == len(reads):
			print(position)
			print(i)
			print(len(bases))
		if reads[read_index] in suffix_reads:
			if reads[read_index] not in read_suffix: read_suffix[reads[read_index]] = ""
			read_suffix[reads[read_index]] += base
		else:
			if reads[read_index] not in read_prefix: read_prefix[reads[read_index]] = ""
			read_prefix[reads[read_index]] += base
		read_index += 1
		i += 1

reads = set(read_prefix.keys()).union(read_suffix.keys())
for read in reads:
	seq = ""
	if read in read_prefix: seq += read_prefix[read]
	if read in read_suffix: seq += read_suffix[read]
	assert len(seq) > 0
	print(">" + read)
	print(seq)

