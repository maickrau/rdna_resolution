#!/usr/bin/python

import fileinput
import re

for l in fileinput.input():
	rle = l[0]
	if l[0] == '>':
		print(l.strip())
		continue
	line = l.strip()
	line = re.sub(r"(AA){2,}", "AA", line)
	line = re.sub(r"(AC){2,}", "AC", line)
	line = re.sub(r"(AG){2,}", "AG", line)
	line = re.sub(r"(AT){2,}", "AT", line)
	line = re.sub(r"(CC){2,}", "CC", line)
	line = re.sub(r"(CG){2,}", "CG", line)
	line = re.sub(r"(CT){2,}", "CT", line)
	line = re.sub(r"(GG){2,}", "GG", line)
	line = re.sub(r"(GT){2,}", "GT", line)
	line = re.sub(r"(TT){2,}", "TT", line)
	print(line.strip())
