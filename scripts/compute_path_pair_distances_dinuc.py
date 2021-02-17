#!/usr/bin/python

import sys
import re

graphfile = sys.argv[1]
max_diff = int(sys.argv[2])
modulo = int(sys.argv[3])
moduloindex = int(sys.argv[4])
# name \t path    from stdin

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def rle(seq):
	seq_hpc = seq[0]
	for i in range(1, len(seq)):
		if seq[i] != seq[i-1]: seq_hpc += seq[i]
	return seq_hpc

def dinuc_rle(seq):
	seq = re.sub(r"(AA){2,}", "AA", seq)
	seq = re.sub(r"(AC){2,}", "AC", seq)
	seq = re.sub(r"(AG){2,}", "AG", seq)
	seq = re.sub(r"(AT){2,}", "AT", seq)
	seq = re.sub(r"(CC){2,}", "CC", seq)
	seq = re.sub(r"(CG){2,}", "CG", seq)
	seq = re.sub(r"(CT){2,}", "CT", seq)
	seq = re.sub(r"(GG){2,}", "GG", seq)
	seq = re.sub(r"(GT){2,}", "GT", seq)
	seq = re.sub(r"(TT){2,}", "TT", seq)
	return seq

def trinuc_rle(seq):
	for ch1 in ['A', 'T', 'C', 'G']:
		for ch2 in ['A', 'T', 'C', 'G']:
			for ch3 in ['A', 'T', 'C', 'G']:
				motif = ch1 + ch2 + ch3
				motif2 = ch2 + ch3 + ch1
				motif3 = ch3 + ch1 + ch2
				if motif2 < motif or motif3 < motif: continue
				seq = re.sub("(" + motif + "){2,}", motif, seq)
	return seq

def quadnuc_rle(seq):
	for ch1 in ['A', 'T', 'C', 'G']:
		for ch2 in ['A', 'T', 'C', 'G']:
			for ch3 in ['A', 'T', 'C', 'G']:
				for ch4 in ['A', 'T', 'C', 'G']:
					motif = ch1 + ch2 + ch3 + ch4
					motif2 = ch2 + ch3 + ch4 + ch1
					motif3 = ch3 + ch4 + ch1 + ch2
					motif4 = ch4 + ch1 + ch2 + ch3
					if motif2 < motif or motif3 < motif or motif4 < motif: continue
					seq = re.sub("(" + motif + "){2,}", motif, seq)
	return seq

def pentanuc_rle(seq):
	for ch1 in ['A', 'T', 'C', 'G']:
		for ch2 in ['A', 'T', 'C', 'G']:
			for ch3 in ['A', 'T', 'C', 'G']:
				for ch4 in ['A', 'T', 'C', 'G']:
					for ch5 in ['A', 'T', 'C', 'G']:
						motif = ch1 + ch2 + ch3 + ch4 + ch5
						motif2 = ch2 + ch3 + ch4 + ch5 + ch1
						motif3 = ch3 + ch4 + ch5 + ch1 + ch2
						motif4 = ch4 + ch5 + ch1 + ch2 + ch3
						motif5 = ch5 + ch1 + ch2 + ch3 + ch4
						if motif2 < motif or motif3 < motif or motif4 < motif or motif5 < motif: continue
						seq = re.sub("(" + motif + "){2,}", motif, seq)
	return seq

def is_minimal_rotation(seq):
	for i in range(0, len(seq)):
		rotated = seq[i:] + seq[:i]
		if rotated < seq: return False
	return True

def manynuc_rle(seq, mink, maxk):
	is_repeatnuc = [False] * len(seq)
	for k in range(mink, maxk+1):
		for i in range(2*k, len(seq)+1):
			if seq[i-2*k:i-k] != seq[i-k:i]: continue
			if not is_minimal_rotation(seq[i-k:i]): continue
			for j in range(i-k, i):
				is_repeatnuc[j] = True
	result = ""
	for i in range(0, len(seq)):
		if not is_repeatnuc[i]: result += seq[i]
	return seq

def manynuc_trirle(seq, mink, maxk):
	is_repeatnuc = [False] * len(seq)
	for k in range(mink, maxk+1):
		for i in range(3*k, len(seq)):
			if seq[i-2*k:i-k] != seq[i-k:i] or seq[i-3*k:i-2*k] != seq[i-k:i]: continue
			if not is_minimal_rotation(seq[i-k:i]): continue
			for j in range(i-k, i+1):
				is_repeatnuc[j] = True
	result = ""
	for i in range(0, len(seq)):
		if not is_repeatnuc[i]: result += seq[i]
	return seq

def pathseq(p):
	global nodeseqs
	seq = "".join(nodeseqs[n[1:]] if n[0] == '>' else revcomp(nodeseqs[n[1:]]) for n in p)
	# seq = manynuc_rle(seq, 1, 6)
	# seq = manynuc_rle(seq, 1, 1)
	# seq = manynuc_rle(seq, 2, 2)
	# seq = manynuc_rle(seq, 3, 3)
	# seq = manynuc_rle(seq, 4, 4)
	# seq = manynuc_rle(seq, 5, 5)
	# seq = manynuc_rle(seq, 6, 6)
	# seq = manynuc_trirle(seq, 2, 6)
	seq = rle(seq)
	seq = dinuc_rle(seq)
	seq = trinuc_rle(seq)
	seq = quadnuc_rle(seq)
	seq = pentanuc_rle(seq)
	# seq = hexanuc_rle(seq)
	return seq

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
	if start_match+1 == len(p1) and start_match+1 == len(p2): return 0
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

def edit_distance_dinuc(p1, p2):
	global max_diff
	# use wfa because new and fancy
	# https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btaa777/5904262?rss=1
	if len(p1) - len(p2) < -max_diff or len(p1) - len(p2) > max_diff: return None
	assert len(p1) > 0
	assert len(p2) > 0
	assert p1[0] == p2[0]
	last_column = {0: start_match}
	for i in range(1, max_diff):
		for column in last_column:
			p1_pos = last_column[column]
			p2_pos = last_column[column] + column
			while p1_pos+1 < len(p1) and p2_pos+1 < len(p2) and p1[p1_pos+1] == p2[p2_pos+1]:
				last_column[column] += 1
				p1_pos += 1
				p2_pos += 1
			if p1_pos+1 >= len(p1) and p2_pos+1 >= len(p2): return i-1
		news = []
		for column in last_column:
			p1_pos = last_column[column]
			p2_pos = last_column[column] + column
			if p1_pos >= 2 and p1_pos <= len(p1)-2:
				if p1[p1_pos-2:p1_pos] == p2[p2_pos-2:p2_pos] and p1[p1_pos:p1_pos+2] == p1[p1_pos-2:p1_pos]:
					news.append(column+2, last_column[column])
			if p2_pos >= 2 and p2_pos <= len(p1)-2:
				if p1[p1_pos-2:p1_pos] == p2[p2_pos-2:p2_pos] and p2[p2_pos:p2_pos+2] == p2[p2_pos-2:p2_pos]:
					news.append(column-2, last_column[column]+2)
		for new in news:
			if new[0] not in last_column: last_column[new[0]] = 0
			last_column[new[0]] = max(last_column[new[0]], new[1])
		for column in last_column:
			p1_pos = last_column[column]
			p2_pos = last_column[column] + column
			while p1_pos+1 < len(p1) and p2_pos+1 < len(p2) and p1[p1_pos+1] == p2[p2_pos+1]:
				last_column[column] += 1
				p1_pos += 1
				p2_pos += 1
			if p1_pos+1 >= len(p1) and p2_pos+1 >= len(p2): return i-1
		next_column = {}
		for column in last_column:
			if column not in next_column: next_column[column] = 0
			next_column[column] = max(next_column[column], last_column[column]+1)
			if column+1 not in next_column: next_column[column+1] = 0
			next_column[column+1] = max(next_column[column+1], last_column[column])
			if column-1 not in next_column: next_column[column-1] = 0
			next_column[column-1] = max(next_column[column-1], last_column[column]-1)
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
		if paths[path1] == paths[path2]: assert edit_dist == 0
		# edit_dist = edit_distance_simple(paths[path1], paths[path2])
		if edit_dist is None: continue
		if edit_dist is not None: value = edit_dist
		print(path1 + "\t" + path2 + "\t" + str(value))
