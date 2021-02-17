#!/usr/bin/python

import sys

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

paths = []
for l in sys.stdin:
	path = l.strip().split(',')
	paths.append(path)

paths.sort(key=lambda x: -len(x))

for i in range(len(paths)-1, 0, -1):
	contained = False
	for j in range(0, i):
		if is_contained_path(paths[i], paths[j]):
			contained = True
			break
	if contained:
		(paths[i], paths[-1]) = (paths[-1], paths[i])
		paths.pop()

for path in paths:
	print(",".join(path))
