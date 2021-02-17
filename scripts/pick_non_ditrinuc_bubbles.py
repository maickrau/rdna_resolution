#!/usr/bin/python

import fileinput

nodeseqs = {}
edges = {}

def reversenode(node):
	return (">" if node[0] == "<" else "<") + node[1:]

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

for l in fileinput.input():
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		nodeseqs[parts[1]] = parts[2]
	if parts[0] == 'L':
		fromnode = (">" if parts[2] == "+" else "<") + parts[1]
		tonode = (">" if parts[4] == "+" else "<") + parts[3]
		if fromnode not in edges: edges[fromnode] = set()
		edges[fromnode].add(tonode)
		if reversenode(tonode) not in edges: edges[reversenode(tonode)] = set()
		edges[reversenode(tonode)].add(reversenode(fromnode))

result = set()

for n in edges:
	if len(edges[n]) != 2: continue
	is_simple_bubble = True
	unique_end = None
	alleles = []
	for edge in edges[n]:
		alleles.append(edge)
		if edge not in edges:
			is_simple_bubble = False
			break
		if len(edges[edge]) != 1:
			is_simple_bubble = False
			break
		end_here = None
		if len(edges[reversenode(edge)]) != 1:
			is_simple_bubble = False
			break
		for edge2 in edges[edge]: end_here = edge2
		if unique_end is not None and edge2 != unique_end:
			is_simple_bubble = False
			break
		unique_end = edge2
	if unique_end is None:
		is_simple_bubble = False
	else:
		assert reversenode(unique_end) in edges
		if len(edges[reversenode(unique_end)]) != 2: is_simple_bubble = False
	if not is_simple_bubble: continue
	assert len(alleles) == 2
	allele1 = alleles[0]
	allele2 = alleles[1]
	is_valid = True
	assert allele1[1:] in nodeseqs
	assert allele2[1:] in nodeseqs
	if len(nodeseqs[allele1[1:]]) < len(nodeseqs[allele2[1:]]): (allele2, allele1) = (allele1, allele2)
	if len(nodeseqs[allele1[1:]]) != 1: is_valid = False
	# if len(nodeseqs[allele1[1:]]) == 2 and len(nodeseqs[allele2[1:]]) == 1: is_valid = False
	if len(nodeseqs[allele1[1:]]) > 1 and len(nodeseqs[allele2[1:]]) == 1:
		length_difference = len(nodeseqs[allele1[1:]]) - len(nodeseqs[allele2[1:]])
		allele_seq = nodeseqs[allele1[1:]]
		if allele1[0] == "<": allele_seq = revcomp(allele_seq)
		left_seq = nodeseqs[n[1:]]
		if n[0] == "<": left_seq = revcomp(left_seq)
		right_seq = nodeseqs[unique_end[1:]]
		if unique_end[0] == "<": right_seq = revcomp(right_seq)
		if len(left_seq) < length_difference:
			is_valid = False
		else:
			if left_seq[-length_difference+1:] + allele_seq[0] == allele_seq[1:]: is_valid = False
		if len(right_seq) < length_difference:
			is_valid = False
		else:
			if allele_seq[:-1] == allele_seq[-1] + right_seq[:length_difference-1]: is_valid = False
	if is_valid:
		result.add(allele1[1:])
		result.add(allele2[1:])

for node in result:
	print(node)
