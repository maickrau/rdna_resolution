#!/usr/bin/python

import sys

graphfile = sys.argv[1]
allelesfile = sys.argv[2]
gaffile = sys.argv[3]
uniquesfile = sys.argv[4]
min_coverage = int(sys.argv[5])
max_coverage = int(sys.argv[6])

def canonpath(path):
    pathstr = "".join(path)
    reverse = [('>' if n[0] == '<' else '<') + n[1:] for n in path[::-1]]
    revstr = "".join(reverse)
    if pathstr < revstr: return (path, True)
    return (reverse, False)

alleles = set()
with open(allelesfile) as f:
	for l in f:
		parts = l.strip().split(' ')
		coverage = int(parts[0])
		if coverage < min_coverage or coverage > max_coverage: continue
		alleles.add(parts[1])

uniques = set()
with open(uniquesfile) as f:
	for l in f:
		uniques.add(l.strip())

allele_edges = {}

with open(gaffile) as f:
	for l in f:
		pathstr = l.strip().split('\t')[5] + '>'
		path = []
		last_break = 0
		for i in range(1, len(pathstr)):
			if pathstr[i] == '<' or pathstr[i] == '>':
				path.append(pathstr[last_break:i])
				last_break = i
		last_unique = 0
		while last_unique < len(path) and path[last_unique][1:] not in uniques: last_unique += 1
		last_allele = None
		for i in range(last_unique+1, len(path)):
			if path[i][1:] in uniques:
				(allele, direction) = canonpath(path[last_unique:i+i])
				last_unique = i
				if "".join(allele) not in alleles:
					last_allele = None
					continue
				this_allele = (allele, direction)
				if last_allele is not None:
					key = canon(last_allele, this_allele)
					if kay not in allele_edges: allele_edges[key] = 0
					allele_edges[key] += 1
				last_allele = this_allele

for allele in alleles:
	print("S\t" + allele + "\t*")
for edge in allele_edges:
	print("L\t" + edge[0][0] + "\t" + ("+" if edge[0][1] else "-") + "\t" + edge[1][0] + "\t" + ("+" if edge[1][1] else "-") + "\t0M")

