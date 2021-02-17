#!/usr/bin/python

import sys
import re

loop_middle = sys.argv[1] # format ACGTAGA...
# loop ends from sys.argv[2]
# loop ends from sys.argv[3]
max_edits = int(sys.argv[4])
# fasta from stdin
# loops to stdout

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

loop_ends = set()
for v in sys.argv[2:4]:
	loop_ends.add(v) # format ACGACT...
	loop_ends.add(revcomp(v))
	assert len(v) == len(loop_middle)

rev_loop_middle = revcomp(loop_middle)

def find_seq_positions(seq, query, mismatches):
	dp_column = [0]
	new_dp_column = [0]
	start_index = [0]
	new_start_index = [0]
	for i in range(0, len(query)):
		dp_column.append(i+1)
		new_dp_column.append(i+1)
		start_index.append(0)
		new_start_index.append(0)
	result = []
	last_score = 0
	last_valid = 0
	for i in range(0, len(seq)):
		new_dp_column[0] = 0
		new_start_index[0] = i
		new_last_valid = 0
		for j in range(0, len(query)):
			new_dp_column[j+1] = new_dp_column[j] + 1
			new_start_index[j+1] = new_start_index[j]
			match_score = 0 if query[j] == seq[i] else 1
			if dp_column[j] + match_score < new_dp_column[j+1]:
				new_dp_column[j+1] = dp_column[j] + match_score
				new_start_index[j+1] = start_index[j]
			if dp_column[j+1] + 1 < new_dp_column[j+1]:
				new_dp_column[j+1] = dp_column[j+1] + match_score
				new_start_index[j+1] = start_index[j+1]
			if new_dp_column[j+1] <= mismatches: new_last_valid = j+1
			if new_dp_column[j+1] > mismatches and j+1 > last_valid+1 and j+1 > new_last_valid+1:
				new_dp_column[-1] = mismatches+1
				break
		last_valid = new_last_valid
		if new_dp_column[-1] <= mismatches:
			skip = False
			if len(result) > 0:
				if result[-1][0] == new_start_index[-1]:
					if last_score <= new_dp_column[-1]:
						skip = True
					else:
						result = result[:-1]
			if not skip:
				result.append((new_start_index[-1], i))
				last_score = new_dp_column[-1]
		(dp_column, new_dp_column) = (new_dp_column, dp_column)
		(start_index, new_start_index) = (new_start_index, start_index)
	return result

def output_loops(name, seq, mismatches):
	seq = seq.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	fw = True
	seq_poses = find_seq_positions(seq, loop_middle, mismatches)
	if len(seq_poses) == 0:
		seq = revcomp(seq)
		seq_poses = find_seq_positions(seq, loop_middle, mismatches)
		if len(seq_poses) == 0: return
	assert len(seq_poses) > 0
	loop_start_end_poses = []
	for end in loop_ends:
		loop_start_end_poses += find_seq_positions(seq, end, mismatches)
	if len(loop_start_end_poses) > 2:
		print(seq_poses)
		print(loop_start_end_poses)
		print(name)
	assert len(loop_start_end_poses) <= 2
	loop_start_end_poses.sort()

	loop_middle_poses = [p[0] for p in seq_poses]
	loop_start_end_poses = [p[0] for p in loop_start_end_poses]
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
			output_loops(current_name, current_seq, max_edits)
		current_name = l[1:].strip().split(' ')[0].strip()
		current_seq = ""
	else:
		current_seq += l.strip()

if len(current_seq) > 0:
	output_loops(current_name, current_seq, max_edits)
