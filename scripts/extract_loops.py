#!/usr/bin/python

import sys

loop_start = sys.argv[1] # format >node_id
# gaf from stdin
# loop ends from argv[2:]
loop_ends = set()
for v in sys.argv[2:]:
	loop_ends.add(v) # format node_id
# loops to stdout

def reverse_path(p):
	return [(">" if n[0] == "<" else "<") + n[1:] for n in p[::-1]]

loop_ends.add(loop_start[1:])
for l in sys.stdin:
	parts = l.strip().split('\t')
	pathstr = parts[5] + '>'
	path = []
	last_break = 0
	for i in range(1, len(pathstr)):
		if pathstr[i] == '>' or pathstr[i] == '<':
			path.append(pathstr[last_break:i])
			last_break = i
	name = parts[0].split(' ')[0]
	last_end = 0
	loops = []
	while last_end < len(path) and path[last_end][1:] not in loop_ends: last_end += 1
	for i in range(last_end+1, len(path)):
		if path[i][1:] in loop_ends:
			loops.append(path[last_end:i+1])
			last_end = i
	if len(loops) < 1: continue
	assert loops[0][0][1:] == loop_start[1:] or loops[0][-1][1:] == loop_start[1:]
	if loops[0][0][1:] == loop_start[1:]:
		if loops[0][0][0] != loop_start[0]:
			loops = [reverse_path(p) for p in loops[::-1]]
	else:
		assert loops[0][-1][1:] == loop_start[1:]
		if loops[0][-1][0] != loop_start[0]:
			loops = [reverse_path(p) for p in loops[::-1]]
	assert loops[0][0] == loop_start or loops[0][-1] == loop_start
	for i in range(0, len(loops)):
		print(name + "_loop_" + str(i) + "\t" + "".join(loops[i]))

