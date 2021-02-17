#!/usr/bin/python

import sys

# pairs from stdin 

parent = {}

def find(n):
	global parent
	while parent[n] != parent[parent[n]]: parent[n] = parent[parent[n]]
	return parent[n]

def merge(n1, n2):
	parent[find(n1)] = find(n2)

for l in sys.stdin:
	parts = l.strip().split(' ')
	if parts[0] not in parent: parent[parts[0]] = parts[0]
	if parts[1] not in parent: parent[parts[1]] = parts[1]
	merge(parts[0], parts[1])

belongs_to_parent = {}
keys = set(parent.keys())
for n in keys:
	if find(n) not in belongs_to_parent: belongs_to_parent[find(n)] = set()
	belongs_to_parent[find(n)].add(n)

for group in belongs_to_parent:
	print(" ".join(belongs_to_parent[group]))

