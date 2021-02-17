#!/usr/bin/python

import sys

query_str = sys.argv[1]
# ref from stdin

for l in sys.stdin:
	start_pos = 0
	found = l.find(query_str, start_pos)
	while found != -1:
		print(found)
		start_pos = found+1
		found = l.find(query_str, start_pos)
