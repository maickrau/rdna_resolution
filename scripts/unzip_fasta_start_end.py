#!/usr/bin/python

import sys

input_fasta = sys.argv[1]
input_zip_seq_file = sys.argv[2]
# output fasta to stdout 

start_zip = ""
end_zip = ""

with open(input_zip_seq_file) as f:
	start_zip = f.readline().strip()
	end_zip = f.readline().strip()

with open(input_fasta) as f:
	current_name = ""
	current_seq = ""
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				print(">" + current_name)
				print(start_zip + current_seq + end_zip)
			current_seq = ""
			current_name = l[1:].strip()
		else:
			current_seq += l.strip()

if len(current_seq) > 0:
	print(">" + current_name)
	print(start_zip + current_seq + end_zip)
