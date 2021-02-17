#!/usr/bin/python

import sys

ref_seq_file = sys.argv[1]
snp_positions_file = sys.argv[2]
# gfa to stdout

ref_seq = ""
with open(ref_seq_file) as f:
	for l in f:
		if l[0] == '>': continue
		ref_seq += l.strip()

snp_positions = []
with open(snp_positions_file) as f:
	for l in f:
		snp_positions.append(int(l.strip()))

snp_positions.sort()

picked_snp_positions = set(snp_positions)
for i in range(1, len(snp_positions)):
	if snp_positions[i] == snp_positions[i-1]+1:
		if snp_positions[i] in picked_snp_positions: picked_snp_positions.remove(snp_positions[i])
		if snp_positions[i+1] in picked_snp_positions: picked_snp_positions.remove(snp_positions[i+1])

snp_positions = list(picked_snp_positions)
snp_positions.sort()
snp_positions.append(len(ref_seq))

assert len(snp_positions) > 0

first_node_name = "0_" + str(snp_positions[0])
last_node_name = first_node_name
print("S\t" + first_node_name + "\t" + ref_seq[0:snp_positions[0]])
last_break = 0
for i in range(0, len(snp_positions)-1):
	next_node_name = str(snp_positions[i]+1) + "_" + str(snp_positions[i+1])
	print("S\t" + next_node_name + "\t" + ref_seq[snp_positions[i]+1:snp_positions[i+1]])
	for char in ['A', 'C', 'G', 'T']:
		name = "SNP_" + str(snp_positions[i]) + "_" + char
		print("S\t" + name + "\t" + char)
		print("L\t" + last_node_name + "\t+\t" + name + "\t+\t0M")
		print("L\t" + name + "\t+\t" + next_node_name + "\t+\t0M")
	last_node_name = next_node_name
print("L\t" + last_node_name + "\t+\t" + first_node_name + "\t+\t0M")
