#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --time=2:00:00
#SBATCH --mem-per-cpu=2G


# Include necessary modules
module load gcc/12.3.0
module load tcl/8.6.12
module load boost/1.83.0

# Include path to mmonca binary
mmonca_path=/scratch/phys/nume/MMonCa/Obj_g++/mmonca
file=input.mc

# Read config file
export MCPATH=/scratch/phys/t30429_numealloys/Ilja/OKMC/MMonCa-Balbuena/MMonCa/config

# Run simulation
${mmonca_path} ${file}








