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

MAX_NUM_THREADS=10
NUM_ITERATIONS=1
DEPTH_LIMIT = 500000000

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
    # Create empty trail files to prevent pan to try and write
    # enormous trail files when it hits the depth limit.
    basename = os.path.basename(promela_source)
    # Remove ".pml"
    basename = basename[:-4]
    for suffix in ['.trail', '.pml.trail']:
        trailfilename = basename + suffix
        with open(trailfilename, 'w') as f:
            f.write('nothing')
            f.close()


def compile_pan(collapse=False, bitstate=False, dma=False):
    cmd = [CC, "-DSAFETY"]
    if collapse:
        cmd += ["-DCOLLAPSE"]
    if bitstate:
        cmd += ["-DBITSTATE"]
    if dma:
        cmd += ["-DMA=50"]
    cmd += COPT
    cmd += ["-o", "pan", "pan.c"]
    run_cmd(cmd)


def run_pan(logfile):
    print(f'Log file: {logfile}')
    # -mXXX: set depth-limit to XXX
    # -b: error if depth-limit is exceeded
    # -x: do not overwrite an existing trail file, we use this to prevent pan
    #     from creating huge trail files.
    run_cmd(["./pan", f"-m{DEPTH_LIMIT}", "-b", "-x"], logfile)


def logfilename(promela_source, num_threads, iteration, collapse=False, bitstate=False, dma=False):
    basename = os.path.basename(promela_source)
    result = f'{LOG_DIR}/{basename}_{num_threads}'
    if collapse:
        result += '_COLLAPSE'
    if dma:
        result += '_DMA'
    if bitstate:
        result += '_BITSTATE'
    result += f'_{iteration}.txt'
    return result

def check_depth_limit_error(logfile):
    with open(logfile, 'r', encoding="utf-8") as f:
        s = f.read()
        return 'error: max search depth too small' not in s

def compile_and_run_pan(promela_source, num_threads, num_iterations, collapse=False, bitstate=False, dma=False):
    compile_pan(collapse=collapse, bitstate=bitstate, dma=dma)
    for i in range(num_iterations):
        logfile = logfilename(promela_source, num_threads,
                              collapse=collapse,
                              bitstate=bitstate,
                              dma=dma,
                              iteration=i)
        run_pan(logfile)
        if not check_depth_limit_error(logfile):
            print('Depth limit too low, skipping other runs')
            break

##############################################################################
# Main
if not os.path.isdir(LOG_DIR):
    os.mkdir(LOG_DIR)
for num_threads in range(2, MAX_NUM_THREADS+1):
    for promela_source in PROMELA_SOURCES:
        generate_pan(promela_source, num_threads)
        compile_and_run_pan(promela_source, num_threads, num_iterations=NUM_ITERATIONS)
        compile_and_run_pan(promela_source, num_threads, collapse=True, num_iterations=NUM_ITERATIONS)
        compile_and_run_pan(promela_source, num_threads, bitstate=True, num_iterations=NUM_ITERATIONS)
        compile_and_run_pan(promela_source, num_threads, dma=True, num_iterations=NUM_ITERATIONS)
