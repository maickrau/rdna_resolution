#!/usr/bin/python

import fileinput

for l in fileinput.input():
	if l[0] == '>':
		print(l.strip())
		continue
	l = l.replace('a', 'A').replace('c', 'C').replace('g', 'G').replace('t', 'T')
	print(l.strip())
