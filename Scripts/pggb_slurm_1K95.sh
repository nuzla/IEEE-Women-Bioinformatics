#!/usr/bin/bash

#SBATCH --account       ga03793
#SBATCH --job-name      NC_017518.1_1K95
#SBATCH --cpus-per-task 8 
#SBATCH --mem           4G
#SBATCH --time          1:00:00

module purge
module load Singularity

#export container to a variable for convenience
WD=/nesi/nobackup/ga03793/pg_workshop #Working Directory
container=/nesi/project/ga03793/software/pggb/pggb_0.5.3.simg
data=${WD}/ASM19152v1_pgsim.fa

#Bind filesystem to container image 
export SINGULARITY_BIND="${WD}, /nesi/project/ga03793/"

singularity exec ${container} pggb -i $data -s 1000 -p 95 -n 6 -k 79 -t 24 -S -m -o output_1K95 -V 'NC_017518.1:#' 
