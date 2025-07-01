#!/bin/bash

# ###### Zona de Parámetros de solicitud de recursos a SLURM ############################
#
#SBATCH --job-name=EQ-Q6              #Nombre del job
#SBATCH -p long                        #Cola a usar, Default=short (Ver colas y límites en /hpcfs/shared/README/partitions.txt)
#SBATCH -N 1                            #Nodos requeridos, Default=1
#SBATCH -n 4                            #Tasks paralelos, recomendado para MPI, Default=1
#SBATCH --cpus-per-task=2              #Cores requeridos por task, recomendado para multi-thread, Default=1
#SBATCH --mem=16000             #Memoria en Mb por CPU, Default=2048
#SBATCH --time=480:10:00                 #Tiempo máximo de corrida, Default=2 horas
#SBATCH --mail-user=m.castillot@uniandes.edu.co
#SBATCH --mail-type=ALL
#SBATCH -o BOX_cpu.o%j                 #Nombre de archivo de salida
#
########################################################################################

# ################## Zona Carga de Módulos ############################################

module load mpi

export OMP_NUM_THREADS=2  # Threads por task (8 cores)

# Ejecutar 3 simulaciones en paralelo, cada una con 8 CPUs:
mpirun -np 4 Qdyn6 pro2.inp > pro2_1.log 
