#!/bin/bash

# Explique este comando
bwa index <secuencia-de-referencia.fasta>
# Y este...
bwa mem <secuencia-de-referencia.fasta> <lectura-illumina-forward.fastq.gz> <lectura-illumina-reverse.fastq.gz> > mapping.sam
# Y este...
samtools view -b -S mapping.sam > mapping.bam
# Y este...
samtools sort mapping.bam > mapping-sorted.bam
# Y este también
samtools index mapping-sorted.bam