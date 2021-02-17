#!/usr/bin/python

import sys

ref_length = int(sys.argv[1])
max_snpmer_length = int(sys.argv[2])
stride = int(sys.argv[3])
min_snpmer_coverage = int(sys.argv[4])
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

snpmer_positions = []
for start in range(0, ref_length, stride):
	end = start + max_snpmer_length
	positions_here = []
	for position in sorted_positions:
		if (position >= start and position < end) or position + ref_length >= start and position + ref_length < end:
			positions_here.append(position)
	if len(positions_here) == 0:
		snpmer_positions.append((start, end, []))
		continue
	if positions_here[0] == sorted_positions[0]:
		for i in range(1, len(positions_here)):
			if positions_here[i] != sorted_positions[i]:
				positions_here = positions_here[i:] + positions_here[:i]
				break
	if end > ref_length: end -= ref_length
	snpmer_positions.append((start, end, positions_here))

path_coverage = {}
for path in paths:
	snps_covered = {}
	for snp in path:
		snps_covered[int(snp.split('_')[0])] = snp.split('_')[1]
	for (start, end, positions) in snpmer_positions:
		covered = True
		for position in positions:
			if position not in snps_covered:
				covered = False
				break
		if not covered: continue
		key = tuple([str(start) + "_N"] + [str(pos) + "_" + str(snps_covered[pos]) for pos in positions] + [str(end) + "_N"])
		if key not in path_coverage: path_coverage[key] = 0
		path_coverage[key] += 1

for path in path_coverage:
	if path_coverage[path] < min_snpmer_coverage: continue
	print(",".join(path) + "\t" + str(path_coverage[path]))
