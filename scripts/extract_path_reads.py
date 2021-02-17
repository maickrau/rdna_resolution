#!/usr/bin/python

import sys

max_distance = int(sys.argv[1])
max_unaligned = int(sys.argv[2])
# alignment paf from stdin. paf of hifi to heavy path

def read_is_fine(alignmentlines, max_distance, max_unaligned):
	alignments = [aln.split('\t') for aln in alignmentlines]
	if len(alignments) > 2: return False
	if len(alignments) == 1:
		aln = alignments[0]
		missing_seq = int(aln[1]) - int(aln[3]) + int(aln[2])
		mismatches = int(aln[12][5:])
		if missing_seq > max_unaligned: return False
		if mismatches > max_distance: return False
	else:
		alignments.sort(key=lambda x: x[2])
		if abs(int(alignments[0][2]) - int(alignments[1][3])) > max_unaligned and abs(int(alignments[0][3]) - int(alignments[1][2])) > max_unaligned: return False
		if int(alignments[0][7]) > max_unaligned and int(alignments[1][7]) > max_unaligned: return False
		if int(alignments[0][8]) < int(alignments[0][6]) - max_unaligned and int(alignments[1][8]) < int(alignments[0][6]) - max_unaligned: return False
		aligned = int(alignments[0][3]) - int(alignments[0][2]) + int(alignments[1][3]) - int(alignments[1][2])
		mismatches = int(alignments[0][12][5:]) + int(alignments[1][12][5:])
		missing_seq = int(alignments[0][1]) - aligned
		if missing_seq > max_unaligned: return False
		if mismatches > max_distance: return False
	return True


current_alignments = []
current_read = ""
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] != current_read:
		if current_read != "" and read_is_fine(current_alignments, max_distance, max_unaligned):
			print(current_read)
		current_read = parts[0]
		current_alignments = [l.strip()]
	else:
		current_alignments.append(l.strip())

if read_is_fine(current_alignments, max_distance, max_unaligned):
	print(current_read)
