#!/usr/bin/python

import sys

# graph from stdin
# graph to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def canon(s):
	bw = revcomp(s)
	if bw < s: return bw
	return s

nodeseqs = {}
has_seq = {}
nodelines = []
edges = {}
edgelines = []

for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		nodeseqs[parts[1]] = parts[2]
		nodelines.append((parts[1], l.strip()))
		if canon(parts[2]) not in has_seq: has_seq[canon(parts[2])] = []
		has_seq[canon(parts[2])].append(parts[1])
	elif parts[0] == 'L':
		edgelines.append((parts[1], parts[3], l.strip()))
		fromtip = (parts[1], parts[2])
		totip = (parts[3], "+" if parts[4] == "-" else "-")
		if fromtip not in edges: edges[fromtip] = set()
		if totip not in edges: edges[totip] = set()
		edges[fromtip].add(totip)
		edges[totip].add(fromtip)
	else:
		print(l.strip())

removed_nodes = set()
keep_going = True
iteration = 0

while keep_going:
	keep_going = False
	sys.stderr.write("iteration " + str(iteration) + "\n")
	iteration += 1
	for seq in has_seq:
		for n in has_seq[seq]:
			if n in removed_nodes: continue
			for n2 in has_seq[seq]:
				if n2 in removed_nodes: continue
				if n == n2: continue
				n_fw = set()
				n_bw = set()
				if (n, "+") in edges: n_fw = edges[(n, "+")]
				if (n, "-") in edges: n_bw = edges[(n, "-")]
				if nodeseqs[n] != seq:
					(n_fw, n_bw) = (n_bw, n_fw)
				n2_fw = set()
				n2_bw = set()
				if (n2, "+") in edges: n2_fw = edges[(n2, "+")]
				if (n2, "-") in edges: n2_bw = edges[(n2, "-")]
				if nodeseqs[n2] != seq:
					(n2_fw, n2_bw) = (n2_bw, n2_fw)
				if len(n_fw.intersection(n2_fw)) < len(n_fw): continue
				if len(n_bw.intersection(n2_bw)) < len(n_bw): continue
				if n > n2 and len(n_fw.intersection(n2_fw)) == len(n2_fw) and len(n_bw.intersection(n2_bw)) == len(n2_bw): continue
				assert n not in removed_nodes
				removed_nodes.add(n)
				keep_going = True
				break
	for n in removed_nodes:
		if (n, "+") in edges:
			for tip in edges[(n, "+")]:
				assert (n, "+") in edges[tip]
				edges[tip].remove((n, "+"))
			del edges[(n, "+")]
		if (n, "-") in edges:
			for tip in edges[(n, "-")]:
				assert (n, "-") in edges[tip]
				edges[tip].remove((n, "-"))
			del edges[(n, "-")]

for n in nodelines:
	if n[0] not in removed_nodes: print(n[1])
for e in edgelines:
	if e[0] not in removed_nodes and e[1] not in removed_nodes: print(e[2])
