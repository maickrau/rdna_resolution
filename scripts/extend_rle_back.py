#!/usr/bin/python

import sys

read_fasta = sys.argv[1]
rle_seqs_file = sys.argv[2]
# un-rle seqs fasta to stdout

def rle(s):
	result = s[0]
	for i in range(1, len(s)):
		if s[i] != s[i-1]:
			result += s[i]
	return result

def upper(s):
	return s.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def get_norle(read_name, read_seq):
	global rle_seqs
	rle_mapping = [0]
	rle_str = upper(read_seq[0])
	read_seq = upper(read_seq)
	for i in range(1, len(read_seq)):
		if read_seq[i] != read_seq[i-1]:
			rle_str += read_seq[i]
			rle_mapping.append(i)
	assert len(rle_mapping) == len(rle_str)
	rle_mapping.append(len(read_seq))
	assert read_name in rle_seqs
	rle_seq = rle_seqs[read_name]
	if rle_seq not in rle_str:
		read_seq = revcomp(read_seq)
		rle_mapping = [0]
		rle_str = read_seq[0]
		for i in range(1, len(read_seq)):
			if read_seq[i] != read_seq[i-1]:
				rle_str += read_seq[i]
				rle_mapping.append(i)
		assert len(rle_mapping) == len(rle_str)
		rle_mapping.append(len(read_seq))
	assert rle_seq in rle_str
	found_pos = rle_str.find(rle_seq)
	assert found_pos != -1
	assert rle_str.find(rle_seq, found_pos+1) == -1
	assert found_pos + len(rle_seq) < len(rle_mapping)
	return read_seq[rle_mapping[found_pos]:rle_mapping[found_pos+len(rle_seq)]]


current_name = ""
current_seq = ""
rle_seqs = {}
with open(rle_seqs_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0 and len(current_name) > 0:
				current_seq = upper(current_seq)
				assert current_name not in rle_seqs
				rle_seqs[current_name] = current_seq
			current_seq = ""
			current_name = l[1:].strip().split(' ')[0]
		else:
			current_seq += l.strip()
if len(current_seq) > 0 and len(current_name) > 0:
	current_seq = upper(current_seq)
	assert current_name not in rle_seqs
	rle_seqs[current_name] = current_seq

prunt = 0

current_name = ""
current_seq = ""
with open(read_fasta) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0 and len(current_name) > 0 and current_name in rle_seqs:
				current_seq = upper(current_seq)
				seq = get_norle(current_name, current_seq)
				print(">" + current_name)
				print(seq)
				prunt += 1
			current_seq = ""
			current_name = l[1:].strip().split(' ')[0]
		else:
			current_seq += l.strip()
if len(current_seq) > 0 and len(current_name) > 0 and current_name in rle_seqs:
	current_seq = upper(current_seq)
	seq = get_norle(current_name, current_seq)
	print(">" + current_name)
	print(seq)
	prunt += 1

assert prunt == len(rle_seqs)



