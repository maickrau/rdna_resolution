#!/usr/bin/python

import sys
import colorsys
import hashlib

kmer_size = int(sys.argv[1])

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def get_minimizer(s):
	global kmer_size
	assert len(s) >= kmer_size
	minimum = min(s[0:kmer_size], revcomp(s[0:kmer_size]))
	for i in range(1, len(s) - kmer_size):
		here = min(s[i:i+kmer_size], revcomp(s[i:i+kmer_size]))
		if here < minimum: minimum = here
	return minimum

def hex_from_int(i):
	result = hex(int(i * 255)).split('x')[1]
	if len(result) == 1: result = "0" + result
	return result

def minimizer_to_color(minimizer):
	hue = float(int(hashlib.md5(minimizer).hexdigest(), 16) % 10000) / 10000.0
	hue -= float(int(hue))
	rgb = colorsys.hsv_to_rgb(hue, 1, 1)
	return "#" + hex_from_int(rgb[0]) + hex_from_int(rgb[1]) + hex_from_int(rgb[2])

print("node,Colour")
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		name = parts[1]
		minimizer = get_minimizer(parts[2])
		color = minimizer_to_color(minimizer)
		print(name + "," + color)
