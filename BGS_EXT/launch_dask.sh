#!/bin/bash

# Launch a dask cluster inside an existing interactive allocation.
#
# Recommended allocation (note: -n 4, NOT -n 512 -- a bare `srun` inherits
# the job's task count, which is what spawned 128 workers per node in v1):
#   salloc -N 4 -n 4 -c 256 -t 240 -C cpu -q interactive \
#       --image=biprateep/desi-dask:latest --account=desi

set -o pipefail

echo "Starting scheduler..."

scheduler_file=$SCRATCH/scheduler.json
rm -f $scheduler_file

#Modify this with your dask image name
image=biprateep/desi-dask:latest

# Perlmutter CPU node: 128 physical cores, ~487 GB usable memory.
# One srun task per node; dask fans out into processes within the node.
#
# workers x threads is the number of sweep-reading tasks that can run at once on
# a node, and each one costs ~0.5 GB while reading plus the partition it builds.
# Keep workers x memory_per_worker below the node total so the nanny can spill
# and pause before the kernel OOM-killer takes the whole worker out.
workers_per_node=16
threads_per_worker=4
memory_per_worker=28GB

# Spill directory. The default is the launch cwd (Lustre); /tmp on a compute node
# is RAM-backed, so spilling there would count against the node's memory.
worker_space=$SCRATCH/dask-worker-space
rm -rf $worker_space
mkdir -p $worker_space

#start scheduler
DASK_DISTRIBUTED__COMM__TIMEOUTS__CONNECT=3600s \
DASK_DISTRIBUTED__COMM__TIMEOUTS__TCP=3600s \
shifter --image=$image dask scheduler \
    --interface hsn0 \
    --scheduler-file $scheduler_file &

dask_pid=$!

# Wait for the scheduler to start
sleep 5
until [ -f $scheduler_file ]
do
     # Bail out instead of looping forever if the scheduler died on startup
     if ! kill -0 $dask_pid 2>/dev/null; then
         echo "ERROR: scheduler exited before writing $scheduler_file" >&2
         exit 1
     fi
     sleep 5
done

echo "Starting workers"

#start workers: pin the geometry explicitly so it does not inherit $SLURM_NTASKS
DASK_DISTRIBUTED__COMM__TIMEOUTS__CONNECT=3600s \
DASK_DISTRIBUTED__COMM__TIMEOUTS__TCP=3600s \
srun -N $SLURM_NNODES --ntasks-per-node=1 --cpus-per-task=128 \
    shifter --image=$image dask worker \
    --scheduler-file $scheduler_file \
    --interface hsn0 \
    --nworkers $workers_per_node \
    --nthreads $threads_per_worker \
    --memory-limit $memory_per_worker \
    --local-directory $worker_space

worker_rc=$?
echo "Worker srun exited with status $worker_rc"

echo "Killing scheduler"
kill -9 $dask_pid
rm -f $scheduler_file

exit $worker_rc
