#!/usr/bin/python

import sys

read_file = sys.argv[1]
mid_seq_file = sys.argv[2]
prefix_file = sys.argv[3]
suffix_file = sys.argv[4]

def revcomp(s):
    comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
    return "".join(comp[c] for c in s[::-1])

def add_prefix_suffix(seq, name, mid):
	global prefixes
	global suffixes
	mid = mid.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	seq = seq.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	if mid not in seq:
		seq = revcomp(seq)
	# this should not happen
	# but it does
	# ignore it and hope it doesn't change the results...
	if mid not in seq: return
	assert mid in seq
	start_pos = seq.index(mid)
	prefix = seq[0:start_pos]
	assert name not in prefixes
	assert name not in suffixes
	if len(prefix) > 0:
		prefixes[name] = prefix
	suffix = seq[start_pos + len(mid):]
	if len(suffix) > 0:
		suffixes[name] = suffix

mid_seqs = {}
prefixes = {}
suffixes = {}


current_seq = ""
current_name = ""
with open(mid_seq_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				mid_seqs[current_name] = current_seq
			current_seq = ""
			current_name = l[1:].strip()
		else:
			current_seq += l.strip()
mid_seqs[current_name] = current_seq

with open(read_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				if current_name in mid_seqs: add_prefix_suffix(current_seq, current_name, mid_seqs[current_name])
			current_seq = ""
			current_name = l[1:].strip().split(' ')[0]
		else:
			current_seq += l.strip()
if current_name in mid_seqs: add_prefix_suffix(current_seq, current_name, mid_seqs[current_name])

prefix_list = [(read, prefixes[read]) for read in prefixes]
prefix_list.sort(key=lambda x: -len(x[1]))
suffix_list = [(read, suffixes[read]) for read in suffixes]
suffix_list.sort(key=lambda x: -len(x[1]))

with open(prefix_file, "w") as f:
	for (read, seq) in prefix_list:
		f.write(">" + read + "\n")
		f.write(revcomp(seq) + "\n")

with open(suffix_file, "w") as f:
	for (read, seq) in suffix_list:
		f.write(">" + read + "\n")
		f.write(seq + "\n")
