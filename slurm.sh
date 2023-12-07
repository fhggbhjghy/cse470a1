#!/bin/bash

####### specify cluster configuration
#SBATCH --cluster=ub-hpc
#SBATCH --partition=general-compute
#SBATCH --qos=general-compute

####### select resources (here we specify required memory)
#SBATCH --mem=8000
#SBATCH --constraint=AVX512

####### make sure no other jobs are assigned to your nodes
#SBATCH --exclusive

####### further customizations
### name of your job
#SBATCH --job-name="changeme"

### files to store stdout and stderr (%j will be replaced by the job id)
#SBATCH --output=%j.stdout
#SBATCH --error=%j.stderr

### how many nodes to allocate for the job
### for shared memory jobs we need only one node
#SBATCH --nodes=1

### how many cores to use on each node
#SBATCH --ntasks-per-node=12

### max time the job will run
#SBATCH --time=00:20:00


# here go regular commands, these commands will be run
# on the first node allocated to the job
hostname

# in the similar way we run OMP app
# tasket limits the number of cores we are going to use
taskset -c 0 ./a1 10 10000000
taskset -c 0-1 ./a1 10 10000000
taskset -c 0-3 ./a1 10 10000000
taskset -c 0-5 ./a1 10 10000000
taskset -c 0-7 ./a1 10 10000000
taskset -c 0-9 ./a1 10 10000000

taskset -c 0 ./a1 10 20000000
taskset -c 0-1 ./a1 10 20000000
taskset -c 0-3 ./a1 10 20000000
taskset -c 0-5 ./a1 10 20000000
taskset -c 0-7 ./a1 10 20000000
taskset -c 0-9 ./a1 10 20000000