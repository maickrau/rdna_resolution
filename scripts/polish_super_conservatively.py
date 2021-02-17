#!/usr/bin/python

import sys
import re

ref_file = sys.argv[1]
min_coverage = int(sys.argv[2])
# pileup from stdin
# polished to stdout

ref_name = ""
ref_seq = ""
with open(ref_file) as f:
	for l in f:
		if l[0] == '>':
			ref_name = l[1:].strip()
		else:
			ref_seq += l.strip()

corrections = []
for l in sys.stdin:
	parts = l.strip().split('\t')
	i = 0
	ref_position = int(parts[1])
	ref_base = parts[2]
	bases = parts[4]
	possible_corrections = {}
	while i < len(bases):
		base = bases[i]
		if bases[i] == '^':
			i += 2
			continue
		if bases[i] == '$':
			i += 1
			continue
		if base == '*': base = ""
		if base == '*': base = ""
		if base == '.': base = ref_base
		if base == ',': base = ref_base
		if base == 'a': base = 'A'
		if base == 'c': base = 'C'
		if base == 'g': base = 'G'
		if base == 't': base = 'T'
		if i < len(bases)-1 and (bases[i+1] == '-' or bases[i+1] == '+'):
			numstart = i+2
			numend = numstart+1
			while bases[numend] in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']: numend += 1
			num = int(bases[numstart:numend])
			indel = bases[i+1:num+numend].replace('-', 'D').replace('+', 'I').replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
			assert len(indel) > num
			indel = bases[i+1] + indel[-num:]
			assert indel[0] == '-' or indel[0] == '+'
			if indel[0] == "+":
				indel = base + indel[1:]
				if indel not in possible_corrections: possible_corrections[indel] = 0
				possible_corrections[indel] += 1
			i = num + numend
			continue
		i += 1
		if base not in ['A', 'C', 'G', 'T', '']:
			sys.stderr.write(base + '\n')
		assert base in ['A', 'C', 'G', 'T', '']
		if base not in possible_corrections: possible_corrections[base] = 0
		possible_corrections[base] += 1
	if len(possible_corrections) >= 2: continue
	if len(possible_corrections) == 0: continue
	assert len(possible_corrections) == 1
	correction = None
	for c in possible_corrections:
		if possible_corrections[c] >= min_coverage: correction = c
	if correction is None: continue
	if correction == ref_base: continue
	corrections.append((ref_position, correction))

corrections = corrections[::-1]
for (ref_pos, correction) in corrections:
	ref_seq = ref_seq[:ref_pos-1] + correction + ref_seq[ref_pos:]

print(">" + ref_name)
print(ref_seq)

