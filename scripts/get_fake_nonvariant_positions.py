#!/usr/bin/python

import sys

stride = int(sys.argv[1])
# pileup from stdin
# positions to stdout

last_prunt = 0
for l in sys.stdin:
	parts = l.strip().split('\t')
	pos = int(parts[1])
	if pos < last_prunt + stride: continue
	if len(parts[4].replace('.', '').replace(',', '')) != 0: continue
	print(pos)
	last_prunt += stride
