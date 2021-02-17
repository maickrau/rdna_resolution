#!/usr/bin/python

import sys
import re

gfafile = sys.argv[1]
max_bubble_size = int(sys.argv[2])
max_bubble_paths = int(sys.argv[3])
# gfa to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def reversenode(n):
	return (">" if n[0] == "<" else "<") + n[1:]

def getone(things):
	for thing in things: return thing

def hpc(s):
	s = re.sub("A+", "A", s)
	s = re.sub("C+", "C", s)
	s = re.sub("G+", "G", s)
	s = re.sub("T+", "T", s)
	return s

def dinuc_hpc(s):
	s = re.sub("(AA){2,}", "AA", s)
	s = re.sub("(AC){2,}", "AC", s)
	s = re.sub("(AG){2,}", "AG", s)
	s = re.sub("(AT){2,}", "AT", s)
	s = re.sub("(CC){2,}", "CC", s)
	s = re.sub("(CG){2,}", "CG", s)
	s = re.sub("(CT){2,}", "CT", s)
	s = re.sub("(GG){2,}", "GG", s)
	s = re.sub("(GT){2,}", "GT", s)
	s = re.sub("(TT){2,}", "TT", s)
	return s

def compress(s):
	s = hpc(s)
	s = dinuc_hpc(s)
	return s

def enumerate_paths_rec(result, current_seq, pos, end):
	global nodeseqs
	global edges
	if pos[0] == '>':
		new_seq = current_seq + nodeseqs[pos[1:]]
	else:
		new_seq = current_seq + revcomp(nodeseqs[pos[1:]])
	if pos == end:
		result.append(new_seq)
		return
	assert len(edges[pos]) >= 1
	for edge in edges[pos]:
		enumerate_paths_rec(result, new_seq, edge, end)
		if len(result) > max_bubble_paths: return

def enumerate_paths(start, end):
	global nodeseqs
	global edges
	result = []
	enumerate_paths_rec(result, "", start, end)
	if len(result) > max_bubble_paths: return None
	return result

def forbid_bubble(start, end):
	global keep_nodes
	global keep_edges
	global edges
	found_nodes = set()
	stack = [start]
	while len(stack) != 0:
		top = stack.pop()
		if top[1:] in found_nodes: continue
		found_nodes.add(top[1:])
		if top == end: continue
		for edge in edges[top]: stack.append(edge)
	for node in found_nodes:
		if node in keep_nodes: keep_nodes.remove(node)
		if ">" + node in edges:
			for edge in edges[">" + node]:
				if edge[1:] not in found_nodes: continue
				key = (">" + node, edge)
				if key in keep_edges: keep_edges.remove(key)
				key = (reversenode(edge), reversenode(">" + node))
				if key in keep_edges: keep_edges.remove(key)
		if "<" + node in edges:
			for edge in edges["<" + node]:
				if edge[1:] not in found_nodes: continue
				key = ("<" + node, edge)
				if key in keep_edges: keep_edges.remove(key)
				key = (reversenode(edge), reversenode("<" + node))
				if key in keep_edges: keep_edges.remove(key)

next_path_num = 0
def add_paths(start, end, paths):
	global next_path_num
	for path in paths:
		middle_seq = path[len(nodeseqs[start[1:]]):-len(nodeseqs[end[1:]])]
		if len(middle_seq) == 0:
			print("L\t" + start[1:] + "\t" + ("+" if start[0] == ">" else "<") + "\t" + end[1:] + "\t" + ("+" if end[0] == ">" else "<") + "\t0M")
			continue
		new_path_name = "new_path_" + str(next_path_num)
		print("S\t" + new_path_name + "\t" + middle_seq)
		print("L\t" + start[1:] + "\t" + ("+" if start[0] == ">" else "<") + "\t" + new_path_name + "\t+\t0M")
		print("L\t" + new_path_name + "\t+\t" + end[1:] + "\t" + ("+" if end[0] == ">" else "<") + "\t0M")
		next_path_num += 1

def keep_one_path(start, end):
	global edges
	global keep_nodes
	global keep_edges
	path = [start]
	while path[-1] != end:
		path.append(getone(edges[path[-1]]))
	for n in path: keep_nodes.add(n[1:])
	for i in range(1, len(path)): keep_edges.add((path[i-1], path[i]))

# Detecting Superbubbles in Assembly Graphs, Onodera et al 2013
# fig. 5
def find_bubble(s):
	global nodeseqs
	global edges
	if s not in edges: return None
	if len(edges[s]) < 2: return None
	S = [s]
	visited = set()
	seen = set()
	seen.add(s)
	while len(S) > 0:
		v = S.pop()
		assert v in seen
		seen.remove(v)
		assert v not in visited
		visited.add(v)
		if len(visited) > max_bubble_size: return None
		if v not in edges: return None
		if len(edges[v]) == 0: return None
		for u in edges[v]:
			if u[1:] == v[1:]: return None
			if reversenode(u) in visited: return None
			if u == s: return None
			assert u not in visited
			seen.add(u)
			assert reversenode(u) in edges
			assert len(edges[reversenode(u)]) >= 1
			has_nonvisited_parent = False
			for parent_edge in edges[reversenode(u)]:
				parent = reversenode(parent_edge)
				if parent not in visited: has_nonvisited_parent = True
			if not has_nonvisited_parent: S.append(u)
		if len(S) == 1 and len(seen) == 1 and S[0] == getone(seen):
			t = S.pop()
			if t in edges:
				for edge in edges[t]:
					if edge == s: return None
			return (s, t)
	return None

nodeseqs = {}
edges = {}
edge_overlap = {}
with open(gfafile) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			nodeseqs[parts[1]] = parts[2]
		elif parts[0] == 'L':
			fromnode = (">" if parts[2] == "+" else "<") + parts[1]
			tonode = (">" if parts[4] == "+" else "<") + parts[3]
			if fromnode not in edges: edges[fromnode] = set()
			edges[fromnode].add(tonode)
			if reversenode(tonode) not in edges: edges[reversenode(tonode)] = set()
			edges[reversenode(tonode)].add(reversenode(fromnode))
			edge_overlap[(fromnode, tonode)] = parts[5]
			edge_overlap[(reversenode(tonode), reversenode(fromnode))] = parts[5]

force_keep_nodes = set()
keep_nodes = set(nodeseqs.keys())
keep_edges = set()
for edge1 in edges:
	for edge2 in edges[edge1]:
		keep_edges.add((edge1, edge2))

handled = set()

for n in edges:
	bubble = find_bubble(n)
	if bubble is None: continue
	(start, end) = bubble
	assert start == n
	if reversenode(end) in handled: continue
	handled.add(start)
	handled.add(reversenode(end))
	paths = enumerate_paths(start, end)
	if paths is None: continue
	if len(paths) == 1: continue
	compressed_paths = set()
	kept_paths = set()
	for path in paths:
		compressed = compress(path)
		if compressed in compressed_paths: continue
		compressed_paths.add(compressed)
		kept_paths.add(path)
	forbid_bubble(start, end)
	add_paths(start, end, kept_paths)
	force_keep_nodes.add(start[1:])
	force_keep_nodes.add(end[1:])

for n in force_keep_nodes: keep_nodes.add(n)

for n in keep_nodes:
	print("S\t" + n + "\t" + nodeseqs[n])
for (fromnode, tonode) in keep_edges:
	if fromnode[1:] not in keep_nodes: continue
	if tonode[1:] not in keep_nodes: continue
	print("L\t" + fromnode[1:] + "\t" + ("+" if fromnode[0] == ">" else "-") + "\t" + tonode[1:] + "\t" + ("+" if tonode[0] == ">" else "-") + "\t" + edge_overlap[(fromnode, tonode)])
