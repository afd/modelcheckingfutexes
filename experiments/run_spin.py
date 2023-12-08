import sys
import subprocess
import os
import os.path

PROMELA_SOURCES = [
    "../promela/drepper_mutex2.pml",
    "../promela/drepper_mutex3.pml",
    "../promela/drepper_mutex3b.pml",
    "../promela/gustedt_mutex1.pml",
    "../promela/gustedt_mutex2.pml",
]

MAX_NUM_THREADS=6
NUM_ITERATIONS=10
DEPTH_LIMIT = 20000000

CC = "gcc"
COPT = ["-O3"]
LOG_DIR="logs"

def run_cmd(cmd, logfile=None):
    print(' '.join(cmd))
    proc = subprocess.run(cmd, capture_output=True)
    assert proc.returncode == 0
    if logfile is not None:
        open(logfile, 'w').write(proc.stdout.decode('utf-8'))


def generate_pan(promela_source, num_threads):
    run_cmd(["spin", f"-DNUM_THREADS={num_threads}", "-a", promela_source])


def compile_pan(no_claim):
    cmd = [CC]
    if no_claim:
        cmd += ["-DNOCLAIM"]
    cmd += COPT
    cmd += ["-o", "pan", "pan.c"]
    run_cmd(cmd)


def run_pan(pan_args, logfile):
    # -mXXX: set depth-limit to XXX
    # -b: error if depth-limit is exceeded
    run_cmd(["./pan", f"-m{DEPTH_LIMIT}", "-b"] + pan_args, logfile)


def logfilename(promela_source, num_threads, claim, iteration):
    basename = os.path.basename(promela_source)
    return f'{LOG_DIR}/{basename}_{num_threads}_{claim}_{iteration}.txt'


def run_noclaim(promela_source, num_threads, num_iterations):
    compile_pan(no_claim=True)
    for i in range(num_iterations):
        logfile = logfilename(promela_source, num_threads, 'noclaim', i)
        run_pan([], logfile)


def run_safe_cs(promela_source, num_threads, num_iterations):
    compile_pan(no_claim=False)
    for i in range(num_iterations):
        logfile = logfilename(promela_source, num_threads, 'safe_cs', i)
        run_pan(['-a'], logfile)


##############################################################################
# Main
if not os.path.isdir(LOG_DIR):
    os.mkdir(LOG_DIR)
for num_threads in range(2, MAX_NUM_THREADS+1):
    for promela_source in PROMELA_SOURCES:
        generate_pan(promela_source, num_threads)
        run_noclaim(promela_source, num_threads, NUM_ITERATIONS)
        run_safe_cs(promela_source, num_threads, NUM_ITERATIONS)
