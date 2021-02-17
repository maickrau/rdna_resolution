#!/usr/bin/python

import sys

# matches from stdin

doublematchlines = {}
for l in sys.stdin:
	parts = l.strip().split(' ')
	if parts[0] != "doublematch": continue
	if int(parts[3].split('_')[1]) < int(parts[1].split('_')[1]): continue
	key = (parts[1], parts[3])
	assert key not in doublematchlines
	doublematchlines[key] = l.strip()

transitives = set()
for key1 in doublematchlines:
	for key2 in doublematchlines:
		if key1[1] != key2[0]: continue
		transitives.add((key1[0], key2[1]))

for key in doublematchlines:
	if key in transitives: continue
	print(doublematchlines[key])
