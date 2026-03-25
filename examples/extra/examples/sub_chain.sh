#!/bin/bash
#SBATCH -t 12:00:00
#SBATCH --qos regular
#SBATCH -A desi_g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=<email>
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -J example_des
#SBATCH -L SCRATCH
#SBATCH -C gpu
#SBATCH --output=example_des.%j.oe
#SBATCH --gpus-per-node=4

module load python
source activate gholax

srun -N 1 run-gholax ../example_configs/example_desy3.yaml
