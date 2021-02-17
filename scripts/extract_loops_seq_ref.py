#!/usr/bin/python

import sys

ref_file = sys.argv[1]
# loop ends from sys.argv[2]
# loop ends from sys.argv[3]

arm_mismatches = 2
kmer_size = 31
max_edits = 10
kmer_search_size = 2000
dp_search_size = 50
diagonal_cluster_size = 20
min_kmer_matches = 10

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

ref_seq = ""
with open(ref_file) as f:
	for l in f:
		if l[0] == '>':
			continue
		ref_seq += l.strip()
revcomp_ref = revcomp(ref_seq)
ref_breakpoint_region = ref_seq[-dp_search_size:] + ref_seq[:dp_search_size]

ref_kmers = {}

existing_kmers = set()
duplicate_kmers = set()

for i in range(0, len(ref_seq)-kmer_size):
	kmer = ref_seq[i:i+kmer_size]
	if kmer in existing_kmers: duplicate_kmers.add(kmer)
	existing_kmers.add(kmer)
	kmer = revcomp_ref[i:i+kmer_size]
	if kmer in existing_kmers: duplicate_kmers.add(kmer)
	existing_kmers.add(kmer)

for i in range(0, kmer_search_size):
	kmer = ref_seq[i:i+kmer_size]
	if kmer in duplicate_kmers: continue
	ref_kmers[kmer] = i

for i in range(-kmer_search_size-kmer_size, -kmer_size):
	kmer = ref_seq[-i:-i+kmer_size]
	if kmer in duplicate_kmers: continue
	ref_kmers[kmer] = i

loop_ends = set()
for v in sys.argv[2:4]:
	loop_ends.add(v)
	loop_ends.add(revcomp(v))

def get_alignment_breakpoint(ref, ref_pos, query):
	dp_matrix = []
	for i in range(0, len(ref)):
		dp_matrix.append([])
		for j in range(0, len(query)):
			dp_matrix[-1].append(0)
	for i in range(0, len(ref)):
		for j in range(0, len(query)):
			min_incoming = len(ref)+len(query)
			if i > 0:
				incoming = dp_matrix[i-1][j]+1
				if incoming < min_incoming: min_incoming = incoming
			if j > 0:
				incoming = dp_matrix[i][j-1]+1
				if incoming < min_incoming: min_incoming = incoming
			if i > 0 and j > 0:
				match_score = 0 if (ref[i] == query[j] or query[j] == "N") else 1
				incoming = dp_matrix[i-1][j-1] + match_score
				if incoming < min_incoming: min_incoming = incoming
			if min_incoming == len(ref)+len(query):
				assert i == 0 and j == 0
			else:
				dp_matrix[i][j] = min_incoming
	i = len(ref)-1
	j = len(query)-1
	edits = dp_matrix[i][j]
	query_breakpoint = None
	while i != 0 or j != 0:
		if i == 0:
			j -= 1
			continue
		if j == 0:
			i -= 1
			continue
		if i == ref_pos:
			query_breakpoint = j
		match_score = 0 if (ref[i] == query[j] or query[j] == "N") else 1
		assert dp_matrix[i-1][j-1] >= dp_matrix[i][j]-match_score
		assert dp_matrix[i][j-1] >= dp_matrix[i][j]-1
		assert dp_matrix[i-1][j] >= dp_matrix[i][j]-1
		if dp_matrix[i-1][j-1] == dp_matrix[i][j]-match_score:
			i -= 1
			j -= 1
			continue
		if dp_matrix[i-1][j] == dp_matrix[i][j]-1:
			i -= 1
			continue
		if dp_matrix[i][j-1] == dp_matrix[i][j]-1:
			j -= 1
			continue
		assert False
	return (query_breakpoint, edits)

def find_ref_seq_positions(query, mismatches):
	matches = []
	for i in range(0, len(query)-kmer_size):
		kmer = query[i:i+kmer_size]
		if kmer not in ref_kmers: continue
		matches.append(i - ref_kmers[kmer])
	matches.sort()
	clusters = []
	cluster_start = 0
	for i in range(1, len(matches)):
		if matches[i] < matches[i-1] + diagonal_cluster_size: continue
		clusters.append((cluster_start, i))
		cluster_start = i
	clusters.append((cluster_start, len(matches)))
	result = []
	for (start, end) in clusters:
		if end-start < min_kmer_matches: continue
		median_position = matches[int(start + (end - start) / 2)]
		query_seq = ""
		if median_position < dp_search_size: continue
		if median_position > len(query) - dp_search_size: continue
		query_seq = query[median_position - dp_search_size : median_position + dp_search_size]
		(loop_breakpoint, edits) = get_alignment_breakpoint(ref_breakpoint_region, dp_search_size, query_seq)
		if edits > max_edits: continue
		breakpoint_position = loop_breakpoint - dp_search_size + median_position
		assert breakpoint_position < len(query)
		assert breakpoint_position >= 0
		result.append(breakpoint_position)
	return result

def find_approx_seq_positions(seq, query, mismatches):
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

def output_loops(name, seq, loop_mismatches, arm_mismatches):
	seq = seq.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	fw = True
	seq_poses = find_ref_seq_positions(seq, loop_mismatches)
	if len(seq_poses) == 0:
		seq = revcomp(seq)
		seq_poses = find_ref_seq_positions(seq, loop_mismatches)
		if len(seq_poses) == 0: return
	assert len(seq_poses) > 0
	loop_start_end_poses = []
	for end in loop_ends:
		loop_start_end_poses += find_approx_seq_positions(seq, end, arm_mismatches)
	if len(loop_start_end_poses) > 2:
		print(seq_poses)
		print(loop_start_end_poses)
		print(name)
	assert len(loop_start_end_poses) <= 2
	loop_start_end_poses.sort()

	loop_middle_poses = seq_poses
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
		loop_seqs.append(seq[loop_start_end_poses[0]:loop_middle_poses[0]])
	for i in range(1, len(loop_middle_poses)):
		loop_seqs.append(seq[loop_middle_poses[i-1]:loop_middle_poses[i]])
	if (len(loop_start_end_poses) == 1 and loop_start_end_poses[0] > loop_middle_poses[-1]) or len(loop_start_end_poses) == 2:
		assert loop_start_end_poses[-1] > loop_middle_poses[-1]
		loop_seqs.append(seq[loop_middle_poses[-1]:loop_start_end_poses[-1]])
	assert len(loop_seqs) > 0
	for i in range(0, len(loop_seqs)):
		print(name + "_loop_" + str(i) + "\t" + loop_seqs[i])

current_seq = ""
current_name = ""
for l in sys.stdin:
	if l[0] == '>':
		if len(current_seq) > 0:
			output_loops(current_name, current_seq, max_edits, arm_mismatches)
		current_name = l[1:].strip().split(' ')[0].strip()
		current_seq = ""
	else:
		current_seq += l.strip()

if len(current_seq) > 0:
	output_loops(current_name, current_seq, max_edits, arm_mismatches)
