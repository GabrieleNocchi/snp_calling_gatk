#!/bin/bash
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_vmem=4G
#$ -l h_rt=70:0:0
#$ -t 1-302

INPUT=$(sed -n "${SGE_TASK_ID}p" list1.txt)

# Load the application module
module load gatk/4.0.8.1

gatk BuildBamIndex -I=$INPUT

# Generated by Job Script Builder on 2018-10-26
# For assistance, please email its-research-support@qmul.ac.uk

