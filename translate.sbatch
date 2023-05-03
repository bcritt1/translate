#!/bin/bash
#SBATCH --job-name=translate
#SBATCH --output=/home/users/%u/out/translate.%j.out
#SBATCH --error=/home/users/%u/err/translate.%j.err
#SBATCH -p hns
#SBATCH --ntasks=1
#SBATCH --mem=16GB
#SBATCH --cpus-per-task=1
#SBATCH --array=1-2
ml load system imagemagick/7.0.7-2
ml load system tesseract/5.1.0
ml load system ghostscript/9.53.2
file=$(ls /home/users/$USER/foreignLanguagePDFs/*.pdf | sed -n ${SLURM_ARRAY_TASK_ID}p)
./translate.sh -in $file
