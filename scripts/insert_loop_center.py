#!/usr/bin/python

import sys

prefix = sys.argv[1]
oneside_nodes = set([sys.argv[2], sys.argv[3]]) # format >123 >124
otherside_nodes = set([sys.argv[4], sys.argv[5]]) # format >123 >124
# graph from stdin
# graph to stdout

focus_oneside_nodes = set(s[1:] for s in oneside_nodes)
focus_otherside_nodes = set(s[1:] for s in otherside_nodes)

center_printed = False
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		if parts[1] not in focus_oneside_nodes:
			print(l.strip())
			continue
		if parts[1] in focus_oneside_nodes:
			if ">" + parts[1] in oneside_nodes:
				assert "<" + parts[1] not in oneside_nodes
				if not center_printed:
					print("S\t" + prefix + "\t" + parts[2][-1])
					center_printed = True
				parts[2] = parts[2][:-1]
			else:
				assert "<" + parts[1] in oneside_nodes
				if not center_printed:
					print("S\t" + prefix + "\t" + parts[2][0])
					center_printed = True
				parts[2] = parts[2][1:]
		print("\t".join(parts))
	if parts[0] == 'L':
		if parts[1] not in focus_oneside_nodes and parts[1] not in focus_otherside_nodes:
			print(l.strip())
			continue
		if parts[3] not in focus_oneside_nodes and parts[3] not in focus_otherside_nodes:
			print(l.strip())
			continue
		continue

for node in oneside_nodes:
	print("L\t" + node[1:] + "\t" + ("+" if node[0] == ">" else "<") + "\t" + prefix + "\t+\t0M")
for node in otherside_nodes:
	print("L\t" + prefix + "\t+\t" + node[1:] + "\t" + ("+" if node[0] == ">" else "<") + "\t0M")

assert center_printed