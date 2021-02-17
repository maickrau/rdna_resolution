# get the reference allele from somewhere
# put it into initial_seq.fa
# get the previous pj/dj sequences from somewhere
# put into chr13_pjdj.fa chr14_pjdj.fa chr15_pjdj.fa chr21_pjdj.fa chr22_pjdj.fa

/usr/bin/time -v snakemake reads_round_xxxxxxxxxxxxxxx.fa 1> stdout_snake.txt 2> stderr_snake.txt
/usr/bin/time -v MBG -i reads_round_xxxxxxxxxxxxxxx.fa -o graph-k251-w100.gfa -k 251 -w 100 -a 1 -u 3 2> stderr_mbg_251.txt
GraphAligner -g graph-round15-k251-w100.gfa -f chr*_pjdj.fa -a alns_251.gaf --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
scripts/color_csv_from_gaf.py dj13=#FF0000 pj13=#AA0000 dj14=#00FF00 pj14=#00AA00 dj15=#0000FF pj15=#0000AA dj21=#FFFF00 pj21=#AAAA00 dj22=#00FFFF pj22=#00FFFF < alns_251.gaf > pjdj_colors_251.csv

# manually pick the part covered by the tangle and pj & dj alignments, put nodes to nodes_251.txt

cp nodes_251.txt picked.txt
grep -P '^S' < graph-round15-k251-w100.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_filtered.fa
mummer -maxmatch -l 250 -b -threads 40 contigs_filtered.fa reads_round_xxxxxxxxxxxxxxx.fa | scripts/pick_readnames_with_mums.py > picked_hifi_filter.txt
cp picked_hifi_filter.txt picked.txt
scripts/pick_reads_stdin.py < reads_round_xxxxxxxxxxxxxxx.fa > hifi_picked_filtered.fa

grep '>' < hifi_picked_filtered.fa | tr -d '>' | cut -f 1 -d ' ' > hifinames_picked_filtered.fa
cp hifinames_picked_filtered.fa picked.txt
scripts/pick_reads_stdin.py < /scratch/bioinf/users/mikko/T2T/CCS_CHM13/combined.fa > hifi_picked_filtered_nohpc.fa

scripts/MBG_syncmer -i hifi_picked_filtered.fa -o graph-filtered-k3501-w10.gfa -k 3501 -w 10 -a 1 -u 2 --collapse-hpc
GraphAligner -g graph-filtered-k3501-w10.gfa -f chr*_pjdj.fa -a alns_3501.gaf --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
scripts/color_csv_from_gaf.py dj13=#FF0000 pj13=#AA0000 dj14=#00FF00 pj14=#00AA00 dj15=#0000FF pj15=#0000AA dj21=#FFFF00 pj21=#AAAA00 dj22=#00FFFF pj22=#00FFFF < alns_3501.gaf > pjdj_colors_3501.csv

# manually pick per-chromosome tangle nodes from graph-filtered-k3501-w10.gfa, put to nodes_chr13.txt nodes_chr14.txt nodes_chr15.txt nodes_chr21.txt nodes_chr22.txt

scripts/MBG_syncmer -i hifi_picked_filtered.fa -o blunt-graph-filtered-k251-w10.gfa -k 251 -w 10 -a 1 -u 2 --collapse-hpc --blunt
scripts/UntipRelative 1000 1000 0.1 < blunt-graph-filtered-k251-w10.gfa | ~/tmp/vg_1_27_1 view -Fv - | ~/tmp/vg_1_27_1 mod -n -U 100 - | ~/tmp/vg_1_27_1 view - > cleaned-blunt-graph-filtered-k251-w10.gfa
cp nodes_chr13.txt picked.txt
grep -P '^S' < graph-filtered-k3501-w10.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_chr13.fa
cp nodes_chr14.txt picked.txt
grep -P '^S' < graph-filtered-k3501-w10.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_chr14.fa
cp nodes_chr15.txt picked.txt
grep -P '^S' < graph-filtered-k3501-w10.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_chr15.fa
cp nodes_chr21.txt picked.txt
grep -P '^S' < graph-filtered-k3501-w10.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_chr21.fa
cp nodes_chr22.txt picked.txt
grep -P '^S' < graph-filtered-k3501-w10.gfa | awk '{print ">" $2; print $3;}' | scripts/pick_reads_stdin.py > contigs_chr22.fa
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f contigs_chr13.fa -a alns_contigs_chr13.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f contigs_chr14.fa -a alns_contigs_chr14.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f contigs_chr15.fa -a alns_contigs_chr15.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f contigs_chr21.fa -a alns_contigs_chr21.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f contigs_chr22.fa -a alns_contigs_chr22.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.99 --E-cutoff 0.00001 --X-drop 1000
GraphAligner -g cleaned-blunt-graph-filtered-k251-w10.gfa -f hifi_picked_filtered.fa -a alns_picked_filtered.gaf -t 40 --multiseed-DP 1 --multimap-score-fraction 1 -x vg --precise-clipping 0.98 --E-cutoff 0.00001 --X-drop 1000
awk '{if ($3 == "0" && $4 == $2 && $16 == "id:f:1") print;}' < alns_contigs_chr13.gaf > alns_contigs_chr13_fix.gaf
awk '{if ($3 == "0" && $4 == $2 && $16 == "id:f:1") print;}' < alns_contigs_chr14.gaf > alns_contigs_chr14_fix.gaf
awk '{if ($3 == "0" && $4 == $2 && $16 == "id:f:1") print;}' < alns_contigs_chr15.gaf > alns_contigs_chr15_fix.gaf
awk '{if ($3 == "0" && $4 == $2 && $16 == "id:f:1") print;}' < alns_contigs_chr21.gaf > alns_contigs_chr21_fix.gaf
awk '{if ($3 == "0" && $4 == $2 && $16 == "id:f:1") print;}' < alns_contigs_chr22.gaf > alns_contigs_chr22_fix.gaf

# manually pick clusterable nodes from cleaned-blunt-graph-filtered-k251-w10.gfa, store them in clusterable.txt

scripts/cluster_rDNA_hifi_by_chr.py clusterable.txt alns_contigs_chr13_fix.gaf alns_contigs_chr14_fix.gaf alns_contigs_chr15_fix.gaf alns_contigs_chr21_fix.gaf alns_contigs_chr22_fix.gaf alns_picked_filtered.gaf read_clustering.txt node_clustering.txt

