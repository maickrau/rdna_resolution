#!/usr/bin/python

import sys

indices_file = sys.argv[1]
path_prefix = sys.argv[2]
# pileup from stdin

valid_indices = set()
with open(indices_file) as f:
	for l in f:
		valid_indices.add(l.strip())

base_mapping = {'a': 'A', 'A': 'A', 'c': 'C', 'C': 'C', 'g': 'G', 'G': 'G', 't': 'T', 'T': 'T', '.': "ref", ',': "ref", "*": 'D'}

indel_index = {}

for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[1] not in valid_indices: continue
	ref_base = parts[2]
	bases = parts[4]
	reads = parts[6].split(',')
	reads_per_base = {}
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
			indel = bases[i+1:num+numend].replace('-', 'D').replace('+', 'I').replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
			if indel not in indel_index:
				next_index = len(indel_index)
				indel_index[indel] = next_index
			indel = indel[0] + str(indel_index[indel])
			i = num + numend - 1
		if base in base_mapping: base = base_mapping[base]
		if base not in reads_per_base: reads_per_base[base] = set()
		reads_per_base[base].add(reads[read_index])
		read_index += 1
		i += 1
	assert read_index == len(reads)
	for base in reads_per_base:
		assert base in ['a', 'A', 'c', 'C', 'g', 'G', 't', 'T', 'ref', 'D']
		file = path_prefix + parts[1] + "_" + base + ".txt"
		if base == "ref": file = path_prefix + parts[1] + "_" + ref_base + ".txt"
		with open(file, 'w') as f:
			for read in reads_per_base[base]:
				f.write(read + "\n")
