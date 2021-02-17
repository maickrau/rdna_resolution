#!/usr/bin/python

import sys
import re

min_coverage = int(sys.argv[1])
min_fraction = float(sys.argv[2])
# pileup from stdin
# positions to stdout

for l in sys.stdin:
	parts = l.strip().split('\t')
	i = 0
	bases = parts[4]
	char_cov = {'A': 0, 'C': 0, 'G': 0, 'T': 0}
	num_ref = 0
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
			i = num + numend - 1
		i += 1
		if base == '*': continue
		if base == '.':
			num_ref += 1
			continue
		if base == ',':
			num_ref += 1
			continue
		if base == 'a': base = 'A'
		if base == 'c': base = 'C'
		if base == 'g': base = 'G'
		if base == 't': base = 'T'
		if base not in ['A', 'C', 'G', 'T']:
			sys.stderr.write(base + '\n')
		assert base in ['A', 'C', 'G', 'T']
		char_cov[base] += 1
	total_coverage = num_ref
	for base in char_cov:
		total_coverage += char_cov[base]
	if num_ref < min_coverage: continue
	if float(num_ref)/float(total_coverage) < min_fraction: continue
	for base in char_cov:
		if char_cov[base] < min_coverage: continue
		if float(char_cov[base])/float(total_coverage) < min_fraction: continue
		print(parts[1])
		break
