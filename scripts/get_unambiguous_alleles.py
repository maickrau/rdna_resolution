#!/usr/bin/python

import sys

allele_node_file = sys.argv[1]
max_removable = int(sys.argv[2])
# node1+,node2+ paths from stdin
# or >node1>node2 paths from stdin

def is_inconsistent(path1, path2, middle_node):
	left_middle_node_index = None
	right_middle_node_index = None
	for i in range(0, len(path1)):
		if path1[i] == middle_node:
			assert left_middle_node_index is None
			left_middle_node_index = i
	for i in range(0, len(path2)):
		if path2[i] == middle_node:
			assert right_middle_node_index is None
			right_middle_node_index = i
	assert left_middle_node_index is not None
	assert right_middle_node_index is not None
	left_overlap = min(left_middle_node_index, right_middle_node_index)
	right_overlap = min(len(path1)-left_middle_node_index-1, len(path2)-right_middle_node_index-1)
	for i in range(0, left_overlap):
		if path1[left_middle_node_index - 1 - i] != path2[right_middle_node_index - 1 - i]: return True
	for i in range(0, right_overlap):
		if path1[left_middle_node_index + 1 + i] != path2[right_middle_node_index + 1 + i]: return True
	return False

def get_consistent_subset(paths, middle_node):
	original_size = len(paths)
	for i in range(0, max_removable):
		inconsistencies = {}
		for path1 in paths:
			for path2 in paths:
				if is_inconsistent(path1, path2, middle_node):
					if path1 not in inconsistencies: inconsistencies[path1] = 0
					if path2 not in inconsistencies: inconsistencies[path2] = 0
					inconsistencies[path1] += 1
					inconsistencies[path2] += 1
		if len(inconsistencies) == 0: break
		max_inconsistent = None
		for path in inconsistencies:
			if max_inconsistent is None or inconsistencies[path] > inconsistencies[max_inconsistent]:
				max_inconsistent = path
		assert max_inconsistent is not None
		new_paths = []
		for path in paths:
			if path != max_inconsistent: new_paths.append(path)
		paths = new_paths
	if len(paths) < original_size - max_removable: return None
	for path1 in paths:
		for path2 in paths:
			if is_inconsistent(path1, path2, middle_node): return None
	return paths

allele_nodes = set()
with open(allele_node_file) as f:
	for l in f:
		allele_nodes.add(l.strip())

paths = {}

for l in sys.stdin:
	nodes = [l.strip()]
	if "-" in l.strip():
		assert "+" not in l.strip()
		nodes = l.strip().replace("-", "").split(",")[::-1]
	if "+" in l.strip():
		assert "-" not in l.strip()
		nodes = l.strip().replace("+", "").split(',')
	if ">" in l.strip():
		assert "<" not in l.strip()
		nodes = l.replace(">", "\t").strip().split("\t")
	if "<" in l.strip():
		assert ">" not in l.strip()
		nodes = l.replace("<", "\t").strip().split("\t")[::-1]
	found = []
	for node in nodes:
		if node in allele_nodes: found.append(node)
	for i in range(0, len(found)):
		if found[i] not in paths: paths[found[i]] = []
		paths[found[i]].append(found)

for middle_node in paths:
	paths_here = get_consistent_subset([tuple(p) for p in paths[middle_node]], middle_node)
	if not paths_here: continue
	longest_left = [middle_node]
	longest_right = [middle_node]
	for path in paths_here:
		index = None
		for i in range(0, len(path)):
			if path[i] == middle_node:
				assert index is None
				index = i
		if index+1 > len(longest_left):
			longest_left = list(path[0:index+1])
		if len(path)-index > len(longest_right):
			longest_right = list(path[index:])
	print(middle_node + ": " + ",".join(str(n) for n in (longest_left + longest_right[1:])))
