#!/usr/bin/python

import sys
import re

loop_middle = sys.argv[1] # format ACGTAGA...
# fasta from stdin
# loop ends from argv[2:]
# loops to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

loop_ends = set()
for v in sys.argv[2:]:
	loop_ends.add(v) # format ACGACT...
	loop_ends.add(revcomp(v))
	assert len(v) == len(loop_middle)

rev_loop_middle = revcomp(loop_middle)

def output_loops(name, seq):
	seq = seq.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	fw = True
	if loop_middle not in seq and rev_loop_middle in seq:
		seq = revcomp(seq)
		fw = False
	if loop_middle not in seq: return
	loop_middle_poses = [m.start() for m in re.finditer(loop_middle, seq)]
	assert len(loop_middle_poses) > 0
	loop_start_end_poses = []
	for end in loop_ends:
		loop_start_end_poses += [m.start() for m in re.finditer(end, seq)]
	assert len(loop_start_end_poses) <= 2
	loop_start_end_poses.sort()
	if len(loop_middle_poses) + len(loop_start_end_poses) == 1: return
	if len(loop_start_end_poses) == 1:
		if not (loop_start_end_poses[0] < loop_middle_poses[0] or loop_start_end_poses[0] > loop_middle_poses[-1]):
			print(name)
			print(seq)
			print(loop_start_end_poses)
			print(loop_middle_poses)
		assert loop_start_end_poses[0] < loop_middle_poses[0] or loop_start_end_poses[0] > loop_middle_poses[-1]
	if len(loop_start_end_poses) == 2:
		if not (loop_start_end_poses[0] < loop_middle_poses[0] and loop_start_end_poses[1] > loop_middle_poses[-1]):
			print(name)
			print(seq)
			print(loop_start_end_poses)
			print(loop_middle_poses)
		assert loop_start_end_poses[0] < loop_middle_poses[0] and loop_start_end_poses[1] > loop_middle_poses[-1]
	loop_seqs = []
	if (len(loop_start_end_poses) == 1 and loop_start_end_poses[0] < loop_middle_poses[0]) or len(loop_start_end_poses) == 2:
		assert loop_start_end_poses[0] < loop_middle_poses[0]
		loop_seqs.append(seq[loop_start_end_poses[0]:loop_middle_poses[0]+len(loop_middle)])
	for i in range(1, len(loop_middle_poses)):
		loop_seqs.append(seq[loop_middle_poses[i-1]:loop_middle_poses[i]+len(loop_middle)])
	if (len(loop_start_end_poses) == 1 and loop_start_end_poses[0] > loop_middle_poses[-1]) or len(loop_start_end_poses) == 2:
		assert loop_start_end_poses[-1] > loop_middle_poses[-1]
		loop_seqs.append(seq[loop_middle_poses[-1]:loop_start_end_poses[-1]+len(loop_middle)])
	assert len(loop_seqs) > 0
	for i in range(0, len(loop_seqs)):
		print(name + "_loop_" + str(i) + "\t" + loop_seqs[i])

current_seq = ""
current_name = ""
for l in sys.stdin:
	if l[0] == '>':
		if len(current_seq) > 0:
			output_loops(current_name, current_seq)
		current_name = l[1:].strip().split(' ')[0].strip()
		current_seq = ""
	else:
		current_seq += l.strip()

if len(current_seq) > 0:
	output_loops(current_name, current_seq)
