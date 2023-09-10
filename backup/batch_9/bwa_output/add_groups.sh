#!/bin/bash
#$ -cwd
#$ -j y
#$ -pe smp 1
#$ -l h_vmem=1G
#$ -l h_rt=70:0:0
#$ -t 1-302

INPUT=$(sed -n "${SGE_TASK_ID}p" list1.txt)
OUTPUT=$(sed -n "${SGE_TASK_ID}p" list2.txt)
SAMPLE=$(sed -n "${SGE_TASK_ID}p" list3.txt)
LIB=$(sed -n "${SGE_TASK_ID}p" list4.txt)
CELL=$(sed -n "${SGE_TASK_ID}p" list5.txt)
LANE=$(sed -n "${SGE_TASK_ID}p" list6.txt)


# Load the application module
module load gatk/4.0.8.1

gatk AddOrReplaceReadGroups --INPUT=$INPUT --OUTPUT=./groups/$OUTPUT\.sam --RGLB=$LIB --RGPL=illumina --RGPU=$CELL$LANE --RGID=$SAMPLE$CELL$LANE --RGSM=$SAMPLE 

rm $INPUT

# Generated by Job Script Builder on 2018-10-26
# For assistance, please email its-research-support@qmul.ac.uk

