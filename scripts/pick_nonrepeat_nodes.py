#!/usr/bin/python

import sys

# paths from stdin

found_nodes = set()
found_multinodes = set()

for l in sys.stdin:
	nodes = l.strip().replace('<', '\t').replace('>', '\t').strip().split('\t')
	found = set()
	for n in nodes:
		found_nodes.add(n)
		if n in found:
			found_multinodes.add(n)
		else:
			found.add(n)

for n in found_nodes:
	if n in found_multinodes: continue
	print(n)
