#!/usr/bin/python

import sys

ref_length = int(sys.argv[1])
max_snpmer_length = int(sys.argv[2])
min_snpmer_coverage = int(sys.argv[3])
# read snp paths from stdin

paths = []
positions = set()
for l in sys.stdin:
	path = l.strip().split('\t')[1].split(',')
	paths.append(path)
	for node in path:
		positions.add(int(node.split('_')[0]))
sorted_positions = list(positions)
sorted_positions.sort()
position_end = {}
for i in range(0, len(sorted_positions)):
	for j in range(0, len(sorted_positions)+1):
		end_pos = sorted_positions[(i + j) % len(sorted_positions)]
		next_pos = sorted_positions[(i + j + 1) % len(sorted_positions)]
		start_pos = sorted_positions[i]
		if end_pos < start_pos: end_pos += ref_length
		if next_pos < start_pos: next_pos += ref_length
		if end_pos - start_pos <= max_snpmer_length and next_pos - start_pos > max_snpmer_length:
			if end_pos >= ref_length: end_pos -= ref_length
			position_end[start_pos] = end_pos
			break

path_coverage = {}
for path in paths:
	for i in range(0, len(path)):
		start_pos = int(path[i].split('_')[0])
		for j in range(i, len(path)):
			end_pos = int(path[j].split('_')[0])
			if end_pos == position_end[start_pos]:
				key = tuple(path[i:j+1])
				if key not in path_coverage: path_coverage[key] = 0
				path_coverage[key] += 1
				break

contained = set()
for path in path_coverage:
	for i in range(1, len(path)):
		contained.add(path[i:])
		contained.add(path[:-i])

for path in path_coverage:
	if path in contained: continue
	if path_coverage[path] < min_snpmer_coverage: continue
	print(",".join(path) + "\t" + str(path_coverage[path]))
