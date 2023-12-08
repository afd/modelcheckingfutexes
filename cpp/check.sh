#!/bin/bash

set -e

for kind in `seq 1 6`
do
    echo "Checking mutex kind ${kind}"
    ${CXX} mutex_harness.cc -DMUTEX=1 -DNTHREADS=16 -DELEMS_PER_THREAD=10000
    ./a.out
    ${CXX} mutex_harness.cc -DMUTEX=1 -DNTHREADS=16 -DELEMS_PER_THREAD=10000 -fsanitize=thread
    ./a.out
done
