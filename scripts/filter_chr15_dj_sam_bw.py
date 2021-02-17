#!/usr/bin/python

import sys

ref_length_file = sys.argv[1]
read_length_file = sys.argv[2]
extra_offset = int(sys.argv[3])
# sam from stdin

ref_length = 0
with open(ref_length_file) as f:
	for l in f:
		if l[0] == '>': continue
		ref_length += len(l.strip())

current_read = ""
current_length = 0
read_lengths = {}
with open(read_length_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_read) > 0:
				read_lengths[current_read] = current_length
			current_read = l[1:].strip()
			current_length = 0
		else:
			current_length += len(l.strip())
if len(current_read) > 0:
	read_lengths[current_read] = current_length

ref_length -= extra_offset

for l in sys.stdin:
	if l[0] == '@':
		print(l.strip())
		continue
	parts = l.strip().split('\t')
	readlen = read_lengths[parts[0]]
	left_clip = 0
	cigar_check = parts[5].replace('S', '\tS').replace('H', '\tH').split('\t')
	if len(cigar_check) >= 2 and (cigar_check[1][0] == 'S' or cigar_check[1][0] == 'H'):
		if 'M' not in cigar_check[0] and 'I' not in cigar_check[0] and 'D' not in cigar_check[0]:
			left_clip = int(cigar_check[0])
	ref_offset = int(parts[3])
	if ref_offset + readlen - left_clip > ref_length - 10000 and ref_offset + readlen - left_clip < ref_length + 10000:
		print(l.strip())
