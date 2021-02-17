#!/usr/bin/python

import fileinput

# loops from stdin
# loops to stdout

lines = []
has_double = set()
found = set()

for l in fileinput.input():
	parts = l.strip().split('\t')
	lines.append(parts)
	if parts[0] in found:
		has_double.add("_".join(parts[0].split('_')[:-1]))
	found.add(parts[0])

for l in lines:
	if "_".join(l[0].split('_')[:-1]) in has_double: continue
	print("\t".join(l))
