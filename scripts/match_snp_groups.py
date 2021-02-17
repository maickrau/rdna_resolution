#!/usr/bin/python

import sys

# snp groups from argv eg ./match_snp_groups.py snp_*.txt
# has to be in format snp_1234_A.txt

snp_groups = {}

for i in range(2, len(sys.argv)):
	path = sys.argv[i]
	filename = path.split('/')[-1].split('.')[0]
	position = "_".join(filename.split('_')[0:2])
	allele = filename.split('_')[2]
	if position not in snp_groups: snp_groups[position] = {}
	if allele not in snp_groups[position]: snp_groups[position][allele] = set()
	with open(path) as f:
		for l in f:
			snp_groups[position][allele].add(l.strip())

directed_matches = {}

for group1 in snp_groups:
	for group2 in snp_groups:
		if group2 == group1: continue
		for allele1 in snp_groups[group1]:
			matches = {}
			for allele2 in snp_groups[group2]:
				matches[allele2] = set()
				for read in snp_groups[group1][allele1]:
					if read in snp_groups[group2][allele2]:
						matches[allele2].add(read)
			more_than_one_match = False
			max_match = (0, set())
			for allele2 in matches:
				if len(matches[allele2]) >= 2:
					if max_match[0] != 0:
						more_than_one_match = True
						break
					max_match = (allele2, matches[allele2])
			if more_than_one_match: continue
			if max_match[0] == 0: continue
			if len(max_match[1]) < len(snp_groups[group1][allele1]) * 0.3: continue
			if len(max_match[1]) < len(snp_groups[group2][max_match[0]]) * 0.3: continue
			directed_matches[(group1, allele1, group2, max_match[0])] = max_match[1]

for match in directed_matches:
	if (match[2], match[3], match[0], match[1]) not in directed_matches: continue
	print("doublematch " + match[0] + "_" + match[1] + " to " + match[2] + "_" + match[3] + " reads " + str(len(directed_matches[match])) + " ( " + str(len(snp_groups[match[0]][match[1]])) + " " + str(len(snp_groups[match[2]][match[3]])) + " )")

for match in directed_matches:
	print("match " + match[0] + "_" + match[1] + " to " + match[2] + "_" + match[3] + " reads " + str(len(directed_matches[match])) + " ( " + str(len(snp_groups[match[0]][match[1]])) + " " + str(len(snp_groups[match[2]][match[3]])) + " )")
