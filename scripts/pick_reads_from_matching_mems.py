#!/usr/bin/python

import sys

ref_fasta = sys.argv[1]
read_fasta = sys.argv[2]
k = int(sys.argv[3])
min_match_len = int(sys.argv[4])
min_match_identity = float(sys.argv[5])
# output fasta to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

kmers = set()

def add_kmers(seq):
	global kmers
	global k
	for i in range(0, len(seq) - k):
		kmers.add(seq[i:i+k])
		kmers.add(revcomp(seq[i:i+k]))

def has_kmer_match(seq):
	global kmers
	global k
	global min_match_identity
	global min_match_len
	match_len = 0
	last_match_end = 0
	for i in range(0, len(seq) - k):
		if seq[i:i+k] not in kmers: continue
		match_end = i + k
		gap = min(k, match_end - last_match_end)
		match_len += gap
		last_match_end = match_end
	if match_len < min_match_len: return False
	if float(match_len) / float(len(seq)) < min_match_identity: return False
	return True

with open(ref_fasta) as f:
	seq = ""
	for l in f:
		if l[0] == '>':
			add_kmers(seq)
			seq = ""
		else:
			seq += l.strip()

add_kmers(seq)

with open(read_fasta) as f:
	current_name = ""
	current_seq = ""
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				if has_kmer_match(current_seq):
					print(">" + current_name)
					print(current_seq)
			current_name = l[1:].strip()
			current_seq = ""
		else:
			current_seq += l.strip()

if len(current_seq) > 0:
	if has_kmer_match(current_seq):
		print(">" + current_name)
		print(current_seq)
