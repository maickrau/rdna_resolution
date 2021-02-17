#!/usr/bin/python

import fileinput

for l in fileinput.input():
	rle = l[0]
	if l[0] == '>':
		print(l.strip())
		continue
	l = l.strip().replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	for i in range(1, len(l)):
		if l[i] != l[i-1]: rle += l[i]
	print(rle.strip())
