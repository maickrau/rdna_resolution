#!/usr/bin/python

import sys

max_path_len = int(sys.argv[1])
node_priority_file = sys.argv[2] # higher more preferable
# gfa from stdin
# nodes to stdout

def reverse(n):
	return (n[0], "+" if n[1] == "-" else "-")

node_priority = {}
with open(node_priority_file) as f:
	for l in f:
		parts = l.strip().split('\t')
		assert parts[0] not in node_priority
		node_priority[parts[0]] = float(parts[1])

node_lens = {}
edges = {}
for l in sys.stdin:
	parts = l.strip().split('\t')
	if parts[0] == 'S':
		assert parts[1] in node_priority
		node_lens[parts[1]] = len(parts[2])
		if (parts[1], "-") not in edges: edges[(parts[1], "-")] = set()
		if (parts[1], "+") not in edges: edges[(parts[1], "+")] = set()
	if parts[0] == 'L':
		assert parts[1] in node_priority
		assert parts[3] in node_priority
		fromtip = (parts[1], parts[2])
		totip = reverse((parts[3], parts[4]))
		if fromtip not in edges: edges[fromtip] = set()
		if totip not in edges: edges[totip] = set()
		edges[fromtip].add(totip)
		edges[totip].add(fromtip)

checkables = []
longest = {}
becomes_longest = []
for i in range(0, max_path_len):
	checkables.append(set())
	becomes_longest.append([])
for n in node_priority:
	checkables[0].add((n, "-"))
	checkables[0].add((n, "+"))
	longest[(n, "+")] = n
	longest[(n, "-")] = n

for i in range(0, max_path_len):
	for p in becomes_longest[i]:
		if node_priority[p[1]] > node_priority[longest[p[0]]]:
			longest[p[0]] = p[1]
	for tip in checkables[i]:
		min_incoming = None
		for edge in edges[tip]:
			if min_incoming is None: min_incoming = longest[edge]
			if node_priority[longest[edge]] < node_priority[min_incoming]:
				min_incoming = longest[edge]
		if min_incoming is None or node_priority[min_incoming] <= node_priority[tip[0]]:
			pass
		else:
			if i + node_lens[tip[0]] < len(checkables):
				becomes_longest[i + node_lens[tip[0]]].append((reverse(tip), min_incoming))
				for edge in edges[reverse(tip)]:
					checkables[i + node_lens[tip[0]]].add(edge)


selected = set()
for tip in longest:
	selected.add(longest[tip])

for n in selected:
	print(n)

