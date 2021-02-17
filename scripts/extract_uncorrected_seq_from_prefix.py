#!/usr/bin/python

import sys
import re

start_sequence_file = sys.argv[1] # just sequence, not fasta
corrected_fasta = sys.argv[2]
uncorrected_fasta = sys.argv[3]
prefix_size = int(sys.argv[4])

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def print_suffix(correctedsequence, uncorrectedsequence, name):
	fwstr = "fw"
	if start_sequence not in correctedsequence:
		rev = revcomp(correctedsequence)
		if start_sequence not in rev: return
		fwstr = "bw"
		correctedsequence = rev
		uncorrectedsequence = revcomp(uncorrectedsequence)
	start_positions = [m.start() for m in re.finditer(start_sequence, correctedsequence)]
	if len(start_positions) != 1: return
	start = start_positions[0] + len(start_sequence)
	if start < prefix_size: return
	start -= prefix_size
	start = int(float(start) * float(len(uncorrectedsequence)) / float(len(correctedsequence)))
	suffix = uncorrectedsequence[start:]
	print(">" + name + "_" + str(start) + "_" + fwstr)
	print(suffix)

uncorrected_seqs = {}
current_seq = ""
current_name = ""
with open(uncorrected_fasta) as f:
	for l in f:
		if l[0] == ">":
			if len(current_name) > 0 and len(current_seq) > 0:
				uncorrected_seqs[current_name] = current_seq
			current_name = l[1:].strip()
			current_seq = ""
		else:
			current_seq += l.strip()
if len(current_name) > 0 and len(current_seq) > 0:
	uncorrected_seqs[current_name] = current_seq

with open(start_sequence_file) as f:
	start_sequence = f.readline().strip()

current_seq = ""
current_name = ""
with open(corrected_fasta) as f:
	for l in f:
		if l[0] == '>':
			if len(current_name) > 0 and len(current_seq) > 0: print_suffix(current_seq, uncorrected_seqs[current_name], current_name)
			current_name = l[1:].strip()
			current_seq = ""
		else:
			current_seq += l.strip().replace('a', 'A').replace('t', 'T').replace('c', 'C').replace('g', 'G')

if len(current_name) > 0 and len(current_seq) > 0: print_suffix(current_seq, uncorrected_seqs[current_name], current_name)
