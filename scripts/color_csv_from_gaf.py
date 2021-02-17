#!/usr/bin/python

import sys

# gaf from stdin
# colors from args pj13=red dj13=lightred etc
# multialn from pj13+dj13=pink etc
# latter in argument list has priority

color_priority = []

for arg in sys.argv[1:]:
	parts = arg.strip().split('=')
	key = set(parts[0].split("+"))
	color_priority.append((key, parts[1]))

node_covers = {}

for l in sys.stdin:
	parts = l.strip().split('\t')
	pathnodes = parts[5].replace('>', '\t').replace('<', '\t').split('\t')
	name = parts[0].split(' ')[0]
	for node in pathnodes:
		if node not in node_covers: node_covers[node] = set()
		node_covers[node].add(name)

print("Node,Alignment,Colour")
for n in node_covers:
	best = ("", "")
	for pair in color_priority:
		if pair[0].issubset(node_covers[n]):
			best = pair
	print(n + "," + "+".join(best[0]) + "," + best[1])
