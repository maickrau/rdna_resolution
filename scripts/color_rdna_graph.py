#!/usr/bin/python

import sys

# gfa from stdin

def color_from_chr(c):
	if c == "chr13":
		return "#FF0000"
	elif c == "chr14":
		return "#00FF00"
	elif c == "chr15":
		return "#0000FF"
	elif c == "chr21":
		return "#FFFF00"
	elif c == "chr22":
		return "#00FFFF"
	assert False

nodes_covered = {}

for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		if parts[1] not in nodes_covered: nodes_covered[parts[1]] = set()
	if parts[0] == 'P':
		chr_name = parts[1]
		nodes = parts[2].replace("+", "").replace("-", "").split(',')
		for node in nodes:
			assert node in nodes_covered
			nodes_covered[node].add(chr_name)

print("node,colour,chromosome")
for node in nodes_covered:
	chromosome_covers = []
	for cover in nodes_covered[node]:
		chromosome_covers.append(cover[0:5])
	if len(chromosome_covers) != 2 or chromosome_covers[0] != chromosome_covers[1]:
		print(node + ",#CCCCCC,")
	else:
		print(node + "," + color_from_chr(chromosome_covers[0]) + "," + chromosome_covers[0])

