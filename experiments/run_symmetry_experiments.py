import shutil
import sys
import subprocess
import os
import os.path

MODELS = [
    "drepper_mutex2",
    "drepper_mutex3",
    "drepper_mutex3b",
    "gustedt_mutex1",
    "gustedt_mutex2",
]

MAX_NUM_THREADS=4
NUM_ITERATIONS=1
DEPTH_LIMIT = 10000000
MEMORY_LIMIT_MEGABYTES = 30 * 1024
TIME_LIMIT_MINUTES = 6 * 60

CC = "gcc"
COPT = ["-O3", f"-DMEMLIM={MEMORY_LIMIT_MEGABYTES}"]
LOG_DIR = "logs"

def run_cmd(cmd, logfile=None):
    print(' '.join(cmd))
    proc = subprocess.run(cmd, capture_output=True)
    assert proc.returncode == 0
    if logfile is not None:
        open(logfile, 'w').write(proc.stdout.decode('utf-8'))

def get_sympan(model_name, num_threads):
    # Create empty trail files to prevent pan to try and write
    # enormous trail files when it hits the depth limit.
    for suffix in ['.trail', '.pml.trail']:
        trailfilename = model_name + suffix
        with open(trailfilename, 'w') as f:
            f.write('nothing')
            f.close()
    files = [
        "sympan.c",
        "group.c",
        "sympan.h",
        "group.h",
        "apply_permutation.h",
        "symmetry_group.h",
        "sympan.b",
        "sympan.m",
        "sympan.t",
    ]
    for file in files:
        shutil.copyfile(src=f"../promela-for-Spin-5.1.6/generated_files/{model_name}/{num_threads}/{file}",
                        dst=file)


def compile_sympan():
    cmd = [CC, "-DSAFETY", "-DCOLLAPSE"]
    cmd += COPT
    cmd += ["-o", "sympan", "sympan.c", "group.c"]
    run_cmd(cmd)


def run_sympan(logfile):
    print(f'Log file: {logfile}')
    # -mXXX: set depth-limit to XXX
    # -b: error if depth-limit is exceeded
    # -x: do not overwrite an existing trail file, we use this to prevent pan
    #     from creating huge trail files.
    run_cmd(["./sympan", f"-m{DEPTH_LIMIT}", f"-Q{TIME_LIMIT_MINUTES}", "-b", "-x"], logfile)


def logfilename(model_name, num_threads, iteration):
    result = f'{LOG_DIR}/{model_name}_{num_threads}'
    result += '_COLLAPSE'
    result += f'_{iteration}.txt'
    return result


def check_depth_limit_error(logfile):
    with open(logfile, 'r', encoding="utf-8") as f:
        s = f.read()
        return 'error: max search depth too small' not in s


def compile_and_run_sympan(model_name, num_threads, num_iterations):
    compile_sympan()
    for i in range(num_iterations):
        logfile = logfilename(model_name + ".pml", num_threads,
                              iteration=i)
        run_sympan(logfile)
        if not check_depth_limit_error(logfile):
            print('Depth limit too low, skipping other runs')
            break

##############################################################################
# Main
if not os.path.isdir(LOG_DIR):
    os.mkdir(LOG_DIR)
for num_threads in range(2, MAX_NUM_THREADS+1):
    for model_name in MODELS:
        get_sympan(model_name, num_threads)
        compile_and_run_sympan(model_name, num_threads, num_iterations=NUM_ITERATIONS)
