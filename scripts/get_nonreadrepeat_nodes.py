#!/usr/bin/python

import sys

# gaf from stdin

max_count = {}
for line in sys.stdin:
	l = line.split('\t')[5]
	nodes = l.replace('>', '\t').replace('<', '\t').strip().split('\t')
	counts = {}
	for node in nodes:
		if node not in counts: counts[node] = 0
		counts[node] += 1
	for n in counts:
		if n not in max_count: max_count[n] = 0
		max_count[n] = max(max_count[n], counts[n])

for n in max_count:
	if max_count[n] == 1: print(n)
