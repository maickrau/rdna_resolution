#!/usr/bin/python

import sys

graphfile = sys.argv[1]
gaffile = sys.argv[2]
corenodefile = sys.argv[3]
# output to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def get_edit_distance(allele1, allele2):
	row = [0]
	for i in range(0, len(allele1)):
		row.append(i)
	for i in range(0, len(allele2)):
		new_row = row.copy()
		new_row[0] = row[0]+1
		for j in range(1, len(allele1)):
			new_row[i] = min(new_row[i-1]+1, row[i]+1, row[i-1]+1)
			if allele2[i] == allele1[j]:
				new_row[i] = min(new_row[i], row[i-1])
		row = new_row
	return new_row[-1]

def get_path_match_start(part1, path2):


def alignment(path1, path2):
	global core_nodes
	global node_seqs
	path_match_start = get_path_match_start(path1, path2)
	if not path_match_start: return None
	pos1 = path_match_start[0]
	dir1 = path_match_start[1]
	pos2 = path_match_start[2]
	dir2 = path_match_start[3]
	matches = 0
	mismatches = 0
	while pos1 >= 0 and pos1 < len(path1) and pos2 >= 0 and pos2 < len(path2):
		assert path1[pos1][1:] == path2[pos2][1:]
		assert dir1 == dir2 or path1[pos1][0] != path2[pos2][0]
		assert dir1 != dir2 or path1[pos1][0] == path2[pos2][0]
		assert path1[pos1][1:] in core_nodes
		allele1 = ""
		allele2 = ""
		pos1 += dir1
		while pos1 >= 0 and pos1 < len(path1) and path1[pos1][1:] not in core_nodes:
			add = node_seqs[path1[pos1][1:]]
			if path1[pos1][0] == '<': add = revcomp(add)
			allele1 += add
			pos1 += dir1
		pos2 += dir2
		while pos2 >= 0 and pos2 < len(path2) and path2[pos2][1:] not in core_nodes:
			add = node_seqs[path2[pos2][1:]]
			if path2[pos2][0] == '<': add = revcomp(add)
			allele2 += add
			pos2 += dir2
		if pos1 < 0 or pos1 >= len(path1) or pos2 < 0 or pos2 >= len(path2): break
		edits = get_matches_mismatches(allele1, allele2)
		matcheshere = max(allele1, allele2) - edits
		matches += matcheshere
		mismatches += edits
	return (dir1, dir2, matches, mismatches)

node_seqs = {}
with open(graphfile) as f:
	for l in f:
		parts = l.strip().split('\t')
		node_seqs[parts[1]] = parts[2]

core_nodes = set()
with open(corenodefile) as f:
	for l in f:
		core_nodes.add(l.strip())

reads = []
with open(gaffile) as f:
	for l in f:
		parts = l.strip().split('\t')
		readname = parts[0]
		pathstr = parts[5] + '>'
		last_break = 0
		path = []
		for i in range(1, len(pathstr)):
			if pathstr[i] == '>' or pathstr[i] == '<':
				path.append(pathstr[last_break:i])
				last_break = i
		reads.append((readname, path))

for read1 in reads:
	for read2 in reads:
		if read1[0] <= read2[0]: continue
		aln = alignment(read1[1], read2[1])
		if not aln: continue
		print(read1[0] + "\t" + ("+" if aln[0] else "-") + "\t" + read2[0] + "\t" + ("+" if aln[1] else "-") + "\t" + aln[2] + "\t" + aln[3])
