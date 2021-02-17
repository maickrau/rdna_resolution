#!/usr/bin/python

import sys

graphfile = sys.argv[1]
corenodefile = sys.argv[2]
gaffile = sys.argv[3]
startnode = sys.argv[4]

# fraction of max to include as an alt
allele_relative_frequency_cutoff = 0.5

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def getseq(n):
	global nodeseqs
	if n[0] == '>': return nodeseqs[n[1:]]
	return revcomp(nodeseqs[n[1:]])

def reversenode(n):
	return (">" if n[0] == "<" else "<") + n[1:]

def reversepath(p):
	return [reversenode(n) for n in p[::-1]]

nodeseqs = {}
with open(graphfile) as f:
	for l in f:
		if l[0] == 'S':
			parts = l.strip().split('\t')
			nodeseqs[parts[1]] = parts[2]

core_nodes = set()
with open(corenodefile) as f:
	for l in f:
		core_nodes.add(l.strip())

fw_alns = []
bw_alns = []
with open(gaffile) as f:
	for l in f:
		path = []
		parts = l.strip().split('\t')
		pathstr = parts[5] + '>'
		last_break = 0
		for i in range(1, len(pathstr)):
			if pathstr[i] == '<' or pathstr[i] == '>':
				path.append(pathstr[last_break:i])
				last_break = i
		for i in range(0, len(path)):
			if path[i][1:] == startnode[1:]:
				if path[i][0] == startnode[0]:
					fw_alns.append(path[i:])
					bw_alns.append(reversepath(path[:i+1]))
					break
				else:
					fw_alns.append(reversepath(path[:i+1]))
					bw_alns.append(path[i:])

bubble_num = 0
start_node = startnode + "_0_0_core"
print("S\t" + start_node + "\t" + getseq(startnode) + "\tFC:i:" + str(len(fw_alns) * len(getseq(startnode))))

def add_paths(start_node, start_dir, alns):
	global bubble_num
	global core_nodes
	last_bubble_end = start_node
	last_bubble_dir = start_dir
	current_index = []
	for i in range(0, len(alns)):
		current_index.append(1)
	while True:
		check_next_core = list(current_index)
		next_cores = {}
		for i in range(0, len(alns)):
			start_index = check_next_core[i]
			while check_next_core[i] < len(alns[i]) and alns[i][check_next_core[i]][1:] not in core_nodes:
				check_next_core[i] += 1
			if check_next_core[i] == len(alns[i]): continue
			if alns[i][check_next_core[i]] not in next_cores: next_cores[alns[i][check_next_core[i]]] = []
			next_cores[alns[i][check_next_core[i]]].append(i)
		if len(next_cores) >= 2:
			for core in next_cores:
				paths = []
				for index in next_cores[core]:
					paths.append(alns[index][current_index[index]-1:])
				assert len(paths) >= 1
				assert len(paths) < len(alns)
				add_paths(last_bubble_end, last_bubble_dir, paths)
			break
		bubble_node_num = 0
		next_end = None
		# alleles does NOT contain start or end nodes
		# only middle nodes
		alleles = {}
		total_coverage = 0
		for i in range(0, len(alns)):
			start_index = current_index[i]
			while current_index[i] < len(alns[i]) and alns[i][current_index[i]][1:] not in core_nodes:
				current_index[i] += 1
			if current_index[i] == len(alns[i]):
				continue
			assert next_end is None or alns[i][current_index[i]] == next_end
			next_end = alns[i][current_index[i]]
			key = tuple(alns[i][start_index:current_index[i]])
			current_index[i] += 1
			if key not in alleles: alleles[key] = 0
			alleles[key] += 1
			total_coverage += 1
		if len(alleles) == 0: break
		bubble_end_name = next_end + "_" + str(bubble_num) + "_" + str(bubble_node_num) + "_core"
		bubble_node_num += 1
		print("S\t" + bubble_end_name + "\t" + getseq(next_end) + "\tFC:i:" + str(total_coverage * len(getseq(next_end))))
		max_allele = 0
		for allele in alleles: max_allele = max(max_allele, alleles[allele])
		for allele in alleles:
			if alleles[allele] < max_allele * allele_relative_frequency_cutoff: continue
			last_node = last_bubble_end
			last_dir = last_bubble_dir
			for n in allele:
				node_name = n + "_" + str(bubble_num) + "_" + str(bubble_node_num) + "_allele"
				bubble_node_num += 1
				print("S\t" + node_name + "\t" + getseq(n) + "\tFC:i:" + str(alleles[allele] * len(getseq(n))))
				print("L\t" + last_node + "\t" + last_bubble_dir + "\t" + node_name + "\t+\t0M")
				last_node = node_name
				last_bubble_dir = "+"
			print("L\t" + last_node + "\t" + last_bubble_dir + "\t" + bubble_end_name + "\t+\t0M")
		bubble_num += 1
		last_bubble_end = bubble_end_name
		last_bubble_dir = "+"

add_paths(start_node, "+", fw_alns)
add_paths(start_node, "-", bw_alns)
