#!/usr/bin/python

import sys

contig_fasta = sys.argv[1]
read_fasta = sys.argv[2]
mem_size = int(sys.argv[3])

comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
def revcomp(s):
	return "".join(comp[c] for c in s[::-1])

mem_positions = {}
contigseq = {}

with open(contig_fasta) as f:
	while True:
		nameline = f.readline()
		seqline = f.readline()
		if not nameline or not seqline: break
		name = nameline.strip()[1:]
		seq = seqline.strip()
		contigseq[name] = seq
		for i in range(0, len(seq) - mem_size):
			assert seq[i:i+mem_size] not in mem_positions
			mem_positions[seq[i:i+mem_size]] = (name, i, True)
			mem_positions[revcomp(seq[i:i+mem_size])] = (name, i, False)

with open(read_fasta) as f:
	while True:
		nameline = f.readline()
		seqline = f.readline()
		if not nameline or not seqline: break
		name = nameline.strip()[1:]
		seq = seqline.strip()
		i = 0
		while i < len(seq) - mem_size:
			if seq[i:i+mem_size] not in mem_positions:
				i += 1
				continue
			pos = mem_positions[seq[i:i+mem_size]]
			mem_length = mem_size
			contig_start = pos[1]
			contig_end = pos[1] + mem_size
			if pos[2]:
				while i + mem_length < len(seq) and pos[1] + mem_length < len(contigseq[pos[0]]):
					if seq[i+mem_length] == contigseq[pos[0]][pos[1] + mem_length]:
						mem_length += 1
						contig_end += 1
					else:
						break
			else:
				while i + mem_length < len(seq) and pos[1] + mem_size - 1 - mem_length >= 0:
					if seq[i+mem_length] == comp[contigseq[pos[0]][pos[1] + mem_size - 1 - mem_length]]:
						mem_length += 1
						contig_start -= 1
					else:
						break
			assert contig_start >= 0
			assert contig_end <= len(contigseq[pos[0]])
			print(name + "\t" + str(len(seq)) + "\t" + str(i) + "\t" + str(i+mem_length) + "\t" + ("+" if pos[2] else "-") + "\t" + pos[0] + "\t" + str(len(contigseq[pos[0]])) + "\t" + str(contig_start) + "\t" + str(contig_end) + "\t" + str(mem_length) + "\t" + str(mem_length) + "\t" + "255" + "\t" + "cg:Z:" + str(mem_length) + "=")
			i += mem_length - mem_size + 1
