#!/bin/bash
#SBATCH -A b1042
#SBATCH -t 6:00:00
#SBATCH --partition=genomics
#SBATCH --mail-user=karson.lychuk@northwestern.edu
#SBATCH --mail-type=FAIL
#SBATCH --job-name=“Mageck_runp3”
#SBATCH --nodes=1
#SBATCH -n 2
#SBATCH --mem=8G

#ENVIR
module purge all
samtools/1.10.1
bowtie2/2.2.6
module load R/3.6.2 
python/ActivePython-3.2
path=/projects/b1042/Adli_Lab/Karson/Mageck/

#INPUT
c1=${path}ControlR1.fastq
c2=${path}Controlr2.fastq
fqh1=${path}High1.fastq
fql1=${path}Low1.fastq
fqh2=${path}High2.fastq
fql2=${path}Low2.fastq
lib=${path}mageck_lib.csv
cont=${path}mageck_control.txt

#OUTPUT?
out=PDL1_com

#COMMAND
mageck count -l ${lib} -n ${out} --sample-label High1,High2,Low1,Low2 --fastq ${fqh1} ${fqh2} ${fql1} ${fql2}
 
