#!/usr/bin/python

import sys

unique_node_file = sys.argv[1]
# gaf from stdin

def print_info(name, parts):
	if len(parts) == 0: return
	infobits = []
	for part in parts:
		if len(part) == 0:
			infobits.append("-")
		else:
			infobits.append(",".join(part))
	infostr = "\t".join(infobits)
	print(name + "\t" + infostr)

unique_nodes = set()
with open(unique_node_file) as f:
	for l in f:
		unique_nodes.add(l.strip())

current_read_name = ""
current_read_parts = []
for l in sys.stdin:
	parts = l.strip().split('\t')
	name = parts[0].split(' ')[0]
	if name != current_read_name:
		print_info(current_read_name, current_read_parts)
		current_read_name = name
		current_read_parts = []
	nodes = parts[5].replace('>', '\t').replace('<', '\t').strip().split('\t')
	current_chunk = []
	for node in nodes:
		if node in unique_nodes: current_chunk.append(node)
	current_read_parts.append(current_chunk)

print_info(current_read_name, current_read_parts)
