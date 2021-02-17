# get uncorrected per-chromosome alignment recruited hifi reads to chr*/hifi.fa
# and all uncorrected hifi reads to hifi.fa
# get simple-clustering recruited hifi reads aka reads in the rDNA array to chr*_rdna_hifi_limited.fa
# and pj/dj sequences to chr*_pjdj.fa
# and ONT reads to ont.fa
# and the reference allele to KY962518.fasta

mkdir chr13 chr14 chr15 chr21 chr22

cd chr13
MBG -i hifi.fa -o graph-35-5-nonblunt.gfa -k 35 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-35-5-nonblunt.gfa -f hifi.fa --corrected-out corrected1.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-101-5-nonblunt.gfa -k 101 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-101-5-nonblunt.gfa -f hifi.fa --corrected-out corrected2.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-251-5.gfa -k 251 -w 5 -a 1 -u 2 --blunt
scripts/UntipRelative 5000 5000 0.1 < graph-251-5.gfa | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > blunt-graph.gfa
cd ../chr14
MBG -i hifi.fa -o graph-35-5-nonblunt.gfa -k 35 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-35-5-nonblunt.gfa -f hifi.fa --corrected-out corrected1.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-101-5-nonblunt.gfa -k 101 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-101-5-nonblunt.gfa -f hifi.fa --corrected-out corrected2.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-251-5.gfa -k 251 -w 5 -a 1 -u 2 --blunt
scripts/UntipRelative 5000 5000 0.1 < graph-251-5.gfa | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > blunt-graph.gfa
cd ../chr15
MBG -i hifi.fa -o graph-35-5-nonblunt.gfa -k 35 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-35-5-nonblunt.gfa -f hifi.fa --corrected-out corrected1.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-101-5-nonblunt.gfa -k 101 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-101-5-nonblunt.gfa -f hifi.fa --corrected-out corrected2.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-251-5.gfa -k 251 -w 5 -a 1 -u 2 --blunt
scripts/UntipRelative 5000 5000 0.1 < graph-251-5.gfa | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > blunt-graph.gfa
cd ../chr21
MBG -i hifi.fa -o graph-35-5-nonblunt.gfa -k 35 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-35-5-nonblunt.gfa -f hifi.fa --corrected-out corrected1.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-101-5-nonblunt.gfa -k 101 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-101-5-nonblunt.gfa -f hifi.fa --corrected-out corrected2.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-251-5.gfa -k 251 -w 5 -a 1 -u 2 --blunt
scripts/UntipRelative 5000 5000 0.1 < graph-251-5.gfa | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > blunt-graph.gfa
cd ../chr22
MBG -i hifi.fa -o graph-35-5-nonblunt.gfa -k 35 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-35-5-nonblunt.gfa -f hifi.fa --corrected-out corrected1.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-101-5-nonblunt.gfa -k 101 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
/usr/bin/time -v GraphAligner -g graph-101-5-nonblunt.gfa -f hifi.fa --corrected-out corrected2.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --E-cutoff 0.00001 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
MBG -i corrected1.fa -o graph-251-5.gfa -k 251 -w 5 -a 1 -u 2 --blunt
scripts/UntipRelative 5000 5000 0.1 < graph-251-5.gfa | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > blunt-graph.gfa
cd ..
awk '$1=="S"{print "S\tchr13_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr13_" $2 "\t" $3 "\tchr13_" $4 "\t" $5 "\t" $6;}' < chr13/blunt-graph.gfa > chr13/graph-pjdj-renamed.gfa
awk '$1=="S"{print "S\tchr14_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr14_" $2 "\t" $3 "\tchr14_" $4 "\t" $5 "\t" $6;}' < chr14/blunt-graph.gfa > chr14/graph-pjdj-renamed.gfa
awk '$1=="S"{print "S\tchr15_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr15_" $2 "\t" $3 "\tchr15_" $4 "\t" $5 "\t" $6;}' < chr15/blunt-graph.gfa > chr15/graph-pjdj-renamed.gfa
awk '$1=="S"{print "S\tchr21_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr21_" $2 "\t" $3 "\tchr21_" $4 "\t" $5 "\t" $6;}' < chr21/blunt-graph.gfa > chr21/graph-pjdj-renamed.gfa
awk '$1=="S"{print "S\tchr22_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr22_" $2 "\t" $3 "\tchr22_" $4 "\t" $5 "\t" $6;}' < chr22/blunt-graph.gfa > chr22/graph-pjdj-renamed.gfa
cat chr*/graph-pjdj-renamed.gfa > mergegraph-pjdj-withcomponents.gfa
scripts/pick_largest_component.py < chr13/graph-pjdj-renamed.gfa > pjdj-mergegraph.gfa
scripts/pick_largest_component.py < chr14/graph-pjdj-renamed.gfa >> pjdj-mergegraph.gfa
scripts/pick_largest_component.py < chr15/graph-pjdj-renamed.gfa >> pjdj-mergegraph.gfa
scripts/pick_largest_component.py < chr21/graph-pjdj-renamed.gfa >> pjdj-mergegraph.gfa
scripts/pick_largest_component.py < chr22/graph-pjdj-renamed.gfa >> pjdj-mergegraph.gfa

GraphAligner -g pjdj-mergegraph.gfa -f chr*_pjdj.fa -a alns_pjdj.gaf -t 40 -x vg --precise-clipping 0.99 --X-drop 1000000 --multiseed-DP 1 --min-alignment-score 30000

mkdir hifi_to_pjdjgraph
cd hifi_to_pjdjgraph
/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f ../hifi.fa -a alns_hifi.gaf -t 40 -x vg -b 35 --multiseed-DP 1 --X-drop 20000 --precise-clipping 0.98 --multimap-score-fraction 1 --min-alignment-score 1000 1> stdout_ga_hifi.txt 2> stderr_ga_hifi.txt
cut -f 1,6,7 < alns_hifi.gaf | tr '>' '\t' | tr '<' '\t' | tr ' ' '\t' | cut -f 1,4 | sed 's/\(chr[12345]\)\(_tip\)\?_[0123456789]*\(_end\)\?\(_[0123456789]*\)\?/\1/g' | sort | uniq | cut -f 1 | sort | uniq -c | grep -vP '^ +1 ' | sed 's/^ \+[0123456789]\+ //g' > reads_hifi_ambiguous.txt
scripts/filter_ambiguous_reads.py reads_hifi_ambiguous.txt < alns_hifi.gaf > alns_hifi_unambiguous.gaf
grep chr13 < alns_hifi_unambiguous.gaf > alns_hifi_chr13.gaf
grep chr14 < alns_hifi_unambiguous.gaf > alns_hifi_chr14.gaf
grep chr15 < alns_hifi_unambiguous.gaf > alns_hifi_chr15.gaf
grep chr21 < alns_hifi_unambiguous.gaf > alns_hifi_chr21.gaf
grep chr22 < alns_hifi_unambiguous.gaf > alns_hifi_chr22.gaf
cd ..
scripts/calculate_coverage.py pjdj-mergegraph.gfa < hifi_to_pjdjgraph/alns_hifi_unambiguous.gaf > node_covs_pjdj-mergegraph_hifi.csv

mkdir ont_to_pjdjgraph
cd ont_to_pjdjgraph
/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f ../ont.fa -a alns_subset.gaf --corrected-out corrected_subset_ONTs.fa -t 40 -x vg -b 35 --X-drop 200000 --precise-clipping 0.8 --multiseed-DP 1 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 2000 1> stdout_ga_subset.txt 2> stderr_ga_subset.txt
# there's an issue with reads aligning to different places depending on if they're fw or revcomp
# pick the more reliable one
# if both reliable, then pick fw alignment. if fw not reliable and bw reliable, pick bw. else discard
cat ../ont.fa | while read L; do  echo $L; read L; echo "$L" | rev | tr "ATGC" "TACG" ; done > revcomp.fa
/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f revcomp.fa -a alns_subset_revcomp.gaf --corrected-out corrected_subset_ONTs_revcomp.fa -t 40 -x vg -b 35 --X-drop 200000 --precise-clipping 0.8 --multiseed-DP 1 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 2000 1> stdout_ga_subset_revcomp.txt 2> stderr_ga_subset_revcomp.txt
cut -f 1,6,7 < alns_subset.gaf | tr '>' '\t' | tr '<' '\t' | tr ' ' '\t' | cut -f 1,3 | sed 's/chr\([12345]*\)_[0123456789]*/chr_\1/g' | sort | uniq | cut -f 1 | sort | uniq -c | grep -vP '^ +1 ' | sed 's/^ \+[0123456789]\+ //g' > reads_subset_ambiguous.txt
cut -f 1,6,7 < alns_subset_revcomp.gaf | tr '>' '\t' | tr '<' '\t' | tr ' ' '\t' | cut -f 1,3 | sed 's/chr\([12345]*\)_[0123456789]*/chr_\1/g' | sort | uniq | cut -f 1 | sort | uniq -c | grep -vP '^ +1 ' | sed 's/^ \+[0123456789]\+ //g' > reads_subset_ambiguous_revcomp.txt
comm -2 <(cut -f 1 < alns_subset.gaf | sort | uniq) reads_subset_ambiguous.txt | cut -f 1 | grep -vP '^$' > fw_unambiguous.txt
comm -2 <(cut -f 1 < alns_subset_revcomp.gaf | sort | uniq) reads_subset_ambiguous_revcomp.txt | cut -f 1 | grep -vP '^$' > bw_unambiguous.txt
cat fw_unambiguous.txt reads_subset_ambiguous_revcomp.txt | sort | uniq > not_bw_usable.txt
comm -2 bw_unambiguous.txt not_bw_usable.txt | cut -f 1 | grep -vP '^$' > bw_usable.txt
cp bw_usable.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs_revcomp.fa > corrected_revcomp.fa
grep chr13 < alns_subset_revcomp.gaf | cut -d ' ' -f 1 | sort | uniq > readnames_chr13_revcomp.txt
grep chr14 < alns_subset_revcomp.gaf | cut -d ' ' -f 1 | sort | uniq > readnames_chr14_revcomp.txt
grep chr15 < alns_subset_revcomp.gaf | cut -d ' ' -f 1 | sort | uniq > readnames_chr15_revcomp.txt
grep chr21 < alns_subset_revcomp.gaf | cut -d ' ' -f 1 | sort | uniq > readnames_chr21_revcomp.txt
grep chr22 < alns_subset_revcomp.gaf | cut -d ' ' -f 1 | sort | uniq > readnames_chr22_revcomp.txt
cp readnames_chr13_revcomp.txt picked.txt
scripts/pick_reads_stdin.py < corrected_revcomp.fa > corrected_chr13_bw.fa
cp readnames_chr14_revcomp.txt picked.txt
scripts/pick_reads_stdin.py < corrected_revcomp.fa > corrected_chr14_bw.fa
cp readnames_chr15_revcomp.txt picked.txt
scripts/pick_reads_stdin.py < corrected_revcomp.fa > corrected_chr15_bw.fa
cp readnames_chr21_revcomp.txt picked.txt
scripts/pick_reads_stdin.py < corrected_revcomp.fa > corrected_chr21_bw.fa
cp readnames_chr22_revcomp.txt picked.txt
scripts/pick_reads_stdin.py < corrected_revcomp.fa > corrected_chr22_bw.fa
scripts/filter_ambiguous_reads.py reads_subset_ambiguous.txt < alns_subset.gaf > alns_subset_unambiguous_fw.gaf
scripts/filter_ambiguous_reads.py not_bw_usable.txt < alns_subset_revcomp.gaf > alns_subset_unambiguous_bw.gaf
cat alns_subset_unambiguous_fw.gaf alns_subset_unambiguous_bw.gaf > alns_subset_unambiguous_merged.gaf
grep chr13 < alns_subset_unambiguous_fw.gaf > alns_subset_chr13.gaf
grep chr14 < alns_subset_unambiguous_fw.gaf > alns_subset_chr14.gaf
grep chr15 < alns_subset_unambiguous_fw.gaf > alns_subset_chr15.gaf
grep chr21 < alns_subset_unambiguous_fw.gaf > alns_subset_chr21.gaf
grep chr22 < alns_subset_unambiguous_fw.gaf > alns_subset_chr22.gaf
cut -d ' ' -f 1 < alns_subset_chr13.gaf | sort | uniq > readnames_chr13.txt
cut -d ' ' -f 1 < alns_subset_chr14.gaf | sort | uniq > readnames_chr14.txt
cut -d ' ' -f 1 < alns_subset_chr15.gaf | sort | uniq > readnames_chr15.txt
cut -d ' ' -f 1 < alns_subset_chr21.gaf | sort | uniq > readnames_chr21.txt
cut -d ' ' -f 1 < alns_subset_chr22.gaf | sort | uniq > readnames_chr22.txt
cp readnames_chr13.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr13_fw.fa
cp readnames_chr14.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr14_fw.fa
cp readnames_chr15.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr15_fw.fa
cp readnames_chr21.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr21_fw.fa
cp readnames_chr22.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr22_fw.fa
cat corrected_chr13_fw.fa corrected_chr13_bw.fa > corrected_chr13.fa
cat corrected_chr14_fw.fa corrected_chr14_bw.fa > corrected_chr14.fa
cat corrected_chr15_fw.fa corrected_chr15_bw.fa > corrected_chr15.fa
cat corrected_chr21_fw.fa corrected_chr21_bw.fa > corrected_chr21.fa
cat corrected_chr22_fw.fa corrected_chr22_bw.fa > corrected_chr22.fa
# reads from adam
grep "72729273-53ba-4221-8e9a-14271af27af1" < alns_subset.gaf > alns_dj13_normal.gaf
grep "2447497d-37fc-4252-979f-2203504f88bc" < alns_subset.gaf > alns_dj13_het.gaf
grep "b660e6fb-f814-4c4d-ace9-2a3c6126a104" < alns_subset.gaf > alns_pj13_normal.gaf
grep "3f1d8de3-deef-4f56-a4c1-12ae1203ac13" < alns_subset.gaf > alns_dj14_normal.gaf
grep "d1cbf206-2286-405b-b10a-5f1c5c491493" < alns_subset.gaf > alns_dj14_het.gaf
grep "c30e7f39-ed13-429d-804d-0a98e78c770a" < alns_subset.gaf > alns_pj14_normal.gaf
grep "38d74a0c-6b69-4a0d-a1c0-a2080772a624" < alns_subset.gaf > alns_dj15_normal.gaf
grep "32a31cd2-98f0-4423-92c3-6c952cad612c" < alns_subset.gaf > alns_pj15_normal.gaf
grep "ef4f8ce9-27c8-4391-8428-98481dc28dbf" < alns_subset.gaf > alns_pj15_het.gaf
grep "171ec83e-0cda-4ead-9469-d683396c14b8" < alns_subset.gaf > alns_dj21_normal.gaf
grep "f78bedbb-7dab-4ecb-b3de-b3d0f37efd42" < alns_subset.gaf > alns_dj21_het.gaf
grep "16d5177f-ab9d-48db-bee1-a7b3293585c5" < alns_subset.gaf > alns_pj21_normal.gaf
grep "cd52f2ac-b176-4ff2-b6b0-a0ff73b1950f" < alns_subset.gaf > alns_dj22_normal.gaf
grep "aa16c4b7-f83e-41e9-b127-0a0025bf6131" < alns_subset.gaf > alns_pj22_normal.gaf
cat alns_dj*.gaf alns_pj*.gaf | sed 's/72729273-53ba-4221-8e9a-14271af27af1/dj13_normal/g' | sed 's/2447497d-37fc-4252-979f-2203504f88bc/dj13_het/g' | sed 's/b660e6fb-f814-4c4d-ace9-2a3c6126a104/pj13_normal/g' | sed 's/3f1d8de3-deef-4f56-a4c1-12ae1203ac13/dj14_normal/g' | sed 's/d1cbf206-2286-405b-b10a-5f1c5c491493/dj14_het/g' | sed 's/c30e7f39-ed13-429d-804d-0a98e78c770a/pj14_normal/g' | sed 's/38d74a0c-6b69-4a0d-a1c0-a2080772a624/dj15_normal/g' | sed 's/32a31cd2-98f0-4423-92c3-6c952cad612c/pj15_normal/g' | sed 's/ef4f8ce9-27c8-4391-8428-98481dc28dbf/pj15_het/g' | sed 's/171ec83e-0cda-4ead-9469-d683396c14b8/dj21_normal/g' | sed 's/f78bedbb-7dab-4ecb-b3de-b3d0f37efd42/dj21_het/g' | sed 's/16d5177f-ab9d-48db-bee1-a7b3293585c5/pj21_normal/g' | sed 's/cd52f2ac-b176-4ff2-b6b0-a0ff73b1950f/dj22_normal/g' | sed 's/aa16c4b7-f83e-41e9-b127-0a0025bf6131/pj22_normal/g' > alns_mergepjdjreads.gaf
cd ..
scripts/color_csv_from_gaf.py dj13_normal=#FF0000 dj13_het=#FFFF00 dj13_normal+dj13_het=#FF8800 dj14_normal=#FF0000 dj14_het=#FFFF00 dj14_normal+dj14_het=#FF8800 dj15_normal=#FF0000 dj15_het=#FFFF00 dj15_normal+dj15_het=#FF8800 dj21_normal=#FF0000 dj21_het=#FFFF00 dj21_normal+dj21_het=#FF8800 dj22_normal=#FF0000 dj22_het=#FFFF00 dj22_normal+dj22_het=#FF8800   pj13_normal=#0000FF pj13_het=#00FF00 pj13_normal+pj13_het=#00FFFF pj14_normal=#0000FF pj14_het=#00FF00 pj14_normal+pj14_het=#00FFFF pj15_normal=#0000FF pj15_het=#00FF00 pj15_normal+pj15_het=#00FFFF pj21_normal=#0000FF pj21_het=#00FF00 pj21_normal+pj21_het=#00FFFF pj22_normal=#0000FF pj22_het=#00FF00 pj22_normal+pj22_het=#00FFFF < ont_to_pjdjgraph/alns_mergepjdjreads.gaf > pjdjread_colors.csv
scripts/color_csv_from_gaf.py dj13_normal=#FF0000 dj13_het=#FFFF00 dj13_normal+dj13_het=#FF8800 dj14_normal=#FF0000 dj14_het=#FFFF00 dj14_normal+dj14_het=#FF8800 dj15_normal=#FF0000 dj15_het=#FFFF00 dj15_normal+dj15_het=#FF8800 dj21_normal=#FF0000 dj21_het=#FFFF00 dj21_normal+dj21_het=#FF8800 dj22_normal=#FF0000 dj22_het=#FFFF00 dj22_normal+dj22_het=#FF8800 < ont_to_pjdjgraph/alns_mergepjdjreads.gaf > djread_colors.csv
scripts/color_csv_from_gaf.py pj13_normal=#0000FF pj13_het=#00FF00 pj13_normal+pj13_het=#00FFFF pj14_normal=#0000FF pj14_het=#00FF00 pj14_normal+pj14_het=#00FFFF pj15_normal=#0000FF pj15_het=#00FF00 pj15_normal+pj15_het=#00FFFF pj21_normal=#0000FF pj21_het=#00FF00 pj21_normal+pj21_het=#00FFFF pj22_normal=#0000FF pj22_het=#00FF00 pj22_normal+pj22_het=#00FFFF < ont_to_pjdjgraph/alns_mergepjdjreads.gaf > pjread_colors.csv
scripts/calculate_coverage.py pjdj-mergegraph.gfa < ont_to_pjdjgraph/alns_subset_unambiguous_merged.gaf > node_covs_pjdj-mergegraph_ont.csv

mkdir pjdj_continuations
cd pjdj_continuations

# get the PJ/DJ sequence boundary nodes from ../pjdj-mergegraph.gfa
# dj13 <chr13_36670
# pj13 >chr13_31820
# dj14 <chr14_7150
# pj14 >chr14_6360
# dj15 <chr15_9173
# pj15 >chr15_8509
# dj21 >chr21_33527
# pj21 <chr21_32856
# dj22 >chr22_7600
# pj22 <chr22_8438
grep -P "^S\tchr13_36670\t" < ../pjdj-mergegraph.gfa | cut -f 3 | head -c 1001 | rev | tr 'ATCG' 'TAGC' > seq_dj13.txt
grep -P "^S\tchr13_31820\t" < ../pjdj-mergegraph.gfa | cut -f 3 | tail -c 1001 > seq_pj13.txt
grep -P "^S\tchr14_7150\t" < ../pjdj-mergegraph.gfa | cut -f 3 | head -c 1001 | rev | tr 'ATCG' 'TAGC' > seq_dj14.txt
grep -P "^S\tchr14_6360\t" < ../pjdj-mergegraph.gfa | cut -f 3 | tail -c 1001 > seq_pj14.txt
grep -P "^S\tchr15_9173\t" < ../pjdj-mergegraph.gfa | cut -f 3 | head -c 1001 | rev | tr 'ATCG' 'TAGC' > seq_dj15.txt
grep -P "^S\tchr15_8509\t" < ../pjdj-mergegraph.gfa | cut -f 3 | tail -c 1001 > seq_pj15.txt
grep -P "^S\tchr21_33527\t" < ../pjdj-mergegraph.gfa | cut -f 3 | tail -c 1001 > seq_dj21.txt
grep -P "^S\tchr21_32856\t" < ../pjdj-mergegraph.gfa | cut -f 3 | head -c 1001 | rev | tr 'ATCG' 'TAGC' > seq_pj21.txt
grep -P "^S\tchr22_7600\t" < ../pjdj-mergegraph.gfa | cut -f 3 | tail -c 1001 > seq_dj22.txt
grep -P "^S\tchr22_8438\t" < ../pjdj-mergegraph.gfa | cut -f 3 | head -c 1001 | rev | tr 'ATCG' 'TAGC' > seq_pj22.txt

scripts/extract_seq_from_prefix.py seq_dj13.txt 10000 < ../ont_to_pjdjgraph/corrected_chr13.fa > djpaths_chr13_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj13.txt 10000 < ../ont_to_pjdjgraph/corrected_chr13.fa > pjpaths_chr13_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj14.txt 10000 < ../ont_to_pjdjgraph/corrected_chr14.fa > djpaths_chr14_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj14.txt 10000 < ../ont_to_pjdjgraph/corrected_chr14.fa > pjpaths_chr14_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj15.txt 10000 < ../ont_to_pjdjgraph/corrected_chr15.fa > djpaths_chr15_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj15.txt 10000 < ../ont_to_pjdjgraph/corrected_chr15.fa > pjpaths_chr15_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj21.txt 10000 < ../ont_to_pjdjgraph/corrected_chr21.fa > djpaths_chr21_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj21.txt 10000 < ../ont_to_pjdjgraph/corrected_chr21.fa > pjpaths_chr21_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj22.txt 10000 < ../ont_to_pjdjgraph/corrected_chr22.fa > djpaths_chr22_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj22.txt 10000 < ../ont_to_pjdjgraph/corrected_chr22.fa > pjpaths_chr22_corr_all.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr13_corr_all.fa > djpaths_chr13_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr13_corr_all.fa > pjpaths_chr13_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr14_corr_all.fa > djpaths_chr14_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr14_corr_all.fa > pjpaths_chr14_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr15_corr_all.fa > djpaths_chr15_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr15_corr_all.fa > pjpaths_chr15_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr21_corr_all.fa > djpaths_chr21_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr21_corr_all.fa > pjpaths_chr21_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr22_corr_all.fa > djpaths_chr22_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr22_corr_all.fa > pjpaths_chr22_corr.fa
awk '{print substr($0, 0, 45000);}' < djpaths_chr13_corr.fa | cut -d '_' -f 1 > djpaths_chr13_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < pjpaths_chr13_corr.fa | cut -d '_' -f 1 > pjpaths_chr13_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < djpaths_chr14_corr.fa | cut -d '_' -f 1 > djpaths_chr14_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < pjpaths_chr14_corr.fa | cut -d '_' -f 1 > pjpaths_chr14_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < djpaths_chr15_corr.fa | cut -d '_' -f 1 > djpaths_chr15_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < pjpaths_chr15_corr.fa | cut -d '_' -f 1 > pjpaths_chr15_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < djpaths_chr21_corr.fa | cut -d '_' -f 1 > djpaths_chr21_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < pjpaths_chr21_corr.fa | cut -d '_' -f 1 > pjpaths_chr21_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < djpaths_chr22_corr.fa | cut -d '_' -f 1 > djpaths_chr22_corr_45k.fa
awk '{print substr($0, 0, 45000);}' < pjpaths_chr22_corr.fa | cut -d '_' -f 1 > pjpaths_chr22_corr_45k.fa

echo "72729273-53ba-4221-8e9a-14271af27af1" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr13_corr_45k.fa > dj13_normal.fa
echo "2447497d-37fc-4252-979f-2203504f88bc" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr13_corr_45k.fa > dj13_het.fa
echo "b660e6fb-f814-4c4d-ace9-2a3c6126a104" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr13_corr_45k.fa > pj13_normal.fa
# not found because the read aligns first to chr13 then chr21!
# arbitrarily pick another one
echo "08653f96-b9ed-4090-84a0-80118a9c0fde" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr13_corr_45k.fa > pj13_normal.fa
echo "3f1d8de3-deef-4f56-a4c1-12ae1203ac13" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr14_corr_45k.fa > dj14_normal.fa
echo "d1cbf206-2286-405b-b10a-5f1c5c491493" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr14_corr_45k.fa > dj14_het.fa
echo "c30e7f39-ed13-429d-804d-0a98e78c770a" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr14_corr_45k.fa > pj14_normal.fa
# not found because it aligns all over the place. chr14, chr15, chr22
# arbitrarily pick another one
echo "657e50aa-53b9-4ab1-b047-fb9af7a7643c" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr14_corr_45k.fa > pj14_normal.fa
echo "38d74a0c-6b69-4a0d-a1c0-a2080772a624" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr_45k.fa > dj15_normal.fa
echo "ef4f8ce9-27c8-4391-8428-98481dc28dbf" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr_45k.fa > dj15_het.fa
echo "c83bf290-eaad-4187-a5e4-7517dc9db48a" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr_45k.fa > dj15_allele3.fa
echo "32a31cd2-98f0-4423-92c3-6c952cad612c" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr15_corr_45k.fa > pj15_normal.fa
echo "ef4f8ce9-27c8-4391-8428-98481dc28dbf" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr15_corr_45k.fa > pj15_het.fa
echo "171ec83e-0cda-4ead-9469-d683396c14b8" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr21_corr_45k.fa > dj21_normal.fa
echo "f78bedbb-7dab-4ecb-b3de-b3d0f37efd42" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr21_corr_45k.fa > dj21_het.fa
echo "16d5177f-ab9d-48db-bee1-a7b3293585c5" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr21_corr_45k.fa > pj21_normal.fa
echo "cd52f2ac-b176-4ff2-b6b0-a0ff73b1950f" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr22_corr_45k.fa > dj22_normal.fa
echo "aa16c4b7-f83e-41e9-b127-0a0025bf6131" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr22_corr_45k.fa > pj22_normal.fa

minimap2 -x map-ont dj13_normal.fa djpaths_chr13_corr_45k.fa > alns_dj13_normal.paf
minimap2 -x map-ont dj13_het.fa djpaths_chr13_corr_45k.fa > alns_dj13_het.paf
# chr13 dj normal reads: 55465bda-f68a-4196-9df5-3b0ac947d6bb 63395e01-319c-4ae3-9c1f-f464dbc27457 60a9d4d0-ca95-45a6-a6ff-eef32d18991d 72729273-53ba-4221-8e9a-14271af27af1 536d68b4-5fd2-42d0-a627-76ff39e3c04c 0e64eabc-4c73-45ba-9e68-757579f9a44f 31555889-d794-4c9d-b376-5c9695abb9fd 418fd761-9e25-47b5-a52a-f53522f723e1 87dd474b-e372-4c16-bd98-e7e9ce2c65ad
# the het is only visible from identity in the normal alignments, but normal reads don't align to the het read
# chr13 dj strange reads: 2447497d-37fc-4252-979f-2203504f88bc 7d8d2c56-0a28-444a-8712-523099b670f8 93479981-5fc2-408b-a9f6-9b7dc9b8f1f1
# discard the het and the two strange reads
# so chr13 dj final reads: 55465bda-f68a-4196-9df5-3b0ac947d6bb 63395e01-319c-4ae3-9c1f-f464dbc27457 60a9d4d0-ca95-45a6-a6ff-eef32d18991d 72729273-53ba-4221-8e9a-14271af27af1 536d68b4-5fd2-42d0-a627-76ff39e3c04c 0e64eabc-4c73-45ba-9e68-757579f9a44f 31555889-d794-4c9d-b376-5c9695abb9fd 418fd761-9e25-47b5-a52a-f53522f723e1 87dd474b-e372-4c16-bd98-e7e9ce2c65ad
minimap2 -x map-ont pj13_normal.fa pjpaths_chr13_corr_45k.fa > alns_pj13_normal.paf 
# chr13 pj normal reads: 08653f96-b9ed-4090-84a0-80118a9c0fde a49093f7-5fe7-40ce-9b44-586af41f5d37 686d32dc-f718-426c-b22e-5ab9737daee4 9f18acc0-af09-4137-89b8-3fa68ae90546 f58db80f-d257-4155-ab04-da2bba4cab3e 5dc6b258-339f-42f6-b9eb-be57d4d8e87e 5845acba-1625-4c30-840f-6715d5200539 31985caf-a7c9-4d09-9240-af5717520e77 178fcd69-70bb-41fb-8b26-8ac5f64d57b4 ba3ca200-bb5f-4362-bc36-a554801e1a8e
# chr13 pj strange reads: c2707e24-e31d-4266-97f1-c6de88d91ff8 21374449-b75f-4239-a187-fe739210600a
echo "c2707e24-e31d-4266-97f1-c6de88d91ff8" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr13_corr_45k.fa > pj13_allele2.fa
echo "21374449-b75f-4239-a187-fe739210600a" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr13_corr_45k.fa > pj13_allele3.fa
minimap2 -x map-ont pj13_allele2.fa pjpaths_chr13_corr_45k.fa > alns_pj13_allele2.paf
# no alignment breaks. might be just a poorly corrected read
minimap2 -x map-ont pj13_allele3.fa pjpaths_chr13_corr_45k.fa > alns_pj13_allele3.paf
# same
# include both strange reads
# so chr13 pj final reads: 08653f96-b9ed-4090-84a0-80118a9c0fde a49093f7-5fe7-40ce-9b44-586af41f5d37 686d32dc-f718-426c-b22e-5ab9737daee4 9f18acc0-af09-4137-89b8-3fa68ae90546 f58db80f-d257-4155-ab04-da2bba4cab3e 5dc6b258-339f-42f6-b9eb-be57d4d8e87e 5845acba-1625-4c30-840f-6715d5200539 31985caf-a7c9-4d09-9240-af5717520e77 178fcd69-70bb-41fb-8b26-8ac5f64d57b4 ba3ca200-bb5f-4362-bc36-a554801e1a8e c2707e24-e31d-4266-97f1-c6de88d91ff8 21374449-b75f-4239-a187-fe739210600a

minimap2 -x map-ont -c dj14_normal.fa djpaths_chr14_corr_45k.fa > alns_dj14_normal.paf
# chr14 dj normal reads: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 3f1d8de3-deef-4f56-a4c1-12ae1203ac13 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
# chr14 dj het reads: b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
# chr14 dj allele3 reads: 09293939-e5a3-4b69-bb8a-ae1e617f9716 d78f2d3c-b7a2-43d9-8276-f2a67a48122f
minimap2 -x map-ont -c dj14_het.fa djpaths_chr14_corr_45k.fa > alns_dj14_het.paf
# chr14 dj normal reads: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
# chr14 dj het reads: 09293939-e5a3-4b69-bb8a-ae1e617f9716 b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 d78f2d3c-b7a2-43d9-8276-f2a67a48122f f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 3f1d8de3-deef-4f56-a4c1-12ae1203ac13 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
# inconsistency in 3f1d8de3-deef-4f56-a4c1-12ae1203ac13
# so final chr14 dj normal: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
# chr14 dj het: 09293939-e5a3-4b69-bb8a-ae1e617f9716 b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 d78f2d3c-b7a2-43d9-8276-f2a67a48122f f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
minimap2 -x map-ont -c pj14_normal.fa pjpaths_chr14_corr_45k.fa > alns_pj14_normal.paf 
# chr14 pj matching reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa
# chr14 pj non-matching reads: 2bc55293-bbf6-4c4e-b547-ba66a3370de0 59dc970e-a9b8-45d4-afe8-ebdb3cbc9b1d 4b1ecccd-0235-489d-a60a-92d376afa9c2
echo "2bc55293-bbf6-4c4e-b547-ba66a3370de0" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr14_corr_45k.fa > pj14_allele2.fa
minimap2 -x map-ont -c pj14_allele2.fa pjpaths_chr14_corr_45k.fa > alns_pj14_allele2.paf
# matches everything except 59dc970e-a9b8-45d4-afe8-ebdb3cbc9b1d
echo "59dc970e-a9b8-45d4-afe8-ebdb3cbc9b1d" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr14_corr_45k.fa > pj14_allele3.fa
minimap2 -x map-ont -c pj14_allele3.fa pjpaths_chr14_corr_45k.fa > alns_pj14_allele3.paf
# does not match any reads
echo "4b1ecccd-0235-489d-a60a-92d376afa9c2" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr14_corr_45k.fa > pj14_allele4.fa
minimap2 -x map-ont -c pj14_allele4.fa pjpaths_chr14_corr_45k.fa > alns_pj14_allele4.paf
# matches everything except 59dc970e-a9b8-45d4-afe8-ebdb3cbc9b1d
# include all except non-matching 59dc970e-a9b8-45d4-afe8-ebdb3cbc9b1d
# apparently 2bc55293-bbf6-4c4e-b547-ba66a3370de0 has an inversion?
echo "205839a9-69e4-47c3-b996-91e77249d9fa_41485" > picked.txt
scripts/pick_reads_stdin.py < ../pjpaths_chr14_corr.fa > pj14_longest_normal.fa
minimap2 -x map-ont -c pj14_longest_normal.fa ../pjpaths_chr14_corr.fa > alns_pj14_longest_normal.paf
# yep got an inversion?!
# discard 2bc55293-bbf6-4c4e-b547-ba66a3370de0
# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2

minimap2 -x map-ont pj15_normal.fa pjpaths_chr15_corr_45k.fa > alns_pj15_normal.paf
minimap2 -x map-ont pj15_het.fa pjpaths_chr15_corr_45k.fa > alns_pj15_het.paf
# chr15 pj normal reads: 5d11980e-d392-42a0-9978-4a82d9c59125 9b934d9f-fae4-46e6-a51c-2bf664fe0468 dc32b8da-06a8-4344-a8ad-f41746ad24ec 97b3a9ae-1db5-4fdc-83a6-bacd24cef28c 837eb607-2736-42a2-842b-926786bd6997 32a31cd2-98f0-4423-92c3-6c952cad612c b015ddc9-18fc-4719-9360-e7dfe77fbc3d
# chr15 pj het reads: ef4f8ce9-27c8-4391-8428-98481dc28dbf dc53f8ef-83cf-4f3b-ab9e-420805cdbd50 6303c6f7-4c3d-4fec-b5d7-61bd6e65081c f847d286-9365-4941-9360-0d29f358cd30 406c2f52-36fb-450b-b398-ce3987a87eab 77921980-9397-4a7d-b647-3660a90b392b ecc8f1f8-3864-44a9-9a66-bc897316de83
# chr15 pj strange: 10663f08-d869-4c9a-92aa-2c79ab56fcab
# discard the strange
# so chr15 pj normal final reads: 5d11980e-d392-42a0-9978-4a82d9c59125 9b934d9f-fae4-46e6-a51c-2bf664fe0468 dc32b8da-06a8-4344-a8ad-f41746ad24ec 97b3a9ae-1db5-4fdc-83a6-bacd24cef28c 837eb607-2736-42a2-842b-926786bd6997 32a31cd2-98f0-4423-92c3-6c952cad612c b015ddc9-18fc-4719-9360-e7dfe77fbc3d
# chr15 pj het final reads: ef4f8ce9-27c8-4391-8428-98481dc28dbf dc53f8ef-83cf-4f3b-ab9e-420805cdbd50 6303c6f7-4c3d-4fec-b5d7-61bd6e65081c f847d286-9365-4941-9360-0d29f358cd30 406c2f52-36fb-450b-b398-ce3987a87eab 77921980-9397-4a7d-b647-3660a90b392b ecc8f1f8-3864-44a9-9a66-bc897316de83
minimap2 -x map-ont dj15_normal.fa djpaths_chr15_corr_45k.fa > alns_dj15_normal.paf
minimap2 -x map-ont dj15_het.fa djpaths_chr15_corr_45k.fa > alns_dj15_het.paf
minimap2 -x map-ont dj15_allele3.fa djpaths_chr15_corr_45k.fa > alns_dj15_allele3.paf
# chr15 dj no visible het. but one read is known to be a het and still doesn't look any different... similar identity, no alignment breaks
# chr15 dj strange: c83bf290-eaad-4187-a5e4-7517dc9db48a d24e3b0b-1331-4ad2-9380-10b496d5c900. not too strange tho.
echo "ef4f8ce9-27c8-4391-8428-98481dc28dbf_14470" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr.fa > dj15_long_het.fa
minimap2 -x map-ont dj15_long_het.fa djpaths_chr15_corr.fa > alns_dj15_long_het.paf
# d24e3b0b-1331-4ad2-9380-10b496d5c900_74209 has something strange going on. two alignments to long het instead of one, while longer reads align fine. might be the missing normal allele?
echo "d24e3b0b-1331-4ad2-9380-10b496d5c900_74209" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr.fa > dj15_long_allele2.fa
minimap2 -x map-ont dj15_long_allele2.fa djpaths_chr15_corr.fa > alns_dj15_long_allele2.paf
# reads inconsistent with allele2: 38c84348-c2ac-4233-82c9-a0dba9f057f0 ef4f8ce9-27c8-4391-8428-98481dc28dbf 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 38d74a0c-6b69-4a0d-a1c0-a2080772a624 305f4723-c5ce-4249-bd79-e6f9cef2d891
echo "38d74a0c-6b69-4a0d-a1c0-a2080772a624_79131" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr15_corr.fa > dj15_long_normal.fa
minimap2 -x map-ont dj15_long_normal.fa djpaths_chr15_corr.fa > alns_dj15_long_normal.paf
# reads inconsistent with normal: none, not even d24e3b0b-1331-4ad2-9380-10b496d5c900
# can't tell the difference between normal / het.
# so just remove the known het from the dj reads
# so final chr15 dj reads: 95736f28-02c9-4ba1-ad29-9696c31e4c45 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a f2e2e8ff-f6a1-48d0-bbe5-d21f6ba8265b 2823fd72-77b4-4640-9d75-6f0f000c09ea 11afa55c-04c6-4da0-a0ed-385d506352bf 4a9ec129-946a-40bb-b8c7-b92729d43c5c b0c0c236-e256-49ae-ba64-de3a1aaa74cd bc61673a-b89b-4729-8787-573a6a5778f0 243241c5-00de-4947-aa1b-721a7d0194c0 3328c51a-b2e1-4292-a3d9-625dca4b147a 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b e4f04026-8956-4d75-899b-bea86f4ac569 c83bf290-eaad-4187-a5e4-7517dc9db48a d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 38d74a0c-6b69-4a0d-a1c0-a2080772a624 b45dfc5a-b9a1-406e-9470-bd4141c96f5d 305f4723-c5ce-4249-bd79-e6f9cef2d891 a8350e37-7635-4ef3-9645-3d76898824c2 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05

# chr15 long het has 470541 bp corrected
# pj cut at 115227
# dj cut at 14470
# middle bit has 340844 bp, 7/8 loops?
# !!! the read has an uncorrected bit at 272289-313357bp !!!

minimap2 -x map-ont -c dj21_normal.fa djpaths_chr21_corr_45k.fa > alns_dj21_normal.paf
# matching reads: 5c14ca3e-1fa8-48c5-aef8-921704514e2a 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c 5cda3308-ccb4-4f7c-ba74-06033b25b1af f598bf95-f28d-418d-9c1f-8969046dc13a f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 3fbb4d38-e59b-450e-ae7d-d3ce365d4c95 171ec83e-0cda-4ead-9469-d683396c14b8 30aa2f7e-c197-461b-9f3b-c86275a6e0a1 d0ba8e0c-d5b1-48ba-b107-ff1dac71c55b 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 94a6f57a-621e-4a99-8c61-1bcbac446fa7 fe220ca9-c812-43ba-aa9f-2644c44b8751 a0af24d2-d505-4c34-85a8-303d8eadcd17 4dbef5b1-6a34-44f5-b807-2002122ce0ee 7f028c70-6efe-436a-82e1-d9453ead77dd 14412df6-e209-41ba-81cc-9fac1173dffc d9b144b7-02e1-4c7a-a90f-458d1f15f2d6 be230842-55d9-44f8-acb5-a2cc3fba6b93 f39f1d14-58c3-4641-9ef5-cb28a75c5371 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
# nonmatching reads: 90d82263-0af4-4894-b98e-506a950de325 f75b93fa-4b26-4f77-ae2d-d7fb3e1838c8 c156a2db-0e2b-45b8-8e4c-ddd6290646fb 885aa100-358f-46ea-97d4-7ea9d30d04c5
# weird reads: 0eed41c3-0eb0-42a5-a503-26b109894809 b207805e-9c8e-43aa-89f2-641d3bc11d40
minimap2 -x map-ont -c dj21_het.fa djpaths_chr21_corr_45k.fa > alns_dj21_het.paf
# het looks similar to the normal allele
echo "90d82263-0af4-4894-b98e-506a950de325" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr21_corr_45k.fa > dj21_allele2.fa
minimap2 -x map-ont dj21_allele2.fa djpaths_chr21_corr_45k.fa > alns_dj21_allele2.paf
# matches the normal allele. just a poor correction?
echo "f75b93fa-4b26-4f77-ae2d-d7fb3e1838c8" > picked.txt
scripts/pick_reads_stdin.py < djpaths_chr21_corr_45k.fa > dj21_allele3.fa
minimap2 -x map-ont dj21_allele3.fa djpaths_chr21_corr_45k.fa > alns_dj21_allele3.paf
# matches ref
# does not match 90d82263-0af4-4894-b98e-506a950de325
# remove them just to be sure
# ...except all of this was with the 45kbp but the het is later than that!
echo "171ec83e-0cda-4ead-9469-d683396c14b8_161000" > picked.txt
scripts/pick_reads_stdin.py < ../djpaths_chr21_corr.fa > dj21_normal.fa
echo "f78bedbb-7dab-4ecb-b3de-b3d0f37efd42_386925" > picked.txt
scripts/pick_reads_stdin.py < ../djpaths_chr21_corr.fa > dj21_het.fa
minimap2 -x map-ont -c dj21_normal.fa ../djpaths_chr21_corr.fa > alns_dj21_normal.paf
# matching reads: f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee be230842-55d9-44f8-acb5-a2cc3fba6b93 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
# nonmatching 61kb reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f75b93fa-4b26-4f77-ae2d-d7fb3e1838c8 f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 d0ba8e0c-d5b1-48ba-b107-ff1dac71c55b 7f028c70-6efe-436a-82e1-d9453ead77dd
# nonmatching 77kb reads: 14412df6-e209-41ba-81cc-9fac1173dffc f39f1d14-58c3-4641-9ef5-cb28a75c5371
# nonmatching 30kb reads: b207805e-9c8e-43aa-89f2-641d3bc11d40
# too short reads: 3fbb4d38-e59b-450e-ae7d-d3ce365d4c95 5cda3308-ccb4-4f7c-ba74-06033b25b1af 90d82263-0af4-4894-b98e-506a950de325 5c14ca3e-1fa8-48c5-aef8-921704514e2a 30aa2f7e-c197-461b-9f3b-c86275a6e0a1 94a6f57a-621e-4a99-8c61-1bcbac446fa7 a0af24d2-d505-4c34-85a8-303d8eadcd17 0eed41c3-0eb0-42a5-a503-26b109894809 d9b144b7-02e1-4c7a-a90f-458d1f15f2d6 c156a2db-0e2b-45b8-8e4c-ddd6290646f 885aa100-358f-46ea-97d4-7ea9d30d04c5
minimap2 -x map-ont -c dj21_het.fa ../djpaths_chr21_corr.fa > alns_dj21_het.paf
# matching reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 7f028c70-6efe-436a-82e1-d9453ead77dd
# nonmatching 61kbp reads: f75b93fa-4b26-4f77-ae2d-d7fb3e1838c8 f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee 14412df6-e209-41ba-81cc-9fac1173dffc be230842-55d9-44f8-acb5-a2cc3fba6b93 f39f1d14-58c3-4641-9ef5-cb28a75c5371 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
# nonmatching 71kbp reads: d0ba8e0c-d5b1-48ba-b107-ff1dac71c55b
# nonmatching 30kbp reads: b207805e-9c8e-43aa-89f2-641d3bc11d40
# so chr21 dj final normal reads: f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee be230842-55d9-44f8-acb5-a2cc3fba6b93 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
# chr21 dj final het reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 7f028c70-6efe-436a-82e1-d9453ead77dd
# what about the 30/71/77 kbp SV reads?
echo "14412df6-e209-41ba-81cc-9fac1173dffc_22622" > picked.txt
scripts/pick_reads_stdin.py < ../djpaths_chr21_corr.fa > dj21_allele3.fa
minimap2 -x map-ont -c dj21_allele3.fa ../djpaths_chr21_corr.fa > alns_dj21_allele3.paf
# matching: f39f1d14-58c3-4641-9ef5-cb28a75c5371
# nonmatching 61kbp reads: d0ba8e0c-d5b1-48ba-b107-ff1dac71c55b
# nonmatching 30kbp reads: b207805e-9c8e-43aa-89f2-641d3bc11d40
# just discard them i guess
minimap2 -x map-ont -c pj21_normal.fa pjpaths_chr21_corr_45k.fa > alns_pj21_normal.paf
# 0ca32f47-e509-412c-a577-c3df2cfac144 looks susp, all else are fine
echo "0ca32f47-e509-412c-a577-c3df2cfac144" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr21_corr_45k.fa > pj21_allele2.fa
minimap2 -x map-ont pj21_allele2.fa pjpaths_chr21_corr_45k.fa > alns_pj21_allele2.paf
# looks fine
# so chr21 pj final reads: all of them

minimap2 -x map-ont -c dj22_normal.fa djpaths_chr22_corr_45k.fa > alns_dj22_normal.paf
# looks all fine
# so chr22 dj final reads: all of them
minimap2 -x map-ont -c pj22_normal.fa pjpaths_chr22_corr_45k.fa > alns_pj22_normal.paf
# 71a4a2fd-500a-42e1-81ab-d9461375c4a1 and 74a9f15b-a6a2-489c-b422-0d9270e1a4b8 look susp
echo "71a4a2fd-500a-42e1-81ab-d9461375c4a1" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr22_corr_45k.fa > pj22_allele2.fa
minimap2 -x map-ont pj22_allele2.fa pjpaths_chr21_corr_45k.fa > alns_pj22_allele2.paf
# first 1455 bp does not match anything. not even itself ?! otherwise looks fine
echo "74a9f15b-a6a2-489c-b422-0d9270e1a4b8" > picked.txt
scripts/pick_reads_stdin.py < pjpaths_chr22_corr_45k.fa > pj22_allele3.fa
minimap2 -x map-ont pj22_allele3.fa pjpaths_chr21_corr_45k.fa > alns_pj22_allele3.paf
# first 1455 bp does not match anything, even itself. first 3000bp does not match 0ca32f47-e509-412c-a577-c3df2cfac144
# discard the two suspicious reads
# so chr22 pj final reads: 505428e3-9ac6-483a-b791-7505fbe232d9 eef2fe73-03d6-4085-b69a-5567fed38f7a 863c69da-3454-41b7-964f-48ad28abd0f9 d8dc9583-6830-4f02-a6ae-5ff40c28909c 980bb713-8be4-4578-b79b-8d9ab16a19e0 aa16c4b7-f83e-41e9-b127-0a0025bf6131 f40c145c-9210-479b-b84f-f03cb7c68450 fdd2f161-f8ea-4348-9877-355b3e258edb 59bdba44-75b7-45e8-a6a2-cb67a602ec10 5ccb66d8-6eef-41a0-80bd-c6e19db2afc9 b204e536-7ef3-4595-91d1-fe1b0729a578 6906feed-66f7-4df0-a673-3d12ef6206be 0e1c059b-855d-4829-b988-8a14ab612a2c 977c3020-9720-497e-ba93-d24acab2c3e7 7ec9c3a0-9fa3-496b-8cca-a11891de75f7

mkdir consensuses
cd consensuses

# so chr13 dj final reads: 55465bda-f68a-4196-9df5-3b0ac947d6bb 63395e01-319c-4ae3-9c1f-f464dbc27457 60a9d4d0-ca95-45a6-a6ff-eef32d18991d 72729273-53ba-4221-8e9a-14271af27af1 536d68b4-5fd2-42d0-a627-76ff39e3c04c 0e64eabc-4c73-45ba-9e68-757579f9a44f 31555889-d794-4c9d-b376-5c9695abb9fd 418fd761-9e25-47b5-a52a-f53522f723e1 87dd474b-e372-4c16-bd98-e7e9ce2c65ad
echo '55465bda-f68a-4196-9df5-3b0ac947d6bb' > picked.txt
echo '63395e01-319c-4ae3-9c1f-f464dbc27457' >> picked.txt
echo '60a9d4d0-ca95-45a6-a6ff-eef32d18991d' >> picked.txt
echo '72729273-53ba-4221-8e9a-14271af27af1' >> picked.txt
echo '536d68b4-5fd2-42d0-a627-76ff39e3c04c' >> picked.txt
echo '0e64eabc-4c73-45ba-9e68-757579f9a44f' >> picked.txt
echo '31555889-d794-4c9d-b376-5c9695abb9fd' >> picked.txt
echo '418fd761-9e25-47b5-a52a-f53522f723e1' >> picked.txt
echo '87dd474b-e372-4c16-bd98-e7e9ce2c65ad' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr13_corr.fa | scripts/pick_reads_stdin.py > dj13_reads.fa

# so chr13 pj final reads: 08653f96-b9ed-4090-84a0-80118a9c0fde a49093f7-5fe7-40ce-9b44-586af41f5d37 686d32dc-f718-426c-b22e-5ab9737daee4 9f18acc0-af09-4137-89b8-3fa68ae90546 f58db80f-d257-4155-ab04-da2bba4cab3e 5dc6b258-339f-42f6-b9eb-be57d4d8e87e 5845acba-1625-4c30-840f-6715d5200539 31985caf-a7c9-4d09-9240-af5717520e77 178fcd69-70bb-41fb-8b26-8ac5f64d57b4 ba3ca200-bb5f-4362-bc36-a554801e1a8e c2707e24-e31d-4266-97f1-c6de88d91ff8 21374449-b75f-4239-a187-fe739210600a
echo '08653f96-b9ed-4090-84a0-80118a9c0fde' > picked.txt
echo 'a49093f7-5fe7-40ce-9b44-586af41f5d37' >> picked.txt
echo '686d32dc-f718-426c-b22e-5ab9737daee4' >> picked.txt
echo '9f18acc0-af09-4137-89b8-3fa68ae90546' >> picked.txt
echo 'f58db80f-d257-4155-ab04-da2bba4cab3e' >> picked.txt
echo '5dc6b258-339f-42f6-b9eb-be57d4d8e87e' >> picked.txt
echo '5845acba-1625-4c30-840f-6715d5200539' >> picked.txt
echo '31985caf-a7c9-4d09-9240-af5717520e77' >> picked.txt
echo '178fcd69-70bb-41fb-8b26-8ac5f64d57b4' >> picked.txt
echo 'ba3ca200-bb5f-4362-bc36-a554801e1a8e' >> picked.txt
echo 'c2707e24-e31d-4266-97f1-c6de88d91ff8' >> picked.txt
echo '21374449-b75f-4239-a187-fe739210600a' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr13_corr.fa | scripts/pick_reads_stdin.py > pj13_reads.fa

# so final chr14 dj normal: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
echo 'efb2ea32-e628-42bc-9253-ecc1c97df0b7' > picked.txt
echo '23d0b699-6b6c-4a0a-9f35-f64c89c307d0' >> picked.txt
echo 'd49dc75c-8dd3-477f-a3af-84713bda029b' >> picked.txt
echo 'cf01d2c6-2512-460a-9614-07e33294be6b' >> picked.txt
echo 'ccf8279e-b78a-44b2-b1e2-547bb6e833da' >> picked.txt
echo '3c5b0999-df37-45e1-aa30-fdf4f9a349b8' >> picked.txt
echo 'bf077246-0e03-4b7f-8ea6-ce163d4dc99c' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > dj14_reads_normal.fa

# chr14 dj het: 09293939-e5a3-4b69-bb8a-ae1e617f9716 b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 d78f2d3c-b7a2-43d9-8276-f2a67a48122f f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
echo '09293939-e5a3-4b69-bb8a-ae1e617f9716' > picked.txt
echo 'b0e694d4-e962-470b-a656-f2da060a2310' >> picked.txt
echo '6b4c3194-760d-4f82-9008-f1cea1185b10' >> picked.txt
echo 'b62fe3d8-fdc4-4622-ac2e-e64e25f0b310' >> picked.txt
echo 'd78f2d3c-b7a2-43d9-8276-f2a67a48122f' >> picked.txt
echo 'f2578dce-b2e5-4d4d-8969-f97d80616e19' >> picked.txt
echo '75be7f73-4c49-4474-9e1c-1eb360bce1e4' >> picked.txt
echo 'd1cbf206-2286-405b-b10a-5f1c5c491493' >> picked.txt
echo '99e2f6e6-8d01-46d8-aed1-61fdb2b7abce' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > dj14_reads_het.fa

# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2
# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2
echo '657e50aa-53b9-4ab1-b047-fb9af7a7643c' > picked.txt
echo '8627995d-758e-4297-878c-b96152e854c0' >> picked.txt
echo '8b344d6e-e4e3-400b-b2e6-6536ae100931' >> picked.txt
echo 'fd3e60e2-5df8-465f-803c-3d4ca67e5740' >> picked.txt
echo '32dc764f-08b6-4294-a611-e3f4edf11a61' >> picked.txt
echo '8116263e-bf90-435d-8c7a-a3ff1210632b' >> picked.txt
echo '29b3df0c-43d4-4176-a62b-5d768111f243' >> picked.txt
echo '302552ab-ead3-4f1d-8c2d-66ea52c42e65' >> picked.txt
echo '47d602c3-d1a8-45ee-80ad-65f8cb01d2e3' >> picked.txt
echo '1794a4dc-2d28-4088-9092-981799f3e543' >> picked.txt
echo 'b42a562d-2a1c-404e-b6c5-c8e985f496ee' >> picked.txt
echo '205839a9-69e4-47c3-b996-91e77249d9fa' >> picked.txt
echo '4b1ecccd-0235-489d-a60a-92d376afa9c2' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > pj14_reads.fa

# so chr15 pj normal final reads: 5d11980e-d392-42a0-9978-4a82d9c59125 9b934d9f-fae4-46e6-a51c-2bf664fe0468 dc32b8da-06a8-4344-a8ad-f41746ad24ec 97b3a9ae-1db5-4fdc-83a6-bacd24cef28c 837eb607-2736-42a2-842b-926786bd6997 32a31cd2-98f0-4423-92c3-6c952cad612c b015ddc9-18fc-4719-9360-e7dfe77fbc3d
echo '5d11980e-d392-42a0-9978-4a82d9c59125' > picked.txt
echo '9b934d9f-fae4-46e6-a51c-2bf664fe0468' >> picked.txt
echo 'dc32b8da-06a8-4344-a8ad-f41746ad24ec' >> picked.txt
echo '97b3a9ae-1db5-4fdc-83a6-bacd24cef28c' >> picked.txt
echo '837eb607-2736-42a2-842b-926786bd6997' >> picked.txt
echo '32a31cd2-98f0-4423-92c3-6c952cad612c' >> picked.txt
echo 'b015ddc9-18fc-4719-9360-e7dfe77fbc3d' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > pj15_reads_normal.fa

# chr15 pj het final reads: ef4f8ce9-27c8-4391-8428-98481dc28dbf dc53f8ef-83cf-4f3b-ab9e-420805cdbd50 6303c6f7-4c3d-4fec-b5d7-61bd6e65081c f847d286-9365-4941-9360-0d29f358cd30 406c2f52-36fb-450b-b398-ce3987a87eab 77921980-9397-4a7d-b647-3660a90b392b ecc8f1f8-3864-44a9-9a66-bc897316de83
echo 'ef4f8ce9-27c8-4391-8428-98481dc28dbf' > picked.txt
echo 'dc53f8ef-83cf-4f3b-ab9e-420805cdbd50' >> picked.txt
echo '6303c6f7-4c3d-4fec-b5d7-61bd6e65081c' >> picked.txt
echo 'f847d286-9365-4941-9360-0d29f358cd30' >> picked.txt
echo '406c2f52-36fb-450b-b398-ce3987a87eab' >> picked.txt
echo '77921980-9397-4a7d-b647-3660a90b392b' >> picked.txt
echo 'ecc8f1f8-3864-44a9-9a66-bc897316de83' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > pj15_reads_het.fa

# so final chr15 dj reads: 95736f28-02c9-4ba1-ad29-9696c31e4c45 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a f2e2e8ff-f6a1-48d0-bbe5-d21f6ba8265b 2823fd72-77b4-4640-9d75-6f0f000c09ea 11afa55c-04c6-4da0-a0ed-385d506352bf 4a9ec129-946a-40bb-b8c7-b92729d43c5c b0c0c236-e256-49ae-ba64-de3a1aaa74cd bc61673a-b89b-4729-8787-573a6a5778f0 243241c5-00de-4947-aa1b-721a7d0194c0 3328c51a-b2e1-4292-a3d9-625dca4b147a 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b e4f04026-8956-4d75-899b-bea86f4ac569 c83bf290-eaad-4187-a5e4-7517dc9db48a d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 38d74a0c-6b69-4a0d-a1c0-a2080772a624 b45dfc5a-b9a1-406e-9470-bd4141c96f5d 305f4723-c5ce-4249-bd79-e6f9cef2d891 a8350e37-7635-4ef3-9645-3d76898824c2 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05
echo '95736f28-02c9-4ba1-ad29-9696c31e4c45' > picked.txt
echo '6053da9f-51c8-4d4b-ae4c-d7f4d912a97c' >> picked.txt
echo '38c84348-c2ac-4233-82c9-a0dba9f057f0' >> picked.txt
echo '9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a' >> picked.txt
echo 'f2e2e8ff-f6a1-48d0-bbe5-d21f6ba8265b' >> picked.txt
echo '2823fd72-77b4-4640-9d75-6f0f000c09ea' >> picked.txt
echo '11afa55c-04c6-4da0-a0ed-385d506352bf' >> picked.txt
echo '4a9ec129-946a-40bb-b8c7-b92729d43c5c' >> picked.txt
echo 'b0c0c236-e256-49ae-ba64-de3a1aaa74cd' >> picked.txt
echo 'bc61673a-b89b-4729-8787-573a6a5778f0' >> picked.txt
echo '243241c5-00de-4947-aa1b-721a7d0194c0' >> picked.txt
echo '3328c51a-b2e1-4292-a3d9-625dca4b147a' >> picked.txt
echo '7ff2268c-7b2d-4c21-b2fa-e0757ba9074b' >> picked.txt
echo 'e4f04026-8956-4d75-899b-bea86f4ac569' >> picked.txt
echo 'c83bf290-eaad-4187-a5e4-7517dc9db48a' >> picked.txt
echo 'd24e3b0b-1331-4ad2-9380-10b496d5c900' >> picked.txt
echo '7202b994-fc29-4496-b4ff-2fdf2bb3ddf5' >> picked.txt
echo '38d74a0c-6b69-4a0d-a1c0-a2080772a624' >> picked.txt
echo 'b45dfc5a-b9a1-406e-9470-bd4141c96f5d' >> picked.txt
echo '305f4723-c5ce-4249-bd79-e6f9cef2d891' >> picked.txt
echo 'a8350e37-7635-4ef3-9645-3d76898824c2' >> picked.txt
echo '57bc9d5b-e534-4100-af9c-6e2b58ee4fd6' >> picked.txt
echo '25fbb44c-93af-439e-9881-cb487cdd6c05' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > dj15_reads.fa

# so chr21 dj final normal reads: f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee be230842-55d9-44f8-acb5-a2cc3fba6b93 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
echo 'f598bf95-f28d-418d-9c1f-8969046dc13a' > picked.txt
echo '171ec83e-0cda-4ead-9469-d683396c14b8' >> picked.txt
echo '06dd4d9a-7a55-42c8-84a6-c2e4b3f30163' >> picked.txt
echo 'fe220ca9-c812-43ba-aa9f-2644c44b8751' >> picked.txt
echo '4dbef5b1-6a34-44f5-b807-2002122ce0ee' >> picked.txt
echo 'be230842-55d9-44f8-acb5-a2cc3fba6b93' >> picked.txt
echo '1b1e4f26-d854-46a4-b876-32cc46afadb6' >> picked.txt
echo '5634e9fb-9df9-422e-91b0-cfe3315cb3bf' >> picked.txt
echo '4c1ee2f1-bdd7-4948-b02a-6484185c316c' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr21_corr.fa | scripts/pick_reads_stdin.py > dj21_reads_normal.fa

# chr21 dj final het reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 7f028c70-6efe-436a-82e1-d9453ead77dd
echo '95482788-ccc9-4b11-b18d-bd2356a457f7' > picked.txt
echo '6a7cf634-37c7-4713-a07d-9d03e0c23a1c' >> picked.txt
echo 'f78bedbb-7dab-4ecb-b3de-b3d0f37efd42' >> picked.txt
echo '16b73135-0dc1-4af0-b276-a11ec962d380' >> picked.txt
echo '7f028c70-6efe-436a-82e1-d9453ead77dd' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr21_corr.fa | scripts/pick_reads_stdin.py > dj21_reads_het.fa

# so chr21 pj final reads: all of them
cut -d '_' -f 1 < ../pjpaths_chr21_corr.fa > pj21_reads.fa

# so chr22 dj final reads: all of them
cut -d '_' -f 1 < ../djpaths_chr22_corr.fa > dj22_reads.fa

# so chr22 pj final reads: 505428e3-9ac6-483a-b791-7505fbe232d9 eef2fe73-03d6-4085-b69a-5567fed38f7a 863c69da-3454-41b7-964f-48ad28abd0f9 d8dc9583-6830-4f02-a6ae-5ff40c28909c 980bb713-8be4-4578-b79b-8d9ab16a19e0 aa16c4b7-f83e-41e9-b127-0a0025bf6131 f40c145c-9210-479b-b84f-f03cb7c68450 fdd2f161-f8ea-4348-9877-355b3e258edb 59bdba44-75b7-45e8-a6a2-cb67a602ec10 5ccb66d8-6eef-41a0-80bd-c6e19db2afc9 b204e536-7ef3-4595-91d1-fe1b0729a578 6906feed-66f7-4df0-a673-3d12ef6206be 0e1c059b-855d-4829-b988-8a14ab612a2c 977c3020-9720-497e-ba93-d24acab2c3e7 7ec9c3a0-9fa3-496b-8cca-a11891de75f7
echo '505428e3-9ac6-483a-b791-7505fbe232d9' > picked.txt
echo 'eef2fe73-03d6-4085-b69a-5567fed38f7a' >> picked.txt
echo '863c69da-3454-41b7-964f-48ad28abd0f9' >> picked.txt
echo 'd8dc9583-6830-4f02-a6ae-5ff40c28909c' >> picked.txt
echo '980bb713-8be4-4578-b79b-8d9ab16a19e0' >> picked.txt
echo 'aa16c4b7-f83e-41e9-b127-0a0025bf6131' >> picked.txt
echo 'f40c145c-9210-479b-b84f-f03cb7c68450' >> picked.txt
echo 'fdd2f161-f8ea-4348-9877-355b3e258edb' >> picked.txt
echo '59bdba44-75b7-45e8-a6a2-cb67a602ec10' >> picked.txt
echo '5ccb66d8-6eef-41a0-80bd-c6e19db2afc9' >> picked.txt
echo 'b204e536-7ef3-4595-91d1-fe1b0729a578' >> picked.txt
echo '6906feed-66f7-4df0-a673-3d12ef6206be' >> picked.txt
echo '0e1c059b-855d-4829-b988-8a14ab612a2c' >> picked.txt
echo '977c3020-9720-497e-ba93-d24acab2c3e7' >> picked.txt
echo '7ec9c3a0-9fa3-496b-8cca-a11891de75f7' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr22_corr.fa | scripts/pick_reads_stdin.py > pj22_reads.fa

scripts/extract_longest_seq.py < dj13_reads.fa > longest_dj13.fa
scripts/extract_longest_seq.py < pj13_reads.fa > longest_pj13.fa
scripts/extract_longest_seq.py < dj14_reads_normal.fa > longest_dj14_normal.fa
scripts/extract_longest_seq.py < dj14_reads_het.fa > longest_dj14_het.fa
scripts/extract_longest_seq.py < pj14_reads.fa > longest_pj14.fa
scripts/extract_longest_seq.py < pj15_reads_normal.fa > longest_pj15_normal.fa
scripts/extract_longest_seq.py < pj15_reads_het.fa > longest_pj15_het.fa
scripts/extract_longest_seq.py < dj15_reads.fa > longest_dj15.fa
scripts/extract_longest_seq.py < dj21_reads_normal.fa > longest_dj21_normal.fa
scripts/extract_longest_seq.py < dj21_reads_het.fa > longest_dj21_het.fa
scripts/extract_longest_seq.py < pj21_reads.fa > longest_pj21.fa
scripts/extract_longest_seq.py < dj22_reads.fa > longest_dj22.fa
scripts/extract_longest_seq.py < pj22_reads.fa > longest_pj22.fa

meryl count k=19 output merylDB longest_dj13.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj13.fa dj13_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj13_reads.fa alns_selected.sam longest_dj13.fa > dj13_consensus.fa
meryl count k=19 output merylDB longest_pj13.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj13.fa pj13_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj13_reads.fa alns_selected.sam longest_pj13.fa > pj13_consensus.fa
meryl count k=19 output merylDB longest_dj14_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj14_normal.fa dj14_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj14_reads_normal.fa alns_selected.sam longest_dj14_normal.fa > dj14_consensus_normal.fa
meryl count k=19 output merylDB longest_dj14_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj14_het.fa dj14_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj14_reads_het.fa alns_selected.sam longest_dj14_het.fa > dj14_consensus_het.fa
meryl count k=19 output merylDB longest_pj14.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj14.fa pj14_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj14_reads.fa alns_selected.sam longest_pj14.fa > pj14_consensus.fa
meryl count k=19 output merylDB longest_pj15_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj15_normal.fa pj15_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj15_reads_normal.fa alns_selected.sam longest_pj15_normal.fa > pj15_consensus_normal.fa
meryl count k=19 output merylDB longest_pj15_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj15_het.fa pj15_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj15_reads_het.fa alns_selected.sam longest_pj15_het.fa > pj15_consensus_het.fa
meryl count k=19 output merylDB longest_dj15.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj15.fa dj15_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj15_reads.fa alns_selected.sam longest_dj15.fa > dj15_consensus.fa
meryl count k=19 output merylDB longest_dj21_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj21_normal.fa dj21_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj21_reads_normal.fa alns_selected.sam longest_dj21_normal.fa > dj21_consensus_normal.fa
meryl count k=19 output merylDB longest_dj21_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj21_het.fa dj21_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj21_reads_het.fa alns_selected.sam longest_dj21_het.fa > dj21_consensus_het.fa
meryl count k=19 output merylDB longest_pj21.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj21.fa pj21_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj21_reads.fa alns_selected.sam longest_pj21.fa > pj21_consensus.fa
meryl count k=19 output merylDB longest_dj22.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj22.fa dj22_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj22_reads.fa alns_selected.sam longest_dj22.fa > dj22_consensus.fa
meryl count k=19 output merylDB longest_pj22.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj22.fa pj22_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj22_reads.fa alns_selected.sam longest_pj22.fa > pj22_consensus.fa

grep -v '>' < dj13_consensus.fa | awk '{print ">dj13_consensus"; print $1;}' > consensuses.fa
grep -v '>' < dj14_consensus_normal.fa | awk '{print ">dj14_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < dj14_consensus_het.fa | awk '{print ">dj14_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < dj15_consensus.fa | awk '{print ">dj15_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < dj21_consensus_normal.fa | awk '{print ">dj21_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < dj21_consensus_het.fa | awk '{print ">dj21_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < dj22_consensus.fa | awk '{print ">dj22_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj13_consensus.fa | awk '{print ">pj13_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj14_consensus.fa | awk '{print ">pj14_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj15_consensus_normal.fa | awk '{print ">pj15_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < pj15_consensus_het.fa | awk '{print ">pj15_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < pj21_consensus.fa | awk '{print ">pj21_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj22_consensus.fa | awk '{print ">pj22_consensus"; print $1;}' >> consensuses.fa

cd ..
cd ..
mkdir pjdj_continuations_aln
cd pjdj_continuations_aln

cp ../pjdj_continuations/seq_*.txt .
scripts/extract_extended_path.py ../pjdj-mergegraph.gfa < ../ont_to_pjdjgraph/alns_subset_unambiguous_merged.gaf | cut -d '_' -f 1 > readpaths.fa
scripts/extract_seq_from_prefix.py seq_dj13.txt 10000 < readpaths.fa > djpaths_chr13_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj13.txt 10000 < readpaths.fa > pjpaths_chr13_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj14.txt 10000 < readpaths.fa > djpaths_chr14_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj14.txt 10000 < readpaths.fa > pjpaths_chr14_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj15.txt 10000 < readpaths.fa > djpaths_chr15_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj15.txt 10000 < readpaths.fa > pjpaths_chr15_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj21.txt 10000 < readpaths.fa > djpaths_chr21_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj21.txt 10000 < readpaths.fa > pjpaths_chr21_corr_all.fa
scripts/extract_seq_from_prefix.py seq_dj22.txt 10000 < readpaths.fa > djpaths_chr22_corr_all.fa
scripts/extract_seq_from_prefix.py seq_pj22.txt 10000 < readpaths.fa > pjpaths_chr22_corr_all.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr13_corr_all.fa > djpaths_chr13_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr13_corr_all.fa > pjpaths_chr13_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr14_corr_all.fa > djpaths_chr14_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr14_corr_all.fa > pjpaths_chr14_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr15_corr_all.fa > djpaths_chr15_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr15_corr_all.fa > pjpaths_chr15_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr21_corr_all.fa > djpaths_chr21_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr21_corr_all.fa > pjpaths_chr21_corr.fa
~/tmp/filter_fasta_by_size.py 45000 djpaths_chr22_corr_all.fa > djpaths_chr22_corr.fa
~/tmp/filter_fasta_by_size.py 45000 pjpaths_chr22_corr_all.fa > pjpaths_chr22_corr.fa

mkdir consensuses
cd consensuses

# so chr13 dj final reads: 55465bda-f68a-4196-9df5-3b0ac947d6bb 63395e01-319c-4ae3-9c1f-f464dbc27457 60a9d4d0-ca95-45a6-a6ff-eef32d18991d 72729273-53ba-4221-8e9a-14271af27af1 536d68b4-5fd2-42d0-a627-76ff39e3c04c 0e64eabc-4c73-45ba-9e68-757579f9a44f 31555889-d794-4c9d-b376-5c9695abb9fd 418fd761-9e25-47b5-a52a-f53522f723e1 87dd474b-e372-4c16-bd98-e7e9ce2c65ad
echo '55465bda-f68a-4196-9df5-3b0ac947d6bb' > picked.txt
echo '63395e01-319c-4ae3-9c1f-f464dbc27457' >> picked.txt
echo '60a9d4d0-ca95-45a6-a6ff-eef32d18991d' >> picked.txt
echo '72729273-53ba-4221-8e9a-14271af27af1' >> picked.txt
echo '536d68b4-5fd2-42d0-a627-76ff39e3c04c' >> picked.txt
echo '0e64eabc-4c73-45ba-9e68-757579f9a44f' >> picked.txt
echo '31555889-d794-4c9d-b376-5c9695abb9fd' >> picked.txt
echo '418fd761-9e25-47b5-a52a-f53522f723e1' >> picked.txt
echo '87dd474b-e372-4c16-bd98-e7e9ce2c65ad' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr13_corr.fa | scripts/pick_reads_stdin.py > dj13_reads.fa

# so chr13 pj final reads: 08653f96-b9ed-4090-84a0-80118a9c0fde a49093f7-5fe7-40ce-9b44-586af41f5d37 686d32dc-f718-426c-b22e-5ab9737daee4 9f18acc0-af09-4137-89b8-3fa68ae90546 f58db80f-d257-4155-ab04-da2bba4cab3e 5dc6b258-339f-42f6-b9eb-be57d4d8e87e 5845acba-1625-4c30-840f-6715d5200539 31985caf-a7c9-4d09-9240-af5717520e77 178fcd69-70bb-41fb-8b26-8ac5f64d57b4 ba3ca200-bb5f-4362-bc36-a554801e1a8e c2707e24-e31d-4266-97f1-c6de88d91ff8 21374449-b75f-4239-a187-fe739210600a
echo '08653f96-b9ed-4090-84a0-80118a9c0fde' > picked.txt
echo 'a49093f7-5fe7-40ce-9b44-586af41f5d37' >> picked.txt
echo '686d32dc-f718-426c-b22e-5ab9737daee4' >> picked.txt
echo '9f18acc0-af09-4137-89b8-3fa68ae90546' >> picked.txt
echo 'f58db80f-d257-4155-ab04-da2bba4cab3e' >> picked.txt
echo '5dc6b258-339f-42f6-b9eb-be57d4d8e87e' >> picked.txt
echo '5845acba-1625-4c30-840f-6715d5200539' >> picked.txt
echo '31985caf-a7c9-4d09-9240-af5717520e77' >> picked.txt
echo '178fcd69-70bb-41fb-8b26-8ac5f64d57b4' >> picked.txt
echo 'ba3ca200-bb5f-4362-bc36-a554801e1a8e' >> picked.txt
echo 'c2707e24-e31d-4266-97f1-c6de88d91ff8' >> picked.txt
echo '21374449-b75f-4239-a187-fe739210600a' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr13_corr.fa | scripts/pick_reads_stdin.py > pj13_reads.fa

# so final chr14 dj normal: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
echo 'efb2ea32-e628-42bc-9253-ecc1c97df0b7' > picked.txt
echo '23d0b699-6b6c-4a0a-9f35-f64c89c307d0' >> picked.txt
echo 'd49dc75c-8dd3-477f-a3af-84713bda029b' >> picked.txt
echo 'cf01d2c6-2512-460a-9614-07e33294be6b' >> picked.txt
echo 'ccf8279e-b78a-44b2-b1e2-547bb6e833da' >> picked.txt
echo '3c5b0999-df37-45e1-aa30-fdf4f9a349b8' >> picked.txt
echo 'bf077246-0e03-4b7f-8ea6-ce163d4dc99c' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > dj14_reads_normal.fa

# chr14 dj het: 09293939-e5a3-4b69-bb8a-ae1e617f9716 b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 d78f2d3c-b7a2-43d9-8276-f2a67a48122f f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
echo '09293939-e5a3-4b69-bb8a-ae1e617f9716' > picked.txt
echo 'b0e694d4-e962-470b-a656-f2da060a2310' >> picked.txt
echo '6b4c3194-760d-4f82-9008-f1cea1185b10' >> picked.txt
echo 'b62fe3d8-fdc4-4622-ac2e-e64e25f0b310' >> picked.txt
echo 'd78f2d3c-b7a2-43d9-8276-f2a67a48122f' >> picked.txt
echo 'f2578dce-b2e5-4d4d-8969-f97d80616e19' >> picked.txt
echo '75be7f73-4c49-4474-9e1c-1eb360bce1e4' >> picked.txt
echo 'd1cbf206-2286-405b-b10a-5f1c5c491493' >> picked.txt
echo '99e2f6e6-8d01-46d8-aed1-61fdb2b7abce' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > dj14_reads_het.fa

# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2
# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2
echo '657e50aa-53b9-4ab1-b047-fb9af7a7643c' > picked.txt
echo '8627995d-758e-4297-878c-b96152e854c0' >> picked.txt
echo '8b344d6e-e4e3-400b-b2e6-6536ae100931' >> picked.txt
echo 'fd3e60e2-5df8-465f-803c-3d4ca67e5740' >> picked.txt
echo '32dc764f-08b6-4294-a611-e3f4edf11a61' >> picked.txt
echo '8116263e-bf90-435d-8c7a-a3ff1210632b' >> picked.txt
echo '29b3df0c-43d4-4176-a62b-5d768111f243' >> picked.txt
echo '302552ab-ead3-4f1d-8c2d-66ea52c42e65' >> picked.txt
echo '47d602c3-d1a8-45ee-80ad-65f8cb01d2e3' >> picked.txt
echo '1794a4dc-2d28-4088-9092-981799f3e543' >> picked.txt
echo 'b42a562d-2a1c-404e-b6c5-c8e985f496ee' >> picked.txt
echo '205839a9-69e4-47c3-b996-91e77249d9fa' >> picked.txt
echo '4b1ecccd-0235-489d-a60a-92d376afa9c2' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr14_corr.fa | scripts/pick_reads_stdin.py > pj14_reads.fa

# so chr15 pj normal final reads: 5d11980e-d392-42a0-9978-4a82d9c59125 9b934d9f-fae4-46e6-a51c-2bf664fe0468 dc32b8da-06a8-4344-a8ad-f41746ad24ec 97b3a9ae-1db5-4fdc-83a6-bacd24cef28c 837eb607-2736-42a2-842b-926786bd6997 32a31cd2-98f0-4423-92c3-6c952cad612c b015ddc9-18fc-4719-9360-e7dfe77fbc3d
echo '5d11980e-d392-42a0-9978-4a82d9c59125' > picked.txt
echo '9b934d9f-fae4-46e6-a51c-2bf664fe0468' >> picked.txt
echo 'dc32b8da-06a8-4344-a8ad-f41746ad24ec' >> picked.txt
echo '97b3a9ae-1db5-4fdc-83a6-bacd24cef28c' >> picked.txt
echo '837eb607-2736-42a2-842b-926786bd6997' >> picked.txt
echo '32a31cd2-98f0-4423-92c3-6c952cad612c' >> picked.txt
echo 'b015ddc9-18fc-4719-9360-e7dfe77fbc3d' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > pj15_reads_normal.fa

# chr15 pj het final reads: ef4f8ce9-27c8-4391-8428-98481dc28dbf dc53f8ef-83cf-4f3b-ab9e-420805cdbd50 6303c6f7-4c3d-4fec-b5d7-61bd6e65081c f847d286-9365-4941-9360-0d29f358cd30 406c2f52-36fb-450b-b398-ce3987a87eab 77921980-9397-4a7d-b647-3660a90b392b ecc8f1f8-3864-44a9-9a66-bc897316de83
echo 'ef4f8ce9-27c8-4391-8428-98481dc28dbf' > picked.txt
echo 'dc53f8ef-83cf-4f3b-ab9e-420805cdbd50' >> picked.txt
echo '6303c6f7-4c3d-4fec-b5d7-61bd6e65081c' >> picked.txt
echo 'f847d286-9365-4941-9360-0d29f358cd30' >> picked.txt
echo '406c2f52-36fb-450b-b398-ce3987a87eab' >> picked.txt
echo '77921980-9397-4a7d-b647-3660a90b392b' >> picked.txt
echo 'ecc8f1f8-3864-44a9-9a66-bc897316de83' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > pj15_reads_het.fa

# so final chr15 dj reads: 95736f28-02c9-4ba1-ad29-9696c31e4c45 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a f2e2e8ff-f6a1-48d0-bbe5-d21f6ba8265b 2823fd72-77b4-4640-9d75-6f0f000c09ea 11afa55c-04c6-4da0-a0ed-385d506352bf 4a9ec129-946a-40bb-b8c7-b92729d43c5c b0c0c236-e256-49ae-ba64-de3a1aaa74cd bc61673a-b89b-4729-8787-573a6a5778f0 243241c5-00de-4947-aa1b-721a7d0194c0 3328c51a-b2e1-4292-a3d9-625dca4b147a 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b e4f04026-8956-4d75-899b-bea86f4ac569 c83bf290-eaad-4187-a5e4-7517dc9db48a d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 38d74a0c-6b69-4a0d-a1c0-a2080772a624 b45dfc5a-b9a1-406e-9470-bd4141c96f5d 305f4723-c5ce-4249-bd79-e6f9cef2d891 a8350e37-7635-4ef3-9645-3d76898824c2 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05
echo '95736f28-02c9-4ba1-ad29-9696c31e4c45' > picked.txt
echo '6053da9f-51c8-4d4b-ae4c-d7f4d912a97c' >> picked.txt
echo '38c84348-c2ac-4233-82c9-a0dba9f057f0' >> picked.txt
echo '9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a' >> picked.txt
echo 'f2e2e8ff-f6a1-48d0-bbe5-d21f6ba8265b' >> picked.txt
echo '2823fd72-77b4-4640-9d75-6f0f000c09ea' >> picked.txt
echo '11afa55c-04c6-4da0-a0ed-385d506352bf' >> picked.txt
echo '4a9ec129-946a-40bb-b8c7-b92729d43c5c' >> picked.txt
echo 'b0c0c236-e256-49ae-ba64-de3a1aaa74cd' >> picked.txt
echo 'bc61673a-b89b-4729-8787-573a6a5778f0' >> picked.txt
echo '243241c5-00de-4947-aa1b-721a7d0194c0' >> picked.txt
echo '3328c51a-b2e1-4292-a3d9-625dca4b147a' >> picked.txt
echo '7ff2268c-7b2d-4c21-b2fa-e0757ba9074b' >> picked.txt
echo 'e4f04026-8956-4d75-899b-bea86f4ac569' >> picked.txt
echo 'c83bf290-eaad-4187-a5e4-7517dc9db48a' >> picked.txt
echo 'd24e3b0b-1331-4ad2-9380-10b496d5c900' >> picked.txt
echo '7202b994-fc29-4496-b4ff-2fdf2bb3ddf5' >> picked.txt
echo '38d74a0c-6b69-4a0d-a1c0-a2080772a624' >> picked.txt
echo 'b45dfc5a-b9a1-406e-9470-bd4141c96f5d' >> picked.txt
echo '305f4723-c5ce-4249-bd79-e6f9cef2d891' >> picked.txt
echo 'a8350e37-7635-4ef3-9645-3d76898824c2' >> picked.txt
echo '57bc9d5b-e534-4100-af9c-6e2b58ee4fd6' >> picked.txt
echo '25fbb44c-93af-439e-9881-cb487cdd6c05' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr15_corr.fa | scripts/pick_reads_stdin.py > dj15_reads.fa

# so chr21 dj final normal reads: f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee be230842-55d9-44f8-acb5-a2cc3fba6b93 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
echo 'f598bf95-f28d-418d-9c1f-8969046dc13a' > picked.txt
echo '171ec83e-0cda-4ead-9469-d683396c14b8' >> picked.txt
echo '06dd4d9a-7a55-42c8-84a6-c2e4b3f30163' >> picked.txt
echo 'fe220ca9-c812-43ba-aa9f-2644c44b8751' >> picked.txt
echo '4dbef5b1-6a34-44f5-b807-2002122ce0ee' >> picked.txt
echo 'be230842-55d9-44f8-acb5-a2cc3fba6b93' >> picked.txt
echo '1b1e4f26-d854-46a4-b876-32cc46afadb6' >> picked.txt
echo '5634e9fb-9df9-422e-91b0-cfe3315cb3bf' >> picked.txt
echo '4c1ee2f1-bdd7-4948-b02a-6484185c316c' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr21_corr.fa | scripts/pick_reads_stdin.py > dj21_reads_normal.fa

# chr21 dj final het reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 7f028c70-6efe-436a-82e1-d9453ead77dd
echo '95482788-ccc9-4b11-b18d-bd2356a457f7' > picked.txt
echo '6a7cf634-37c7-4713-a07d-9d03e0c23a1c' >> picked.txt
echo 'f78bedbb-7dab-4ecb-b3de-b3d0f37efd42' >> picked.txt
echo '16b73135-0dc1-4af0-b276-a11ec962d380' >> picked.txt
echo '7f028c70-6efe-436a-82e1-d9453ead77dd' >> picked.txt
cut -d '_' -f 1 < ../djpaths_chr21_corr.fa | scripts/pick_reads_stdin.py > dj21_reads_het.fa

# so chr21 pj final reads: all of them
cut -d '_' -f 1 < ../pjpaths_chr21_corr.fa > pj21_reads.fa

# so chr22 dj final reads: all of them
cut -d '_' -f 1 < ../djpaths_chr22_corr.fa > dj22_reads.fa

# so chr22 pj final reads: 505428e3-9ac6-483a-b791-7505fbe232d9 eef2fe73-03d6-4085-b69a-5567fed38f7a 863c69da-3454-41b7-964f-48ad28abd0f9 d8dc9583-6830-4f02-a6ae-5ff40c28909c 980bb713-8be4-4578-b79b-8d9ab16a19e0 aa16c4b7-f83e-41e9-b127-0a0025bf6131 f40c145c-9210-479b-b84f-f03cb7c68450 fdd2f161-f8ea-4348-9877-355b3e258edb 59bdba44-75b7-45e8-a6a2-cb67a602ec10 5ccb66d8-6eef-41a0-80bd-c6e19db2afc9 b204e536-7ef3-4595-91d1-fe1b0729a578 6906feed-66f7-4df0-a673-3d12ef6206be 0e1c059b-855d-4829-b988-8a14ab612a2c 977c3020-9720-497e-ba93-d24acab2c3e7 7ec9c3a0-9fa3-496b-8cca-a11891de75f7
echo '505428e3-9ac6-483a-b791-7505fbe232d9' > picked.txt
echo 'eef2fe73-03d6-4085-b69a-5567fed38f7a' >> picked.txt
echo '863c69da-3454-41b7-964f-48ad28abd0f9' >> picked.txt
echo 'd8dc9583-6830-4f02-a6ae-5ff40c28909c' >> picked.txt
echo '980bb713-8be4-4578-b79b-8d9ab16a19e0' >> picked.txt
echo 'aa16c4b7-f83e-41e9-b127-0a0025bf6131' >> picked.txt
echo 'f40c145c-9210-479b-b84f-f03cb7c68450' >> picked.txt
echo 'fdd2f161-f8ea-4348-9877-355b3e258edb' >> picked.txt
echo '59bdba44-75b7-45e8-a6a2-cb67a602ec10' >> picked.txt
echo '5ccb66d8-6eef-41a0-80bd-c6e19db2afc9' >> picked.txt
echo 'b204e536-7ef3-4595-91d1-fe1b0729a578' >> picked.txt
echo '6906feed-66f7-4df0-a673-3d12ef6206be' >> picked.txt
echo '0e1c059b-855d-4829-b988-8a14ab612a2c' >> picked.txt
echo '977c3020-9720-497e-ba93-d24acab2c3e7' >> picked.txt
echo '7ec9c3a0-9fa3-496b-8cca-a11891de75f7' >> picked.txt
cut -d '_' -f 1 < ../pjpaths_chr22_corr.fa | scripts/pick_reads_stdin.py > pj22_reads.fa

scripts/extract_longest_seq.py < dj13_reads.fa > longest_dj13.fa
scripts/extract_longest_seq.py < pj13_reads.fa > longest_pj13.fa
scripts/extract_longest_seq.py < dj14_reads_normal.fa > longest_dj14_normal.fa
scripts/extract_longest_seq.py < dj14_reads_het.fa > longest_dj14_het.fa
scripts/extract_longest_seq.py < pj14_reads.fa > longest_pj14.fa
scripts/extract_longest_seq.py < pj15_reads_normal.fa > longest_pj15_normal.fa
scripts/extract_longest_seq.py < pj15_reads_het.fa > longest_pj15_het.fa
scripts/extract_longest_seq.py < dj15_reads.fa > longest_dj15.fa
scripts/extract_longest_seq.py < dj21_reads_normal.fa > longest_dj21_normal.fa
scripts/extract_longest_seq.py < dj21_reads_het.fa > longest_dj21_het.fa
scripts/extract_longest_seq.py < pj21_reads.fa > longest_pj21.fa
scripts/extract_longest_seq.py < dj22_reads.fa > longest_dj22.fa
scripts/extract_longest_seq.py < pj22_reads.fa > longest_pj22.fa

meryl count k=19 output merylDB longest_dj13.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj13.fa dj13_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj13_reads.fa alns_selected.sam longest_dj13.fa > dj13_consensus.fa
meryl count k=19 output merylDB longest_pj13.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj13.fa pj13_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj13_reads.fa alns_selected.sam longest_pj13.fa > pj13_consensus.fa
meryl count k=19 output merylDB longest_dj14_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj14_normal.fa dj14_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj14_reads_normal.fa alns_selected.sam longest_dj14_normal.fa > dj14_consensus_normal.fa
meryl count k=19 output merylDB longest_dj14_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj14_het.fa dj14_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj14_reads_het.fa alns_selected.sam longest_dj14_het.fa > dj14_consensus_het.fa
meryl count k=19 output merylDB longest_pj14.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj14.fa pj14_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj14_reads.fa alns_selected.sam longest_pj14.fa > pj14_consensus.fa
meryl count k=19 output merylDB longest_pj15_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj15_normal.fa pj15_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj15_reads_normal.fa alns_selected.sam longest_pj15_normal.fa > pj15_consensus_normal.fa
meryl count k=19 output merylDB longest_pj15_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj15_het.fa pj15_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj15_reads_het.fa alns_selected.sam longest_pj15_het.fa > pj15_consensus_het.fa
meryl count k=19 output merylDB longest_dj15.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj15.fa dj15_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj15_reads.fa alns_selected.sam longest_dj15.fa > dj15_consensus.fa
meryl count k=19 output merylDB longest_dj21_normal.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj21_normal.fa dj21_reads_normal.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj21_reads_normal.fa alns_selected.sam longest_dj21_normal.fa > dj21_consensus_normal.fa
meryl count k=19 output merylDB longest_dj21_het.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj21_het.fa dj21_reads_het.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 -u dj21_reads_het.fa alns_selected.sam longest_dj21_het.fa > dj21_consensus_het.fa
meryl count k=19 output merylDB longest_pj21.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj21.fa pj21_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj21_reads.fa alns_selected.sam longest_pj21.fa > pj21_consensus.fa
meryl count k=19 output merylDB longest_dj22.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_dj22.fa dj22_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 dj22_reads.fa alns_selected.sam longest_dj22.fa > dj22_consensus.fa
meryl count k=19 output merylDB longest_pj22.fa
winnowmap -c -W repetitive_k19.txt -ax map-ont longest_pj22.fa pj22_reads.fa | samtools view -F 256 -q 1 > alns_primary_mapq1.sam
rm -r merylDB
cut -f 1,3 < alns_primary_mapq1.sam | sort | uniq |cut -f 1 | sort | uniq -c | sort -nr | sed 's/ \+/ /g' | awk '{if ($1 == 1) print $2;}' > valid_aln_read_names.txt
scripts/filter_sam_by_read_name.py valid_aln_read_names.txt < alns_primary_mapq1.sam > alns_selected.sam
racon -t 40 pj22_reads.fa alns_selected.sam longest_pj22.fa > pj22_consensus.fa

grep -v '>' < dj13_consensus.fa | awk '{print ">dj13_consensus"; print $1;}' > consensuses.fa
grep -v '>' < dj14_consensus_normal.fa | awk '{print ">dj14_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < dj14_consensus_het.fa | awk '{print ">dj14_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < dj15_consensus.fa | awk '{print ">dj15_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < dj21_consensus_normal.fa | awk '{print ">dj21_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < dj21_consensus_het.fa | awk '{print ">dj21_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < dj22_consensus.fa | awk '{print ">dj22_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj13_consensus.fa | awk '{print ">pj13_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj14_consensus.fa | awk '{print ">pj14_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj15_consensus_normal.fa | awk '{print ">pj15_consensus_normal"; print $1;}' >> consensuses.fa
grep -v '>' < pj15_consensus_het.fa | awk '{print ">pj15_consensus_het"; print $1;}' >> consensuses.fa
grep -v '>' < pj21_consensus.fa | awk '{print ">pj21_consensus"; print $1;}' >> consensuses.fa
grep -v '>' < pj22_consensus.fa | awk '{print ">pj22_consensus"; print $1;}' >> consensuses.fa

cd ../..

# all of that resulted in strange consensuses which aren't really correct
# better to first build a consensus of the raw ONT reads and then correct that by aligning to the hifi graphs
# and the dj15 consensus mixes reads from het / normal!

mkdir dj15_split
cd dj15_split
cp ../ont_to_pjdjgraph/corrected_chr15.fa .
cp ../pjdj_continuations/seq_dj15.txt .
scripts/extract_uncorrected_seq_from_prefix.py seq_dj15.txt corrected_chr15.fa ../ont.fa 10000 > raw_suffixes_10k_dj15.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_10k_dj15.fa | cut -d '_' -f 1 > suffixes.fa
# $ grep -n ef4f8ce9-27c8-4391-8428-98481dc28dbf < suffixes.fa
# 9:>ef4f8ce9-27c8-4391-8428-98481dc28dbf
sed -n 9,10p < suffixes.fa > longest_het.fa
meryl count k=19 output merylDB longest_het.fa
/usr/bin/time -v winnowmap -c -W repetitive_k19.txt -ax map-ont longest_het.fa suffixes.fa > alns_het.sam 2> stderr_winnowmap.txt
rm -r merylDB
samtools view -S -b alns_het.sam | samtools sort > alns_het.bam
paftools.js sam2paf alns_het.sam > alns_het.paf
samtools view -F 256 -q 1 -h < alns_het.sam > alns_het_prim_mapq1.sam
samtools view -S -b alns_het_prim_mapq1.sam | samtools sort > alns_het_prim_mapq1.bam
paftools.js sam2paf alns_het_prim_mapq1.sam > alns_het_prim_mapq1.paf
# this read seems to not align to the het well, and it's the longest one
# $ grep -n 38d74a0c-6b69-4a0d-a1c0-a2080772a624 < suffixes.fa
# 43:>38d74a0c-6b69-4a0d-a1c0-a2080772a624
sed -n 43,44p < suffixes.fa > longest_normal1.fa
meryl count k=19 output merylDB longest_normal1.fa
/usr/bin/time -v winnowmap -c -W repetitive_k19.txt -ax map-ont longest_normal1.fa suffixes.fa > alns_normal1.sam 2> stderr_winnowmap.txt
rm -r merylDB
samtools view -S -b alns_normal1.sam | samtools sort > alns_normal1.bam
paftools.js sam2paf alns_normal1.sam > alns_normal1.paf
samtools view -F 256 -q 1 -h < alns_normal1.sam > alns_normal1_prim_mapq1.sam
samtools view -S -b alns_normal1_prim_mapq1.sam | samtools sort > alns_normal1_prim_mapq1.bam
paftools.js sam2paf alns_normal1_prim_mapq1.sam > alns_normal1_prim_mapq1.paf
# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_het.paf | less -S
# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal1.paf | less -S
# hmm, none of the >65kbp reads map too well?
# is it a winnowmap issue?
minimap2 -x map-ont -c -f 0 -t 40 longest_het.fa suffixes.fa > alns_het_minimap.paf
# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_het_minimap.paf | less -S
# looks like a minimap issue
minimap2 -x map-ont -c -f 0 -t 40 longest_normal1.fa suffixes.fa > alns_normal1_minimap.paf
/usr/bin/time -v winnowmap -c -t 40 -ax map-ont longest_het.fa suffixes.fa > alns_het_noW.sam 2> stderr_winnowmap.txt
paftools.js sam2paf alns_het_noW.sam > alns_het_noW.paf
# not a -W issue, so just winnowmap doing something strange
# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal1_minimap.paf | less -S
grep '>' suffixes.fa | tr -d '>' > readnames.txt
awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_het_minimap.paf | cut -f 1 | sort | uniq > good_hets.txt
cat readnames.txt good_hets.txt | sort | uniq -c | sort -nr | less
# doesn't match het:
# f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 118k
# d24e3b0b-1331-4ad2-9380-10b496d5c900 194k ("normal2")
# b0c0c236-e256-49ae-ba64-de3a1aaa74cd 100k
# 38d74a0c-6b69-4a0d-a1c0-a2080772a624 222k ("normal1")
# 38c84348-c2ac-4233-82c9-a0dba9f057f0 180k ("normal3")
# 16b73135-0dc1-4af0-b276-a11ec962d380 89k

awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal1_minimap.paf | cut -f 1 | sort | uniq > good_normals.txt
cat readnames.txt good_normals.txt | sort | uniq -c | sort -nr | less
# doesn't match normal1:
# f78bedbb-7dab-4ecb-b3de-b3d0f37efd42
# d24e3b0b-1331-4ad2-9380-10b496d5c900 ("normal2")
# b0c0c236-e256-49ae-ba64-de3a1aaa74cd
# 38c84348-c2ac-4233-82c9-a0dba9f057f0 ("normal3")
# 16b73135-0dc1-4af0-b276-a11ec962d380
# ef4f8ce9-27c8-4391-8428-98481dc28dbf 461k ("het")
# 89e2d924-6cdd-4d4f-99bc-a31d89c047c3 60k
# 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b 106k

# $ grep -n d24e3b0b-1331-4ad2-9380-10b496d5c900 < suffixes.fa
# 37:>d24e3b0b-1331-4ad2-9380-10b496d5c900
sed -n 37,38p < suffixes.fa > longest_normal2.fa
minimap2 -x map-ont -c -f 0 -t 40 longest_normal2.fa suffixes.fa > alns_normal2_minimap.paf

# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal2_minimap.paf | less -S
awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal2_minimap.paf | cut -f 1 | sort | uniq > good_normals2.txt
cat readnames.txt good_normals2.txt | sort | uniq -c | sort -nr | less
# only short ones match normal2. probably something wrong with the read?

# $ grep -n 38c84348-c2ac-4233-82c9-a0dba9f057f0 < suffixes.fa
# 5:>38c84348-c2ac-4233-82c9-a0dba9f057f0
sed -n 5,6p < suffixes.fa > longest_normal3.fa
minimap2 -x map-ont -c -f 0 -t 40 longest_normal3.fa suffixes.fa > alns_normal3_minimap.paf

# awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal3_minimap.paf | less -S
awk '{if ($3 < 5000 && $4 > $2-10000 && $8 < 5000) print;}' < alns_normal3_minimap.paf | cut -f 1 | sort | uniq > good_normals3.txt
cat readnames.txt good_normals3.txt | sort | uniq -c | sort -nr | less

# where is the het in the shorter allele?
scripts/extract_uncorrected_seq_from_prefix.py ../pjdj_continuations/seq_pj15.txt corrected_chr15.fa ../ont.fa 10000 > raw_suffixes_10k_pj15.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_10k_pj15.fa | cut -d '_' -f 1 > suffixes_pj.fa
echo 'dc32b8da-06a8-4344-a8ad-f41746ad24ec' > picked.txt #140k
echo '32a31cd2-98f0-4423-92c3-6c952cad612c' >> picked.txt #139k
scripts/pick_reads_stdin.py < suffixes_pj.fa > long_pj_normal.fa
echo 'f847d286-9365-4941-9360-0d29f358cd30' > picked.txt #144k
echo '406c2f52-36fb-450b-b398-ce3987a87eab' >> picked.txt #128k
scripts/pick_reads_stdin.py < suffixes_pj.fa > long_pj_het.fa
echo 'ef4f8ce9-27c8-4391-8428-98481dc28dbf' > picked.txt #360k
scripts/pick_reads_stdin.py < suffixes_pj.fa > longest_pj_het.fa
minimap2 -x map-ont -c -f 0 -t 40 longest_pj_het.fa long_pj_normal.fa > alns_long_pj_normal.paf
minimap2 -x map-ont -c -f 0 -t 40 longest_pj_het.fa long_pj_het.fa > alns_long_pj_het.paf
mashmap -r longest_pj_het.fa -q long_pj_het.fa
mv mashmap.out mash_pj_het.txt
mashmap -r longest_pj_het.fa -q long_pj_normal.fa
mv mashmap.out mash_pj_normal.txt

~/tmp/filter_fasta_by_size.py 100000 suffixes.fa | cut -d '_' -f 1 > suffixes_100k.fa
mashmap -r longest_het.fa -q suffixes_100k.fa --pi 90
mv mashmap.out mash_dj_het.txt
# matches het: 38c84348-c2ac-4233-82c9-a0dba9f057f0 ef4f8ce9-27c8-4391-8428-98481dc28dbf bc61673a-b89b-4729-8787-573a6a5778f0 38d74a0c-6b69-4a0d-a1c0-a2080772a624 305f4723-c5ce-4249-bd79-e6f9cef2d891 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05
# doesn't match het: 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 b0c0c236-e256-49ae-ba64-de3a1aaa74cd
echo 'd24e3b0b-1331-4ad2-9380-10b496d5c900' > picked.txt
scripts/pick_reads_stdin.py < suffixes.fa > longest_dj_normal1.fa
mashmap -r longest_dj_normal1.fa -q suffixes_100k.fa --pi 90
mv mashmap.out mash_dj_normal1.txt
# matches normal: 38c84348-c2ac-4233-82c9-a0dba9f057f0 f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 bc61673a-b89b-4729-8787-573a6a5778f0 d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 305f4723-c5ce-4249-bd79-e6f9cef2d891 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05
# doesn't match normal: 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c ef4f8ce9-27c8-4391-8428-98481dc28dbf 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b 38d74a0c-6b69-4a0d-a1c0-a2080772a624 b0c0c236-e256-49ae-ba64-de3a1aaa74cd
# not very reliable...
# just try splitting anyways?
# matches both: 38c84348-c2ac-4233-82c9-a0dba9f057f0 bc61673a-b89b-4729-8787-573a6a5778f0 305f4723-c5ce-4249-bd79-e6f9cef2d891 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 25fbb44c-93af-439e-9881-cb487cdd6c05
# doesn't match both: 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b b0c0c236-e256-49ae-ba64-de3a1aaa74cd
# take the ones which are consistent with each others
# het: ef4f8ce9-27c8-4391-8428-98481dc28dbf 38d74a0c-6b69-4a0d-a1c0-a2080772a624
# normal: f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 d24e3b0b-1331-4ad2-9380-10b496d5c900 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5
# consensus of 2 reads? nope..
nucmer --maxmatch -c 30 -p nucmer longest_het.fa suffixes.fa > nucmer.delta
show-coords -r -c -l nucmer.delta > nucmer.coords

# try something else??
awk '{if ($3-$8 < 5000 && $3-$8 > -5000) print;}' < alns_het_minimap.paf > alns_het_minimap_startpos.paf
# can't convert paf2sam
minimap2 -x map-ont -a -c -f 0 -t 40 longest_het.fa suffixes.fa > alns_het_minimap.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_het_minimap.sam > alns_het_minimap_selected.sam
samtools view -b alns_het_minimap_selected.sam | samtools sort > alns_het_minimap_selected.bam

samtools mpileup --output-QNAME --ff 256 -q 1 -f longest_het.fa alns_het_minimap_selected.bam > pileup.txt
scripts/simple_snp_positions_fraction.py 3 0.2 < pileup.txt > snp_positions.txt
# manually found snp positions: 5655? 12771?

# too error prone
/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f longest_het.fa --corrected-out corrected_longest_het.fa -t 40 -x vg -b 150 --X-drop 2000000 --precise-clipping 0.7 --multiseed-DP 1 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 2000
minimap2 -x map-ont -a -c -f 0 -t 40 corrected_longest_het.fa suffixes.fa > alns_het_minimap.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_het_minimap.sam > alns_het_minimap_selected.sam
samtools view -b alns_het_minimap_selected.sam | samtools sort > alns_het_minimap_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f longest_het.fa alns_het_minimap_selected.bam > pileup.txt
scripts/simple_snp_positions_fraction.py 3 0.2 < pileup.txt > snp_positions.txt
# SV in 35kbp
# maybe another at 77kbp?
# allele1 (del): 305f4723-c5ce-4249-bd79-e6f9cef2d891 ef4f8ce9-27c8-4391-8428-98481dc28dbf bc61673a-b89b-4729-8787-573a6a5778f0 4a9ec129-946a-40bb-b8c7-b92729d43c5c 38d74a0c-6b69-4a0d-a1c0-a2080772a624 d24e3b0b-1331-4ad2-9380-10b496d5c900 e02613db-5037-44e3-927a-315dc09cf40c c83bf290-eaad-4187-a5e4-7517dc9db48a 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b
# allele2 (no del): 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 2823fd72-77b4-4640-9d75-6f0f000c09ea e4f04026-8956-4d75-899b-bea86f4ac569 b3505ec3-5a03-4769-b6c0-fcfa9c98462c 05885891-261e-4af3-bb02-274c3417bcd7 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 243241c5-00de-4947-aa1b-721a7d0194c0 b45dfc5a-b9a1-406e-9470-bd4141c96f5d bf2debd4-72e6-4e63-9cb9-6b0a268b9ef0 a8350e37-7635-4ef3-9645-3d76898824c2 89e2d924-6cdd-4d4f-99bc-a31d89c047c3
# unclear: 25fbb44c-93af-439e-9881-cb487cdd6c05 11afa55c-04c6-4da0-a0ed-385d506352bf 95736f28-02c9-4ba1-ad29-9696c31e4c45 3328c51a-b2e1-4292-a3d9-625dca4b147a
# from adam: reads match dotplot, also c83bf290-eaad-4187-a5e4-7517dc9db48a is really weird
# so final chr15 dj normal reads: 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 2823fd72-77b4-4640-9d75-6f0f000c09ea e4f04026-8956-4d75-899b-bea86f4ac569 b3505ec3-5a03-4769-b6c0-fcfa9c98462c 05885891-261e-4af3-bb02-274c3417bcd7 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 243241c5-00de-4947-aa1b-721a7d0194c0 b45dfc5a-b9a1-406e-9470-bd4141c96f5d bf2debd4-72e6-4e63-9cb9-6b0a268b9ef0 a8350e37-7635-4ef3-9645-3d76898824c2 89e2d924-6cdd-4d4f-99bc-a31d89c047c3
# final chr15 dj het reads: 305f4723-c5ce-4249-bd79-e6f9cef2d891 ef4f8ce9-27c8-4391-8428-98481dc28dbf bc61673a-b89b-4729-8787-573a6a5778f0 4a9ec129-946a-40bb-b8c7-b92729d43c5c 38d74a0c-6b69-4a0d-a1c0-a2080772a624 d24e3b0b-1331-4ad2-9380-10b496d5c900 e02613db-5037-44e3-927a-315dc09cf40c 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b

cd ..
mkdir raw_ont_consensus
cd raw_ont_consensus
cp ../pjdj_continuations/seq_*.txt .
scripts/extract_uncorrected_seq_from_prefix.py seq_dj13.txt ../ont_to_pjdjgraph/corrected_chr13.fa ../ont.fa 10000 > raw_suffixes_dj13_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_pj13.txt ../ont_to_pjdjgraph/corrected_chr13.fa ../ont.fa 10000 > raw_suffixes_pj13_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_dj14.txt ../ont_to_pjdjgraph/corrected_chr14.fa ../ont.fa 10000 > raw_suffixes_dj14_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_pj14.txt ../ont_to_pjdjgraph/corrected_chr14.fa ../ont.fa 10000 > raw_suffixes_pj14_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_dj15.txt ../ont_to_pjdjgraph/corrected_chr15.fa ../ont.fa 10000 > raw_suffixes_dj15_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_pj15.txt ../ont_to_pjdjgraph/corrected_chr15.fa ../ont.fa 10000 > raw_suffixes_pj15_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_dj21.txt ../ont_to_pjdjgraph/corrected_chr21.fa ../ont.fa 10000 > raw_suffixes_dj21_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_pj21.txt ../ont_to_pjdjgraph/corrected_chr21.fa ../ont.fa 10000 > raw_suffixes_pj21_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_dj22.txt ../ont_to_pjdjgraph/corrected_chr22.fa ../ont.fa 10000 > raw_suffixes_dj22_all.fa
scripts/extract_uncorrected_seq_from_prefix.py seq_pj22.txt ../ont_to_pjdjgraph/corrected_chr22.fa ../ont.fa 10000 > raw_suffixes_pj22_all.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_dj13_all.fa | cut -d '_' -f 1 > raw_suffixes_dj13.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_pj13_all.fa | cut -d '_' -f 1 > raw_suffixes_pj13.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_dj14_all.fa | cut -d '_' -f 1 > raw_suffixes_dj14.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_pj14_all.fa | cut -d '_' -f 1 > raw_suffixes_pj14.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_dj15_all.fa | cut -d '_' -f 1 > raw_suffixes_dj15.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_pj15_all.fa | cut -d '_' -f 1 > raw_suffixes_pj15.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_dj21_all.fa | cut -d '_' -f 1 > raw_suffixes_dj21.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_pj21_all.fa | cut -d '_' -f 1 > raw_suffixes_pj21.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_dj22_all.fa | cut -d '_' -f 1 > raw_suffixes_dj22.fa
~/tmp/filter_fasta_by_size.py 45000 raw_suffixes_pj22_all.fa | cut -d '_' -f 1 > raw_suffixes_pj22.fa

# so chr13 dj final reads: 55465bda-f68a-4196-9df5-3b0ac947d6bb 63395e01-319c-4ae3-9c1f-f464dbc27457 60a9d4d0-ca95-45a6-a6ff-eef32d18991d 72729273-53ba-4221-8e9a-14271af27af1 536d68b4-5fd2-42d0-a627-76ff39e3c04c 0e64eabc-4c73-45ba-9e68-757579f9a44f 31555889-d794-4c9d-b376-5c9695abb9fd 418fd761-9e25-47b5-a52a-f53522f723e1 87dd474b-e372-4c16-bd98-e7e9ce2c65ad
echo '55465bda-f68a-4196-9df5-3b0ac947d6bb' > picked.txt
echo '63395e01-319c-4ae3-9c1f-f464dbc27457' >> picked.txt
echo '60a9d4d0-ca95-45a6-a6ff-eef32d18991d' >> picked.txt
echo '72729273-53ba-4221-8e9a-14271af27af1' >> picked.txt
echo '536d68b4-5fd2-42d0-a627-76ff39e3c04c' >> picked.txt
echo '0e64eabc-4c73-45ba-9e68-757579f9a44f' >> picked.txt
echo '31555889-d794-4c9d-b376-5c9695abb9fd' >> picked.txt
echo '418fd761-9e25-47b5-a52a-f53522f723e1' >> picked.txt
echo '87dd474b-e372-4c16-bd98-e7e9ce2c65ad' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj13.fa | scripts/pick_reads_stdin.py > dj13_reads.fa

# so chr13 pj final reads: 08653f96-b9ed-4090-84a0-80118a9c0fde a49093f7-5fe7-40ce-9b44-586af41f5d37 686d32dc-f718-426c-b22e-5ab9737daee4 9f18acc0-af09-4137-89b8-3fa68ae90546 f58db80f-d257-4155-ab04-da2bba4cab3e 5dc6b258-339f-42f6-b9eb-be57d4d8e87e 5845acba-1625-4c30-840f-6715d5200539 31985caf-a7c9-4d09-9240-af5717520e77 178fcd69-70bb-41fb-8b26-8ac5f64d57b4 ba3ca200-bb5f-4362-bc36-a554801e1a8e c2707e24-e31d-4266-97f1-c6de88d91ff8 21374449-b75f-4239-a187-fe739210600a
echo '08653f96-b9ed-4090-84a0-80118a9c0fde' > picked.txt
echo 'a49093f7-5fe7-40ce-9b44-586af41f5d37' >> picked.txt
echo '686d32dc-f718-426c-b22e-5ab9737daee4' >> picked.txt
echo '9f18acc0-af09-4137-89b8-3fa68ae90546' >> picked.txt
echo 'f58db80f-d257-4155-ab04-da2bba4cab3e' >> picked.txt
echo '5dc6b258-339f-42f6-b9eb-be57d4d8e87e' >> picked.txt
echo '5845acba-1625-4c30-840f-6715d5200539' >> picked.txt
echo '31985caf-a7c9-4d09-9240-af5717520e77' >> picked.txt
echo '178fcd69-70bb-41fb-8b26-8ac5f64d57b4' >> picked.txt
echo 'ba3ca200-bb5f-4362-bc36-a554801e1a8e' >> picked.txt
echo 'c2707e24-e31d-4266-97f1-c6de88d91ff8' >> picked.txt
echo '21374449-b75f-4239-a187-fe739210600a' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_pj13.fa | scripts/pick_reads_stdin.py > pj13_reads.fa

# so final chr14 dj normal: efb2ea32-e628-42bc-9253-ecc1c97df0b7 23d0b699-6b6c-4a0a-9f35-f64c89c307d0 d49dc75c-8dd3-477f-a3af-84713bda029b cf01d2c6-2512-460a-9614-07e33294be6b ccf8279e-b78a-44b2-b1e2-547bb6e833da 3c5b0999-df37-45e1-aa30-fdf4f9a349b8 bf077246-0e03-4b7f-8ea6-ce163d4dc99c
echo 'efb2ea32-e628-42bc-9253-ecc1c97df0b7' > picked.txt
echo '23d0b699-6b6c-4a0a-9f35-f64c89c307d0' >> picked.txt
echo 'd49dc75c-8dd3-477f-a3af-84713bda029b' >> picked.txt
echo 'cf01d2c6-2512-460a-9614-07e33294be6b' >> picked.txt
echo 'ccf8279e-b78a-44b2-b1e2-547bb6e833da' >> picked.txt
echo '3c5b0999-df37-45e1-aa30-fdf4f9a349b8' >> picked.txt
echo 'bf077246-0e03-4b7f-8ea6-ce163d4dc99c' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj14.fa | scripts/pick_reads_stdin.py > dj14_reads_normal.fa

# chr14 dj het: 09293939-e5a3-4b69-bb8a-ae1e617f9716 b0e694d4-e962-470b-a656-f2da060a2310 6b4c3194-760d-4f82-9008-f1cea1185b10 b62fe3d8-fdc4-4622-ac2e-e64e25f0b310 d78f2d3c-b7a2-43d9-8276-f2a67a48122f f2578dce-b2e5-4d4d-8969-f97d80616e19 75be7f73-4c49-4474-9e1c-1eb360bce1e4 d1cbf206-2286-405b-b10a-5f1c5c491493 99e2f6e6-8d01-46d8-aed1-61fdb2b7abce
echo '09293939-e5a3-4b69-bb8a-ae1e617f9716' > picked.txt
echo 'b0e694d4-e962-470b-a656-f2da060a2310' >> picked.txt
echo '6b4c3194-760d-4f82-9008-f1cea1185b10' >> picked.txt
echo 'b62fe3d8-fdc4-4622-ac2e-e64e25f0b310' >> picked.txt
echo 'd78f2d3c-b7a2-43d9-8276-f2a67a48122f' >> picked.txt
echo 'f2578dce-b2e5-4d4d-8969-f97d80616e19' >> picked.txt
echo '75be7f73-4c49-4474-9e1c-1eb360bce1e4' >> picked.txt
echo 'd1cbf206-2286-405b-b10a-5f1c5c491493' >> picked.txt
echo '99e2f6e6-8d01-46d8-aed1-61fdb2b7abce' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj14.fa | scripts/pick_reads_stdin.py > dj14_reads_het.fa

# so final chr14 pj reads: 657e50aa-53b9-4ab1-b047-fb9af7a7643c 8627995d-758e-4297-878c-b96152e854c0 8b344d6e-e4e3-400b-b2e6-6536ae100931 fd3e60e2-5df8-465f-803c-3d4ca67e5740 32dc764f-08b6-4294-a611-e3f4edf11a61 8116263e-bf90-435d-8c7a-a3ff1210632b 29b3df0c-43d4-4176-a62b-5d768111f243 302552ab-ead3-4f1d-8c2d-66ea52c42e65 47d602c3-d1a8-45ee-80ad-65f8cb01d2e3 1794a4dc-2d28-4088-9092-981799f3e543 b42a562d-2a1c-404e-b6c5-c8e985f496ee 205839a9-69e4-47c3-b996-91e77249d9fa 4b1ecccd-0235-489d-a60a-92d376afa9c2
echo '657e50aa-53b9-4ab1-b047-fb9af7a7643c' > picked.txt
echo '8627995d-758e-4297-878c-b96152e854c0' >> picked.txt
echo '8b344d6e-e4e3-400b-b2e6-6536ae100931' >> picked.txt
echo 'fd3e60e2-5df8-465f-803c-3d4ca67e5740' >> picked.txt
echo '32dc764f-08b6-4294-a611-e3f4edf11a61' >> picked.txt
echo '8116263e-bf90-435d-8c7a-a3ff1210632b' >> picked.txt
echo '29b3df0c-43d4-4176-a62b-5d768111f243' >> picked.txt
echo '302552ab-ead3-4f1d-8c2d-66ea52c42e65' >> picked.txt
echo '47d602c3-d1a8-45ee-80ad-65f8cb01d2e3' >> picked.txt
echo '1794a4dc-2d28-4088-9092-981799f3e543' >> picked.txt
echo 'b42a562d-2a1c-404e-b6c5-c8e985f496ee' >> picked.txt
echo '205839a9-69e4-47c3-b996-91e77249d9fa' >> picked.txt
echo '4b1ecccd-0235-489d-a60a-92d376afa9c2' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_pj14.fa | scripts/pick_reads_stdin.py > pj14_reads.fa

# so chr15 pj normal final reads: 5d11980e-d392-42a0-9978-4a82d9c59125 9b934d9f-fae4-46e6-a51c-2bf664fe0468 dc32b8da-06a8-4344-a8ad-f41746ad24ec 97b3a9ae-1db5-4fdc-83a6-bacd24cef28c 837eb607-2736-42a2-842b-926786bd6997 32a31cd2-98f0-4423-92c3-6c952cad612c b015ddc9-18fc-4719-9360-e7dfe77fbc3d
echo '5d11980e-d392-42a0-9978-4a82d9c59125' > picked.txt
echo '9b934d9f-fae4-46e6-a51c-2bf664fe0468' >> picked.txt
echo 'dc32b8da-06a8-4344-a8ad-f41746ad24ec' >> picked.txt
echo '97b3a9ae-1db5-4fdc-83a6-bacd24cef28c' >> picked.txt
echo '837eb607-2736-42a2-842b-926786bd6997' >> picked.txt
echo '32a31cd2-98f0-4423-92c3-6c952cad612c' >> picked.txt
echo 'b015ddc9-18fc-4719-9360-e7dfe77fbc3d' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_pj15.fa | scripts/pick_reads_stdin.py > pj15_reads_normal.fa

# chr15 pj het final reads: ef4f8ce9-27c8-4391-8428-98481dc28dbf dc53f8ef-83cf-4f3b-ab9e-420805cdbd50 6303c6f7-4c3d-4fec-b5d7-61bd6e65081c f847d286-9365-4941-9360-0d29f358cd30 406c2f52-36fb-450b-b398-ce3987a87eab 77921980-9397-4a7d-b647-3660a90b392b ecc8f1f8-3864-44a9-9a66-bc897316de83
echo 'ef4f8ce9-27c8-4391-8428-98481dc28dbf' > picked.txt
echo 'dc53f8ef-83cf-4f3b-ab9e-420805cdbd50' >> picked.txt
echo '6303c6f7-4c3d-4fec-b5d7-61bd6e65081c' >> picked.txt
echo 'f847d286-9365-4941-9360-0d29f358cd30' >> picked.txt
echo '406c2f52-36fb-450b-b398-ce3987a87eab' >> picked.txt
echo '77921980-9397-4a7d-b647-3660a90b392b' >> picked.txt
echo 'ecc8f1f8-3864-44a9-9a66-bc897316de83' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_pj15.fa | scripts/pick_reads_stdin.py > pj15_reads_het.fa

# so final chr15 dj normal reads: 7202b994-fc29-4496-b4ff-2fdf2bb3ddf5 2823fd72-77b4-4640-9d75-6f0f000c09ea e4f04026-8956-4d75-899b-bea86f4ac569 b3505ec3-5a03-4769-b6c0-fcfa9c98462c 05885891-261e-4af3-bb02-274c3417bcd7 57bc9d5b-e534-4100-af9c-6e2b58ee4fd6 38c84348-c2ac-4233-82c9-a0dba9f057f0 9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a 6053da9f-51c8-4d4b-ae4c-d7f4d912a97c 243241c5-00de-4947-aa1b-721a7d0194c0 b45dfc5a-b9a1-406e-9470-bd4141c96f5d bf2debd4-72e6-4e63-9cb9-6b0a268b9ef0 a8350e37-7635-4ef3-9645-3d76898824c2 89e2d924-6cdd-4d4f-99bc-a31d89c047c3
echo '7202b994-fc29-4496-b4ff-2fdf2bb3ddf5' > picked.txt
echo '2823fd72-77b4-4640-9d75-6f0f000c09ea' >> picked.txt
echo 'e4f04026-8956-4d75-899b-bea86f4ac569' >> picked.txt
echo 'b3505ec3-5a03-4769-b6c0-fcfa9c98462c' >> picked.txt
echo '05885891-261e-4af3-bb02-274c3417bcd7' >> picked.txt
echo '57bc9d5b-e534-4100-af9c-6e2b58ee4fd6' >> picked.txt
echo '38c84348-c2ac-4233-82c9-a0dba9f057f0' >> picked.txt
echo '9b39e06d-0ce1-44bc-aa08-c80f5cf82e6a' >> picked.txt
echo '6053da9f-51c8-4d4b-ae4c-d7f4d912a97c' >> picked.txt
echo '243241c5-00de-4947-aa1b-721a7d0194c0' >> picked.txt
echo 'b45dfc5a-b9a1-406e-9470-bd4141c96f5d' >> picked.txt
echo 'bf2debd4-72e6-4e63-9cb9-6b0a268b9ef0' >> picked.txt
echo 'a8350e37-7635-4ef3-9645-3d76898824c2' >> picked.txt
echo '89e2d924-6cdd-4d4f-99bc-a31d89c047c3' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj15.fa | scripts/pick_reads_stdin.py > dj15_reads_normal.fa

# final chr15 dj het reads: 305f4723-c5ce-4249-bd79-e6f9cef2d891 ef4f8ce9-27c8-4391-8428-98481dc28dbf bc61673a-b89b-4729-8787-573a6a5778f0 4a9ec129-946a-40bb-b8c7-b92729d43c5c 38d74a0c-6b69-4a0d-a1c0-a2080772a624 d24e3b0b-1331-4ad2-9380-10b496d5c900 e02613db-5037-44e3-927a-315dc09cf40c 7ff2268c-7b2d-4c21-b2fa-e0757ba9074b
echo '305f4723-c5ce-4249-bd79-e6f9cef2d891' > picked.txt
echo 'ef4f8ce9-27c8-4391-8428-98481dc28dbf' >> picked.txt
echo 'bc61673a-b89b-4729-8787-573a6a5778f0' >> picked.txt
echo '4a9ec129-946a-40bb-b8c7-b92729d43c5c' >> picked.txt
echo '38d74a0c-6b69-4a0d-a1c0-a2080772a624' >> picked.txt
echo 'd24e3b0b-1331-4ad2-9380-10b496d5c900' >> picked.txt
echo 'e02613db-5037-44e3-927a-315dc09cf40c' >> picked.txt
echo '7ff2268c-7b2d-4c21-b2fa-e0757ba9074b' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj15.fa | scripts/pick_reads_stdin.py > dj15_reads_het.fa

# so chr21 dj final normal reads: f598bf95-f28d-418d-9c1f-8969046dc13a 171ec83e-0cda-4ead-9469-d683396c14b8 06dd4d9a-7a55-42c8-84a6-c2e4b3f30163 fe220ca9-c812-43ba-aa9f-2644c44b8751 4dbef5b1-6a34-44f5-b807-2002122ce0ee be230842-55d9-44f8-acb5-a2cc3fba6b93 1b1e4f26-d854-46a4-b876-32cc46afadb6 5634e9fb-9df9-422e-91b0-cfe3315cb3bf 4c1ee2f1-bdd7-4948-b02a-6484185c316c
echo 'f598bf95-f28d-418d-9c1f-8969046dc13a' > picked.txt
echo '171ec83e-0cda-4ead-9469-d683396c14b8' >> picked.txt
echo '06dd4d9a-7a55-42c8-84a6-c2e4b3f30163' >> picked.txt
echo 'fe220ca9-c812-43ba-aa9f-2644c44b8751' >> picked.txt
echo '4dbef5b1-6a34-44f5-b807-2002122ce0ee' >> picked.txt
echo 'be230842-55d9-44f8-acb5-a2cc3fba6b93' >> picked.txt
echo '1b1e4f26-d854-46a4-b876-32cc46afadb6' >> picked.txt
echo '5634e9fb-9df9-422e-91b0-cfe3315cb3bf' >> picked.txt
echo '4c1ee2f1-bdd7-4948-b02a-6484185c316c' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj21.fa | scripts/pick_reads_stdin.py > dj21_reads_normal.fa

# chr21 dj final het reads: 95482788-ccc9-4b11-b18d-bd2356a457f7 6a7cf634-37c7-4713-a07d-9d03e0c23a1c f78bedbb-7dab-4ecb-b3de-b3d0f37efd42 16b73135-0dc1-4af0-b276-a11ec962d380 7f028c70-6efe-436a-82e1-d9453ead77dd
echo '95482788-ccc9-4b11-b18d-bd2356a457f7' > picked.txt
echo '6a7cf634-37c7-4713-a07d-9d03e0c23a1c' >> picked.txt
echo 'f78bedbb-7dab-4ecb-b3de-b3d0f37efd42' >> picked.txt
echo '16b73135-0dc1-4af0-b276-a11ec962d380' >> picked.txt
echo '7f028c70-6efe-436a-82e1-d9453ead77dd' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_dj21.fa | scripts/pick_reads_stdin.py > dj21_reads_het.fa

# so chr21 pj final reads: all of them
cut -d '_' -f 1 < raw_suffixes_pj21.fa > pj21_reads.fa

# so chr22 dj final reads: all of them
cut -d '_' -f 1 < raw_suffixes_dj22.fa > dj22_reads.fa

# so chr22 pj final reads: 505428e3-9ac6-483a-b791-7505fbe232d9 eef2fe73-03d6-4085-b69a-5567fed38f7a 863c69da-3454-41b7-964f-48ad28abd0f9 d8dc9583-6830-4f02-a6ae-5ff40c28909c 980bb713-8be4-4578-b79b-8d9ab16a19e0 aa16c4b7-f83e-41e9-b127-0a0025bf6131 f40c145c-9210-479b-b84f-f03cb7c68450 fdd2f161-f8ea-4348-9877-355b3e258edb 59bdba44-75b7-45e8-a6a2-cb67a602ec10 5ccb66d8-6eef-41a0-80bd-c6e19db2afc9 b204e536-7ef3-4595-91d1-fe1b0729a578 6906feed-66f7-4df0-a673-3d12ef6206be 0e1c059b-855d-4829-b988-8a14ab612a2c 977c3020-9720-497e-ba93-d24acab2c3e7 7ec9c3a0-9fa3-496b-8cca-a11891de75f7
echo '505428e3-9ac6-483a-b791-7505fbe232d9' > picked.txt
echo 'eef2fe73-03d6-4085-b69a-5567fed38f7a' >> picked.txt
echo '863c69da-3454-41b7-964f-48ad28abd0f9' >> picked.txt
echo 'd8dc9583-6830-4f02-a6ae-5ff40c28909c' >> picked.txt
echo '980bb713-8be4-4578-b79b-8d9ab16a19e0' >> picked.txt
echo 'aa16c4b7-f83e-41e9-b127-0a0025bf6131' >> picked.txt
echo 'f40c145c-9210-479b-b84f-f03cb7c68450' >> picked.txt
echo 'fdd2f161-f8ea-4348-9877-355b3e258edb' >> picked.txt
echo '59bdba44-75b7-45e8-a6a2-cb67a602ec10' >> picked.txt
echo '5ccb66d8-6eef-41a0-80bd-c6e19db2afc9' >> picked.txt
echo 'b204e536-7ef3-4595-91d1-fe1b0729a578' >> picked.txt
echo '6906feed-66f7-4df0-a673-3d12ef6206be' >> picked.txt
echo '0e1c059b-855d-4829-b988-8a14ab612a2c' >> picked.txt
echo '977c3020-9720-497e-ba93-d24acab2c3e7' >> picked.txt
echo '7ec9c3a0-9fa3-496b-8cca-a11891de75f7' >> picked.txt
cut -d '_' -f 1 < raw_suffixes_pj22.fa | scripts/pick_reads_stdin.py > pj22_reads.fa

scripts/extract_longest_seq.py < dj13_reads.fa > longest_dj13.fa
scripts/extract_longest_seq.py < pj13_reads.fa > longest_pj13.fa
scripts/extract_longest_seq.py < dj14_reads_normal.fa > longest_dj14_normal.fa
scripts/extract_longest_seq.py < dj14_reads_het.fa > longest_dj14_het.fa
scripts/extract_longest_seq.py < pj14_reads.fa > longest_pj14.fa
scripts/extract_longest_seq.py < pj15_reads_normal.fa > longest_pj15_normal.fa
scripts/extract_longest_seq.py < pj15_reads_het.fa > longest_pj15_het.fa
scripts/extract_longest_seq.py < dj15_reads_normal.fa > longest_dj15_normal.fa
scripts/extract_longest_seq.py < dj15_reads_het.fa > longest_dj15_het.fa
scripts/extract_longest_seq.py < dj21_reads_normal.fa > longest_dj21_normal.fa
scripts/extract_longest_seq.py < dj21_reads_het.fa > longest_dj21_het.fa
scripts/extract_longest_seq.py < pj21_reads.fa > longest_pj21.fa
scripts/extract_longest_seq.py < dj22_reads.fa > longest_dj22.fa
scripts/extract_longest_seq.py < pj22_reads.fa > longest_pj22.fa

minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj13.fa dj13_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj13_reads.fa alns_selected.sam longest_dj13.fa > dj13_consensus.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj13.fa pj13_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj13_reads.fa alns_selected.sam longest_pj13.fa > pj13_consensus.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj14_normal.fa dj14_reads_normal.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj14_reads_normal.fa alns_selected.sam longest_dj14_normal.fa > dj14_consensus_normal.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj14_het.fa dj14_reads_het.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj14_reads_het.fa alns_selected.sam longest_dj14_het.fa > dj14_consensus_het.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj14.fa pj14_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj14_reads.fa alns_selected.sam longest_pj14.fa > pj14_consensus.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj15_normal.fa pj15_reads_normal.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj15_reads_normal.fa alns_selected.sam longest_pj15_normal.fa > pj15_consensus_normal.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj15_het.fa pj15_reads_het.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj15_reads_het.fa alns_selected.sam longest_pj15_het.fa > pj15_consensus_het.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj15_normal.fa dj15_reads_normal.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj15_reads_normal.fa alns_selected.sam longest_dj15_normal.fa > dj15_consensus_normal.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj15_het.fa dj15_reads_het.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj15_reads_het.fa alns_selected.sam longest_dj15_het.fa > dj15_consensus_het.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj21_normal.fa dj21_reads_normal.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj21_reads_normal.fa alns_selected.sam longest_dj21_normal.fa > dj21_consensus_normal.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj21_het.fa dj21_reads_het.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj21_reads_het.fa alns_selected.sam longest_dj21_het.fa > dj21_consensus_het.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj21.fa pj21_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj21_reads.fa alns_selected.sam longest_pj21.fa > pj21_consensus.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj22.fa dj22_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj22_reads.fa alns_selected.sam longest_dj22.fa > dj22_consensus.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj22.fa pj22_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj22_reads.fa alns_selected.sam longest_pj22.fa > pj22_consensus.fa


minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj15_het.fa pj15_reads_het.fa > alns_pj15_het.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_pj15_het.sam > alns_pj15_het_selected.sam
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj15_het.fa dj15_reads_het.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_dj15_het_dj_valid.sam
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj15_het.fa dj15_reads_het.fa > alns_dj15_het.sam
scripts/filter_chr15_dj_sam_bw.py longest_pj15_het.fa dj15_reads_het.fa 0 < alns_dj15_het.sam > alns_dj15_het_selected.sam
cat alns_pj15_het_selected.sam > alns_het15_selected.sam
grep -v '@' < alns_dj15_het_selected.sam >> alns_het15_selected.sam
cat pj15_reads_het.fa dj15_reads_het.fa > het15_reads.fa
awk '$1!="ef4f8ce9-27c8-4391-8428-98481dc28dbf"{print;}' < alns_het15_selected.sam > alns_het15_selected_noref.sam
# $ grep -n ef4f8ce9 < het15_reads.fa
# 1:>ef4f8ce9-27c8-4391-8428-98481dc28dbf
# $ wc -l het15_reads.fa
# 28 het15_reads.fa
sed -n 3,14p < het15_reads.fa > het15_reads_fix.fa
sed -n 17,30p < het15_reads.fa >> het15_reads_fix.fa
racon -t 40 het15_reads_fix.fa alns_het15_selected_noref.sam longest_pj15_het.fa > chr15_consensus_het.fa
samtools view -b alns_het15_selected_noref.sam | samtools sort > alns_het15_selected_noref.bam

grep -v '>' < dj13_consensus.fa | awk '{print ">dj13_consensus"; print $1;}' > dj13_consensus_fixname.fa
grep -v '>' < dj14_consensus_normal.fa | awk '{print ">dj14_consensus_normal"; print $1;}' > dj14_consensus_normal_fixname.fa
grep -v '>' < dj14_consensus_het.fa | awk '{print ">dj14_consensus_het"; print $1;}' > dj14_consensus_het_fixname.fa
grep -v '>' < dj15_consensus_normal.fa | awk '{print ">dj15_consensus_normal"; print $1;}' > dj15_consensus_normal_fixname.fa
grep -v '>' < dj21_consensus_normal.fa | awk '{print ">dj21_consensus_normal"; print $1;}' > dj21_consensus_normal_fixname.fa
grep -v '>' < dj21_consensus_het.fa | awk '{print ">dj21_consensus_het"; print $1;}' > dj21_consensus_het_fixname.fa
grep -v '>' < dj22_consensus.fa | awk '{print ">dj22_consensus"; print $1;}' > dj22_consensus_fixname.fa
grep -v '>' < pj13_consensus.fa | awk '{print ">pj13_consensus"; print $1;}' > pj13_consensus_fixname.fa
grep -v '>' < pj14_consensus.fa | awk '{print ">pj14_consensus"; print $1;}' > pj14_consensus_fixname.fa
grep -v '>' < pj15_consensus_normal.fa | awk '{print ">pj15_consensus_normal"; print $1;}' > pj15_consensus_normal_fixname.fa
grep -v '>' < pj21_consensus.fa | awk '{print ">pj21_consensus"; print $1;}' > pj21_consensus_fixname.fa
grep -v '>' < pj22_consensus.fa | awk '{print ">pj22_consensus"; print $1;}' > pj22_consensus_fixname.fa
grep -v '>' < chr15_consensus_het.fa | awk '{print ">chr15_consensus_het"; print $1;}' > chr15_consensus_het_fixname.fa

cat *_consensus*_fixname.fa > consensuses.fa

/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f consensuses.fa -a alns_consensues.gaf --corrected-out hifigraph_corrected_consensuses.fa -t 40 -x vg --precise-clipping 0.70 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_hifipolish.txt 2> stderr_ga_hifipolish.txt

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_fixname.fa dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_fixname.fa pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_fixname.fa dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_fixname.fa dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_fixname.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_fixname.fa pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_fixname.fa pj15_reads_het.fa dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_fixname.fa dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_fixname.fa dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_fixname.fa dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_fixname.fa pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_fixname.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_fixname.fa pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj22.bam
samtools merge alns_raw_to_cons.bam alns_selected_raw_to_cons_*.bam

# looks wrong: dj22, pj14
# also has weirdness in the ref dj22 and pj14, which don't align to the arms???
# unconsensused: dj21 het, most of pj14

minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj22.fa dj22_reads.fa | samtools view -b | samtools sort > alns_dj22_longest.bam
minimap2 -x map-ont -c -f 0 -t 40 longest_dj22.fa dj22_reads.fa > alns_dj22_longest.paf

# maybe the longest is somehow a poor read?
# $ grep -n 9d79321e-ad85-431f-be4b-c03f32dd69fd dj22_reads.fa
# 29:>9d79321e-ad85-431f-be4b-c03f32dd69fd
sed -n 29,30p < dj22_reads.fa > longest_dj22_2.fa
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj22_2.fa dj22_reads.fa | samtools view -b | samtools sort > alns_dj22_longest_2.bam
minimap2 -x map-ont -c -f 0 -t 40 longest_dj22_2.fa dj22_reads.fa > alns_dj22_longest_2.paf
# sure, good enough
minimap2 -x map-ont -a -c -f 0 -t 40 longest_dj22_2.fa dj22_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 dj22_reads.fa alns_selected.sam longest_dj22_2.fa > dj22_consensus_2.fa
grep -v '>' < dj22_consensus_2.fa | awk '{print ">dj22_consensus"; print $1;}' > dj22_consensus_fixname.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_fixname.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_dj22.bam
cat *_consensus*_fixname.fa > consensuses.fa
samtools merge alns_raw_to_cons.bam alns_selected_raw_to_cons_*.bam

# what about pj14
minimap2 -x map-ont -c -f 0 -t 40 longest_pj14.fa pj14_reads.fa > alns_pj14_longest.paf

# breaks at 160k, maybe the read is somehow poor?
# $ grep -n fd3e60e2-5df8-465f-803c-3d4ca67e5740 pj14_reads.fa
# 7:>fd3e60e2-5df8-465f-803c-3d4ca67e5740
sed -n 7,8p < pj14_reads.fa > longest_pj14_2.fa
minimap2 -x map-ont -c -f 0 -t 40 longest_pj14_2.fa pj14_reads.fa > alns_pj14_longest_2.paf
# some breaks but looks good enough i guess
minimap2 -x map-ont -a -c -f 0 -t 40 longest_pj14_2.fa pj14_reads.fa | awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 pj14_reads.fa alns_selected.sam longest_pj14_2.fa > pj14_consensus_2.fa
grep -v '>' < pj14_consensus_2.fa | awk '{print ">pj14_consensus"; print $1;}' > pj14_consensus_fixname.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_fixname.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_cons_pj14.bam
cat *_consensus*_fixname.fa > consensuses.fa
samtools merge alns_raw_to_cons.bam alns_selected_raw_to_cons_*.bam
# looks better

/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f consensuses.fa -a alns_consensues.gaf --corrected-out hifigraph_corrected_consensuses.fa -t 40 -x vg --precise-clipping 0.70 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_hifipolish.txt 2> stderr_ga_hifipolish.txt
# looks fine
scripts/extract_extended_path.py ../pjdj-mergegraph.gfa < alns_consensues.gaf | sed 's/_[0-9]*_[0-9]*_[0-9]*//g' > consensuses_polished.fa

# fix the line numbers if rerunning!!
sed -n 23,24p < consensuses_polished.fa > dj13_consensus_polished.fa
sed -n 13,14p < consensuses_polished.fa > pj13_consensus_polished.fa
sed -n 3,4p < consensuses_polished.fa > dj14_consensus_het_polished.fa
sed -n 21,22p < consensuses_polished.fa > dj14_consensus_normal_polished.fa
sed -n 1,2p < consensuses_polished.fa > pj14_consensus_polished.fa
sed -n 9,10p < consensuses_polished.fa > dj15_consensus_normal_polished.fa
sed -n 5,6p < consensuses_polished.fa > pj15_consensus_normal_polished.fa
sed -n 7,8p < consensuses_polished.fa > chr15_consensus_het_polished.fa
sed -n 19,20p < consensuses_polished.fa > dj21_consensus_normal_polished.fa
sed -n 25,26p < consensuses_polished.fa > dj21_consensus_het_polished.fa
sed -n 15,16p < consensuses_polished.fa > pj21_consensus_polished.fa
sed -n 17,18p < consensuses_polished.fa > dj22_consensus_polished.fa
sed -n 11,12p < consensuses_polished.fa > pj22_consensus_polished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_polished.fa dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_polished.fa pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_polished.fa dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_polished.fa dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_polished.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_polished.fa pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa pj15_reads_het.fa dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_polished.fa dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_polished.fa dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_polished.fa dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_polished.fa pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_polished.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_polished.fa pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj22.bam
samtools merge alns_raw_to_polished_cons.bam alns_selected_raw_to_polished_cons_*.bam

# maybe polishable areas:
# dj13 19197 (hpc del) 19610 (hpc del) 21062 (hpc) 54971 (snp) 96329 (hpc ins 1bp) 102003 (snp)
# pj14 20700 (lots) 21314 (hpc) 21945 (snp) 28415 (del) 34497 (del) 61411 (dinuc)

# these offsets have to be chosen manually because the hifi polishing extended the sequences
minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_polished.fa dj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-10500-$6 > -5000 && $4-10500-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj13_reads.fa alns_selected.sam dj13_consensus_polished.fa | cut -d ' ' -f 1 > dj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_polished.fa pj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-9000-$6 > -5000 && $4-9000-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u pj13_reads.fa alns_selected.sam pj13_consensus_polished.fa | cut -d ' ' -f 1 > pj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_polished.fa dj14_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj14_reads_normal.fa alns_selected.sam dj14_consensus_normal_polished.fa | cut -d ' ' -f 1 > dj14_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_polished.fa dj14_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj14_reads_het.fa alns_selected.sam dj14_consensus_het_polished.fa | cut -d ' ' -f 1 > dj14_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_polished.fa pj14_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-2000-$6 > -5000 && $4-2000-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u pj14_reads.fa alns_selected.sam pj14_consensus_polished.fa | cut -d ' ' -f 1 > pj14_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_polished.fa dj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-12000-$6 > -5000 && $4-12000-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj15_reads_normal.fa alns_selected.sam dj15_consensus_normal_polished.fa | cut -d ' ' -f 1 > dj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_polished.fa pj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-1200-$6 > -5000 && $4-1200-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u pj15_reads_normal.fa alns_selected.sam pj15_consensus_normal_polished.fa | cut -d ' ' -f 1 > pj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_polished.fa dj21_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj21_reads_normal.fa alns_selected.sam dj21_consensus_normal_polished.fa | cut -d ' ' -f 1 > dj21_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_polished.fa dj21_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj21_reads_het.fa alns_selected.sam dj21_consensus_het_polished.fa | cut -d ' ' -f 1 > dj21_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_polished.fa pj21_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7500-$6 > -5000 && $4-7500-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u pj21_reads.fa alns_selected.sam pj21_consensus_polished.fa | cut -d ' ' -f 1 > pj21_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_polished.fa dj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7700-$6 > -5000 && $4-7700-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u dj22_reads.fa alns_selected.sam dj22_consensus_polished.fa | cut -d ' ' -f 1 > dj22_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_polished.fa pj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-8500-$6 > -5000 && $4-8500-$6 < 5000) print;}' > alns_selected.sam
racon -t 40 -u pj22_reads.fa alns_selected.sam pj22_consensus_polished.fa | cut -d ' ' -f 1 > pj22_consensus_repolished.fa

# chr15 het
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa pj15_reads_het.fa > alns_pj15_het.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_pj15_het.sam > alns_pj15_het_selected.sam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa dj15_reads_het.fa > alns_dj15_het.sam
scripts/filter_chr15_dj_sam_bw.py chr15_consensus_het_polished.fa dj15_reads_het.fa 12000 < alns_dj15_het.sam > alns_dj15_het_selected.sam
cat alns_pj15_het_selected.sam > alns_het15_selected.sam
grep -v '@' < alns_dj15_het_selected.sam >> alns_het15_selected.sam
awk '$1!="ef4f8ce9-27c8-4391-8428-98481dc28dbf"{print;}' < alns_het15_selected.sam > alns_het15_selected_noref.sam
racon -t 40 -u het15_reads_fix.fa alns_het15_selected_noref.sam chr15_consensus_het_polished.fa | cut -d ' ' -f 1 > chr15_consensus_het_repolished.fa

cat *_consensus*_repolished.fa > consensuses_repolished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_repolished.fa dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_repolished.fa pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_repolished.fa dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_repolished.fa dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_repolished.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_repolished.fa pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_repolished.fa pj15_reads_het.fa dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_repolished.fa dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_repolished.fa dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_repolished.fa dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_repolished.fa pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_repolished.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_repolished.fa pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj22.bam
samtools merge alns_raw_to_repolished_cons.bam alns_selected_raw_to_repolished_cons_*.bam

/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f consensuses_repolished.fa -a alns_consensues_repolished.gaf -t 40 -x vg --precise-clipping 0.70 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_hifipolish_re.txt 2> stderr_ga_hifipolish_re.txt

# seems unreliable. racon might have introduced errors?
# polish only very clear errors, supported by at least 4 reads and all reads must support the same correction

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_polished.fa dj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-10500-$6 > -5000 && $4-10500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj13_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj13_consensus_polished.fa 4 < pileup.txt > dj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_polished.fa dj14_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_het_polished.fa 4 < pileup.txt > dj14_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_polished.fa dj14_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_normal_polished.fa 4 < pileup.txt > dj14_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_polished.fa dj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-12000-$6 > -5000 && $4-12000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj15_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj15_consensus_normal_polished.fa 4 < pileup.txt > dj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_polished.fa dj21_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_normal_polished.fa 4 < pileup.txt > dj21_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_polished.fa dj21_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_het_polished.fa 4 < pileup.txt > dj21_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_polished.fa dj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7700-$6 > -5000 && $4-7700-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj22_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj22_consensus_polished.fa 4 < pileup.txt > dj22_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_polished.fa pj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-9000-$6 > -5000 && $4-9000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj13_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj13_consensus_polished.fa 4 < pileup.txt > pj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_polished.fa pj14_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-2000-$6 > -5000 && $4-2000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj14_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj14_consensus_polished.fa 4 < pileup.txt > pj14_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_polished.fa pj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-1200-$6 > -5000 && $4-1200-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj15_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj15_consensus_normal_polished.fa 4 < pileup.txt > pj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_polished.fa pj21_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7500-$6 > -5000 && $4-7500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj21_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj21_consensus_polished.fa 4 < pileup.txt > pj21_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_polished.fa pj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-8500-$6 > -5000 && $4-8500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj22_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj22_consensus_polished.fa 4 < pileup.txt > pj22_consensus_repolished.fa

# chr15 het
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa pj15_reads_het.fa > alns_pj15_het.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_pj15_het.sam > alns_pj15_het_selected.sam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa dj15_reads_het.fa > alns_dj15_het.sam
scripts/filter_chr15_dj_sam_bw.py chr15_consensus_het_polished.fa dj15_reads_het.fa 12000 < alns_dj15_het.sam > alns_dj15_het_selected.sam
cat alns_pj15_het_selected.sam > alns_het15_selected.sam
grep -v '@' < alns_dj15_het_selected.sam >> alns_het15_selected.sam
awk '$1!="ef4f8ce9-27c8-4391-8428-98481dc28dbf"{print;}' < alns_het15_selected.sam > alns_het15_selected_noref.sam
samtools view -b alns_het15_selected_noref.sam | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f chr15_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py chr15_consensus_het_polished.fa 4 < pileup.txt > chr15_consensus_het_repolished.fa

# maybe better?
cat *_consensus*_repolished.fa > consensuses_repolished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_repolished.fa dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_repolished.fa pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_repolished.fa dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_repolished.fa dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_repolished.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_repolished.fa pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_repolished.fa pj15_reads_het.fa dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_repolished.fa dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_repolished.fa dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_repolished.fa dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_repolished.fa pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_repolished.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_repolished.fa pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj22.bam
samtools merge alns_raw_to_repolished_cons.bam alns_selected_raw_to_repolished_cons_*.bam

/usr/bin/time -v GraphAligner -g ../pjdj-mergegraph.gfa -f consensuses_repolished.fa -a alns_consensues_repolished.gaf -t 40 -x vg --precise-clipping 0.70 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_hifipolish_re.txt 2> stderr_ga_hifipolish_re.txt

# still has some small things to fix!
# pj14: 28403 (del)

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_repolished.fa dj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-10500-$6 > -5000 && $4-10500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj13_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj13_consensus_repolished.fa 4 < pileup.txt > dj13_consensus_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_repolished.fa dj14_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_het_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_het_repolished.fa 4 < pileup.txt > dj14_consensus_het_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_repolished.fa dj14_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11500-$6 > -5000 && $4-11500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_normal_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_normal_repolished.fa 4 < pileup.txt > dj14_consensus_normal_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_repolished.fa dj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-12000-$6 > -5000 && $4-12000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj15_consensus_normal_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj15_consensus_normal_repolished.fa 4 < pileup.txt > dj15_consensus_normal_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_repolished.fa dj21_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_normal_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_normal_repolished.fa 4 < pileup.txt > dj21_consensus_normal_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_repolished.fa dj21_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-11100-$6 > -5000 && $4-11100-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_het_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_het_repolished.fa 4 < pileup.txt > dj21_consensus_het_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_repolished.fa dj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7700-$6 > -5000 && $4-7700-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj22_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj22_consensus_repolished.fa 4 < pileup.txt > dj22_consensus_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_repolished.fa pj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-9000-$6 > -5000 && $4-9000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj13_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj13_consensus_repolished.fa 4 < pileup.txt > pj13_consensus_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_repolished.fa pj14_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-2000-$6 > -5000 && $4-2000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj14_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj14_consensus_repolished.fa 4 < pileup.txt > pj14_consensus_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_repolished.fa pj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-1200-$6 > -5000 && $4-1200-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj15_consensus_normal_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj15_consensus_normal_repolished.fa 4 < pileup.txt > pj15_consensus_normal_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_repolished.fa pj21_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-7500-$6 > -5000 && $4-7500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj21_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj21_consensus_repolished.fa 4 < pileup.txt > pj21_consensus_rerepolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_repolished.fa pj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-8500-$6 > -5000 && $4-8500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj22_consensus_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj22_consensus_repolished.fa 4 < pileup.txt > pj22_consensus_rerepolished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_repolished.fa pj15_reads_het.fa > alns_pj15_het.sam
awk '{if ($4-$6 > -5000 && $4-$6 < 5000) print;}' < alns_pj15_het.sam > alns_pj15_het_selected.sam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_repolished.fa dj15_reads_het.fa > alns_dj15_het.sam
scripts/filter_chr15_dj_sam_bw.py chr15_consensus_het_repolished.fa dj15_reads_het.fa 12000 < alns_dj15_het.sam > alns_dj15_het_selected.sam
cat alns_pj15_het_selected.sam > alns_het15_selected.sam
grep -v '@' < alns_dj15_het_selected.sam >> alns_het15_selected.sam
awk '$1!="ef4f8ce9-27c8-4391-8428-98481dc28dbf"{print;}' < alns_het15_selected.sam > alns_het15_selected_noref.sam
samtools view -b alns_het15_selected_noref.sam | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f chr15_consensus_het_repolished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py chr15_consensus_het_repolished.fa 4 < pileup.txt > chr15_consensus_het_rerepolished.fa

cat *_consensus*_rerepolished.fa > consensuses_rerepolished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_rerepolished.fa dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_rerepolished.fa pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_rerepolished.fa dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_rerepolished.fa dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_rerepolished.fa pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_rerepolished.fa pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_rerepolished.fa pj15_reads_het.fa dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_rerepolished.fa dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_rerepolished.fa dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_rerepolished.fa dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_rerepolished.fa pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_rerepolished.fa dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_rerepolished.fa pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_rerepolished_cons_pj22.bam
samtools merge alns_raw_to_rerepolished_cons.bam alns_selected_raw_to_rerepolished_cons_*.bam

cd ..
mkdir mbg_nocollapse
MBG -i chr13/corrected2.fa -o mbg_nocollapse/chr13.gfa -k 501 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
MBG -i chr14/corrected2.fa -o mbg_nocollapse/chr14.gfa -k 501 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
MBG -i chr15/corrected2.fa -o mbg_nocollapse/chr15.gfa -k 501 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
MBG -i chr21/corrected2.fa -o mbg_nocollapse/chr21.gfa -k 501 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
MBG -i chr22/corrected2.fa -o mbg_nocollapse/chr22.gfa -k 501 -w 5 -a 1 -u 2 --blunt --no-hpc --collapse-hpc
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/chr13.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/chr13-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/chr14.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/chr14-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/chr15.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/chr15-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/chr21.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/chr21-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/chr22.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/chr22-clean.gfa
awk '$1=="S"{print "S\tchr13_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr13_" $2 "\t" $3 "\tchr13_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/chr13-clean.gfa > mbg_nocollapse/chr13-renamed.gfa
awk '$1=="S"{print "S\tchr14_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr14_" $2 "\t" $3 "\tchr14_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/chr14-clean.gfa > mbg_nocollapse/chr14-renamed.gfa
awk '$1=="S"{print "S\tchr15_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr15_" $2 "\t" $3 "\tchr15_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/chr15-clean.gfa > mbg_nocollapse/chr15-renamed.gfa
awk '$1=="S"{print "S\tchr21_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr21_" $2 "\t" $3 "\tchr21_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/chr21-clean.gfa > mbg_nocollapse/chr21-renamed.gfa
awk '$1=="S"{print "S\tchr22_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr22_" $2 "\t" $3 "\tchr22_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/chr22-clean.gfa > mbg_nocollapse/chr22-renamed.gfa
scripts/pick_largest_component.py < mbg_nocollapse/chr13-renamed.gfa > mbg_nocollapse/pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/chr14-renamed.gfa >> mbg_nocollapse/pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/chr15-renamed.gfa >> mbg_nocollapse/pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/chr21-renamed.gfa >> mbg_nocollapse/pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/chr22-renamed.gfa >> mbg_nocollapse/pjdj-mergegraph-nocollapse.gfa

MBG -i chr13/corrected2.fa -o mbg_nocollapse/chr13-noblunt.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr14/corrected2.fa -o mbg_nocollapse/chr14-noblunt.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr15/corrected2.fa -o mbg_nocollapse/chr15-noblunt.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr21/corrected2.fa -o mbg_nocollapse/chr21-noblunt.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr22/corrected2.fa -o mbg_nocollapse/chr22-noblunt.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
grep -P '^S' < mbg_nocollapse/chr13-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_k501_chr13.fa
grep -P '^S' < mbg_nocollapse/chr14-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_k501_chr14.fa
grep -P '^S' < mbg_nocollapse/chr15-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_k501_chr15.fa
grep -P '^S' < mbg_nocollapse/chr21-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_k501_chr21.fa
grep -P '^S' < mbg_nocollapse/chr22-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_k501_chr22.fa
MBG -i mbg_nocollapse/contigs_k501_chr13.fa -o mbg_nocollapse/chr13-kmergraph.gfa -k 127 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_k501_chr14.fa -o mbg_nocollapse/chr14-kmergraph.gfa -k 127 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_k501_chr15.fa -o mbg_nocollapse/chr15-kmergraph.gfa -k 127 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_k501_chr21.fa -o mbg_nocollapse/chr21-kmergraph.gfa -k 127 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_k501_chr22.fa -o mbg_nocollapse/chr22-kmergraph.gfa -k 127 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc

MBG -i chr13/hifi.fa -o mbg_nocollapse/raw-chr13.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr14/hifi.fa -o mbg_nocollapse/raw-chr14.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr15/hifi.fa -o mbg_nocollapse/raw-chr15.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr21/hifi.fa -o mbg_nocollapse/raw-chr21.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr22/hifi.fa -o mbg_nocollapse/raw-chr22.gfa -k 501 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr13.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr13-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr14.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr14-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr15.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr15-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr21.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr21-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr22.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr22-clean.gfa
awk '$1=="S"{print "S\tchr13_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr13_" $2 "\t" $3 "\tchr13_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr13-clean.gfa > mbg_nocollapse/raw-chr13-renamed.gfa
awk '$1=="S"{print "S\tchr14_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr14_" $2 "\t" $3 "\tchr14_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr14-clean.gfa > mbg_nocollapse/raw-chr14-renamed.gfa
awk '$1=="S"{print "S\tchr15_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr15_" $2 "\t" $3 "\tchr15_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr15-clean.gfa > mbg_nocollapse/raw-chr15-renamed.gfa
awk '$1=="S"{print "S\tchr21_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr21_" $2 "\t" $3 "\tchr21_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr21-clean.gfa > mbg_nocollapse/raw-chr21-renamed.gfa
awk '$1=="S"{print "S\tchr22_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr22_" $2 "\t" $3 "\tchr22_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr22-clean.gfa > mbg_nocollapse/raw-chr22-renamed.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr13-renamed.gfa > mbg_nocollapse/raw-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr14-renamed.gfa >> mbg_nocollapse/raw-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr15-renamed.gfa >> mbg_nocollapse/raw-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr21-renamed.gfa >> mbg_nocollapse/raw-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr22-renamed.gfa >> mbg_nocollapse/raw-pjdj-mergegraph-nocollapse.gfa

MBG -i chr13/hifi.fa -o mbg_nocollapse/raw-chr13-201.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr14/hifi.fa -o mbg_nocollapse/raw-chr14-201.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr15/hifi.fa -o mbg_nocollapse/raw-chr15-201.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr21/hifi.fa -o mbg_nocollapse/raw-chr21-201.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
MBG -i chr22/hifi.fa -o mbg_nocollapse/raw-chr22-201.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc --blunt
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr13-201.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr13-201-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr14-201.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr14-201-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr15-201.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr15-201-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr21-201.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr21-201-clean.gfa
scripts/UntipRelative 5000 5000 0.1 < mbg_nocollapse/raw-chr22-201.gfa | scripts/gfa_string_to_int.py /dev/null | ~/tmp/vg_1_28_0 view -Fv - | ~/tmp/vg_1_28_0 mod -n -U 100 - | ~/tmp/vg_1_28_0 view - > mbg_nocollapse/raw-chr22-201-clean.gfa
awk '$1=="S"{print "S\tchr13_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr13_" $2 "\t" $3 "\tchr13_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr13-201-clean.gfa > mbg_nocollapse/raw-chr13-201-renamed.gfa
awk '$1=="S"{print "S\tchr14_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr14_" $2 "\t" $3 "\tchr14_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr14-201-clean.gfa > mbg_nocollapse/raw-chr14-201-renamed.gfa
awk '$1=="S"{print "S\tchr15_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr15_" $2 "\t" $3 "\tchr15_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr15-201-clean.gfa > mbg_nocollapse/raw-chr15-201-renamed.gfa
awk '$1=="S"{print "S\tchr21_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr21_" $2 "\t" $3 "\tchr21_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr21-201-clean.gfa > mbg_nocollapse/raw-chr21-201-renamed.gfa
awk '$1=="S"{print "S\tchr22_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr22_" $2 "\t" $3 "\tchr22_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr22-201-clean.gfa > mbg_nocollapse/raw-chr22-201-renamed.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr13-201-renamed.gfa > mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr14-201-renamed.gfa >> mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr15-201-renamed.gfa >> mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr21-201-renamed.gfa >> mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr22-201-renamed.gfa >> mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa

MBG -i chr13/hifi.fa -o mbg_nocollapse/raw-chr13-201-noblunt.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr14/hifi.fa -o mbg_nocollapse/raw-chr14-201-noblunt.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr15/hifi.fa -o mbg_nocollapse/raw-chr15-201-noblunt.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr21/hifi.fa -o mbg_nocollapse/raw-chr21-201-noblunt.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
MBG -i chr22/hifi.fa -o mbg_nocollapse/raw-chr22-201-noblunt.gfa -k 201 -w 5 -a 1 -u 2 --no-hpc --collapse-hpc
grep -P '^S' < mbg_nocollapse/raw-chr13-201-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_chr13_201.fa
grep -P '^S' < mbg_nocollapse/raw-chr14-201-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_chr14_201.fa
grep -P '^S' < mbg_nocollapse/raw-chr15-201-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_chr15_201.fa
grep -P '^S' < mbg_nocollapse/raw-chr21-201-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_chr21_201.fa
grep -P '^S' < mbg_nocollapse/raw-chr22-201-noblunt.gfa | awk '{print ">" $2; print $3;}' > mbg_nocollapse/contigs_chr22_201.fa
MBG -i mbg_nocollapse/contigs_chr13_201.fa -o mbg_nocollapse/raw-chr13-65-noblunt.gfa -k 65 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_chr14_201.fa -o mbg_nocollapse/raw-chr14-65-noblunt.gfa -k 65 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_chr15_201.fa -o mbg_nocollapse/raw-chr15-65-noblunt.gfa -k 65 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_chr21_201.fa -o mbg_nocollapse/raw-chr21-65-noblunt.gfa -k 65 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
MBG -i mbg_nocollapse/contigs_chr22_201.fa -o mbg_nocollapse/raw-chr22-65-noblunt.gfa -k 65 -w 5 -a 1 -u 1 --no-hpc --collapse-hpc
awk '$1=="S"{print "S\tchr13_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr13_" $2 "\t" $3 "\tchr13_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr13-65-noblunt.gfa > mbg_nocollapse/raw-chr13-65-noblunt-renamed.gfa
awk '$1=="S"{print "S\tchr14_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr14_" $2 "\t" $3 "\tchr14_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr14-65-noblunt.gfa > mbg_nocollapse/raw-chr14-65-noblunt-renamed.gfa
awk '$1=="S"{print "S\tchr15_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr15_" $2 "\t" $3 "\tchr15_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr15-65-noblunt.gfa > mbg_nocollapse/raw-chr15-65-noblunt-renamed.gfa
awk '$1=="S"{print "S\tchr21_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr21_" $2 "\t" $3 "\tchr21_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr21-65-noblunt.gfa > mbg_nocollapse/raw-chr21-65-noblunt-renamed.gfa
awk '$1=="S"{print "S\tchr22_" $2 "\t" $3 "\t" $4 "\t" $5;}$1=="L"{print "L\tchr22_" $2 "\t" $3 "\tchr22_" $4 "\t" $5 "\t" $6;}' < mbg_nocollapse/raw-chr22-65-noblunt.gfa > mbg_nocollapse/raw-chr22-65-noblunt-renamed.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr13-65-noblunt-renamed.gfa > mbg_nocollapse/raw-65-noblunt-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr14-65-noblunt-renamed.gfa >> mbg_nocollapse/raw-65-noblunt-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr15-65-noblunt-renamed.gfa >> mbg_nocollapse/raw-65-noblunt-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr21-65-noblunt-renamed.gfa >> mbg_nocollapse/raw-65-noblunt-pjdj-mergegraph-nocollapse.gfa
scripts/pick_largest_component.py < mbg_nocollapse/raw-chr22-65-noblunt-renamed.gfa >> mbg_nocollapse/raw-65-noblunt-pjdj-mergegraph-nocollapse.gfa

# the polishing with self-corrected hifi reads introduced some errors, including SNPs!
# so polish with raw hifi reads instead because it's more reliable
mkdir polish_rawhifi
cd polish_rawhifi
cp ../raw_ont_consensus/consensuses.fa .
/usr/bin/time -v GraphAligner -g ../mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa -f consensuses.fa -a alns_consensues.gaf --corrected-out hifigraph_corrected_consensuses.fa -t 40 -x vg --precise-clipping 0.70 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_hifipolish.txt 2> stderr_ga_hifipolish.txt
# looks fine
scripts/extract_extended_path.py ../mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa < alns_consensues.gaf | sed 's/_[0-9]*_[0-9]*_[0-9]*//g' > consensuses_polished.fa

echo "pj13_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > pj13_consensus_polished.fa
echo "pj14_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > pj14_consensus_polished.fa
echo "pj15_consensus_normal" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > pj15_consensus_normal_polished.fa
echo "pj21_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > pj21_consensus_polished.fa
echo "pj22_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > pj22_consensus_polished.fa
echo "dj13_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj13_consensus_polished.fa
echo "dj14_consensus_normal" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj14_consensus_normal_polished.fa
echo "dj14_consensus_het" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj14_consensus_het_polished.fa
echo "dj15_consensus_normal" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj15_consensus_normal_polished.fa
echo "dj21_consensus_normal" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj21_consensus_normal_polished.fa
echo "dj21_consensus_het" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj21_consensus_het_polished.fa
echo "dj22_consensus" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > dj22_consensus_polished.fa
echo "chr15_consensus_het" > picked.txt
scripts/pick_reads_stdin.py < consensuses_polished.fa > chr15_consensus_het_polished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_polished.fa ../raw_ont_consensus/dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_polished.fa ../raw_ont_consensus/pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_polished.fa ../raw_ont_consensus/dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_polished.fa ../raw_ont_consensus/dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_polished.fa ../raw_ont_consensus/pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_polished.fa ../raw_ont_consensus/pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa ../raw_ont_consensus/pj15_reads_het.fa ../raw_ont_consensus/dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_polished.fa ../raw_ont_consensus/dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_polished.fa ../raw_ont_consensus/dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_polished.fa ../raw_ont_consensus/dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_polished.fa ../raw_ont_consensus/pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_polished.fa ../raw_ont_consensus/dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_polished.fa ../raw_ont_consensus/pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_polished_cons_pj22.bam
samtools merge alns_raw_to_polished_cons.bam alns_selected_raw_to_polished_cons_*.bam

# fix: dj13 98112

# these offsets have to be chosen manually because the hifi polishing extended the sequences
minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_polished.fa ../raw_ont_consensus/dj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-300-$6 > -5000 && $4-300-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj13_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj13_consensus_polished.fa 4 < pileup.txt > dj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_polished.fa ../raw_ont_consensus/dj14_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_het_polished.fa 4 < pileup.txt > dj14_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_polished.fa ../raw_ont_consensus/dj14_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-1500-$6 > -5000 && $4-1500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj14_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj14_consensus_normal_polished.fa 4 < pileup.txt > dj14_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_polished.fa ../raw_ont_consensus/dj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj15_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj15_consensus_normal_polished.fa 4 < pileup.txt > dj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_polished.fa ../raw_ont_consensus/dj21_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_normal_polished.fa 4 < pileup.txt > dj21_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_polished.fa ../raw_ont_consensus/dj21_reads_het.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj21_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj21_consensus_het_polished.fa 4 < pileup.txt > dj21_consensus_het_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_polished.fa ../raw_ont_consensus/dj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f dj22_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py dj22_consensus_polished.fa 4 < pileup.txt > dj22_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_polished.fa ../raw_ont_consensus/pj13_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-2700-$6 > -5000 && $4-2700-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj13_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj13_consensus_polished.fa 4 < pileup.txt > pj13_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_polished.fa ../raw_ont_consensus/pj14_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj14_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj14_consensus_polished.fa 4 < pileup.txt > pj14_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_polished.fa ../raw_ont_consensus/pj15_reads_normal.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-1000-$6 > -5000 && $4-1000-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj15_consensus_normal_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj15_consensus_normal_polished.fa 4 < pileup.txt > pj15_consensus_normal_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_polished.fa ../raw_ont_consensus/pj21_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-500-$6 > -5000 && $4-500-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj21_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj21_consensus_polished.fa 4 < pileup.txt > pj21_consensus_repolished.fa
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_polished.fa ../raw_ont_consensus/pj22_reads.fa | awk 'substr($1,1,1)=="@"{print;}{if ($4-0-$6 > -5000 && $4-0-$6 < 5000) print;}' | samtools view -b | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f pj22_consensus_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py pj22_consensus_polished.fa 4 < pileup.txt > pj22_consensus_repolished.fa

# chr15 het
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa ../raw_ont_consensus/pj15_reads_het.fa > alns_pj15_het.sam
awk '{if ($4-1000-$6 > -5000 && $4-1000-$6 < 5000) print;}' < alns_pj15_het.sam > alns_pj15_het_selected.sam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_polished.fa ../raw_ont_consensus/dj15_reads_het.fa > alns_dj15_het.sam
scripts/filter_chr15_dj_sam_bw.py chr15_consensus_het_polished.fa ../raw_ont_consensus/dj15_reads_het.fa 4000 < alns_dj15_het.sam > alns_dj15_het_selected.sam
cat alns_pj15_het_selected.sam > alns_het15_selected.sam
grep -v '@' < alns_dj15_het_selected.sam >> alns_het15_selected.sam
awk '$1!="ef4f8ce9-27c8-4391-8428-98481dc28dbf"{print;}' < alns_het15_selected.sam > alns_het15_selected_noref.sam
samtools view -b alns_het15_selected_noref.sam | samtools sort > alns_selected.bam
samtools mpileup --output-QNAME --ff 256 -q 1 -f chr15_consensus_het_polished.fa alns_selected.bam > pileup.txt
scripts/polish_super_conservatively.py chr15_consensus_het_polished.fa 4 < pileup.txt > chr15_consensus_het_repolished.fa
cat *_consensus*_repolished.fa > consensuses_repolished.fa

minimap2 -x map-ont -a -c -f 0 -t 40 dj13_consensus_repolished.fa ../raw_ont_consensus/dj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj13_consensus_repolished.fa ../raw_ont_consensus/pj13_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj13.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_normal_repolished.fa ../raw_ont_consensus/dj14_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj14_consensus_het_repolished.fa ../raw_ont_consensus/dj14_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj14_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj14_consensus_repolished.fa ../raw_ont_consensus/pj14_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj14.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj15_consensus_normal_repolished.fa ../raw_ont_consensus/pj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 chr15_consensus_het_repolished.fa ../raw_ont_consensus/pj15_reads_het.fa ../raw_ont_consensus/dj15_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_het15.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj15_consensus_normal_repolished.fa ../raw_ont_consensus/dj15_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj15_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_normal_repolished.fa ../raw_ont_consensus/dj21_reads_normal.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_normal.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj21_consensus_het_repolished.fa ../raw_ont_consensus/dj21_reads_het.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj21_het.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj21_consensus_repolished.fa ../raw_ont_consensus/pj21_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj21.bam
minimap2 -x map-ont -a -c -f 0 -t 40 dj22_consensus_repolished.fa ../raw_ont_consensus/dj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_dj22.bam
minimap2 -x map-ont -a -c -f 0 -t 40 pj22_consensus_repolished.fa ../raw_ont_consensus/pj22_reads.fa | samtools view -b | samtools sort > alns_selected_raw_to_repolished_cons_pj22.bam
samtools merge alns_raw_to_repolished_cons.bam alns_selected_raw_to_repolished_cons_*.bam

cd ..
mkdir check_extension_SVs
cd check_extension_SVs

cp ../polish_rawhifi/*_consensus*_repolished.fa .
grep '>' < ../raw_ont_consensus/longest_dj13.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj13.fa
mummer -maxmatch -F -b -c dj13_consensus_repolished.fa longest_dj13.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj13.pdf
grep '>' < ../raw_ont_consensus/longest_dj14_het.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj14_het.fa
mummer -maxmatch -F -b -c dj14_consensus_het_repolished.fa longest_dj14_het.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj14_het.pdf
grep '>' < ../raw_ont_consensus/longest_dj14_normal.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj14_normal.fa
mummer -maxmatch -F -b -c dj14_consensus_normal_repolished.fa longest_dj14_normal.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj14_normal.pdf
grep '>' < ../raw_ont_consensus/longest_dj15_normal.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj15_normal.fa
mummer -maxmatch -F -b -c dj15_consensus_normal_repolished.fa longest_dj15_normal.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj15_normal.pdf
grep '>' < ../raw_ont_consensus/longest_dj21_normal.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj21_normal.fa
mummer -maxmatch -F -b -c dj21_consensus_normal_repolished.fa longest_dj21_normal.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj21_normal.pdf
grep '>' < ../raw_ont_consensus/longest_dj21_het.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj21_het.fa
mummer -maxmatch -F -b -c dj21_consensus_het_repolished.fa longest_dj21_het.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj21_het.pdf
grep '>' < ../raw_ont_consensus/longest_dj22.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_dj22.fa
mummer -maxmatch -F -b -c dj22_consensus_repolished.fa longest_dj22.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj22.pdf
grep '>' < ../raw_ont_consensus/longest_pj13.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_pj13.fa
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa longest_pj13.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj13.pdf
grep '>' < ../raw_ont_consensus/longest_pj14.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_pj14.fa
mummer -maxmatch -F -b -c pj14_consensus_repolished.fa longest_pj14.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj14.pdf
grep '>' < ../raw_ont_consensus/longest_pj15_normal.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_pj15_normal.fa
mummer -maxmatch -F -b -c pj15_consensus_normal_repolished.fa longest_pj15_normal.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj15_normal.pdf
grep '>' < ../raw_ont_consensus/longest_pj21.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_pj21.fa
mummer -maxmatch -F -b -c pj21_consensus_repolished.fa longest_pj21.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj21.pdf
grep '>' < ../raw_ont_consensus/longest_pj22.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_pj22.fa
mummer -maxmatch -F -b -c pj22_consensus_repolished.fa longest_pj22.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj22.pdf
grep '>' < ../raw_ont_consensus/longest_dj15_het.fa | tr -d '>' > picked.txt
scripts/pick_reads_stdin.py < ../ont.fa > longest_chr15_het.fa
mummer -maxmatch -F -b -c chr15_consensus_het_repolished.fa longest_chr15_het.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerchr15_het.pdf
# longest looks fine
# what about adam's reads
# $ grep -n "aa16c4b7-f83e-41e9-b127-0a0025bf6131" < ../ont.fa
# 1399:>aa16c4b7-f83e-41e9-b127-0a0025bf6131
sed -n 1399,1400p < ../ont.fa > oneread_aa16c4b7-f83e-41e9-b127-0a0025bf6131.fa
# $ grep -n "fdd2f161-f8ea-4348-9877-355b3e258edb" < ../ont.fa
# 2249:>fdd2f161-f8ea-4348-9877-355b3e258edb
sed -n 2249,2250p < ../ont.fa > oneread_fdd2f161-f8ea-4348-9877-355b3e258edb.fa
# $ grep -n "686d32dc-f718-426c-b22e-5ab9737daee4" < ../ont.fa
# 3617:>686d32dc-f718-426c-b22e-5ab9737daee4
sed -n 3617,3618p < ../ont.fa > oneread_686d32dc-f718-426c-b22e-5ab9737daee4.fa
# $ grep -n "b660e6fb-f814-4c4d-ace9-2a3c6126a104" < ../ont.fa
# 6355:>b660e6fb-f814-4c4d-ace9-2a3c6126a104
sed -n 6355,6356p < ../ont.fa > oneread_b660e6fb-f814-4c4d-ace9-2a3c6126a104.fa
mummer -maxmatch -F -b -c pj22_consensus_repolished.fa oneread_aa16c4b7-f83e-41e9-b127-0a0025bf6131.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj22_aa16c4b7-f83e-41e9-b127-0a0025bf6131.pdf
mummer -maxmatch -F -b -c pj22_consensus_repolished.fa oneread_fdd2f161-f8ea-4348-9877-355b3e258edb.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj22_fdd2f161-f8ea-4348-9877-355b3e258edb.pdf
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa oneread_686d32dc-f718-426c-b22e-5ab9737daee4.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj13_686d32dc-f718-426c-b22e-5ab9737daee4.pdf
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa oneread_686d32dc-f718-426c-b22e-5ab9737daee4.fa  > matches.mum
mummerplot -postscript -x "[30000,50000]" -y "[50000,70000]" -p mummer matches.mum
ps2pdf mummer.ps mummerpj13_686d32dc-f718-426c-b22e-5ab9737daee4_zoomed.pdf
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa oneread_b660e6fb-f814-4c4d-ace9-2a3c6126a104.fa  > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummerpj13_b660e6fb-f814-4c4d-ace9-2a3c6126a104.pdf
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa oneread_b660e6fb-f814-4c4d-ace9-2a3c6126a104.fa  > matches.mum
mummerplot -postscript -x "[30000,50000]" -y "[90000,110000]" -p mummer matches.mum
ps2pdf mummer.ps mummerpj13_b660e6fb-f814-4c4d-ace9-2a3c6126a104_zoomed.pdf
mummer -maxmatch -F -b -c pj13_consensus_repolished.fa longest_pj13.fa  > matches.mum
mummerplot -postscript -x "[30000,50000]" -y "[120000,140000]" -p mummer matches.mum
ps2pdf mummer.ps mummerpj13_zoomed.pdf

mkdir ont_to_nocollapse_pjdjgraph
cd ont_to_nocollapse_pjdjgraph
/usr/bin/time -v GraphAligner -g ../mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa -f ../ont_bonito_merged.fq -a alns_subset.gaf --corrected-out corrected_subset_ONTs.fa -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000 1> stdout_ga_subset.txt 2> stderr_ga_subset.txt
cut -f 1,6 < alns_subset.gaf | tr '>' '\t' | tr '<' '\t' | tr ' ' '\t' | cut -f 1,8 | sed 's/\(chr[12345]*\)_[0123456789]*/\1/g' | sort | uniq | cut -f 1 | sort | uniq -c | grep -vP '^ +1 ' | sed 's/^ \+[0123456789]\+ //g' > reads_subset_ambiguous.txt
scripts/filter_ambiguous_reads.py reads_subset_ambiguous.txt < alns_subset.gaf > alns_subset_unambiguous.gaf
grep chr13 < alns_subset_unambiguous.gaf > alns_subset_chr13.gaf
grep chr14 < alns_subset_unambiguous.gaf > alns_subset_chr14.gaf
grep chr15 < alns_subset_unambiguous.gaf > alns_subset_chr15.gaf
grep chr21 < alns_subset_unambiguous.gaf > alns_subset_chr21.gaf
grep chr22 < alns_subset_unambiguous.gaf > alns_subset_chr22.gaf
cut -d ' ' -f 1 < alns_subset_chr13.gaf | sort | uniq > readnames_chr13.txt
cut -d ' ' -f 1 < alns_subset_chr14.gaf | sort | uniq > readnames_chr14.txt
cut -d ' ' -f 1 < alns_subset_chr15.gaf | sort | uniq > readnames_chr15.txt
cut -d ' ' -f 1 < alns_subset_chr21.gaf | sort | uniq > readnames_chr21.txt
cut -d ' ' -f 1 < alns_subset_chr22.gaf | sort | uniq > readnames_chr22.txt
cp readnames_chr13.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr13.fa
cp readnames_chr14.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr14.fa
cp readnames_chr15.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr15.fa
cp readnames_chr21.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr21.fa
cp readnames_chr22.txt picked.txt
scripts/pick_reads_stdin.py < corrected_subset_ONTs.fa > corrected_chr22.fa
cd ..
scripts/calculate_coverage.py mbg_nocollapse/raw-201-pjdj-mergegraph-nocollapse.gfa < ont_to_nocollapse_pjdjgraph/alns_subset_unambiguous.gaf > node_covs_pjdj-mergegraph-nocollapse_ont.csv
/usr/bin/time -v GraphAligner -g mbg_nocollapse/raw-chr13-65-noblunt-renamed.gfa -f KY962518.fasta -a alns_ref_chr13.gaf -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000
/usr/bin/time -v GraphAligner -g mbg_nocollapse/raw-chr14-65-noblunt-renamed.gfa -f KY962518.fasta -a alns_ref_chr14.gaf -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000
/usr/bin/time -v GraphAligner -g mbg_nocollapse/raw-chr15-65-noblunt-renamed.gfa -f KY962518.fasta -a alns_ref_chr15.gaf -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000
/usr/bin/time -v GraphAligner -g mbg_nocollapse/raw-chr21-65-noblunt-renamed.gfa -f KY962518.fasta -a alns_ref_chr21.gaf -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000
/usr/bin/time -v GraphAligner -g mbg_nocollapse/raw-chr22-65-noblunt-renamed.gfa -f KY962518.fasta -a alns_ref_chr22.gaf -t 40 -x vg -b 50 --multiseed-DP 1 --X-drop 1000000 --precise-clipping 0.85 --multimap-score-fraction 1 --E-cutoff 0.0000001 --min-alignment-score 10000
cat alns_ref_chr13.gaf alns_ref_chr14.gaf alns_ref_chr15.gaf alns_ref_chr21.gaf alns_ref_chr22.gaf > alns_ref_merged.gaf

mkdir loops
cd loops

# manually find these k-mers using ../chr__/graph-105-5.gfa
# remake with smaller k-mer size if necessary
# if using a smaller k-mer: adjust numbers below
# first: a k-mer that appears exactly once in each loop
# second: a k-mer that appears exactly once in the PJ arm, and nowhere else. As close to the rDNA as possible
# third: a k-mer that appears exactly once in the DJ arm, and nowhere else. As close to the rDNA as possible
# all three in the same chromosome have to be the same length
# different chromosomes can have different lengths
# forward / reverse complement doesn't matter
# also doesn't matter if the second is PJ and third is DJ, or second is DJ and third is PJ

scripts/extract_loops_seq_approx.py CTGCAGCGTGGACGCTCCTGGACTCGAGCGATCCTTCCACCTCAGCCTCCAGAGTACAGAGCCTG GCTTGCGACGCTGGACTTGAAGGCAAAATGAAAATGAAAATGAAACGCAACAAAATAATTAAAAA CCCCGACGACGTGGGTGTCGGCGGGCGTGGGGGCGGTTCTCGGCGGCGTCGCGGCGGGTTTGGGG 2 < ../ont_to_nocollapse_pjdjgraph/corrected_chr13.fa > loops_seq_chr13.txt &
scripts/extract_loops_seq_approx.py TCTCCATCTTGGTCAGGCTGGTCTTCAACTTCCGACCGTTGGAGAATCTTAACTTTCTTGGTGGT GAAACTCACTTTTTAATTATTTTGTTGCGTTTCATTTTCATTTTCATTTTGCCTTCAAGTCCAGC AGGTTTCCGTAGGTGAACCTGCGGAAGGATCATTAACGGAGTCTGGAGGGCGAGGCCGGCGGCGG 2 < ../ont_to_nocollapse_pjdjgraph/corrected_chr14.fa > loops_seq_chr14.txt &
scripts/extract_loops_seq_approx.py TTATGTTGTTTCTCATGTTTTCCGTAGGTAGGTATGTGTGTGTGTGTGTGTGTGTGTGTGTGTGT AAAGCACCACCTCCTTGACCTGACTCAGGGCGTTTGGGGTCTTCTGGGGAAATGTTCTGAAACAA CAGCCTCGACGGCGGGGAGCCGGTGCGGCGGGGCCGGACGACGGGCCCCGGCGGGGAGGAGGGCA 2 < ../ont_to_nocollapse_pjdjgraph/corrected_chr15.fa > loops_seq_chr15.txt &
scripts/extract_loops_seq_approx.py GTCTTTCTCTCTCTGTGTATCGTTGTCTCTCTCTGTCTGTCTCTGTCTCTGTCTCTCTGTCTCTC TAACAATACAGGACTCTTTCGAGGCCCTGTAATTGGAATGAGTCCACTTTAAATCCTAATCCAGG TGGACTTGAAGGCAAAATGAAAATGAAAATGAAACGCAACAAAATAATTAAAAAGTGAGTTTCTG 2 < ../ont_to_nocollapse_pjdjgraph/corrected_chr21.fa > loops_seq_chr21.txt &
scripts/extract_loops_seq_approx.py ACAACCACCACCAAGAAAGTTAAGATTCTCCAACGGTCGGAAGTTGAAGACCAGCCTGACCAAGA ATGTTCAAAAATTAGCAGGGCATTATGGCGCGTGACTGTAATCCCGGCCACTCAGGAGGATGAGA CCGACGCCGCGGCGGCCGTCGGGTGGGGGCTTTACCCGGCGGTCGTTGCGTGAATGCCACTGGCG 2 < ../ont_to_nocollapse_pjdjgraph/corrected_chr22.fa > loops_seq_chr22.txt &
wait
awk -F '\t' '{print $1 "\t" substr($2, 0, 65) substr($2, length($2)-65);}' < loops_seq_chr13.txt > loopnames_chr13.txt
awk -F '\t' '{print $1 "\t" substr($2, 0, 65) substr($2, length($2)-65);}' < loops_seq_chr14.txt > loopnames_chr14.txt
awk -F '\t' '{print $1 "\t" substr($2, 0, 65) substr($2, length($2)-65);}' < loops_seq_chr15.txt > loopnames_chr15.txt
awk -F '\t' '{print $1 "\t" substr($2, 0, 65) substr($2, length($2)-65);}' < loops_seq_chr21.txt > loopnames_chr21.txt
awk -F '\t' '{print $1 "\t" substr($2, 0, 65) substr($2, length($2)-65);}' < loops_seq_chr22.txt > loopnames_chr22.txt

scripts/compute_path_pair_distances_dinuc_seq.py 300 10 0 < loops_seq_chr13.txt > loop_distances_chr13_0.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 1 < loops_seq_chr13.txt > loop_distances_chr13_1.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 2 < loops_seq_chr13.txt > loop_distances_chr13_2.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 3 < loops_seq_chr13.txt > loop_distances_chr13_3.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 4 < loops_seq_chr13.txt > loop_distances_chr13_4.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 5 < loops_seq_chr13.txt > loop_distances_chr13_5.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 6 < loops_seq_chr13.txt > loop_distances_chr13_6.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 7 < loops_seq_chr13.txt > loop_distances_chr13_7.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 8 < loops_seq_chr13.txt > loop_distances_chr13_8.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 9 < loops_seq_chr13.txt > loop_distances_chr13_9.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 0 < loops_seq_chr14.txt > loop_distances_chr14_0.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 1 < loops_seq_chr14.txt > loop_distances_chr14_1.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 2 < loops_seq_chr14.txt > loop_distances_chr14_2.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 3 < loops_seq_chr14.txt > loop_distances_chr14_3.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 4 < loops_seq_chr14.txt > loop_distances_chr14_4.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 5 < loops_seq_chr14.txt > loop_distances_chr14_5.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 6 < loops_seq_chr14.txt > loop_distances_chr14_6.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 7 < loops_seq_chr14.txt > loop_distances_chr14_7.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 8 < loops_seq_chr14.txt > loop_distances_chr14_8.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 9 < loops_seq_chr14.txt > loop_distances_chr14_9.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 0 < loops_seq_chr15.txt > loop_distances_chr15_0.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 1 < loops_seq_chr15.txt > loop_distances_chr15_1.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 2 < loops_seq_chr15.txt > loop_distances_chr15_2.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 3 < loops_seq_chr15.txt > loop_distances_chr15_3.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 4 < loops_seq_chr15.txt > loop_distances_chr15_4.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 5 < loops_seq_chr15.txt > loop_distances_chr15_5.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 6 < loops_seq_chr15.txt > loop_distances_chr15_6.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 7 < loops_seq_chr15.txt > loop_distances_chr15_7.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 8 < loops_seq_chr15.txt > loop_distances_chr15_8.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 9 < loops_seq_chr15.txt > loop_distances_chr15_9.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 0 < loops_seq_chr21.txt > loop_distances_chr21_0.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 1 < loops_seq_chr21.txt > loop_distances_chr21_1.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 2 < loops_seq_chr21.txt > loop_distances_chr21_2.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 3 < loops_seq_chr21.txt > loop_distances_chr21_3.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 4 < loops_seq_chr21.txt > loop_distances_chr21_4.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 5 < loops_seq_chr21.txt > loop_distances_chr21_5.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 6 < loops_seq_chr21.txt > loop_distances_chr21_6.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 7 < loops_seq_chr21.txt > loop_distances_chr21_7.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 8 < loops_seq_chr21.txt > loop_distances_chr21_8.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 9 < loops_seq_chr21.txt > loop_distances_chr21_9.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 0 < loops_seq_chr22.txt > loop_distances_chr22_0.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 1 < loops_seq_chr22.txt > loop_distances_chr22_1.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 2 < loops_seq_chr22.txt > loop_distances_chr22_2.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 3 < loops_seq_chr22.txt > loop_distances_chr22_3.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 4 < loops_seq_chr22.txt > loop_distances_chr22_4.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 5 < loops_seq_chr22.txt > loop_distances_chr22_5.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 6 < loops_seq_chr22.txt > loop_distances_chr22_6.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 7 < loops_seq_chr22.txt > loop_distances_chr22_7.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 8 < loops_seq_chr22.txt > loop_distances_chr22_8.txt &
scripts/compute_path_pair_distances_dinuc_seq.py 300 10 9 < loops_seq_chr22.txt > loop_distances_chr22_9.txt &
wait
cat loop_distances_chr13_*.txt > loop_distances_chr13.txt
cat loop_distances_chr14_*.txt > loop_distances_chr14.txt
cat loop_distances_chr15_*.txt > loop_distances_chr15.txt
cat loop_distances_chr21_*.txt > loop_distances_chr21.txt
cat loop_distances_chr22_*.txt > loop_distances_chr22.txt
# max cluster distances set very high to catch SVs with a high error rate
# if you adjust these distances, then also adjust the distances below
time scripts/make_mergeloop_graph_dist.py loopnames_chr13.txt 200 2 < loop_distances_chr13.txt > loop_mergegraph_chr13.gfa
time scripts/make_mergeloop_graph_dist.py loopnames_chr14.txt 200 2 < loop_distances_chr14.txt > loop_mergegraph_chr14.gfa
time scripts/make_mergeloop_graph_dist.py loopnames_chr15.txt 200 2 < loop_distances_chr15.txt > loop_mergegraph_chr15.gfa
time scripts/make_mergeloop_graph_dist.py loopnames_chr21.txt 200 2 < loop_distances_chr21.txt > loop_mergegraph_chr21.gfa
time scripts/make_mergeloop_graph_dist.py loopnames_chr22.txt 200 2 < loop_distances_chr22.txt > loop_mergegraph_chr22.gfa
mkdir loopseqs
cd loopseqs
mkdir chr13_loopseqs
mkdir chr14_loopseqs
mkdir chr15_loopseqs
mkdir chr21_loopseqs
mkdir chr22_loopseqs
# if you adjusted the distances above, then adjust these too
cd chr13_loopseqs
scripts/get_loop_cluster_seqs_seq.py ../../loops_seq_chr13.txt 200 1 < ../../loop_distances_chr13.txt
cd ../chr14_loopseqs
scripts/get_loop_cluster_seqs_seq.py ../../loops_seq_chr14.txt 200 1 < ../../loop_distances_chr14.txt
cd ../chr15_loopseqs
scripts/get_loop_cluster_seqs_seq.py ../../loops_seq_chr15.txt 200 1 < ../../loop_distances_chr15.txt
cd ../chr21_loopseqs
scripts/get_loop_cluster_seqs_seq.py ../../loops_seq_chr21.txt 200 1 < ../../loop_distances_chr21.txt
cd ../chr22_loopseqs
scripts/get_loop_cluster_seqs_seq.py ../../loops_seq_chr22.txt 200 1 < ../../loop_distances_chr22.txt
cd ..

# look at this command below, manually add spoa_chrxx_allelexx_coveragexx_unpolished.fa to the snakemake command below
ls -1 chr*_loopseqs/*
# replace:
# chr(\d+)_loopseqs/allele(\d+)_coverage(\d+)_loops.fa\n?
# spoa_chr\1_allele\2_coverage\3_unpolished.fa
# spoa_chr\1_allele\2_coverage\3_unrotated.fa

# run this over and over again
# it's going to crash for some  PJ/DJ connecting alleles but whatevs
# just rerun until the non-PJDJ alleles are finished
snakemake --cores 40 spoa_chr13_allele0_coverage1_unpolished.fa spoa_chr13_allele100_coverage1_unpolished.fa spoa_chr13_allele101_coverage1_unpolished.fa spoa_chr13_allele102_coverage3_unpolished.fa spoa_chr13_allele103_coverage1_unpolished.fa spoa_chr13_allele104_coverage1_unpolished.fa spoa_chr13_allele105_coverage1_unpolished.fa spoa_chr13_allele106_coverage12_unpolished.fa spoa_chr13_allele107_coverage1_unpolished.fa spoa_chr13_allele108_coverage1_unpolished.fa spoa_chr13_allele109_coverage1_unpolished.fa spoa_chr13_allele10_coverage1_unpolished.fa spoa_chr13_allele110_coverage1_unpolished.fa spoa_chr13_allele111_coverage1_unpolished.fa spoa_chr13_allele112_coverage1_unpolished.fa spoa_chr13_allele113_coverage1_unpolished.fa spoa_chr13_allele114_coverage1_unpolished.fa spoa_chr13_allele115_coverage1_unpolished.fa spoa_chr13_allele116_coverage1_unpolished.fa spoa_chr13_allele117_coverage1_unpolished.fa spoa_chr13_allele118_coverage1_unpolished.fa spoa_chr13_allele119_coverage1_unpolished.fa spoa_chr13_allele11_coverage1_unpolished.fa spoa_chr13_allele120_coverage1_unpolished.fa spoa_chr13_allele121_coverage1_unpolished.fa spoa_chr13_allele122_coverage1_unpolished.fa spoa_chr13_allele123_coverage1_unpolished.fa spoa_chr13_allele124_coverage1_unpolished.fa spoa_chr13_allele125_coverage1_unpolished.fa spoa_chr13_allele126_coverage1_unpolished.fa spoa_chr13_allele127_coverage1_unpolished.fa spoa_chr13_allele128_coverage1_unpolished.fa spoa_chr13_allele129_coverage1_unpolished.fa spoa_chr13_allele12_coverage1_unpolished.fa spoa_chr13_allele130_coverage1_unpolished.fa spoa_chr13_allele131_coverage1_unpolished.fa spoa_chr13_allele132_coverage1_unpolished.fa spoa_chr13_allele133_coverage1_unpolished.fa spoa_chr13_allele134_coverage1_unpolished.fa spoa_chr13_allele135_coverage1_unpolished.fa spoa_chr13_allele136_coverage1_unpolished.fa spoa_chr13_allele137_coverage1_unpolished.fa spoa_chr13_allele138_coverage1_unpolished.fa spoa_chr13_allele139_coverage1_unpolished.fa spoa_chr13_allele13_coverage1_unpolished.fa spoa_chr13_allele140_coverage1_unpolished.fa spoa_chr13_allele141_coverage1_unpolished.fa spoa_chr13_allele142_coverage1_unpolished.fa spoa_chr13_allele143_coverage1_unpolished.fa spoa_chr13_allele144_coverage1_unpolished.fa spoa_chr13_allele145_coverage1_unpolished.fa spoa_chr13_allele146_coverage1_unpolished.fa spoa_chr13_allele147_coverage1_unpolished.fa spoa_chr13_allele148_coverage1_unpolished.fa spoa_chr13_allele149_coverage1_unpolished.fa spoa_chr13_allele14_coverage2_unpolished.fa spoa_chr13_allele150_coverage1_unpolished.fa spoa_chr13_allele151_coverage2_unpolished.fa spoa_chr13_allele152_coverage1_unpolished.fa spoa_chr13_allele153_coverage1_unpolished.fa spoa_chr13_allele154_coverage1_unpolished.fa spoa_chr13_allele155_coverage1_unpolished.fa spoa_chr13_allele156_coverage5_unpolished.fa spoa_chr13_allele157_coverage1_unpolished.fa spoa_chr13_allele158_coverage1_unpolished.fa spoa_chr13_allele159_coverage1_unpolished.fa spoa_chr13_allele15_coverage1_unpolished.fa spoa_chr13_allele160_coverage1_unpolished.fa spoa_chr13_allele161_coverage1_unpolished.fa spoa_chr13_allele162_coverage1_unpolished.fa spoa_chr13_allele163_coverage1_unpolished.fa spoa_chr13_allele164_coverage1_unpolished.fa spoa_chr13_allele165_coverage1_unpolished.fa spoa_chr13_allele166_coverage1_unpolished.fa spoa_chr13_allele167_coverage1_unpolished.fa spoa_chr13_allele168_coverage1_unpolished.fa spoa_chr13_allele169_coverage1_unpolished.fa spoa_chr13_allele16_coverage3_unpolished.fa spoa_chr13_allele170_coverage1_unpolished.fa spoa_chr13_allele171_coverage1_unpolished.fa spoa_chr13_allele172_coverage1_unpolished.fa spoa_chr13_allele173_coverage1_unpolished.fa spoa_chr13_allele174_coverage1_unpolished.fa spoa_chr13_allele175_coverage1_unpolished.fa spoa_chr13_allele176_coverage1_unpolished.fa spoa_chr13_allele177_coverage1_unpolished.fa spoa_chr13_allele178_coverage86_unpolished.fa spoa_chr13_allele179_coverage1_unpolished.fa spoa_chr13_allele17_coverage1_unpolished.fa spoa_chr13_allele180_coverage1_unpolished.fa spoa_chr13_allele181_coverage1_unpolished.fa spoa_chr13_allele182_coverage1_unpolished.fa spoa_chr13_allele183_coverage1_unpolished.fa spoa_chr13_allele184_coverage1_unpolished.fa spoa_chr13_allele185_coverage1_unpolished.fa spoa_chr13_allele186_coverage1_unpolished.fa spoa_chr13_allele187_coverage1_unpolished.fa spoa_chr13_allele188_coverage1_unpolished.fa spoa_chr13_allele189_coverage1_unpolished.fa spoa_chr13_allele18_coverage1_unpolished.fa spoa_chr13_allele190_coverage1_unpolished.fa spoa_chr13_allele191_coverage1_unpolished.fa spoa_chr13_allele192_coverage1_unpolished.fa spoa_chr13_allele193_coverage28_unpolished.fa spoa_chr13_allele194_coverage1_unpolished.fa spoa_chr13_allele195_coverage1_unpolished.fa spoa_chr13_allele196_coverage1_unpolished.fa spoa_chr13_allele197_coverage1_unpolished.fa spoa_chr13_allele198_coverage1_unpolished.fa spoa_chr13_allele199_coverage1_unpolished.fa spoa_chr13_allele19_coverage1_unpolished.fa spoa_chr13_allele1_coverage1_unpolished.fa spoa_chr13_allele200_coverage1_unpolished.fa spoa_chr13_allele201_coverage2_unpolished.fa spoa_chr13_allele202_coverage1_unpolished.fa spoa_chr13_allele203_coverage2_unpolished.fa spoa_chr13_allele204_coverage1_unpolished.fa spoa_chr13_allele205_coverage1_unpolished.fa spoa_chr13_allele206_coverage1_unpolished.fa spoa_chr13_allele207_coverage2_unpolished.fa spoa_chr13_allele208_coverage1_unpolished.fa spoa_chr13_allele209_coverage1_unpolished.fa spoa_chr13_allele20_coverage1_unpolished.fa spoa_chr13_allele210_coverage1_unpolished.fa spoa_chr13_allele211_coverage19_unpolished.fa spoa_chr13_allele212_coverage1_unpolished.fa spoa_chr13_allele213_coverage1_unpolished.fa spoa_chr13_allele214_coverage1_unpolished.fa spoa_chr13_allele215_coverage1_unpolished.fa spoa_chr13_allele216_coverage2_unpolished.fa spoa_chr13_allele217_coverage1_unpolished.fa spoa_chr13_allele218_coverage1_unpolished.fa spoa_chr13_allele219_coverage1_unpolished.fa spoa_chr13_allele21_coverage1_unpolished.fa spoa_chr13_allele220_coverage1_unpolished.fa spoa_chr13_allele221_coverage1_unpolished.fa spoa_chr13_allele222_coverage1_unpolished.fa spoa_chr13_allele223_coverage1_unpolished.fa spoa_chr13_allele224_coverage1_unpolished.fa spoa_chr13_allele225_coverage1_unpolished.fa spoa_chr13_allele226_coverage1_unpolished.fa spoa_chr13_allele227_coverage1_unpolished.fa spoa_chr13_allele228_coverage1_unpolished.fa spoa_chr13_allele229_coverage1_unpolished.fa spoa_chr13_allele22_coverage1_unpolished.fa spoa_chr13_allele230_coverage1_unpolished.fa spoa_chr13_allele231_coverage1_unpolished.fa spoa_chr13_allele232_coverage1_unpolished.fa spoa_chr13_allele233_coverage7_unpolished.fa spoa_chr13_allele234_coverage1_unpolished.fa spoa_chr13_allele235_coverage1_unpolished.fa spoa_chr13_allele236_coverage1_unpolished.fa spoa_chr13_allele237_coverage1_unpolished.fa spoa_chr13_allele238_coverage1_unpolished.fa spoa_chr13_allele239_coverage1_unpolished.fa spoa_chr13_allele23_coverage1_unpolished.fa spoa_chr13_allele240_coverage1_unpolished.fa spoa_chr13_allele241_coverage1_unpolished.fa spoa_chr13_allele242_coverage1_unpolished.fa spoa_chr13_allele243_coverage5_unpolished.fa spoa_chr13_allele244_coverage1_unpolished.fa spoa_chr13_allele245_coverage1_unpolished.fa spoa_chr13_allele246_coverage1_unpolished.fa spoa_chr13_allele247_coverage1_unpolished.fa spoa_chr13_allele248_coverage1_unpolished.fa spoa_chr13_allele249_coverage1_unpolished.fa spoa_chr13_allele24_coverage1_unpolished.fa spoa_chr13_allele250_coverage1_unpolished.fa spoa_chr13_allele251_coverage1_unpolished.fa spoa_chr13_allele252_coverage1_unpolished.fa spoa_chr13_allele253_coverage1_unpolished.fa spoa_chr13_allele254_coverage1_unpolished.fa spoa_chr13_allele255_coverage35_unpolished.fa spoa_chr13_allele256_coverage1_unpolished.fa spoa_chr13_allele257_coverage3_unpolished.fa spoa_chr13_allele258_coverage1_unpolished.fa spoa_chr13_allele259_coverage1_unpolished.fa spoa_chr13_allele25_coverage1_unpolished.fa spoa_chr13_allele260_coverage1_unpolished.fa spoa_chr13_allele261_coverage1_unpolished.fa spoa_chr13_allele262_coverage2_unpolished.fa spoa_chr13_allele263_coverage1_unpolished.fa spoa_chr13_allele264_coverage1_unpolished.fa spoa_chr13_allele26_coverage1_unpolished.fa spoa_chr13_allele27_coverage1_unpolished.fa spoa_chr13_allele28_coverage1_unpolished.fa spoa_chr13_allele29_coverage1_unpolished.fa spoa_chr13_allele2_coverage1_unpolished.fa spoa_chr13_allele30_coverage1_unpolished.fa spoa_chr13_allele31_coverage1_unpolished.fa spoa_chr13_allele32_coverage1_unpolished.fa spoa_chr13_allele33_coverage1_unpolished.fa spoa_chr13_allele34_coverage1_unpolished.fa spoa_chr13_allele35_coverage1_unpolished.fa spoa_chr13_allele36_coverage1_unpolished.fa spoa_chr13_allele37_coverage1_unpolished.fa spoa_chr13_allele38_coverage1_unpolished.fa spoa_chr13_allele39_coverage1_unpolished.fa spoa_chr13_allele3_coverage1_unpolished.fa spoa_chr13_allele40_coverage1_unpolished.fa spoa_chr13_allele41_coverage4_unpolished.fa spoa_chr13_allele42_coverage1_unpolished.fa spoa_chr13_allele43_coverage14_unpolished.fa spoa_chr13_allele44_coverage1_unpolished.fa spoa_chr13_allele45_coverage1_unpolished.fa spoa_chr13_allele46_coverage1_unpolished.fa spoa_chr13_allele47_coverage1_unpolished.fa spoa_chr13_allele48_coverage1_unpolished.fa spoa_chr13_allele49_coverage1_unpolished.fa spoa_chr13_allele4_coverage1_unpolished.fa spoa_chr13_allele50_coverage1_unpolished.fa spoa_chr13_allele51_coverage1_unpolished.fa spoa_chr13_allele52_coverage1_unpolished.fa spoa_chr13_allele53_coverage1_unpolished.fa spoa_chr13_allele54_coverage1_unpolished.fa spoa_chr13_allele55_coverage1_unpolished.fa spoa_chr13_allele56_coverage2_unpolished.fa spoa_chr13_allele57_coverage1_unpolished.fa spoa_chr13_allele58_coverage1_unpolished.fa spoa_chr13_allele59_coverage1_unpolished.fa spoa_chr13_allele5_coverage1_unpolished.fa spoa_chr13_allele60_coverage1_unpolished.fa spoa_chr13_allele61_coverage1_unpolished.fa spoa_chr13_allele62_coverage1_unpolished.fa spoa_chr13_allele63_coverage1_unpolished.fa spoa_chr13_allele64_coverage1_unpolished.fa spoa_chr13_allele65_coverage1_unpolished.fa spoa_chr13_allele66_coverage1_unpolished.fa spoa_chr13_allele67_coverage1_unpolished.fa spoa_chr13_allele68_coverage1_unpolished.fa spoa_chr13_allele69_coverage1_unpolished.fa spoa_chr13_allele6_coverage1_unpolished.fa spoa_chr13_allele70_coverage1_unpolished.fa spoa_chr13_allele71_coverage1_unpolished.fa spoa_chr13_allele72_coverage1_unpolished.fa spoa_chr13_allele73_coverage1_unpolished.fa spoa_chr13_allele74_coverage1_unpolished.fa spoa_chr13_allele75_coverage1_unpolished.fa spoa_chr13_allele76_coverage1_unpolished.fa spoa_chr13_allele77_coverage1_unpolished.fa spoa_chr13_allele78_coverage1_unpolished.fa spoa_chr13_allele79_coverage1_unpolished.fa spoa_chr13_allele7_coverage1_unpolished.fa spoa_chr13_allele80_coverage1_unpolished.fa spoa_chr13_allele81_coverage1_unpolished.fa spoa_chr13_allele82_coverage1_unpolished.fa spoa_chr13_allele83_coverage1_unpolished.fa spoa_chr13_allele84_coverage1_unpolished.fa spoa_chr13_allele85_coverage1_unpolished.fa spoa_chr13_allele86_coverage503_unpolished.fa spoa_chr13_allele87_coverage1_unpolished.fa spoa_chr13_allele88_coverage1_unpolished.fa spoa_chr13_allele89_coverage1_unpolished.fa spoa_chr13_allele8_coverage1_unpolished.fa spoa_chr13_allele90_coverage1_unpolished.fa spoa_chr13_allele91_coverage1_unpolished.fa spoa_chr13_allele92_coverage1_unpolished.fa spoa_chr13_allele93_coverage1_unpolished.fa spoa_chr13_allele94_coverage9_unpolished.fa spoa_chr13_allele95_coverage1_unpolished.fa spoa_chr13_allele96_coverage1_unpolished.fa spoa_chr13_allele97_coverage17_unpolished.fa spoa_chr13_allele98_coverage1_unpolished.fa spoa_chr13_allele99_coverage1_unpolished.fa spoa_chr13_allele9_coverage1_unpolished.fa spoa_chr14_allele0_coverage1_unpolished.fa spoa_chr14_allele1_coverage2_unpolished.fa spoa_chr14_allele2_coverage59_unpolished.fa spoa_chr14_allele3_coverage16_unpolished.fa spoa_chr14_allele4_coverage1_unpolished.fa spoa_chr14_allele5_coverage17_unpolished.fa spoa_chr14_allele6_coverage1_unpolished.fa spoa_chr14_allele7_coverage1_unpolished.fa spoa_chr15_allele0_coverage1_unpolished.fa spoa_chr15_allele10_coverage1_unpolished.fa spoa_chr15_allele11_coverage1_unpolished.fa spoa_chr15_allele12_coverage1_unpolished.fa spoa_chr15_allele13_coverage1_unpolished.fa spoa_chr15_allele14_coverage1_unpolished.fa spoa_chr15_allele15_coverage1_unpolished.fa spoa_chr15_allele16_coverage1_unpolished.fa spoa_chr15_allele17_coverage86_unpolished.fa spoa_chr15_allele18_coverage1_unpolished.fa spoa_chr15_allele19_coverage1_unpolished.fa spoa_chr15_allele1_coverage1_unpolished.fa spoa_chr15_allele20_coverage1_unpolished.fa spoa_chr15_allele21_coverage1_unpolished.fa spoa_chr15_allele22_coverage1_unpolished.fa spoa_chr15_allele23_coverage74_unpolished.fa spoa_chr15_allele24_coverage1_unpolished.fa spoa_chr15_allele25_coverage1_unpolished.fa spoa_chr15_allele26_coverage1_unpolished.fa spoa_chr15_allele27_coverage1_unpolished.fa spoa_chr15_allele28_coverage1_unpolished.fa spoa_chr15_allele29_coverage1_unpolished.fa spoa_chr15_allele2_coverage1_unpolished.fa spoa_chr15_allele30_coverage1_unpolished.fa spoa_chr15_allele31_coverage1_unpolished.fa spoa_chr15_allele32_coverage1_unpolished.fa spoa_chr15_allele33_coverage1_unpolished.fa spoa_chr15_allele34_coverage38_unpolished.fa spoa_chr15_allele35_coverage106_unpolished.fa spoa_chr15_allele36_coverage1_unpolished.fa spoa_chr15_allele37_coverage1_unpolished.fa spoa_chr15_allele38_coverage1_unpolished.fa spoa_chr15_allele39_coverage2_unpolished.fa spoa_chr15_allele3_coverage1_unpolished.fa spoa_chr15_allele40_coverage2_unpolished.fa spoa_chr15_allele41_coverage8_unpolished.fa spoa_chr15_allele42_coverage1_unpolished.fa spoa_chr15_allele43_coverage1_unpolished.fa spoa_chr15_allele44_coverage1_unpolished.fa spoa_chr15_allele45_coverage1_unpolished.fa spoa_chr15_allele46_coverage1_unpolished.fa spoa_chr15_allele47_coverage38_unpolished.fa spoa_chr15_allele48_coverage1_unpolished.fa spoa_chr15_allele49_coverage1_unpolished.fa spoa_chr15_allele4_coverage1_unpolished.fa spoa_chr15_allele50_coverage1_unpolished.fa spoa_chr15_allele51_coverage1_unpolished.fa spoa_chr15_allele52_coverage1_unpolished.fa spoa_chr15_allele53_coverage1_unpolished.fa spoa_chr15_allele54_coverage1_unpolished.fa spoa_chr15_allele55_coverage1_unpolished.fa spoa_chr15_allele56_coverage1_unpolished.fa spoa_chr15_allele57_coverage1_unpolished.fa spoa_chr15_allele58_coverage16_unpolished.fa spoa_chr15_allele59_coverage1_unpolished.fa spoa_chr15_allele5_coverage1_unpolished.fa spoa_chr15_allele60_coverage1_unpolished.fa spoa_chr15_allele61_coverage1_unpolished.fa spoa_chr15_allele6_coverage1_unpolished.fa spoa_chr15_allele7_coverage1_unpolished.fa spoa_chr15_allele8_coverage1_unpolished.fa spoa_chr15_allele9_coverage1_unpolished.fa spoa_chr21_allele0_coverage1_unpolished.fa spoa_chr21_allele100_coverage1_unpolished.fa spoa_chr21_allele101_coverage1_unpolished.fa spoa_chr21_allele102_coverage1_unpolished.fa spoa_chr21_allele103_coverage1_unpolished.fa spoa_chr21_allele104_coverage1_unpolished.fa spoa_chr21_allele105_coverage1_unpolished.fa spoa_chr21_allele106_coverage1_unpolished.fa spoa_chr21_allele107_coverage2_unpolished.fa spoa_chr21_allele108_coverage1_unpolished.fa spoa_chr21_allele109_coverage1_unpolished.fa spoa_chr21_allele10_coverage1_unpolished.fa spoa_chr21_allele110_coverage1_unpolished.fa spoa_chr21_allele111_coverage1_unpolished.fa spoa_chr21_allele112_coverage1_unpolished.fa spoa_chr21_allele113_coverage1_unpolished.fa spoa_chr21_allele114_coverage1_unpolished.fa spoa_chr21_allele115_coverage1_unpolished.fa spoa_chr21_allele116_coverage6_unpolished.fa spoa_chr21_allele117_coverage1_unpolished.fa spoa_chr21_allele118_coverage1_unpolished.fa spoa_chr21_allele119_coverage1_unpolished.fa spoa_chr21_allele11_coverage1_unpolished.fa spoa_chr21_allele120_coverage1_unpolished.fa spoa_chr21_allele121_coverage318_unpolished.fa spoa_chr21_allele122_coverage1_unpolished.fa spoa_chr21_allele123_coverage1_unpolished.fa spoa_chr21_allele124_coverage1_unpolished.fa spoa_chr21_allele125_coverage1_unpolished.fa spoa_chr21_allele126_coverage1_unpolished.fa spoa_chr21_allele127_coverage1_unpolished.fa spoa_chr21_allele128_coverage1_unpolished.fa spoa_chr21_allele129_coverage1_unpolished.fa spoa_chr21_allele12_coverage1_unpolished.fa spoa_chr21_allele130_coverage1_unpolished.fa spoa_chr21_allele131_coverage1_unpolished.fa spoa_chr21_allele132_coverage1_unpolished.fa spoa_chr21_allele133_coverage1_unpolished.fa spoa_chr21_allele134_coverage1_unpolished.fa spoa_chr21_allele135_coverage1_unpolished.fa spoa_chr21_allele136_coverage1_unpolished.fa spoa_chr21_allele137_coverage1_unpolished.fa spoa_chr21_allele138_coverage1_unpolished.fa spoa_chr21_allele139_coverage1_unpolished.fa spoa_chr21_allele13_coverage1_unpolished.fa spoa_chr21_allele140_coverage1_unpolished.fa spoa_chr21_allele141_coverage1_unpolished.fa spoa_chr21_allele142_coverage1_unpolished.fa spoa_chr21_allele143_coverage1_unpolished.fa spoa_chr21_allele144_coverage1_unpolished.fa spoa_chr21_allele145_coverage1_unpolished.fa spoa_chr21_allele146_coverage1_unpolished.fa spoa_chr21_allele147_coverage1_unpolished.fa spoa_chr21_allele148_coverage1_unpolished.fa spoa_chr21_allele149_coverage1_unpolished.fa spoa_chr21_allele14_coverage1_unpolished.fa spoa_chr21_allele150_coverage1_unpolished.fa spoa_chr21_allele151_coverage1_unpolished.fa spoa_chr21_allele152_coverage1_unpolished.fa spoa_chr21_allele153_coverage1_unpolished.fa spoa_chr21_allele154_coverage1_unpolished.fa spoa_chr21_allele155_coverage1_unpolished.fa spoa_chr21_allele156_coverage1_unpolished.fa spoa_chr21_allele157_coverage1_unpolished.fa spoa_chr21_allele158_coverage1_unpolished.fa spoa_chr21_allele159_coverage1_unpolished.fa spoa_chr21_allele15_coverage29_unpolished.fa spoa_chr21_allele160_coverage1_unpolished.fa spoa_chr21_allele161_coverage1_unpolished.fa spoa_chr21_allele162_coverage1_unpolished.fa spoa_chr21_allele163_coverage1_unpolished.fa spoa_chr21_allele164_coverage1_unpolished.fa spoa_chr21_allele165_coverage1_unpolished.fa spoa_chr21_allele166_coverage1_unpolished.fa spoa_chr21_allele167_coverage1_unpolished.fa spoa_chr21_allele168_coverage1_unpolished.fa spoa_chr21_allele169_coverage1_unpolished.fa spoa_chr21_allele16_coverage1_unpolished.fa spoa_chr21_allele170_coverage1_unpolished.fa spoa_chr21_allele171_coverage1_unpolished.fa spoa_chr21_allele172_coverage1_unpolished.fa spoa_chr21_allele173_coverage1_unpolished.fa spoa_chr21_allele174_coverage1_unpolished.fa spoa_chr21_allele175_coverage1_unpolished.fa spoa_chr21_allele176_coverage1_unpolished.fa spoa_chr21_allele177_coverage1_unpolished.fa spoa_chr21_allele178_coverage1_unpolished.fa spoa_chr21_allele179_coverage1_unpolished.fa spoa_chr21_allele17_coverage2_unpolished.fa spoa_chr21_allele180_coverage1_unpolished.fa spoa_chr21_allele181_coverage1_unpolished.fa spoa_chr21_allele182_coverage1_unpolished.fa spoa_chr21_allele183_coverage1_unpolished.fa spoa_chr21_allele184_coverage1_unpolished.fa spoa_chr21_allele185_coverage1_unpolished.fa spoa_chr21_allele186_coverage1_unpolished.fa spoa_chr21_allele187_coverage1_unpolished.fa spoa_chr21_allele188_coverage1_unpolished.fa spoa_chr21_allele189_coverage1_unpolished.fa spoa_chr21_allele18_coverage1_unpolished.fa spoa_chr21_allele190_coverage1_unpolished.fa spoa_chr21_allele191_coverage1_unpolished.fa spoa_chr21_allele192_coverage1_unpolished.fa spoa_chr21_allele193_coverage1_unpolished.fa spoa_chr21_allele194_coverage1_unpolished.fa spoa_chr21_allele195_coverage1_unpolished.fa spoa_chr21_allele196_coverage1_unpolished.fa spoa_chr21_allele197_coverage1_unpolished.fa spoa_chr21_allele198_coverage1_unpolished.fa spoa_chr21_allele199_coverage1_unpolished.fa spoa_chr21_allele19_coverage1_unpolished.fa spoa_chr21_allele1_coverage1_unpolished.fa spoa_chr21_allele200_coverage1_unpolished.fa spoa_chr21_allele201_coverage1_unpolished.fa spoa_chr21_allele202_coverage1_unpolished.fa spoa_chr21_allele203_coverage1_unpolished.fa spoa_chr21_allele204_coverage1_unpolished.fa spoa_chr21_allele205_coverage1_unpolished.fa spoa_chr21_allele206_coverage1_unpolished.fa spoa_chr21_allele207_coverage1_unpolished.fa spoa_chr21_allele208_coverage1_unpolished.fa spoa_chr21_allele209_coverage1_unpolished.fa spoa_chr21_allele20_coverage1_unpolished.fa spoa_chr21_allele210_coverage1_unpolished.fa spoa_chr21_allele211_coverage1_unpolished.fa spoa_chr21_allele212_coverage1_unpolished.fa spoa_chr21_allele213_coverage1_unpolished.fa spoa_chr21_allele214_coverage8_unpolished.fa spoa_chr21_allele215_coverage1_unpolished.fa spoa_chr21_allele216_coverage1_unpolished.fa spoa_chr21_allele217_coverage1_unpolished.fa spoa_chr21_allele218_coverage1_unpolished.fa spoa_chr21_allele219_coverage1_unpolished.fa spoa_chr21_allele21_coverage1_unpolished.fa spoa_chr21_allele220_coverage1_unpolished.fa spoa_chr21_allele221_coverage1_unpolished.fa spoa_chr21_allele222_coverage1_unpolished.fa spoa_chr21_allele223_coverage1_unpolished.fa spoa_chr21_allele224_coverage3_unpolished.fa spoa_chr21_allele225_coverage1_unpolished.fa spoa_chr21_allele226_coverage49_unpolished.fa spoa_chr21_allele227_coverage1_unpolished.fa spoa_chr21_allele228_coverage1_unpolished.fa spoa_chr21_allele229_coverage1_unpolished.fa spoa_chr21_allele22_coverage1_unpolished.fa spoa_chr21_allele230_coverage1_unpolished.fa spoa_chr21_allele231_coverage1_unpolished.fa spoa_chr21_allele232_coverage1_unpolished.fa spoa_chr21_allele233_coverage1_unpolished.fa spoa_chr21_allele234_coverage20_unpolished.fa spoa_chr21_allele235_coverage1_unpolished.fa spoa_chr21_allele236_coverage1_unpolished.fa spoa_chr21_allele237_coverage1_unpolished.fa spoa_chr21_allele238_coverage1_unpolished.fa spoa_chr21_allele239_coverage1_unpolished.fa spoa_chr21_allele23_coverage1_unpolished.fa spoa_chr21_allele240_coverage1_unpolished.fa spoa_chr21_allele241_coverage1_unpolished.fa spoa_chr21_allele242_coverage1_unpolished.fa spoa_chr21_allele243_coverage1_unpolished.fa spoa_chr21_allele244_coverage1_unpolished.fa spoa_chr21_allele245_coverage1_unpolished.fa spoa_chr21_allele246_coverage1_unpolished.fa spoa_chr21_allele247_coverage35_unpolished.fa spoa_chr21_allele248_coverage1_unpolished.fa spoa_chr21_allele249_coverage1_unpolished.fa spoa_chr21_allele24_coverage2_unpolished.fa spoa_chr21_allele250_coverage1_unpolished.fa spoa_chr21_allele251_coverage1_unpolished.fa spoa_chr21_allele252_coverage1_unpolished.fa spoa_chr21_allele253_coverage1_unpolished.fa spoa_chr21_allele254_coverage1_unpolished.fa spoa_chr21_allele255_coverage1_unpolished.fa spoa_chr21_allele256_coverage1_unpolished.fa spoa_chr21_allele257_coverage1_unpolished.fa spoa_chr21_allele258_coverage1_unpolished.fa spoa_chr21_allele259_coverage1_unpolished.fa spoa_chr21_allele25_coverage1_unpolished.fa spoa_chr21_allele260_coverage1_unpolished.fa spoa_chr21_allele261_coverage1_unpolished.fa spoa_chr21_allele262_coverage2_unpolished.fa spoa_chr21_allele263_coverage1_unpolished.fa spoa_chr21_allele264_coverage17_unpolished.fa spoa_chr21_allele265_coverage1_unpolished.fa spoa_chr21_allele266_coverage1_unpolished.fa spoa_chr21_allele267_coverage1_unpolished.fa spoa_chr21_allele268_coverage1_unpolished.fa spoa_chr21_allele269_coverage1_unpolished.fa spoa_chr21_allele26_coverage1_unpolished.fa spoa_chr21_allele270_coverage1_unpolished.fa spoa_chr21_allele271_coverage1_unpolished.fa spoa_chr21_allele272_coverage2_unpolished.fa spoa_chr21_allele273_coverage1_unpolished.fa spoa_chr21_allele274_coverage1_unpolished.fa spoa_chr21_allele275_coverage1_unpolished.fa spoa_chr21_allele276_coverage1_unpolished.fa spoa_chr21_allele277_coverage1_unpolished.fa spoa_chr21_allele278_coverage1_unpolished.fa spoa_chr21_allele279_coverage1_unpolished.fa spoa_chr21_allele27_coverage1_unpolished.fa spoa_chr21_allele28_coverage1_unpolished.fa spoa_chr21_allele29_coverage3_unpolished.fa spoa_chr21_allele2_coverage1_unpolished.fa spoa_chr21_allele30_coverage12_unpolished.fa spoa_chr21_allele31_coverage1_unpolished.fa spoa_chr21_allele32_coverage1_unpolished.fa spoa_chr21_allele33_coverage1_unpolished.fa spoa_chr21_allele34_coverage1_unpolished.fa spoa_chr21_allele35_coverage1_unpolished.fa spoa_chr21_allele36_coverage100_unpolished.fa spoa_chr21_allele37_coverage1_unpolished.fa spoa_chr21_allele38_coverage1_unpolished.fa spoa_chr21_allele39_coverage1_unpolished.fa spoa_chr21_allele3_coverage1_unpolished.fa spoa_chr21_allele40_coverage1_unpolished.fa spoa_chr21_allele41_coverage2_unpolished.fa spoa_chr21_allele42_coverage2_unpolished.fa spoa_chr21_allele43_coverage1_unpolished.fa spoa_chr21_allele44_coverage1_unpolished.fa spoa_chr21_allele45_coverage1_unpolished.fa spoa_chr21_allele46_coverage1_unpolished.fa spoa_chr21_allele47_coverage1_unpolished.fa spoa_chr21_allele48_coverage1_unpolished.fa spoa_chr21_allele49_coverage1_unpolished.fa spoa_chr21_allele4_coverage1_unpolished.fa spoa_chr21_allele50_coverage1_unpolished.fa spoa_chr21_allele51_coverage2_unpolished.fa spoa_chr21_allele52_coverage1_unpolished.fa spoa_chr21_allele53_coverage1_unpolished.fa spoa_chr21_allele54_coverage1_unpolished.fa spoa_chr21_allele55_coverage1_unpolished.fa spoa_chr21_allele56_coverage1_unpolished.fa spoa_chr21_allele57_coverage20_unpolished.fa spoa_chr21_allele58_coverage1_unpolished.fa spoa_chr21_allele59_coverage1_unpolished.fa spoa_chr21_allele5_coverage1_unpolished.fa spoa_chr21_allele60_coverage1_unpolished.fa spoa_chr21_allele61_coverage38_unpolished.fa spoa_chr21_allele62_coverage1_unpolished.fa spoa_chr21_allele63_coverage1_unpolished.fa spoa_chr21_allele64_coverage1_unpolished.fa spoa_chr21_allele65_coverage1_unpolished.fa spoa_chr21_allele66_coverage1_unpolished.fa spoa_chr21_allele67_coverage1_unpolished.fa spoa_chr21_allele68_coverage1_unpolished.fa spoa_chr21_allele69_coverage1_unpolished.fa spoa_chr21_allele6_coverage1_unpolished.fa spoa_chr21_allele70_coverage1_unpolished.fa spoa_chr21_allele71_coverage1_unpolished.fa spoa_chr21_allele72_coverage1_unpolished.fa spoa_chr21_allele73_coverage1_unpolished.fa spoa_chr21_allele74_coverage26_unpolished.fa spoa_chr21_allele75_coverage1_unpolished.fa spoa_chr21_allele76_coverage1_unpolished.fa spoa_chr21_allele77_coverage1_unpolished.fa spoa_chr21_allele78_coverage1_unpolished.fa spoa_chr21_allele79_coverage1_unpolished.fa spoa_chr21_allele7_coverage1_unpolished.fa spoa_chr21_allele80_coverage1_unpolished.fa spoa_chr21_allele81_coverage1_unpolished.fa spoa_chr21_allele82_coverage1_unpolished.fa spoa_chr21_allele83_coverage1_unpolished.fa spoa_chr21_allele84_coverage1_unpolished.fa spoa_chr21_allele85_coverage1_unpolished.fa spoa_chr21_allele86_coverage1_unpolished.fa spoa_chr21_allele87_coverage1_unpolished.fa spoa_chr21_allele88_coverage1_unpolished.fa spoa_chr21_allele89_coverage1_unpolished.fa spoa_chr21_allele8_coverage1_unpolished.fa spoa_chr21_allele90_coverage1_unpolished.fa spoa_chr21_allele91_coverage1_unpolished.fa spoa_chr21_allele92_coverage1_unpolished.fa spoa_chr21_allele93_coverage1_unpolished.fa spoa_chr21_allele94_coverage1_unpolished.fa spoa_chr21_allele95_coverage1_unpolished.fa spoa_chr21_allele96_coverage1_unpolished.fa spoa_chr21_allele97_coverage2_unpolished.fa spoa_chr21_allele98_coverage1_unpolished.fa spoa_chr21_allele99_coverage1_unpolished.fa spoa_chr21_allele9_coverage1_unpolished.fa spoa_chr22_allele0_coverage1_unpolished.fa spoa_chr22_allele10_coverage1_unpolished.fa spoa_chr22_allele11_coverage3_unpolished.fa spoa_chr22_allele12_coverage1_unpolished.fa spoa_chr22_allele13_coverage1_unpolished.fa spoa_chr22_allele14_coverage1_unpolished.fa spoa_chr22_allele15_coverage1_unpolished.fa spoa_chr22_allele16_coverage1_unpolished.fa spoa_chr22_allele17_coverage1_unpolished.fa spoa_chr22_allele18_coverage1_unpolished.fa spoa_chr22_allele19_coverage1_unpolished.fa spoa_chr22_allele1_coverage1_unpolished.fa spoa_chr22_allele20_coverage1_unpolished.fa spoa_chr22_allele21_coverage5_unpolished.fa spoa_chr22_allele22_coverage33_unpolished.fa spoa_chr22_allele23_coverage1_unpolished.fa spoa_chr22_allele24_coverage1_unpolished.fa spoa_chr22_allele25_coverage1_unpolished.fa spoa_chr22_allele26_coverage1_unpolished.fa spoa_chr22_allele27_coverage1_unpolished.fa spoa_chr22_allele28_coverage1_unpolished.fa spoa_chr22_allele29_coverage1_unpolished.fa spoa_chr22_allele2_coverage2_unpolished.fa spoa_chr22_allele30_coverage1_unpolished.fa spoa_chr22_allele31_coverage1_unpolished.fa spoa_chr22_allele32_coverage18_unpolished.fa spoa_chr22_allele33_coverage1_unpolished.fa spoa_chr22_allele34_coverage1_unpolished.fa spoa_chr22_allele35_coverage1_unpolished.fa spoa_chr22_allele3_coverage1_unpolished.fa spoa_chr22_allele4_coverage4_unpolished.fa spoa_chr22_allele5_coverage1_unpolished.fa spoa_chr22_allele6_coverage1_unpolished.fa spoa_chr22_allele7_coverage11_unpolished.fa spoa_chr22_allele8_coverage1_unpolished.fa spoa_chr22_allele9_coverage167_unpolished.fa 
snakemake --cores 40 spoa_chr13_allele0_coverage1_unrotated.fa spoa_chr13_allele100_coverage1_unrotated.fa spoa_chr13_allele101_coverage1_unrotated.fa spoa_chr13_allele102_coverage3_unrotated.fa spoa_chr13_allele103_coverage1_unrotated.fa spoa_chr13_allele104_coverage1_unrotated.fa spoa_chr13_allele105_coverage1_unrotated.fa spoa_chr13_allele106_coverage12_unrotated.fa spoa_chr13_allele107_coverage1_unrotated.fa spoa_chr13_allele108_coverage1_unrotated.fa spoa_chr13_allele109_coverage1_unrotated.fa spoa_chr13_allele10_coverage1_unrotated.fa spoa_chr13_allele110_coverage1_unrotated.fa spoa_chr13_allele111_coverage1_unrotated.fa spoa_chr13_allele112_coverage1_unrotated.fa spoa_chr13_allele113_coverage1_unrotated.fa spoa_chr13_allele114_coverage1_unrotated.fa spoa_chr13_allele115_coverage1_unrotated.fa spoa_chr13_allele116_coverage1_unrotated.fa spoa_chr13_allele117_coverage1_unrotated.fa spoa_chr13_allele118_coverage1_unrotated.fa spoa_chr13_allele119_coverage1_unrotated.fa spoa_chr13_allele11_coverage1_unrotated.fa spoa_chr13_allele120_coverage1_unrotated.fa spoa_chr13_allele121_coverage1_unrotated.fa spoa_chr13_allele122_coverage1_unrotated.fa spoa_chr13_allele123_coverage1_unrotated.fa spoa_chr13_allele124_coverage1_unrotated.fa spoa_chr13_allele125_coverage1_unrotated.fa spoa_chr13_allele126_coverage1_unrotated.fa spoa_chr13_allele127_coverage1_unrotated.fa spoa_chr13_allele128_coverage1_unrotated.fa spoa_chr13_allele129_coverage1_unrotated.fa spoa_chr13_allele12_coverage1_unrotated.fa spoa_chr13_allele130_coverage1_unrotated.fa spoa_chr13_allele131_coverage1_unrotated.fa spoa_chr13_allele132_coverage1_unrotated.fa spoa_chr13_allele133_coverage1_unrotated.fa spoa_chr13_allele134_coverage1_unrotated.fa spoa_chr13_allele135_coverage1_unrotated.fa spoa_chr13_allele136_coverage1_unrotated.fa spoa_chr13_allele137_coverage1_unrotated.fa spoa_chr13_allele138_coverage1_unrotated.fa spoa_chr13_allele139_coverage1_unrotated.fa spoa_chr13_allele13_coverage1_unrotated.fa spoa_chr13_allele140_coverage1_unrotated.fa spoa_chr13_allele141_coverage1_unrotated.fa spoa_chr13_allele142_coverage1_unrotated.fa spoa_chr13_allele143_coverage1_unrotated.fa spoa_chr13_allele144_coverage1_unrotated.fa spoa_chr13_allele145_coverage1_unrotated.fa spoa_chr13_allele146_coverage1_unrotated.fa spoa_chr13_allele147_coverage1_unrotated.fa spoa_chr13_allele148_coverage1_unrotated.fa spoa_chr13_allele149_coverage1_unrotated.fa spoa_chr13_allele14_coverage2_unrotated.fa spoa_chr13_allele150_coverage1_unrotated.fa spoa_chr13_allele151_coverage2_unrotated.fa spoa_chr13_allele152_coverage1_unrotated.fa spoa_chr13_allele153_coverage1_unrotated.fa spoa_chr13_allele154_coverage1_unrotated.fa spoa_chr13_allele155_coverage1_unrotated.fa spoa_chr13_allele156_coverage5_unrotated.fa spoa_chr13_allele157_coverage1_unrotated.fa spoa_chr13_allele158_coverage1_unrotated.fa spoa_chr13_allele159_coverage1_unrotated.fa spoa_chr13_allele15_coverage1_unrotated.fa spoa_chr13_allele160_coverage1_unrotated.fa spoa_chr13_allele161_coverage1_unrotated.fa spoa_chr13_allele162_coverage1_unrotated.fa spoa_chr13_allele163_coverage1_unrotated.fa spoa_chr13_allele164_coverage1_unrotated.fa spoa_chr13_allele165_coverage1_unrotated.fa spoa_chr13_allele166_coverage1_unrotated.fa spoa_chr13_allele167_coverage1_unrotated.fa spoa_chr13_allele168_coverage1_unrotated.fa spoa_chr13_allele169_coverage1_unrotated.fa spoa_chr13_allele16_coverage3_unrotated.fa spoa_chr13_allele170_coverage1_unrotated.fa spoa_chr13_allele171_coverage1_unrotated.fa spoa_chr13_allele172_coverage1_unrotated.fa spoa_chr13_allele173_coverage1_unrotated.fa spoa_chr13_allele174_coverage1_unrotated.fa spoa_chr13_allele175_coverage1_unrotated.fa spoa_chr13_allele176_coverage1_unrotated.fa spoa_chr13_allele177_coverage1_unrotated.fa spoa_chr13_allele178_coverage86_unrotated.fa spoa_chr13_allele179_coverage1_unrotated.fa spoa_chr13_allele17_coverage1_unrotated.fa spoa_chr13_allele180_coverage1_unrotated.fa spoa_chr13_allele181_coverage1_unrotated.fa spoa_chr13_allele182_coverage1_unrotated.fa spoa_chr13_allele183_coverage1_unrotated.fa spoa_chr13_allele184_coverage1_unrotated.fa spoa_chr13_allele185_coverage1_unrotated.fa spoa_chr13_allele186_coverage1_unrotated.fa spoa_chr13_allele187_coverage1_unrotated.fa spoa_chr13_allele188_coverage1_unrotated.fa spoa_chr13_allele189_coverage1_unrotated.fa spoa_chr13_allele18_coverage1_unrotated.fa spoa_chr13_allele190_coverage1_unrotated.fa spoa_chr13_allele191_coverage1_unrotated.fa spoa_chr13_allele192_coverage1_unrotated.fa spoa_chr13_allele193_coverage28_unrotated.fa spoa_chr13_allele194_coverage1_unrotated.fa spoa_chr13_allele195_coverage1_unrotated.fa spoa_chr13_allele196_coverage1_unrotated.fa spoa_chr13_allele197_coverage1_unrotated.fa spoa_chr13_allele198_coverage1_unrotated.fa spoa_chr13_allele199_coverage1_unrotated.fa spoa_chr13_allele19_coverage1_unrotated.fa spoa_chr13_allele1_coverage1_unrotated.fa spoa_chr13_allele200_coverage1_unrotated.fa spoa_chr13_allele201_coverage2_unrotated.fa spoa_chr13_allele202_coverage1_unrotated.fa spoa_chr13_allele203_coverage2_unrotated.fa spoa_chr13_allele204_coverage1_unrotated.fa spoa_chr13_allele205_coverage1_unrotated.fa spoa_chr13_allele206_coverage1_unrotated.fa spoa_chr13_allele207_coverage2_unrotated.fa spoa_chr13_allele208_coverage1_unrotated.fa spoa_chr13_allele209_coverage1_unrotated.fa spoa_chr13_allele20_coverage1_unrotated.fa spoa_chr13_allele210_coverage1_unrotated.fa spoa_chr13_allele211_coverage19_unrotated.fa spoa_chr13_allele212_coverage1_unrotated.fa spoa_chr13_allele213_coverage1_unrotated.fa spoa_chr13_allele214_coverage1_unrotated.fa spoa_chr13_allele215_coverage1_unrotated.fa spoa_chr13_allele216_coverage2_unrotated.fa spoa_chr13_allele217_coverage1_unrotated.fa spoa_chr13_allele218_coverage1_unrotated.fa spoa_chr13_allele219_coverage1_unrotated.fa spoa_chr13_allele21_coverage1_unrotated.fa spoa_chr13_allele220_coverage1_unrotated.fa spoa_chr13_allele221_coverage1_unrotated.fa spoa_chr13_allele222_coverage1_unrotated.fa spoa_chr13_allele223_coverage1_unrotated.fa spoa_chr13_allele224_coverage1_unrotated.fa spoa_chr13_allele225_coverage1_unrotated.fa spoa_chr13_allele226_coverage1_unrotated.fa spoa_chr13_allele227_coverage1_unrotated.fa spoa_chr13_allele228_coverage1_unrotated.fa spoa_chr13_allele229_coverage1_unrotated.fa spoa_chr13_allele22_coverage1_unrotated.fa spoa_chr13_allele230_coverage1_unrotated.fa spoa_chr13_allele231_coverage1_unrotated.fa spoa_chr13_allele232_coverage1_unrotated.fa spoa_chr13_allele233_coverage7_unrotated.fa spoa_chr13_allele234_coverage1_unrotated.fa spoa_chr13_allele235_coverage1_unrotated.fa spoa_chr13_allele236_coverage1_unrotated.fa spoa_chr13_allele237_coverage1_unrotated.fa spoa_chr13_allele238_coverage1_unrotated.fa spoa_chr13_allele239_coverage1_unrotated.fa spoa_chr13_allele23_coverage1_unrotated.fa spoa_chr13_allele240_coverage1_unrotated.fa spoa_chr13_allele241_coverage1_unrotated.fa spoa_chr13_allele242_coverage1_unrotated.fa spoa_chr13_allele243_coverage5_unrotated.fa spoa_chr13_allele244_coverage1_unrotated.fa spoa_chr13_allele245_coverage1_unrotated.fa spoa_chr13_allele246_coverage1_unrotated.fa spoa_chr13_allele247_coverage1_unrotated.fa spoa_chr13_allele248_coverage1_unrotated.fa spoa_chr13_allele249_coverage1_unrotated.fa spoa_chr13_allele24_coverage1_unrotated.fa spoa_chr13_allele250_coverage1_unrotated.fa spoa_chr13_allele251_coverage1_unrotated.fa spoa_chr13_allele252_coverage1_unrotated.fa spoa_chr13_allele253_coverage1_unrotated.fa spoa_chr13_allele254_coverage1_unrotated.fa spoa_chr13_allele255_coverage35_unrotated.fa spoa_chr13_allele256_coverage1_unrotated.fa spoa_chr13_allele257_coverage3_unrotated.fa spoa_chr13_allele258_coverage1_unrotated.fa spoa_chr13_allele259_coverage1_unrotated.fa spoa_chr13_allele25_coverage1_unrotated.fa spoa_chr13_allele260_coverage1_unrotated.fa spoa_chr13_allele261_coverage1_unrotated.fa spoa_chr13_allele262_coverage2_unrotated.fa spoa_chr13_allele263_coverage1_unrotated.fa spoa_chr13_allele264_coverage1_unrotated.fa spoa_chr13_allele26_coverage1_unrotated.fa spoa_chr13_allele27_coverage1_unrotated.fa spoa_chr13_allele28_coverage1_unrotated.fa spoa_chr13_allele29_coverage1_unrotated.fa spoa_chr13_allele2_coverage1_unrotated.fa spoa_chr13_allele30_coverage1_unrotated.fa spoa_chr13_allele31_coverage1_unrotated.fa spoa_chr13_allele32_coverage1_unrotated.fa spoa_chr13_allele33_coverage1_unrotated.fa spoa_chr13_allele34_coverage1_unrotated.fa spoa_chr13_allele35_coverage1_unrotated.fa spoa_chr13_allele36_coverage1_unrotated.fa spoa_chr13_allele37_coverage1_unrotated.fa spoa_chr13_allele38_coverage1_unrotated.fa spoa_chr13_allele39_coverage1_unrotated.fa spoa_chr13_allele3_coverage1_unrotated.fa spoa_chr13_allele40_coverage1_unrotated.fa spoa_chr13_allele41_coverage4_unrotated.fa spoa_chr13_allele42_coverage1_unrotated.fa spoa_chr13_allele43_coverage14_unrotated.fa spoa_chr13_allele44_coverage1_unrotated.fa spoa_chr13_allele45_coverage1_unrotated.fa spoa_chr13_allele46_coverage1_unrotated.fa spoa_chr13_allele47_coverage1_unrotated.fa spoa_chr13_allele48_coverage1_unrotated.fa spoa_chr13_allele49_coverage1_unrotated.fa spoa_chr13_allele4_coverage1_unrotated.fa spoa_chr13_allele50_coverage1_unrotated.fa spoa_chr13_allele51_coverage1_unrotated.fa spoa_chr13_allele52_coverage1_unrotated.fa spoa_chr13_allele53_coverage1_unrotated.fa spoa_chr13_allele54_coverage1_unrotated.fa spoa_chr13_allele55_coverage1_unrotated.fa spoa_chr13_allele56_coverage2_unrotated.fa spoa_chr13_allele57_coverage1_unrotated.fa spoa_chr13_allele58_coverage1_unrotated.fa spoa_chr13_allele59_coverage1_unrotated.fa spoa_chr13_allele5_coverage1_unrotated.fa spoa_chr13_allele60_coverage1_unrotated.fa spoa_chr13_allele61_coverage1_unrotated.fa spoa_chr13_allele62_coverage1_unrotated.fa spoa_chr13_allele63_coverage1_unrotated.fa spoa_chr13_allele64_coverage1_unrotated.fa spoa_chr13_allele65_coverage1_unrotated.fa spoa_chr13_allele66_coverage1_unrotated.fa spoa_chr13_allele67_coverage1_unrotated.fa spoa_chr13_allele68_coverage1_unrotated.fa spoa_chr13_allele69_coverage1_unrotated.fa spoa_chr13_allele6_coverage1_unrotated.fa spoa_chr13_allele70_coverage1_unrotated.fa spoa_chr13_allele71_coverage1_unrotated.fa spoa_chr13_allele72_coverage1_unrotated.fa spoa_chr13_allele73_coverage1_unrotated.fa spoa_chr13_allele74_coverage1_unrotated.fa spoa_chr13_allele75_coverage1_unrotated.fa spoa_chr13_allele76_coverage1_unrotated.fa spoa_chr13_allele77_coverage1_unrotated.fa spoa_chr13_allele78_coverage1_unrotated.fa spoa_chr13_allele79_coverage1_unrotated.fa spoa_chr13_allele7_coverage1_unrotated.fa spoa_chr13_allele80_coverage1_unrotated.fa spoa_chr13_allele81_coverage1_unrotated.fa spoa_chr13_allele82_coverage1_unrotated.fa spoa_chr13_allele83_coverage1_unrotated.fa spoa_chr13_allele84_coverage1_unrotated.fa spoa_chr13_allele85_coverage1_unrotated.fa spoa_chr13_allele86_coverage503_unrotated.fa spoa_chr13_allele87_coverage1_unrotated.fa spoa_chr13_allele88_coverage1_unrotated.fa spoa_chr13_allele89_coverage1_unrotated.fa spoa_chr13_allele8_coverage1_unrotated.fa spoa_chr13_allele90_coverage1_unrotated.fa spoa_chr13_allele91_coverage1_unrotated.fa spoa_chr13_allele92_coverage1_unrotated.fa spoa_chr13_allele93_coverage1_unrotated.fa spoa_chr13_allele94_coverage9_unrotated.fa spoa_chr13_allele95_coverage1_unrotated.fa spoa_chr13_allele96_coverage1_unrotated.fa spoa_chr13_allele97_coverage17_unrotated.fa spoa_chr13_allele98_coverage1_unrotated.fa spoa_chr13_allele99_coverage1_unrotated.fa spoa_chr13_allele9_coverage1_unrotated.fa spoa_chr14_allele0_coverage1_unrotated.fa spoa_chr14_allele1_coverage2_unrotated.fa spoa_chr14_allele2_coverage59_unrotated.fa spoa_chr14_allele3_coverage16_unrotated.fa spoa_chr14_allele4_coverage1_unrotated.fa spoa_chr14_allele5_coverage17_unrotated.fa spoa_chr14_allele6_coverage1_unrotated.fa spoa_chr14_allele7_coverage1_unrotated.fa spoa_chr15_allele0_coverage1_unrotated.fa spoa_chr15_allele10_coverage1_unrotated.fa spoa_chr15_allele11_coverage1_unrotated.fa spoa_chr15_allele12_coverage1_unrotated.fa spoa_chr15_allele13_coverage1_unrotated.fa spoa_chr15_allele14_coverage1_unrotated.fa spoa_chr15_allele15_coverage1_unrotated.fa spoa_chr15_allele16_coverage1_unrotated.fa spoa_chr15_allele17_coverage86_unrotated.fa spoa_chr15_allele18_coverage1_unrotated.fa spoa_chr15_allele19_coverage1_unrotated.fa spoa_chr15_allele1_coverage1_unrotated.fa spoa_chr15_allele20_coverage1_unrotated.fa spoa_chr15_allele21_coverage1_unrotated.fa spoa_chr15_allele22_coverage1_unrotated.fa spoa_chr15_allele23_coverage74_unrotated.fa spoa_chr15_allele24_coverage1_unrotated.fa spoa_chr15_allele25_coverage1_unrotated.fa spoa_chr15_allele26_coverage1_unrotated.fa spoa_chr15_allele27_coverage1_unrotated.fa spoa_chr15_allele28_coverage1_unrotated.fa spoa_chr15_allele29_coverage1_unrotated.fa spoa_chr15_allele2_coverage1_unrotated.fa spoa_chr15_allele30_coverage1_unrotated.fa spoa_chr15_allele31_coverage1_unrotated.fa spoa_chr15_allele32_coverage1_unrotated.fa spoa_chr15_allele33_coverage1_unrotated.fa spoa_chr15_allele34_coverage38_unrotated.fa spoa_chr15_allele35_coverage106_unrotated.fa spoa_chr15_allele36_coverage1_unrotated.fa spoa_chr15_allele37_coverage1_unrotated.fa spoa_chr15_allele38_coverage1_unrotated.fa spoa_chr15_allele39_coverage2_unrotated.fa spoa_chr15_allele3_coverage1_unrotated.fa spoa_chr15_allele40_coverage2_unrotated.fa spoa_chr15_allele41_coverage8_unrotated.fa spoa_chr15_allele42_coverage1_unrotated.fa spoa_chr15_allele43_coverage1_unrotated.fa spoa_chr15_allele44_coverage1_unrotated.fa spoa_chr15_allele45_coverage1_unrotated.fa spoa_chr15_allele46_coverage1_unrotated.fa spoa_chr15_allele47_coverage38_unrotated.fa spoa_chr15_allele48_coverage1_unrotated.fa spoa_chr15_allele49_coverage1_unrotated.fa spoa_chr15_allele4_coverage1_unrotated.fa spoa_chr15_allele50_coverage1_unrotated.fa spoa_chr15_allele51_coverage1_unrotated.fa spoa_chr15_allele52_coverage1_unrotated.fa spoa_chr15_allele53_coverage1_unrotated.fa spoa_chr15_allele54_coverage1_unrotated.fa spoa_chr15_allele55_coverage1_unrotated.fa spoa_chr15_allele56_coverage1_unrotated.fa spoa_chr15_allele57_coverage1_unrotated.fa spoa_chr15_allele58_coverage16_unrotated.fa spoa_chr15_allele59_coverage1_unrotated.fa spoa_chr15_allele5_coverage1_unrotated.fa spoa_chr15_allele60_coverage1_unrotated.fa spoa_chr15_allele61_coverage1_unrotated.fa spoa_chr15_allele6_coverage1_unrotated.fa spoa_chr15_allele7_coverage1_unrotated.fa spoa_chr15_allele8_coverage1_unrotated.fa spoa_chr15_allele9_coverage1_unrotated.fa spoa_chr21_allele0_coverage1_unrotated.fa spoa_chr21_allele100_coverage1_unrotated.fa spoa_chr21_allele101_coverage1_unrotated.fa spoa_chr21_allele102_coverage1_unrotated.fa spoa_chr21_allele103_coverage1_unrotated.fa spoa_chr21_allele104_coverage1_unrotated.fa spoa_chr21_allele105_coverage1_unrotated.fa spoa_chr21_allele106_coverage1_unrotated.fa spoa_chr21_allele107_coverage2_unrotated.fa spoa_chr21_allele108_coverage1_unrotated.fa spoa_chr21_allele109_coverage1_unrotated.fa spoa_chr21_allele10_coverage1_unrotated.fa spoa_chr21_allele110_coverage1_unrotated.fa spoa_chr21_allele111_coverage1_unrotated.fa spoa_chr21_allele112_coverage1_unrotated.fa spoa_chr21_allele113_coverage1_unrotated.fa spoa_chr21_allele114_coverage1_unrotated.fa spoa_chr21_allele115_coverage1_unrotated.fa spoa_chr21_allele116_coverage6_unrotated.fa spoa_chr21_allele117_coverage1_unrotated.fa spoa_chr21_allele118_coverage1_unrotated.fa spoa_chr21_allele119_coverage1_unrotated.fa spoa_chr21_allele11_coverage1_unrotated.fa spoa_chr21_allele120_coverage1_unrotated.fa spoa_chr21_allele121_coverage318_unrotated.fa spoa_chr21_allele122_coverage1_unrotated.fa spoa_chr21_allele123_coverage1_unrotated.fa spoa_chr21_allele124_coverage1_unrotated.fa spoa_chr21_allele125_coverage1_unrotated.fa spoa_chr21_allele126_coverage1_unrotated.fa spoa_chr21_allele127_coverage1_unrotated.fa spoa_chr21_allele128_coverage1_unrotated.fa spoa_chr21_allele129_coverage1_unrotated.fa spoa_chr21_allele12_coverage1_unrotated.fa spoa_chr21_allele130_coverage1_unrotated.fa spoa_chr21_allele131_coverage1_unrotated.fa spoa_chr21_allele132_coverage1_unrotated.fa spoa_chr21_allele133_coverage1_unrotated.fa spoa_chr21_allele134_coverage1_unrotated.fa spoa_chr21_allele135_coverage1_unrotated.fa spoa_chr21_allele136_coverage1_unrotated.fa spoa_chr21_allele137_coverage1_unrotated.fa spoa_chr21_allele138_coverage1_unrotated.fa spoa_chr21_allele139_coverage1_unrotated.fa spoa_chr21_allele13_coverage1_unrotated.fa spoa_chr21_allele140_coverage1_unrotated.fa spoa_chr21_allele141_coverage1_unrotated.fa spoa_chr21_allele142_coverage1_unrotated.fa spoa_chr21_allele143_coverage1_unrotated.fa spoa_chr21_allele144_coverage1_unrotated.fa spoa_chr21_allele145_coverage1_unrotated.fa spoa_chr21_allele146_coverage1_unrotated.fa spoa_chr21_allele147_coverage1_unrotated.fa spoa_chr21_allele148_coverage1_unrotated.fa spoa_chr21_allele149_coverage1_unrotated.fa spoa_chr21_allele14_coverage1_unrotated.fa spoa_chr21_allele150_coverage1_unrotated.fa spoa_chr21_allele151_coverage1_unrotated.fa spoa_chr21_allele152_coverage1_unrotated.fa spoa_chr21_allele153_coverage1_unrotated.fa spoa_chr21_allele154_coverage1_unrotated.fa spoa_chr21_allele155_coverage1_unrotated.fa spoa_chr21_allele156_coverage1_unrotated.fa spoa_chr21_allele157_coverage1_unrotated.fa spoa_chr21_allele158_coverage1_unrotated.fa spoa_chr21_allele159_coverage1_unrotated.fa spoa_chr21_allele15_coverage29_unrotated.fa spoa_chr21_allele160_coverage1_unrotated.fa spoa_chr21_allele161_coverage1_unrotated.fa spoa_chr21_allele162_coverage1_unrotated.fa spoa_chr21_allele163_coverage1_unrotated.fa spoa_chr21_allele164_coverage1_unrotated.fa spoa_chr21_allele165_coverage1_unrotated.fa spoa_chr21_allele166_coverage1_unrotated.fa spoa_chr21_allele167_coverage1_unrotated.fa spoa_chr21_allele168_coverage1_unrotated.fa spoa_chr21_allele169_coverage1_unrotated.fa spoa_chr21_allele16_coverage1_unrotated.fa spoa_chr21_allele170_coverage1_unrotated.fa spoa_chr21_allele171_coverage1_unrotated.fa spoa_chr21_allele172_coverage1_unrotated.fa spoa_chr21_allele173_coverage1_unrotated.fa spoa_chr21_allele174_coverage1_unrotated.fa spoa_chr21_allele175_coverage1_unrotated.fa spoa_chr21_allele176_coverage1_unrotated.fa spoa_chr21_allele177_coverage1_unrotated.fa spoa_chr21_allele178_coverage1_unrotated.fa spoa_chr21_allele179_coverage1_unrotated.fa spoa_chr21_allele17_coverage2_unrotated.fa spoa_chr21_allele180_coverage1_unrotated.fa spoa_chr21_allele181_coverage1_unrotated.fa spoa_chr21_allele182_coverage1_unrotated.fa spoa_chr21_allele183_coverage1_unrotated.fa spoa_chr21_allele184_coverage1_unrotated.fa spoa_chr21_allele185_coverage1_unrotated.fa spoa_chr21_allele186_coverage1_unrotated.fa spoa_chr21_allele187_coverage1_unrotated.fa spoa_chr21_allele188_coverage1_unrotated.fa spoa_chr21_allele189_coverage1_unrotated.fa spoa_chr21_allele18_coverage1_unrotated.fa spoa_chr21_allele190_coverage1_unrotated.fa spoa_chr21_allele191_coverage1_unrotated.fa spoa_chr21_allele192_coverage1_unrotated.fa spoa_chr21_allele193_coverage1_unrotated.fa spoa_chr21_allele194_coverage1_unrotated.fa spoa_chr21_allele195_coverage1_unrotated.fa spoa_chr21_allele196_coverage1_unrotated.fa spoa_chr21_allele197_coverage1_unrotated.fa spoa_chr21_allele198_coverage1_unrotated.fa spoa_chr21_allele199_coverage1_unrotated.fa spoa_chr21_allele19_coverage1_unrotated.fa spoa_chr21_allele1_coverage1_unrotated.fa spoa_chr21_allele200_coverage1_unrotated.fa spoa_chr21_allele201_coverage1_unrotated.fa spoa_chr21_allele202_coverage1_unrotated.fa spoa_chr21_allele203_coverage1_unrotated.fa spoa_chr21_allele204_coverage1_unrotated.fa spoa_chr21_allele205_coverage1_unrotated.fa spoa_chr21_allele206_coverage1_unrotated.fa spoa_chr21_allele207_coverage1_unrotated.fa spoa_chr21_allele208_coverage1_unrotated.fa spoa_chr21_allele209_coverage1_unrotated.fa spoa_chr21_allele20_coverage1_unrotated.fa spoa_chr21_allele210_coverage1_unrotated.fa spoa_chr21_allele211_coverage1_unrotated.fa spoa_chr21_allele212_coverage1_unrotated.fa spoa_chr21_allele213_coverage1_unrotated.fa spoa_chr21_allele214_coverage8_unrotated.fa spoa_chr21_allele215_coverage1_unrotated.fa spoa_chr21_allele216_coverage1_unrotated.fa spoa_chr21_allele217_coverage1_unrotated.fa spoa_chr21_allele218_coverage1_unrotated.fa spoa_chr21_allele219_coverage1_unrotated.fa spoa_chr21_allele21_coverage1_unrotated.fa spoa_chr21_allele220_coverage1_unrotated.fa spoa_chr21_allele221_coverage1_unrotated.fa spoa_chr21_allele222_coverage1_unrotated.fa spoa_chr21_allele223_coverage1_unrotated.fa spoa_chr21_allele224_coverage3_unrotated.fa spoa_chr21_allele225_coverage1_unrotated.fa spoa_chr21_allele226_coverage49_unrotated.fa spoa_chr21_allele227_coverage1_unrotated.fa spoa_chr21_allele228_coverage1_unrotated.fa spoa_chr21_allele229_coverage1_unrotated.fa spoa_chr21_allele22_coverage1_unrotated.fa spoa_chr21_allele230_coverage1_unrotated.fa spoa_chr21_allele231_coverage1_unrotated.fa spoa_chr21_allele232_coverage1_unrotated.fa spoa_chr21_allele233_coverage1_unrotated.fa spoa_chr21_allele234_coverage20_unrotated.fa spoa_chr21_allele235_coverage1_unrotated.fa spoa_chr21_allele236_coverage1_unrotated.fa spoa_chr21_allele237_coverage1_unrotated.fa spoa_chr21_allele238_coverage1_unrotated.fa spoa_chr21_allele239_coverage1_unrotated.fa spoa_chr21_allele23_coverage1_unrotated.fa spoa_chr21_allele240_coverage1_unrotated.fa spoa_chr21_allele241_coverage1_unrotated.fa spoa_chr21_allele242_coverage1_unrotated.fa spoa_chr21_allele243_coverage1_unrotated.fa spoa_chr21_allele244_coverage1_unrotated.fa spoa_chr21_allele245_coverage1_unrotated.fa spoa_chr21_allele246_coverage1_unrotated.fa spoa_chr21_allele247_coverage35_unrotated.fa spoa_chr21_allele248_coverage1_unrotated.fa spoa_chr21_allele249_coverage1_unrotated.fa spoa_chr21_allele24_coverage2_unrotated.fa spoa_chr21_allele250_coverage1_unrotated.fa spoa_chr21_allele251_coverage1_unrotated.fa spoa_chr21_allele252_coverage1_unrotated.fa spoa_chr21_allele253_coverage1_unrotated.fa spoa_chr21_allele254_coverage1_unrotated.fa spoa_chr21_allele255_coverage1_unrotated.fa spoa_chr21_allele256_coverage1_unrotated.fa spoa_chr21_allele257_coverage1_unrotated.fa spoa_chr21_allele258_coverage1_unrotated.fa spoa_chr21_allele259_coverage1_unrotated.fa spoa_chr21_allele25_coverage1_unrotated.fa spoa_chr21_allele260_coverage1_unrotated.fa spoa_chr21_allele261_coverage1_unrotated.fa spoa_chr21_allele262_coverage2_unrotated.fa spoa_chr21_allele263_coverage1_unrotated.fa spoa_chr21_allele264_coverage17_unrotated.fa spoa_chr21_allele265_coverage1_unrotated.fa spoa_chr21_allele266_coverage1_unrotated.fa spoa_chr21_allele267_coverage1_unrotated.fa spoa_chr21_allele268_coverage1_unrotated.fa spoa_chr21_allele269_coverage1_unrotated.fa spoa_chr21_allele26_coverage1_unrotated.fa spoa_chr21_allele270_coverage1_unrotated.fa spoa_chr21_allele271_coverage1_unrotated.fa spoa_chr21_allele272_coverage2_unrotated.fa spoa_chr21_allele273_coverage1_unrotated.fa spoa_chr21_allele274_coverage1_unrotated.fa spoa_chr21_allele275_coverage1_unrotated.fa spoa_chr21_allele276_coverage1_unrotated.fa spoa_chr21_allele277_coverage1_unrotated.fa spoa_chr21_allele278_coverage1_unrotated.fa spoa_chr21_allele279_coverage1_unrotated.fa spoa_chr21_allele27_coverage1_unrotated.fa spoa_chr21_allele28_coverage1_unrotated.fa spoa_chr21_allele29_coverage3_unrotated.fa spoa_chr21_allele2_coverage1_unrotated.fa spoa_chr21_allele30_coverage12_unrotated.fa spoa_chr21_allele31_coverage1_unrotated.fa spoa_chr21_allele32_coverage1_unrotated.fa spoa_chr21_allele33_coverage1_unrotated.fa spoa_chr21_allele34_coverage1_unrotated.fa spoa_chr21_allele35_coverage1_unrotated.fa spoa_chr21_allele36_coverage100_unrotated.fa spoa_chr21_allele37_coverage1_unrotated.fa spoa_chr21_allele38_coverage1_unrotated.fa spoa_chr21_allele39_coverage1_unrotated.fa spoa_chr21_allele3_coverage1_unrotated.fa spoa_chr21_allele40_coverage1_unrotated.fa spoa_chr21_allele41_coverage2_unrotated.fa spoa_chr21_allele42_coverage2_unrotated.fa spoa_chr21_allele43_coverage1_unrotated.fa spoa_chr21_allele44_coverage1_unrotated.fa spoa_chr21_allele45_coverage1_unrotated.fa spoa_chr21_allele46_coverage1_unrotated.fa spoa_chr21_allele47_coverage1_unrotated.fa spoa_chr21_allele48_coverage1_unrotated.fa spoa_chr21_allele49_coverage1_unrotated.fa spoa_chr21_allele4_coverage1_unrotated.fa spoa_chr21_allele50_coverage1_unrotated.fa spoa_chr21_allele51_coverage2_unrotated.fa spoa_chr21_allele52_coverage1_unrotated.fa spoa_chr21_allele53_coverage1_unrotated.fa spoa_chr21_allele54_coverage1_unrotated.fa spoa_chr21_allele55_coverage1_unrotated.fa spoa_chr21_allele56_coverage1_unrotated.fa spoa_chr21_allele57_coverage20_unrotated.fa spoa_chr21_allele58_coverage1_unrotated.fa spoa_chr21_allele59_coverage1_unrotated.fa spoa_chr21_allele5_coverage1_unrotated.fa spoa_chr21_allele60_coverage1_unrotated.fa spoa_chr21_allele61_coverage38_unrotated.fa spoa_chr21_allele62_coverage1_unrotated.fa spoa_chr21_allele63_coverage1_unrotated.fa spoa_chr21_allele64_coverage1_unrotated.fa spoa_chr21_allele65_coverage1_unrotated.fa spoa_chr21_allele66_coverage1_unrotated.fa spoa_chr21_allele67_coverage1_unrotated.fa spoa_chr21_allele68_coverage1_unrotated.fa spoa_chr21_allele69_coverage1_unrotated.fa spoa_chr21_allele6_coverage1_unrotated.fa spoa_chr21_allele70_coverage1_unrotated.fa spoa_chr21_allele71_coverage1_unrotated.fa spoa_chr21_allele72_coverage1_unrotated.fa spoa_chr21_allele73_coverage1_unrotated.fa spoa_chr21_allele74_coverage26_unrotated.fa spoa_chr21_allele75_coverage1_unrotated.fa spoa_chr21_allele76_coverage1_unrotated.fa spoa_chr21_allele77_coverage1_unrotated.fa spoa_chr21_allele78_coverage1_unrotated.fa spoa_chr21_allele79_coverage1_unrotated.fa spoa_chr21_allele7_coverage1_unrotated.fa spoa_chr21_allele80_coverage1_unrotated.fa spoa_chr21_allele81_coverage1_unrotated.fa spoa_chr21_allele82_coverage1_unrotated.fa spoa_chr21_allele83_coverage1_unrotated.fa spoa_chr21_allele84_coverage1_unrotated.fa spoa_chr21_allele85_coverage1_unrotated.fa spoa_chr21_allele86_coverage1_unrotated.fa spoa_chr21_allele87_coverage1_unrotated.fa spoa_chr21_allele88_coverage1_unrotated.fa spoa_chr21_allele89_coverage1_unrotated.fa spoa_chr21_allele8_coverage1_unrotated.fa spoa_chr21_allele90_coverage1_unrotated.fa spoa_chr21_allele91_coverage1_unrotated.fa spoa_chr21_allele92_coverage1_unrotated.fa spoa_chr21_allele93_coverage1_unrotated.fa spoa_chr21_allele94_coverage1_unrotated.fa spoa_chr21_allele95_coverage1_unrotated.fa spoa_chr21_allele96_coverage1_unrotated.fa spoa_chr21_allele97_coverage2_unrotated.fa spoa_chr21_allele98_coverage1_unrotated.fa spoa_chr21_allele99_coverage1_unrotated.fa spoa_chr21_allele9_coverage1_unrotated.fa spoa_chr22_allele0_coverage1_unrotated.fa spoa_chr22_allele10_coverage1_unrotated.fa spoa_chr22_allele11_coverage3_unrotated.fa spoa_chr22_allele12_coverage1_unrotated.fa spoa_chr22_allele13_coverage1_unrotated.fa spoa_chr22_allele14_coverage1_unrotated.fa spoa_chr22_allele15_coverage1_unrotated.fa spoa_chr22_allele16_coverage1_unrotated.fa spoa_chr22_allele17_coverage1_unrotated.fa spoa_chr22_allele18_coverage1_unrotated.fa spoa_chr22_allele19_coverage1_unrotated.fa spoa_chr22_allele1_coverage1_unrotated.fa spoa_chr22_allele20_coverage1_unrotated.fa spoa_chr22_allele21_coverage5_unrotated.fa spoa_chr22_allele22_coverage33_unrotated.fa spoa_chr22_allele23_coverage1_unrotated.fa spoa_chr22_allele24_coverage1_unrotated.fa spoa_chr22_allele25_coverage1_unrotated.fa spoa_chr22_allele26_coverage1_unrotated.fa spoa_chr22_allele27_coverage1_unrotated.fa spoa_chr22_allele28_coverage1_unrotated.fa spoa_chr22_allele29_coverage1_unrotated.fa spoa_chr22_allele2_coverage2_unrotated.fa spoa_chr22_allele30_coverage1_unrotated.fa spoa_chr22_allele31_coverage1_unrotated.fa spoa_chr22_allele32_coverage18_unrotated.fa spoa_chr22_allele33_coverage1_unrotated.fa spoa_chr22_allele34_coverage1_unrotated.fa spoa_chr22_allele35_coverage1_unrotated.fa spoa_chr22_allele3_coverage1_unrotated.fa spoa_chr22_allele4_coverage4_unrotated.fa spoa_chr22_allele5_coverage1_unrotated.fa spoa_chr22_allele6_coverage1_unrotated.fa spoa_chr22_allele7_coverage11_unrotated.fa spoa_chr22_allele8_coverage1_unrotated.fa spoa_chr22_allele9_coverage167_unrotated.fa 

cat spoa_chr13_allele*_coverage*_unpolished.fa > chr13_alleles_unpolished.fa
cat spoa_chr14_allele*_coverage*_unpolished.fa > chr14_alleles_unpolished.fa
cat spoa_chr15_allele*_coverage*_unpolished.fa > chr15_alleles_unpolished.fa
cat spoa_chr21_allele*_coverage*_unpolished.fa > chr21_alleles_unpolished.fa
cat spoa_chr22_allele*_coverage*_unpolished.fa > chr22_alleles_unpolished.fa

cat spoa_chr13_allele*_coverage*_unrotated.fa > chr13_alleles_unrotated.fa
cat spoa_chr14_allele*_coverage*_unrotated.fa > chr14_alleles_unrotated.fa
cat spoa_chr15_allele*_coverage*_unrotated.fa > chr15_alleles_unrotated.fa
cat spoa_chr21_allele*_coverage*_unrotated.fa > chr21_alleles_unrotated.fa
cat spoa_chr22_allele*_coverage*_unrotated.fa > chr22_alleles_unrotated.fa

scripts/add_sequences_to_loopgraph.py ../loop_mergegraph_chr13.gfa chr13_alleles_unrotated.fa 65 chr13 > ../loop_mergegraph_chr13_seq.gfa
scripts/add_sequences_to_loopgraph.py ../loop_mergegraph_chr14.gfa chr14_alleles_unrotated.fa 65 chr14 > ../loop_mergegraph_chr14_seq.gfa
scripts/add_sequences_to_loopgraph.py ../loop_mergegraph_chr15.gfa chr15_alleles_unrotated.fa 65 chr15 > ../loop_mergegraph_chr15_seq.gfa
scripts/add_sequences_to_loopgraph.py ../loop_mergegraph_chr21.gfa chr21_alleles_unrotated.fa 65 chr21 > ../loop_mergegraph_chr21_seq.gfa
scripts/add_sequences_to_loopgraph.py ../loop_mergegraph_chr22.gfa chr22_alleles_unrotated.fa 65 chr22 > ../loop_mergegraph_chr22_seq.gfa

cd ..
/usr/bin/time -v GraphAligner -g loop_mergegraph_chr13_seq.gfa -f ../polish_rawhifi/*13*_repolished.fa -a alns_chr13_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_chr13.txt 2> stderr_ga_chr13.txt
/usr/bin/time -v GraphAligner -g loop_mergegraph_chr14_seq.gfa -f ../polish_rawhifi/*14*_repolished.fa -a alns_chr14_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_chr14.txt 2> stderr_ga_chr14.txt
/usr/bin/time -v GraphAligner -g loop_mergegraph_chr15_seq.gfa -f ../polish_rawhifi/*15*_repolished.fa -a alns_chr15_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_chr15.txt 2> stderr_ga_chr15.txt
/usr/bin/time -v GraphAligner -g loop_mergegraph_chr21_seq.gfa -f ../polish_rawhifi/*21*_repolished.fa -a alns_chr21_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_chr21.txt 2> stderr_ga_chr21.txt
/usr/bin/time -v GraphAligner -g loop_mergegraph_chr22_seq.gfa -f ../polish_rawhifi/*22*_repolished.fa -a alns_chr22_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_chr22.txt 2> stderr_ga_chr22.txt
cat loop_mergegraph_chr*_seq.gfa > loop_mergegraph_merged_seq.gfa
cat alns_chr*_loopgraph.gaf > alns_loopgraph_merge.gaf
/usr/bin/time -v GraphAligner -g loop_mergegraph_merged_seq.gfa -f ../polish_rawhifi/consensuses_repolished.fa -a alns_all_loopgraph.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 --multiseed-DP 1 --multimap-score-fraction 1 > stdout_ga_all.txt 2> stderr_ga_all.txt

/usr/bin/time -v GraphAligner -g loop_mergegraph_merged_seq.gfa -f ../polish_rawhifi/consensuses_repolished.fa -a alns_all_loopgraph_2.gaf -t 40 -x vg --precise-clipping 0.95 --X-drop 1000000 -b 1000 --min-alignment-score 10000 > stdout_ga_all_2.txt 2> stderr_ga_all_2.txt

cd ..
mkdir check_major_alleles
cd check_major_alleles
grep -P '^S\tchr13_loop_86_coverage503_copycount50\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr13_major"; print substr($0, 65);}' > chr13_major.fa
grep -P '^S\tchr14_loop_2_coverage59_copycount6\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr14_major"; print substr($0, 65);}' > chr14_major.fa
grep -P '^S\tchr15_loop_35_coverage106_copycount11\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr15_major_1"; print substr($0, 65);}' > chr15_major_1.fa
grep -P '^S\tchr15_loop_17_coverage86_copycount9\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr15_major_2"; print substr($0, 65);}' > chr15_major_2.fa
grep -P '^S\tchr15_loop_23_coverage74_copycount7\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr15_major_3"; print substr($0, 65);}' > chr15_major_3.fa
grep -P '^S\tchr15_loop_34_coverage38_copycount4\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr15_major_4"; print substr($0, 65);}' > chr15_major_4.fa
grep -P '^S\tchr21_loop_121_coverage318_copycount32\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr21_major"; print substr($0, 65);}' > chr21_major.fa
grep -P '^S\tchr22_loop_9_coverage167_copycount17\t' < ../loops/loop_mergegraph_merged_seq.gfa | cut -f 3 | awk '{print ">chr22_major"; print substr($0, 65);}' > chr22_major.fa
meryl count k=19 output merylDB chr13_major.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr13_major.fa ../chr13_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr13_major.bam
meryl count k=19 output merylDB chr14_major.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr14_major.fa ../chr14_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr14_major.bam
meryl count k=19 output merylDB chr15_major_1.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr15_major_1.fa ../chr15_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr15_major_1.bam
meryl count k=19 output merylDB chr15_major_2.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr15_major_2.fa ../chr15_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr15_major_2.bam
meryl count k=19 output merylDB chr15_major_3.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr15_major_3.fa ../chr15_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr15_major_3.bam
meryl count k=19 output merylDB chr15_major_4.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr15_major_4.fa ../chr15_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr15_major_4.bam
meryl count k=19 output merylDB chr21_major.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr21_major.fa ../chr21_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr21_major.bam
meryl count k=19 output merylDB chr22_major.fa
winnowmap -c -W repetitive_k19.txt -ax asm20 chr22_major.fa ../chr22_rdna_hifi_limited.fa > alns.sam
rm -r merylDB
samtools view -S -b -F 256 -q 1 alns.sam | samtools sort > alns_chr22_major.bam
samtools merge alns_major_merged.bam alns_chr*_major*.bam
cat chr*_major*.fa > major_alleles_merged.fa
# looks mostly fine-. homopolymer run length errors, dinucleotide run errors.
# some SNPs where the minority 45-50% allele was chosen, one where 35% allele was chosen
# chr21 has some structural strangeness in the end, probably from SV allele reads mixed in

cd ..
mkdir major_allele_sequences
cd major_allele_sequences
# direction DJ -> PJ
# chr13
# 50 major alleles in the middle
# based on the loopgraph topology we can add >chr13_loop_255_coverage35_copycount4>chr13_loop_94_coverage9_copycount1 to extend the PJ
echo "chr13_fake_resolution 1 1 1 + >chr13_loop_193_coverage28_copycount3>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_86_coverage503_copycount50>chr13_loop_255_coverage35_copycount4>chr13_loop_94_coverage9_copycount1>chr13_loop_233_coverage7_copycount1>chr13_loop_243_coverage5_copycount1>chr13_loop_43_coverage14_copycount1 1 1 1 1 1 60" | tr ' ' '\t' > fake_chr13_aln.gaf
scripts/extract_extended_path_overlap.py ../loops/loop_mergegraph_merged_seq.gfa 65 < fake_chr13_aln.gaf > fake_chr13_seq.fa
# chr14
# 10 major alleles in the middle
echo "chr14_fake_resolution 1 1 1 + >chr14_loop_3_coverage16_copycount2>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_2_coverage59_copycount6>chr14_loop_5_coverage17_copycount2 1 1 1 1 1 60" | tr ' ' '\t' > fake_chr14_aln.gaf
scripts/extract_extended_path_overlap.py ../loops/loop_mergegraph_merged_seq.gfa 65 < fake_chr14_aln.gaf > fake_chr14_seq.fa
# chr15
# very unclear
# arbitrarily pick this:
# 47 35 35 35 35 17 17 17 17 17 17 17 23 23 23 23 23 58
# consistent copy counts
# but known to be inconsistent with the reads
echo "chr15_fake_resolution 1 1 1 + >chr15_loop_47_coverage38_copycount4>chr15_loop_35_coverage106_copycount11>chr15_loop_35_coverage106_copycount11>chr15_loop_35_coverage106_copycount11>chr15_loop_35_coverage106_copycount11>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_17_coverage86_copycount9>chr15_loop_23_coverage74_copycount7>chr15_loop_23_coverage74_copycount7>chr15_loop_23_coverage74_copycount7>chr15_loop_23_coverage74_copycount7>chr15_loop_23_coverage74_copycount7>chr15_loop_58_coverage16_copycount2 1 1 1 1 1 60" | tr ' ' '\t' > fake_chr15_aln.gaf
scripts/extract_extended_path_overlap.py ../loops/loop_mergegraph_merged_seq.gfa 65 < fake_chr15_aln.gaf > fake_chr15_seq.fa
# chr21
# normal and het DJ agree-ish, starts at 234 then goes to 15
# 30 major alleles in the middle
echo "chr21_fake_resolution 1 1 1 + >chr21_loop_234_coverage20_copycount2>chr21_loop_15_coverage29_copycount3>chr21_loop_15_coverage29_copycount3>chr21_loop_15_coverage29_copycount3>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_121_coverage318_copycount32>chr21_loop_226_coverage49_copycount5>chr21_loop_116_coverage6_copycount1 1 1 1 1 1 60" | tr ' ' '\t' > fake_chr21_aln.gaf
scripts/extract_extended_path_overlap.py ../loops/loop_mergegraph_merged_seq.gfa 65 < fake_chr21_aln.gaf > fake_chr21_seq.fa
# chr22
# 10 major alleles in the middle
echo "chr22_fake_resolution 1 1 1 + <chr22_loop_22_coverage33_copycount3<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_7_coverage11_copycount1<chr22_loop_9_coverage167_copycount17<chr22_loop_9_coverage167_copycount17<chr22_loop_21_coverage5_copycount1<chr22_loop_32_coverage18_copycount2 1 1 1 1 1 60" | tr ' ' '\t' > fake_chr22_aln.gaf
scripts/extract_extended_path_overlap.py ../loops/loop_mergegraph_merged_seq.gfa 65 < fake_chr22_aln.gaf > fake_chr22_seq.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr13_seq.fa ../polish_rawhifi/dj13_consensus_repolished.fa ../polish_rawhifi/pj13_consensus_repolished.fa > alns_13.paf
# dj13_consensus  254123  10367   254123  +       chr13_fake_resolution_1_1_1     2594100 0       244029
# pj13_consensus  168135  12643   168135  -       chr13_fake_resolution_1_1_1     2594100 2438553 2594100
grep -v '>' < ../polish_rawhifi/dj13_consensus_repolished.fa > seq.txt
grep -v '>' < fake_chr13_seq.fa | head -c 2438553 | tail -c 2194524 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj13_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr13"; print $1}' > chr13.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr14_seq.fa ../polish_rawhifi/dj14_consensus_normal_repolished.fa ../polish_rawhifi/pj14_consensus_repolished.fa > alns_14_normal.paf
# dj14_consensus_normal   183372  10772   183372  +       chr14_fake_resolution_1_1_1     496706  0       172748
# pj14_consensus  321513  9965    321513  -       chr14_fake_resolution_1_1_1     496706  184676  496706
grep -v '>' < ../polish_rawhifi/dj14_consensus_normal_repolished.fa > seq.txt
grep -v '>' < fake_chr14_seq.fa | head -c 184676 | tail -c 11928 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj14_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr14_normal"; print $1}' > chr14_normal.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr14_seq.fa ../polish_rawhifi/dj14_consensus_het_repolished.fa ../polish_rawhifi/pj14_consensus_repolished.fa > alns_14_het.paf
# dj14_consensus_het      183216  18493   183216  +       chr14_fake_resolution_1_1_1     496706  10209   175048
# pj14_consensus  321513  9965    321513  -       chr14_fake_resolution_1_1_1     496706  184676  496706
grep -v '>' < ../polish_rawhifi/dj14_consensus_het_repolished.fa > seq.txt
grep -v '>' < fake_chr14_seq.fa | head -c 184676 | tail -c 9628 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj14_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr14_het"; print $1}' > chr14_het.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr15_seq.fa ../polish_rawhifi/dj15_consensus_normal_repolished.fa ../polish_rawhifi/pj15_consensus_normal_repolished.fa > alns_15_normal.paf
# dj15_consensus_normal   182986  8304    182986  +       chr15_fake_resolution_1_1_1     757350  0       174779
# pj15_consensus_normal   142396  10765   142396  -       chr15_fake_resolution_1_1_1     757350  625637  757350
grep -v '>' < ../polish_rawhifi/dj15_consensus_normal_repolished.fa > seq.txt
grep -v '>' < fake_chr15_seq.fa | head -c 625637 | tail -c 450858 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj15_consensus_normal_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr15_normal"; print $1}' > chr15_normal.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr21_seq.fa ../polish_rawhifi/dj21_consensus_normal_repolished.fa ../polish_rawhifi/pj21_consensus_repolished.fa > alns_21_normal.paf
# dj21_consensus_normal   162411  9584    162411  +       chr21_fake_resolution_1_1_1     1612737 0       152890
# pj21_consensus  218363  10730   218363  -       chr21_fake_resolution_1_1_1     1612737 1405009 1612737
grep -v '>' < ../polish_rawhifi/dj21_consensus_normal_repolished.fa > seq.txt
grep -v '>' < fake_chr21_seq.fa | head -c 1405009 | tail -c 1252119 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj21_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr21_normal"; print $1}' > chr21_normal.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr21_seq.fa ../polish_rawhifi/dj21_consensus_het_repolished.fa ../polish_rawhifi/pj21_consensus_repolished.fa > alns_21_het.paf
# dj21_consensus_het      225930  71685   209600  +       chr21_fake_resolution_1_1_1     1612737 58406   196710 (good enough)
# pj21_consensus  218363  10730   218363  -       chr21_fake_resolution_1_1_1     1612737 1405009 1612737 (good enough)
grep -v '>' < ../polish_rawhifi/dj21_consensus_het_repolished.fa > seq.txt
grep -v '>' < fake_chr21_seq.fa | head -c 1405009 | tail -c 1208299 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj21_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr21_het"; print $1}' > chr21_het.fa

minimap2 -x map-ont -c -f 0 -t 40 -N 20 fake_chr22_seq.fa ../polish_rawhifi/dj22_consensus_repolished.fa ../polish_rawhifi/pj22_consensus_repolished.fa > alns_22.paf
# dj22_consensus  155380  9487    155380  +       chr22_fake_resolution_1_1_1     665313  0       146003
# pj22_consensus  227307  125367  227307  -       chr22_fake_resolution_1_1_1     665313  449922  552179 (good enough)
grep -v '>' < ../polish_rawhifi/dj22_consensus_repolished.fa > seq.txt
grep -v '>' < fake_chr22_seq.fa | head -c 449922 | tail -c 303919 | tr 'ATCG' 'atcg' >> seq.txt
grep -v '>' < ../polish_rawhifi/pj22_consensus_repolished.fa | tr -d '\n' | rev | tr 'ATCG' 'TAGC' >> seq.txt
tr -d '\n' < seq.txt | awk '{print ">chr22"; print $1}' > chr22.fa

grep -v '>' < ../polish_rawhifi/chr15_consensus_het_repolished.fa | awk '{print ">chr15_het"; print $0;}' > chr15_het.fa

cat chr13.fa chr14_normal.fa chr14_het.fa chr15_normal.fa chr15_het.fa chr21_normal.fa chr21_het.fa chr22.fa > sequences.fa

cd ..
mkdir check_allele_presence
cd check_allele_presence

grep -P '^S' < ../loops/loop_mergegraph_merged_seq.gfa | grep chr13 | grep -v copycount0 | cut -f 3 | tr -d '\n' | awk '{print ">chr13_alleles_concat"; print $0;}' > chr13_alleles_concat.fa 
grep -P '^S' < ../loops/loop_mergegraph_merged_seq.gfa | grep chr14 | grep -v copycount0 | cut -f 3 | tr -d '\n' | awk '{print ">chr14_alleles_concat"; print $0;}' > chr14_alleles_concat.fa 
grep -P '^S' < ../loops/loop_mergegraph_merged_seq.gfa | grep chr15 | grep -v copycount0 | cut -f 3 | tr -d '\n' | awk '{print ">chr15_alleles_concat"; print $0;}' > chr15_alleles_concat.fa 
grep -P '^S' < ../loops/loop_mergegraph_merged_seq.gfa | grep chr21 | grep -v copycount0 | cut -f 3 | tr -d '\n' | awk '{print ">chr21_alleles_concat"; print $0;}' > chr21_alleles_concat.fa 
grep -P '^S' < ../loops/loop_mergegraph_merged_seq.gfa | grep chr22 | grep -v copycount0 | cut -f 3 | tr -d '\n' | awk '{print ">chr22_alleles_concat"; print $0;}' > chr22_alleles_concat.fa 

mummer -maxmatch -F -b -c chr13_alleles_concat.fa ../polish_rawhifi/dj13_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj13.pdf
mummer -maxmatch -F -b -c chr13_alleles_concat.fa ../polish_rawhifi/pj13_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_pj13.pdf
mummer -maxmatch -F -b -c chr14_alleles_concat.fa ../polish_rawhifi/dj14_consensus_normal_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj14_normal.pdf
mummer -maxmatch -F -b -c chr14_alleles_concat.fa ../polish_rawhifi/dj14_consensus_het_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj14_het.pdf
mummer -maxmatch -F -b -c chr14_alleles_concat.fa ../polish_rawhifi/pj14_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_pj14.pdf
mummer -maxmatch -F -b -c chr15_alleles_concat.fa ../polish_rawhifi/dj15_consensus_normal_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj15_normal.pdf
mummer -maxmatch -F -b -c chr15_alleles_concat.fa ../polish_rawhifi/pj15_consensus_normal_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_pj15_normal.pdf
mummer -maxmatch -F -b -c chr15_alleles_concat.fa ../polish_rawhifi/chr15_consensus_het_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_chr15_het.pdf
mummer -maxmatch -F -b -c chr21_alleles_concat.fa ../polish_rawhifi/dj21_consensus_normal_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj21_normal.pdf
mummer -maxmatch -F -b -c chr21_alleles_concat.fa ../polish_rawhifi/dj21_consensus_het_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj21_het.pdf
mummer -maxmatch -F -b -c chr21_alleles_concat.fa ../polish_rawhifi/pj21_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_pj21.pdf
mummer -maxmatch -F -b -c chr22_alleles_concat.fa ../polish_rawhifi/dj22_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj22.pdf
mummer -maxmatch -F -b -c chr22_alleles_concat.fa ../polish_rawhifi/pj22_consensus_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_pj22.pdf

# dj21 het might have two alleles not in the loopgraph? ~210k and ~70k
# pj22 hard to say at ~45kb and ~90kb, but looks like it could be a match
# all others are fine
# manually extract the dj21 het non-matched allele

# scripts/find_substring_positions.py GTCTTTCTCTCTCTGTGTATCGTTGTCTCTCTCTGTCTGTCTCTGTCTCTGTCTCTCTGTCTCTC < ../polish_rawhifi/dj21_consensus_het_repolished.fa
# 45512
# 94010
# 138659
# 183434
grep -v '>' < ../polish_rawhifi/dj21_consensus_het_repolished.fa | head -c 94010 | tail -c 48498 | awk '{print ">chr21_het_allele_manual"; print $0;}' > chr21_het_allele_manual.fa
cat chr21_alleles_concat.fa chr21_het_allele_manual.fa | grep -v '>' | tr -d '\n' | awk '{print ">chr21_alleles_concat"; print $0;}' > chr21_alleles_concat_withmanual.fa
mummer -maxmatch -F -b -c chr21_alleles_concat_withmanual.fa ../polish_rawhifi/dj21_consensus_het_repolished.fa > matches.mum
mummerplot -postscript -p mummer matches.mum
ps2pdf mummer.ps mummer_dj21_het_manual.pdf

# one allele manually added but others preserved hopefully

cd ..
mkdir results
cd results
cp ../polish_rawhifi/consensuses.fa pjdj_extensions_raw_ont.fa
cp ../polish_rawhifi/consensuses_repolished.fa pjdj_extensions_polished.fa
cp ../loops/loop_mergegraph_merged_seq.gfa .
cp ../loops/alns_loopgraph_merge.gaf alns_pjdj_extensions_to_loopgraph.gaf
# remove copy count 0 alleles, remove PJ/DJ alleles
grep -P '^S\tchr13' < loop_mergegraph_merged_seq.gfa | grep -v 'copycount0' | grep -v "chr13_loop_43_coverage14_copycount1" | grep -v "chr13_loop_193_coverage28_copycount3" | awk '{print ">" $2; print $3;}' > alleles_chr13.fa
grep -P '^S\tchr14' < loop_mergegraph_merged_seq.gfa | grep -v 'copycount0' | grep -v "chr14_loop_3_coverage16_copycount2" | grep -v "chr14_loop_5_coverage17_copycount2" | awk '{print ">" $2; print $3;}' > alleles_chr14.fa
grep -P '^S\tchr15' < loop_mergegraph_merged_seq.gfa | grep -v 'copycount0' | grep -v "chr15_loop_47_coverage38_copycount4" | grep -v "chr15_loop_58_coverage16_copycount2" | awk '{print ">" $2; print $3;}' > alleles_chr15.fa
grep -P '^S\tchr21' < loop_mergegraph_merged_seq.gfa | grep -v 'copycount0' | grep -v "chr21_loop_234_coverage20_copycount2" | grep -v "chr21_loop_116_coverage6_copycount1" | awk '{print ">" $2; print $3;}' > alleles_chr21.fa
grep -P '^S\tchr22' < loop_mergegraph_merged_seq.gfa | grep -v 'copycount0' | grep -v "chr22_loop_22_coverage33_copycount3" | grep -v "chr22_loop_32_coverage18_copycount2" | awk '{print ">" $2; print $3;}' > alleles_chr22.fa
cat ../check_allele_presence/chr21_het_allele_manual.fa >> alleles_chr21.fa
cp ../major_allele_sequences/sequences.fa fake_spanning_sequences.fa

