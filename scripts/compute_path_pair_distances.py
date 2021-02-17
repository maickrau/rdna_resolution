#!/usr/bin/python

import sys

graphfile = sys.argv[1]
max_diff = int(sys.argv[2])
modulo = int(sys.argv[3])
moduloindex = int(sys.argv[4])
# name \t path    from stdin

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def pathseq(p):
	global nodeseqs
	seq_no_hpc = "".join(nodeseqs[n[1:]] if n[0] == '>' else revcomp(nodeseqs[n[1:]]) for n in p)
	# seq_hpc = seq_no_hpc[0]
	# for i in range(1, len(seq_no_hpc)):
	# 	if seq_no_hpc[i] != seq_no_hpc[i-1]: seq_hpc += seq_no_hpc[i]
	# return seq_hpc
	return seq_no_hpc

def edit_distance_simple(p1, p2):
	global max_diff
	if len(p1) - len(p2) <= -max_diff or len(p1) - len(p2) >= max_diff: return None
	last_row = []
	for i in range(0, len(p2)+1):
		last_row.append(i)
	for i in range(1, len(p1)):
		next_row = [i]
		min_this_row = i
		for j in range(0, len(p2)):
			index = len(next_row)
			next_row.append(min(next_row[index-1]+1, last_row[index]+1))
			if p1[i] == p2[j]:
				next_row[index] = min(next_row[index], last_row[index-1])
			else:
				next_row[index] = min(next_row[index], last_row[index-1]+1)
			min_this_row = min(min_this_row, next_row[index])
		last_row = next_row
		# if min_this_row >= max_diff: return None
	return last_row[-1]

def edit_distance_wfa(p1, p2):
	global max_diff
	# use wfa because new and fancy
	# https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btaa777/5904262?rss=1
	if len(p1) - len(p2) < -max_diff or len(p1) - len(p2) > max_diff: return None
	start_match = -1
	while start_match+1 < len(p1) and start_match+1 < len(p2) and p1[start_match+1] == p2[start_match+1]:
		start_match += 1
	if start_match == len(p1) and start_match == len(p2): return 0
	last_column = [start_match]
	# sys.stderr.write("0" + "\n")
	for i in range(1, max_diff):
		offset = i-1
		# sys.stderr.write(str(i) + "\n")
		next_column = []
		last_match =last_column[-i+offset+1]
		while last_match+1-i < len(p1) and last_match+1 < len(p2) and p1[last_match+1-i] == p2[last_match+1]:
			last_match += 1
		if last_match+1-i >= len(p1) and last_match+1 >= len(p2):
			return i
		next_column.append(last_match)
		for j in range(-i+1, +i):
			last_match = last_column[j+offset]+1
			if j > -i+1:
				last_match = max(last_match, last_column[j+offset-1]-1)
			if j < i-1:
				last_match = max(last_match, last_column[j+offset+1])
			while last_match+1+j < len(p1) and last_match+1 < len(p2) and p1[last_match+1+j] == p2[last_match+1]:
				last_match += 1
			if last_match+1+j >= len(p1) and last_match+1 >= len(p2):
				return i
			next_column.append(last_match)
		last_match = last_column[i+offset-1]-1
		while last_match+1+i < len(p1) and last_match+1 < len(p2) and p1[last_match+1+i] == p2[last_match+1]:
			last_match += 1
		if last_match+1+i >= len(p1) and last_match+1 >= len(p2):
			return i
		next_column.append(last_match)
		last_column = next_column
	return None

def edit_distance(p1, p2):
	global max_diff
	# use wfa because new and fancy
	# https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btaa777/5904262?rss=1
	if len(p1) - len(p2) < -max_diff or len(p1) - len(p2) > max_diff: return None
	start_match = -1
	while start_match+1 < len(p1) and start_match+1 < len(p2) and p1[start_match+1] == p2[start_match+1]:
		start_match += 1
	if start_match == len(p1) and start_match == len(p2): return 0
	last_column = {0: start_match}
	for i in range(1, max_diff):
		offset = i-1
		next_column = {}
		for column in last_column:
			if column not in next_column: next_column[column] = 0
			next_column[column] = max(next_column[column], last_column[column]+1)
			if column+1 not in next_column: next_column[column+1] = 0
			next_column[column+1] = max(next_column[column+1], last_column[column])
			if column-1 not in next_column: next_column[column-1] = 0
			next_column[column-1] = max(next_column[column-1], last_column[column]-1)
			p1_pos = last_column[column]
			p2_pos = last_column[column] + column
			if p1_pos >= 4 and p2_pos >= 4:
				if p1[p1_pos-4:p1_pos] == p2[p2_pos-4:p2_pos] and p1[p1_pos-4:p1_pos-2] == p1[p1_pos-2:p1_pos]:
					if p1_pos+2 <= len(p1) and p1[p1_pos:p1_pos+2] == p1[p1_pos-2:p1_pos]:
						extend_until = 0
						while True:
							if column-extend_until not in next_column: next_column[column-extend_until] = 0
							next_column[column-extend_until] = max(next_column[column-extend_until], last_column[column]+extend_until)
							if p1_pos+extend_until+2 <= len(p1) and p1[p1_pos+extend_until:p1_pos+extend_until+2] == p1[p1_pos-2:p1_pos]:
								extend_until += 2
							else:
								break
					if p2_pos+2 <= len(p2) and p2[p2_pos:p2_pos+2] == p2[p2_pos-2:p2_pos]:
						extend_until = 0
						while True:
							if column+extend_until+2 not in next_column: next_column[column+extend_until+2] = 0
							next_column[column+extend_until+2] = max(next_column[column+extend_until+2], last_column[column])
							if p2_pos+extend_until+2 <= len(p2) and p2[p2_pos+extend_until:p2_pos+extend_until+2] == p2[p2_pos-2:p2_pos]:
								extend_until += 2
							else:
								break
		for column in next_column:
			p1_pos = next_column[column]
			p2_pos = next_column[column] + column
			while p1_pos+1 < len(p1) and p2_pos+1 < len(p2) and p1[p1_pos+1] == p2[p2_pos+1]:
				next_column[column] += 1
				p1_pos += 1
				p2_pos += 1
			if p1_pos+1 >= len(p1) and p2_pos+1 >= len(p2): return i
		last_column = next_column
	return None

nodeseqs = {}
with open(graphfile) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			nodeseqs[parts[1]] = parts[2]

num = 0
pathnum = {}
paths = {}
for l in sys.stdin:
	parts = l.strip().split('\t')
	name = parts[0]
	last_break = 0
	path = []
	pathstr = parts[1] + '>'
	for i in range(1, len(pathstr)):
		if pathstr[i] == '<' or pathstr[i] == '>':
			path.append(pathstr[last_break:i])
			last_break = i
	if name in paths: print(name)
	assert name not in paths
	paths[name] = pathseq(path)
	pathnum[name] = num
	num += 1
	# print(name + "\t" + paths[name])

for path1 in paths:
	if pathnum[path1] % modulo != moduloindex: continue
	for path2 in paths:
		if path1 <= path2: continue
		value = max_diff + 1
		edit_dist = edit_distance(paths[path1], paths[path2])
		# edit_dist = edit_distance_simple(paths[path1], paths[path2])
		if edit_dist is None: continue
		if edit_dist is not None: value = edit_dist
		print(path1 + "\t" + path2 + "\t" + str(value))
