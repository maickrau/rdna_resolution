#!/usr/bin/python

import sys

min_support = int(sys.argv[1])
# paths from stdin

def is_contained_path(subpath, superpath):
	assert len(superpath) >= len(subpath)
	for offset in range(0, len(superpath) - len(subpath) + 1):
		contained = True
		for i in range(0, len(subpath)):
			if subpath[i] != superpath[i+offset]:
				contained = False
				break
		if contained: return True
	return False

all_paths = []
for l in sys.stdin:
	path = l.strip().split(',')
	all_paths.append(path)

all_paths.sort(key=lambda x: -len(x))
maximal_paths = []

for i in range(len(all_paths)-1, 0, -1):
	contained = False
	for j in range(0, i):
		if is_contained_path(all_paths[i], all_paths[j]):
			contained = True
			break
	if not contained:
		maximal_paths.append(all_paths[i])

for path in maximal_paths:
	last_supported_end = None
	for start in range(0, len(path)):
		for end in range(len(path), start, -1):
			subpath = path[start:end]
			supported_count = 0
			for path2 in all_paths:
				if len(path2) < len(subpath): continue
				if is_contained_path(subpath, path2):
					supported_count += 1
			if supported_count >= min_support:
				if last_supported_end is None or end > last_supported_end:
					print(",".join(subpath) + "\t" + str(supported_count))
					last_supported_end = end

