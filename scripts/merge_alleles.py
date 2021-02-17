#!/usr/bin/python

import sys

ref_file = sys.argv[1]
replacement_file = sys.argv[2]
replacement_paf = sys.argv[3]
name = sys.argv[4]

ref_seq = ""
replacement_seq = ""

with open(ref_file) as f:
	for l in f:
		if l[0] == '>': continue
		ref_seq += l.strip()

with open(replacement_file) as f:
	for l in f:
		if l[0] == '>': continue
		replacement_seq += l.strip()

replacements = []
with open(replacement_paf) as f:
	for l in f:
		parts = l.strip().split('\t')
		replacements.append((int(parts[7]), int(parts[8]), int(parts[2]), int(parts[3])))

replacements.sort(key=lambda x: x[0])
for i in range(1, len(replacements)):
	assert replacements[i][0] > replacements[i-1][1]

result_seq = ""
last_replaced = 0
for (ref_start, ref_end, replacement_start, replacements_end) in replacements:
	result_seq += ref_seq[last_replaced:ref_start]
	result_seq += replacement_seq[replacement_start:replacements_end]
	last_replaced = ref_end
result_seq += ref_seq[last_replaced:]

print(">" + name)
print(result_seq)
