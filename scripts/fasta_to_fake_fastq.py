#!/usr/bin/python

import fileinput

fake_quality = "5" # QV 20

current_seq = ""
current_name = ""

for l in fileinput.input():
	if l[0] == '>':
		if len(current_seq) > 0:
			print("@" + current_name)
			print(current_seq)
			print("+" + current_name)
			print(fake_quality * len(current_seq))
		current_seq = ""
		current_name = l[1:].strip()
	else:
		current_seq += l.strip()

if len(current_seq) > 0:
	print("@" + current_name)
	print(current_seq)
	print("+" + current_name)
	print(fake_quality * len(current_seq))
