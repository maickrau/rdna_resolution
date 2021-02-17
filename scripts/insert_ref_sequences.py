#!/usr/bin/python

import sys

ref_fasta = sys.argv[1]
input_gfa = sys.argv[2]
# gfa to stdout

ref_seq = ""
with open(ref_fasta) as f:
	for l in f:
		if l[0] == '>': continue
		ref_seq += l.strip()

with open(input_gfa) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			assert parts[2] == "*"
			name = parts[1]
			snp_path = name.strip().split('-')
			start_pos = int(snp_path[0].split('_')[0])
			end_pos = int(snp_path[-1].split('_')[0])
			if end_pos > start_pos:
				seq = ref_seq[start_pos:end_pos]
			else:
				seq = ref_seq[start_pos:] + ref_seq[:end_pos]
			for snp in snp_path[1:-1]:
				pos = int(snp.split('_')[0])
				allele = snp.split('_')[1]
				if allele not in ['A', 'C', 'G', 'T']: continue
				assert allele in ['A', 'C', 'G', 'T']
				if pos < start_pos: pos += len(ref_seq)
				seq = seq[:pos - start_pos] + allele + seq[pos - start_pos + 1:]
			parts[2] = seq
			print("\t".join(parts))
		else:
			print(l.strip())
