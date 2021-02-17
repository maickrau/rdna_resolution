#!/usr/bin/python

import fileinput

# fasta from stdin

longest_seq = ""
longest_name = ""
current_seq = ""
current_name = ""

for l in fileinput.input():
	if l[0] == '>':
		if len(current_seq) > len(longest_seq):
			longest_seq = current_seq
			longest_name = current_name
		current_name = l[1:].strip()
		current_seq = ""
	else:
		current_seq += l.strip()

if len(current_seq) > len(longest_seq):
	longest_seq = current_seq
	longest_name = current_name

print(">" + longest_name)
print(longest_seq)
