#!/usr/bin/python

import sys

# read name files from argv
# sam from stdin

read_groups = {}
for i in range(1, len(sys.argv)):
	with open(sys.argv[i]) as f:
		for l in f:
			# assert l.strip() not in read_groups
			read_groups[l.strip()] = i

for l in sys.stdin:
	if l[0] == '@':
		print(l.strip())
		continue
	parts = l.strip().split('\t')
	group = -1
	if parts[0] in read_groups: group = read_groups[parts[0]]
	parts.append("rg:Z:" + str(group))
	print("\t").join(parts)
