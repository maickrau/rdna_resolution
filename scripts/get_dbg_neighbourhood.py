#!/usr/bin/python

import sys

initial_nodes_file = sys.argv[1]
graph_file = sys.argv[2]
max_dist = int(sys.argv[3])
k = int(sys.argv[4]) - 1

initial_nodes = set()
with open(initial_nodes_file) as f:
	for l in f:
		initial_nodes.add(l.strip())

edges = {}
nodelens = {}
with open(graph_file) as f:
	for l in f:
		if l[0] == 'L':
			parts = l.strip().split('\t')
			if parts[1] not in edges: edges[parts[1]] = set()
			if parts[3] not in edges: edges[parts[3]] = set()
			edges[parts[1]].add(parts[3])
			edges[parts[3]].add(parts[1])
		if l[0] == 'S':
			parts = l.strip().split('\t')
			nodelens[parts[1]] = len(parts[2])

check_queue = []
found = set()
for i in range(0, max_dist):
	check_queue.append(set())
for node in initial_nodes:
	check_queue[0].add(node)

for i in range(0, max_dist):
	for node in check_queue[i]:
		if node in found: continue
		found.add(node)
		if node not in edges: continue
		for edge in edges[node]:
			if edge in found: continue
			if i + nodelens[edge] - k < max_dist:
				check_queue[i + nodelens[edge] - k].add(edge)

with open(graph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if l[0] == 'S':
			if parts[1] in found: print(l.strip())
		if l[0] == 'L':
			if parts[1] in found and parts[3] in found: print(l.strip())
