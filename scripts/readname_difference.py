#!/usr/bin/python

import sys

main_readname_file = sys.argv[1]
# more readname files from argv[2:], those are forbidden from the main
# output to stdout

forbidden = set()
for file in sys.argv[2:]:
	with open(file) as f:
		for l in f:
			forbidden.add(l.strip())

with open(main_readname_file) as f:
	for l in f:
		if l.strip() in forbidden: continue
		print(l.strip())
