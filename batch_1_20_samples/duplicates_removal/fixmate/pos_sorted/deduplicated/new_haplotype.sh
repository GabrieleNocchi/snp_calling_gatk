#!/bin/bash
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l node_type=nxv
#$ -l h_vmem=8G
#$ -l h_rt=240:0:0
#$ -t 1-20

INPUT=${SGE_TASK_ID}

OUTPUT=$(sed -n "${SGE_TASK_ID}p" list3.txt)

# Load the application module
module load gatk/4.0.8.1

gatk HaplotypeCaller -R /data/SBCS-BuggsLab/GabrieleNocchi/haplotypecaller_ref/Qrob_PM1N.fa -I list_$INPUT\.list --genotyping-mode DISCOVERY --emit-ref-confidence GVCF -O /data/SBCS-BuggsLab/GabrieleNocchi/Oak/batch_1_20_samples/variants_2/$OUTPUT\.g.vcf

# Generated by Job Script Builder on 2018-10-26
# For assistance, please email its-research-support@qmul.ac.uk

