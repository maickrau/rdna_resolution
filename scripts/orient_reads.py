#!/usr/bin/python

import sys

ref_fasta = sys.argv[1]
# sequences from stdin

k = 101

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

ref_seq = ""
with open(ref_fasta) as f:
	for l in f:
		if l[0] == '>':
			continue
		ref_seq += l.strip()

ref_kmers = {}
for i in range(0, len(ref_seq)-k):
	kmer = ref_seq[i:i+k]
	if kmer in ref_kmers:
		ref_kmers[kmer] = None
	else:
		ref_kmers[kmer] = True
	rev_kmer = revcomp(ref_seq[i:i+k])
	if rev_kmer in ref_kmers:
		ref_kmers[rev_kmer] = None
	else:
		ref_kmers[rev_kmer] = False

seq_is_fw = True

def orient(sequence):
	fw_matches = 0
	bw_matches = 0
	seq_is_fw = True
	for i in range(0, len(sequence)-k):
		kmer = sequence[i:i+k]
		if kmer in ref_kmers and ref_kmers[kmer] is not None:
			if ref_kmers[kmer]:
				fw_matches += 1
			else:
				bw_matches += 1
	if fw_matches == 0 and bw_matches == 0:
		return (sequence, seq_is_fw)
	assert fw_matches > 0 or bw_matches > 0
	if fw_matches < bw_matches:
		sequence = revcomp(sequence)
		seq_is_fw = False
	return (sequence, seq_is_fw)

current_name = ""
current_seq = ""

for l in sys.stdin:
	if l[0] == '>':
		if len(current_seq) > 0:
			(current_seq, fw) = orient(current_seq)
			print(">" + current_name + "_" + ("fw" if fw else "bw"))
			print(current_seq)
		current_seq = ""
		current_name = l[1:].strip()
		continue
	current_seq += l.strip()

if len(current_seq) > 0:
	(current_seq, fw) = orient(current_seq)
	print(">" + current_name + "_" + ("fw" if fw else "bw"))
	print(current_seq)
