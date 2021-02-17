#!/usr/bin/python

import sys

longnodefile = sys.argv[1]
orientnode = sys.argv[2]
anchornodefile = sys.argv[3]
# gaf from stdin

def reversepath(p):
	return [(">" if n[0] == "<" else "<") + n[1:] for n in p[::-1]]

anchornodes = set()
with open(anchornodefile) as f:
	for l in f:
		anchornodes.add(l.strip())

longnodes = set()
with open(longnodefile) as f:
	for l in f:
		longnodes.add(l.strip())

for l in sys.stdin:
	parts = l.strip().split('\t')
	pathstr = parts[5] + '>'
	path = []
	name = parts[0].split(' ')[0]
	last_break = 0
	for i in range(1, len(l)):
		if l[i] == '>' or l[i] == '<':
			if l[last_break+1:i] in longnodes:
				path.append(l[last_break:i])
			last_break = i
	if len(path) == 0: continue
	fw = None
	for node in path:
		if node == orientnode:
			fw = True
			break
		if node[1:] == orientnode[1:] and node[0] != orientnode[0]:
			fw = False
			break
	if fw is None: continue
	if not fw: path = reversepath(path)
	while len(path) > 0 and path[-1][1:] not in anchornodes: path = path[:-1]
	while len(path) > 0 and path[0][1:] not in anchornodes: path = path[1:]
	if len(path) == 0: continue
	last_anchor = 0
	path_count = 0
	for i in range(1, len(path)):
		if path[i][1:] in anchornodes:
			print(name + "_" + str(path_count) + "\t" + "".join(path[last_anchor:i+1]))
			last_anchor = i
			path_count += 1
