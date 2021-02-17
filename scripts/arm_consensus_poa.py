#!/usr/bin/python

import sys

graphfile = sys.argv[1]
corenodefile = sys.argv[2]
gaffile = sys.argv[3]
startnode = sys.argv[4]

def revcomp(s):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return "".join(comp[c] for c in s[::-1])

def complement(c):
	comp = {'A': 'T', 'T': 'A', 'C': 'G', 'G': 'C'}
	return comp[c]

def getseq(n):
	global nodeseqs
	if n[0] == '>': return nodeseqs[n[1:]]
	return revcomp(nodeseqs[n[1:]])

def reversenode(n):
	return (">" if n[0] == "<" else "<") + n[1:]

def reversepath(p):
	return [reversenode(n) for n in p[::-1]]

def get_allele_seq(allele, last_core, next_core):
	global nodeseqs
	result = ""
	if last_core[0] == '>':
		result += nodeseqs[last_core[1:]][-1]
	else:
		result += complement(nodeseqs[last_core[1:]][0])
	for node in allele:
		if node[0] == '>':
			result += nodeseqs[node[1:]]
		else:
			result += revcomp(nodeseqs[node[1:]])
	if next_core[0] == '>':
		result += nodeseqs[next_core[1:]][0]
	else:
		result += complement(nodeseqs[next_core[1:]][-1])
	return result

def get_dp_path(allele_seq, nodes, in_edges, node_order):
	assert len(allele_seq) >= 2
	assert len(nodes) >= 2
	assert allele_seq[0] == nodes[0]
	assert allele_seq[-1] == nodes[1]
	assert len(nodes) == len(in_edges)
	assert len(nodes) == len(node_order)
	dp_table = []
	for i in range(0, len(allele_seq)):
		dp_table.append([])
		for j in range(0, len(node_order)):
			dp_table[i].append(len(allele_seq)+len(node_order))
			assert node_order[j] < len(nodes)
		for order in range(0, len(node_order)):
			j = node_order[order]
			assert j < len(nodes)
			assert i < len(dp_table)
			assert j < len(dp_table[i])
			if i == 0 and j == 0: dp_table[i][j] = 0
			if i > 0: dp_table[i][j] = min(dp_table[i][j], dp_table[i-1][j]+1)
			if j > 0:
				assert len(in_edges[j]) >= 1
				for neighbor in in_edges[j]:
					dp_table[i][j] = min(dp_table[i][j], dp_table[i][neighbor]+1)
					if i > 0: dp_table[i][j] = min(dp_table[i][j], dp_table[i-1][neighbor]+(0 if allele_seq[i] == nodes[j] else 1))
	i = len(allele_seq)-1
	j = 1
	path = [(i, j)]
	while i != 0 or j != 0:
		if i > 0 and dp_table[i][j] == dp_table[i-1][j]+1:
			i -= 1
		elif j > 0:
			assert len(in_edges[j]) >= 1
			found = False
			for neighbor in in_edges[j]:
				if dp_table[i][j] == dp_table[i][neighbor]+1:
					j = neighbor
					found = True
					break
				if i > 0 and dp_table[i][j] == dp_table[i-1][neighbor]+(0 if allele_seq[i] == nodes[j] else 1):
					j = neighbor
					i -= 1
					found = True
					break
			assert found
		else:
			assert False
		path.append((i, j))
	return path[::-1]


def get_poa(alleles, last_core, next_core):
	assert len(alleles) >= 1
	nodes = []
	in_edges = []
	node_order = []
	node_coverage = []
	for allele in alleles:
		allele_seq = get_allele_seq(allele, last_core, next_core)
		if len(nodes) == 0:
			nodes.append(allele_seq[0])
			node_coverage.append(1)
			in_edges.append(set())
			node_order.append(0)
			nodes.append(allele_seq[-1])
			node_coverage.append(1)
			in_edges.append(set())
			last_node = 0
			for i in range(1, len(allele_seq)-1):
				nodes.append(allele_seq[i])
				in_edges.append(set())
				in_edges[-1].add(last_node)
				last_node = len(nodes)-1
				node_order.append(last_node)
				node_coverage.append(1)
			in_edges[1].add(last_node)
			node_order.append(1)
			assert len(nodes) == len(in_edges)
			assert len(nodes) == len(node_order)
			assert len(nodes) == len(node_coverage)
			node_in_order = []
			for i in range(0, len(nodes)):
				node_in_order.append(None)
			for i in range(0, len(node_order)):
				assert node_in_order[node_order[i]] is None
				node_in_order[node_order[i]] = i
			for i in range(0, len(in_edges)):
				for edge in in_edges[i]:
					assert node_in_order[edge] < node_in_order[i]
			for i in range(1, len(in_edges)):
				assert len(in_edges[i]) >= 1
			continue
		path = get_dp_path(allele_seq, nodes, in_edges, node_order)
		assert path[0] == (0, 0)
		assert path[-1] == (len(allele_seq)-1, 1)
		match_list = [path[0]]
		for i in range(1, len(path)-1):
			if path[i][0] == path[i-1][0]: continue
			if path[i][1] == path[i-1][1]: continue
			if allele_seq[path[i][0]] != nodes[path[i][1]]: continue
			if path[i][0] == len(allele_seq)-1:
				assert path[i][1] != 1
				continue
			if path[i][1] == 1:
				assert path[i][0] != len(allele_seq)-1
				continue
			match_list.append(path[i])
		match_list.append(path[-1])
		assert len(match_list) >= 2
		print("path: " + str(path))
		print("match_list: " + str(match_list))
		assert match_list[0] == path[0]
		assert match_list[-1] == path[-1]
		node_order_additions = {}
		node_coverage[match_list[0][0]] += 1
		for i in range(1, len(match_list)):
			assert match_list[i][0] > match_list[i-1][0]
			node_coverage[match_list[i][1]] += 1
			if match_list[i][0] == match_list[i-1][0]+1:
				in_edges[match_list[i][1]].add(match_list[i-1][1])
			else:
				assert match_list[i][1] not in node_order_additions
				node_order_additions[match_list[i][1]] = (match_list[i-1][1], allele_seq[match_list[i-1][0]+1:match_list[i][0]])
		new_node_order = []
		assert node_order[0] not in node_order_additions
		for i in range(0, len(node_order)):
			if node_order[i] not in node_order_additions:
				new_node_order.append(node_order[i])
				continue
			(from_node, addition) = node_order_additions[node_order[i]]
			for c in addition:
				nodes.append(c)
				new_node_order.append(len(nodes)-1)
				in_edges.append(set())
				in_edges[-1].add(from_node)
				from_node = len(nodes)-1
				node_coverage.append(1)
			in_edges[node_order[i]].add(from_node)
			new_node_order.append(node_order[i])
		node_order = new_node_order
		node_in_order = []
		for i in range(0, len(nodes)):
			node_in_order.append(None)
		for i in range(0, len(node_order)):
			assert node_in_order[node_order[i]] is None
			node_in_order[node_order[i]] = i
		for i in range(0, len(in_edges)):
			for edge in in_edges[i]:
				assert node_in_order[edge] < node_in_order[i]
		for i in range(1, len(in_edges)):
			assert len(in_edges[i]) >= 1
		assert len(nodes) == len(in_edges)
		assert len(nodes) == len(node_order)
		assert len(nodes) == len(node_coverage)
	return (nodes, in_edges, node_coverage)


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
		last_bubble_end_node = None
		for i in range(0, len(alns)):
			last_core_index = check_next_core[i]-1
			last_bubble_end_node = alns[i][check_next_core[i]-1]
			start_index = check_next_core[i]
			while check_next_core[i] < len(alns[i]) and alns[i][check_next_core[i]][1:] not in core_nodes:
				check_next_core[i] += 1
			if check_next_core[i] == len(alns[i]): continue
			assert last_bubble_end_node is None or alns[i][last_core_index] == last_bubble_end_node
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
		(poa_nodes, poa_in_edges, poa_coverage) = get_poa(alleles, last_bubble_end_node, next_end)
		for node in range(2, len(poa_nodes)):
			print("S\t" + "allele_" + str(bubble_num) + "_" + str(node) + "\t" + poa_nodes[node] + "\tFC:i:" + str(poa_coverage[node]))
			for edge in poa_in_edges[node]:
				from_name = "allele_" + str(bubble_num) + "_" + str(edge)
				from_dir = "+"
				if edge == 0:
					from_name = last_bubble_end
					from_dir = last_bubble_dir
				to_name = "allele_" + str(bubble_num) + "_" + str(node)
				print("L\t" + from_name + "\t" + from_dir + "\t" + to_name + "\t+\t0M")
		assert len(poa_in_edges[1]) >= 1
		for edge in poa_in_edges[1]:
			from_name = "allele_" + str(bubble_num) + "_" + str(edge)
			print("L\t" + from_name + "\t+\t" + bubble_end_name + "\t+\t0M")
		bubble_num += 1
		last_bubble_end_node = next_end
		last_bubble_end = bubble_end_name
		last_bubble_dir = "+"

add_paths(start_node, "+", fw_alns)
add_paths(start_node, "-", bw_alns)
