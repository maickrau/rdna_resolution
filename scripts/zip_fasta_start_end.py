#!/usr/bin/python

import sys

input_fasta = sys.argv[1]
output_zip_seq_file = sys.argv[2]
output_seq_fasta = sys.argv[3]

sequences = []
with open(input_fasta) as f:
	current_seq = ""
	current_name = ""
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				sequences.append((current_name, current_seq))
				current_name = ""
				current_seq = ""
			current_name = l[1].strip()
			current_seq = ""
		else:
			current_seq += l.strip()
	if len(current_seq) > 0:
		sequences.append((current_name, current_seq))
		current_name = ""
		current_seq = ""

min_len = min(len(p[1]) for p in sequences)
start_index = 0
while start_index < min_len:
	mismatch = False
	c = sequences[0][1][start_index]
	for (name, seq) in sequences:
		if seq[start_index] != c:
			mismatch = True
			break
	if mismatch:
		start_index -= 1
		break
	if not mismatch: start_index += 1

end_index = -1
while end_index < min_len:
	mismatch = False
	c = sequences[0][1][end_index]
	for (name, seq) in sequences:
		if seq[end_index] != c:
			mismatch = True
			break
	if mismatch:
		end_index += 1
		break
	if not mismatch: end_index -= 1

assert start_index >= 0
assert end_index <= 0

with open(output_zip_seq_file, 'w') as f:
	start_zip = ""
	end_zip = ""
	if start_index > 0: start_zip = sequences[0][1][0:start_index]
	if end_index < 0: end_zip = sequences[0][1][end_index:]
	f.write(start_zip + "\n")
	f.write(end_zip + "\n")

with open(output_seq_fasta, 'w') as f:
	for (name, seq) in sequences:
		if start_index > 0: seq = seq[start_index:]
		if end_index < 0: seq = seq[:end_index]
		f.write(">" + name + "\n")
		f.write(seq + "\n")
