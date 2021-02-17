#!/usr/bin/python

import sys

readname_file = sys.argv[1]
# sam from stdin

valid_reads = set()
with open(readname_file) as f:
	for l in f:
		valid_reads.add(l.strip())

for l in sys.stdin:
	if l[0] == '#':
		print(l.strip())
		continue
	parts = l.strip().split('\t')
	if parts[0] not in valid_reads: continue
	print(l.strip())
	continue
