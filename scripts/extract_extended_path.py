#!/usr/bin/python

import sys

graphfile = sys.argv[1]
# gaf from stdin

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C', 'a': 'T', 't': 'A', 'c': 'G', 'g': 'C'}
	return "".join(comp[c] for c in s[::-1])

def getone(s):
	for i in s:
		return i

def extend_path(path, edges):
	assert len(path) > 0
	rev_pos = (path[0][0], not path[0][1])
	rev_extension = []
	while len(edges[rev_pos]) == 1:
		rev_pos = getone(edges[rev_pos])
		rev_extension.append((rev_pos[0], not rev_pos[1]))
	fw_pos = path[-1]
	fw_extension = []
	while len(edges[fw_pos]) == 1:
		fw_pos = getone(edges[fw_pos])
		fw_extension.append(fw_pos)
	return rev_extension[::-1] + path + fw_extension

nodeseqs = {}
edges = {}

with open(graphfile) as f:
	for l in f:
		if l[0] == 'S':
			parts = l.strip().split('\t')
			nodeseqs[parts[1]] = parts[2]
			edges[(parts[1], True)] = set()
			edges[(parts[1], False)] = set()
		if l[0] == 'L':
			parts = l.strip().split('\t')
			edges[(parts[1], parts[2] == '+')].add((parts[3], parts[4] == '+'))
			edges[(parts[3], parts[4] == '-')].add((parts[1], parts[2] == '-'))
			if parts[5] != "0M":
				print("Graphs with overlap are not supported")
				sys.stderr.write("Graphs with overlap are not supported\n")
				sys.exit(1)

for l in sys.stdin:
	parts = l.strip().split('\t')
	if len(parts) < 11: continue
	readname = parts[0] + "_" + parts[2] + "_" + parts[3] + "_" + parts[1]
	seq = ""
	last_break = 0
	parts[5] += '>'
	path = []
	for i in range(1, len(parts[5])):
		if parts[5][i] == '>' or parts[5][i] == '<':
			node = parts[5][last_break+1:i]
			fw = parts[5][last_break] == '>'
			path.append((node, fw))
			last_break = i
	path = extend_path(path, edges)
	for node in path:
		add_seq = nodeseqs[node[0]]
		if not node[1]: add_seq = revcomp(add_seq)
		seq += add_seq
	print(">" + readname)
	print(seq)

