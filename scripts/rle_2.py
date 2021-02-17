#!/usr/bin/python

import fileinput

for l in fileinput.input():
	if l[0] == '>':
		print(l.strip())
		continue
	rle = l[0:2]
	for i in range(2, len(l)):
		if l[i] != l[i-1] or l[i] != l[i-2]: rle += l[i]
	print(rle.strip())
