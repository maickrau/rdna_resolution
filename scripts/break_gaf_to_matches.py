#!/usr/bin/python

import sys

graph_file = sys.argv[1]
# gaf from stdin
# gaf to stdout

def filter_path(path, start, end):
	global node_lens
	while start >= node_lens[path[0][1:]]:
		start -= node_lens[path[0][1:]]
		end -= node_lens[path[0][1:]]
		path = path[1:]
	pathlen = sum(node_lens[p[1:]] for p in path)
	assert pathlen >= end
	while pathlen - end >= node_lens[path[-1][1:]]:
		pathlen -= node_lens[path[-1][1:]]
		path = path[:-1]
	pathlen = sum(node_lens[p[1:]] for p in path)
	return ("".join(path), str(pathlen), str(start), str(end))

def output_part_match(parts, readpos, pathpos, length):
	global node_lens
	assert readpos + length <= int(parts[3])
	assert pathpos + length <= int(parts[8])
	assert readpos >= int(parts[2])
	assert pathpos >= int(parts[7])
	out_parts = list(parts)
	out_parts[2] = str(readpos)
	out_parts[3] = str(readpos + length)
	path = parts[5].replace('<', '\t<').replace('>', '\t>').strip().split('\t')
	(out_parts[5], out_parts[6], out_parts[7], out_parts[8]) = filter_path(path, pathpos, pathpos + length)
	assert int(out_parts[3]) - int(out_parts[2]) == length
	assert int(out_parts[8]) - int(out_parts[7]) == length
	assert int(out_parts[7]) >= 0
	assert int(out_parts[8]) <= int(out_parts[6])
	newpath = out_parts[5].replace('<', '\t<').replace('>', '\t>').strip().split('\t')
	assert int(out_parts[7]) < node_lens[newpath[0][1:]]
	out_parts[16] = "cg:Z:" + str(length) + "="
	out_parts.append("or:Z:" + str(parts[2]) + "-" + str(parts[3]))
	print("\t".join(out_parts))

node_lens = {}
with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			node_lens[parts[1]] = len(parts[2])

for l in sys.stdin:
	parts = l.strip().split('\t')
	path = parts[5].replace('<', '\t<').replace('>', '\t>').strip().split('\t')
	cigar = parts[16][5:].replace('=', '=\t').replace('I', 'I\t').replace('D', 'D\t').replace('X', 'X\t').strip().split('\t')
	readpos = int(parts[2])
	pathpos = int(parts[7])
	for c in cigar:
		length = int(c[:-1])
		if c[-1] == 'I':
			readpos += length
		elif c[-1] == 'D':
			pathpos += length
		elif c[-1] == 'X':
			readpos += length
			pathpos += length
		elif c[-1] == '=':
			output_part_match(parts, readpos, pathpos, length)
			readpos += length
			pathpos += length
