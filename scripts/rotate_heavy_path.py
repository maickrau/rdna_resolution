#!/usr/bin/python

import sys

ref_fasta = sys.argv[1]
# sequence from stdin

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

path_seq = ""
for l in sys.stdin:
	if l[0] == '>':
		continue
	path_seq += l.strip()

assert len(path_seq) > 0

ref_kmers = {}
for i in range(0, len(ref_seq)-k):
	kmer = ref_seq[i:i+k]
	if kmer in ref_kmers:
		ref_kmers[kmer] = None
	else:
		ref_kmers[kmer] = i

seq_is_fw = True

fw_matches = 0
bw_matches = 0
for i in range(0, len(path_seq)-k):
	kmer = path_seq[i:i+k]
	if kmer in ref_kmers and ref_kmers[kmer] is not None:
		fw_matches += 1
	if revcomp(kmer) in ref_kmers and ref_kmers[revcomp(kmer)] is not None:
		bw_matches += 1

assert fw_matches > 0 or bw_matches > 0

if fw_matches < bw_matches:
	path_seq = revcomp(path_seq)
	seq_is_fw = False

match_ref_start = None
match_path_start = None
for i in range(0, len(path_seq)):
	kmer = path_seq[i:i+k]
	if kmer not in ref_kmers or ref_kmers[kmer] is None: continue
	ref_pos = ref_kmers[kmer]
	if match_ref_start is None or ref_pos < match_ref_start:
		match_ref_start = ref_pos
		match_path_start = i

assert match_ref_start is not None
assert match_path_start is not None

ref_substr = ref_seq[-100:] + ref_seq[:match_ref_start+100]
path_substr_end = match_path_start + 100
path_substr_start = path_substr_end - len(ref_substr)
path_substr_end %= len(path_seq)
assert path_substr_end < len(path_seq)
assert path_substr_end >= 0
assert path_substr_start < len(path_seq)
assert path_substr_start > -len(path_seq)
if path_substr_start >= 0:
	path_substr = path_seq[path_substr_start:path_substr_end]
else:
	path_substr = path_seq[path_substr_start:] + path_seq[:path_substr_end]

dp_table = []
for i in range(0, len(ref_substr)):
	dp_table.append([])
	for j in range(0, len(path_substr)):
		score_here = max(i, j)
		if i > 0: score_here = min(score_here, dp_table[i-1][j]+1)
		if j > 0: score_here = min(score_here, dp_table[i][j-1]+1)
		if j > 0 and i > 0: score_here = min(score_here, dp_table[i-1][j-1]+1)
		if j > 0 and i > 0 and ref_substr[i] == path_substr[i]: score_here = min(score_here, dp_table[i-1][j-1])
		dp_table[i].append(score_here)

assert dp_table[-1][-1] < max(len(ref_substr), len(path_substr))

i = len(ref_substr)-1
j = len(path_substr)-1
while i > 100:
	assert j < len(path_substr)
	assert j > 0
	if ref_substr[i] == path_substr[i] and dp_table[i-1][j-1] == dp_table[i][j]:
		i -= 1
		j -= 1
	elif ref_substr[i] != path_substr[i] and dp_table[i-1][j-1]+1 == dp_table[i][j]:
		i -= 1
		j -= 1
	elif dp_table[i-1][j]+1 == dp_table[i][j]:
		i -= i
	elif dp_table[i][j-1]+1 == dp_table[i][j]:
		j -= i
	else:
		assert False

path_start_pos = path_substr_start + j
if path_start_pos < 0: path_start_pos += len(path_seq)
if path_start_pos >= len(path_seq) : path_start_pos -= len(path_seq)
assert path_start_pos >= 0
assert path_start_pos < len(path_seq)

print(">heavy_path_" + ("fw" if seq_is_fw else "bw") + "_rotate_" + str(path_start_pos))
print(path_seq[path_start_pos:] + path_seq[:path_start_pos])

