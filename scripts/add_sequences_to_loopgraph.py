#!/usr/bin/python

import sys

loopgraph_file = sys.argv[1]
sequence_file = sys.argv[2]
kmer_size = int(sys.argv[3])
prefix = sys.argv[4]
# graph to stdout

allele_sequence = {}
allele_copycount = {}
allele_coverage = {}
current_name = ""
current_seq = ""
with open(sequence_file) as f:
	for l in f:
		if l[0] == '>':
			if len(current_seq) > 0:
				allele_sequence[current_name] = current_seq
			current_name = l.split('_')[1]
			assert current_name[0:6] == "allele"
			current_name = current_name[6:]
			current_seq = ""
			coverage = l.split('_')[2].strip()
			assert coverage[0:8] == "coverage"
			coverage = int(coverage[8:])
			allele_coverage[current_name] = coverage
			copycount = l.split('_')[3].strip()
			assert copycount[0:9] == "copycount"
			copycount = int(copycount[9:])
			allele_copycount[current_name] = copycount
		else:
			current_seq += l.strip()
if len(current_seq) > 0:
	allele_sequence[current_name] = current_seq

with open(loopgraph_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		if parts[0] == 'S':
			name = parts[1].split('_')[1]
			assert name in allele_sequence
			parts[1] = "loop_" + name + "_coverage" + str(allele_coverage[name]) + "_copycount" + str(allele_copycount[name])
			parts[2] = allele_sequence[name]
			parts[1] = prefix + "_" + parts[1]
			print("\t".join(parts))
		elif parts[0] == 'L':
			name = parts[1].split('_')[1]
			assert name in allele_sequence
			parts[1] = "loop_" + name + "_coverage" + str(allele_coverage[name]) + "_copycount" + str(allele_copycount[name])
			parts[1] = prefix + "_" + parts[1]
			name = parts[3].split('_')[1]
			assert name in allele_sequence
			parts[3] = "loop_" + name + "_coverage" + str(allele_coverage[name]) + "_copycount" + str(allele_copycount[name])
			parts[3] = prefix + "_" + parts[3]
			parts[5] = str(kmer_size) + "M"
			print("\t".join(parts))
		elif parts[0] == 'P':
			path = parts[2].split(',')
			newpath = []
			for p in path:
				name = p.split('_')[1]
				assert name in allele_sequence
				name = "loop_" + name + "_coverage" + str(allele_coverage[name]) + "_copycount" + str(allele_copycount[name]) + "+"
				name = prefix + "_" + name
				newpath.append(name)
			parts[2] = ",".join(newpath)
			print("\t".join(parts))
