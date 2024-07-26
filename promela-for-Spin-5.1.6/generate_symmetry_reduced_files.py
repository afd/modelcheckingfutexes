import os
import subprocess
import sys

MODELS = [
    'drepper_mutex2',
    'drepper_mutex3',
    'drepper_mutex3b',
    'gustedt_mutex1',
    'gustedt_mutex2',
]

TOPSPIN_ROOT = '/home/afd/dev/symmetrytools'
PATH_TO_GAP = '/home/afd/dev/gap/gap-4.13.1/gap'

work_dir = sys.argv[1]

if os.path.exists(work_dir):
    print(f'Working directory {work_dir} already exists.')
    sys.exit(1)

os.mkdir(work_dir)
os.chdir(work_dir)

for model in MODELS:
    assert(os.path.exists('../' + model + '.pml'))
    os.mkdir(model)
    os.chdir(model)
    for i in range(2, 11):
        if model.startswith('condvar') and i == 2:
            # There is no symmetry when there is one waiter and one signaller
            continue
        os.mkdir(str(i))
        os.chdir(str(i))
        print(f'Generating {model} with {i} threads')
        config_content = '\n'.join([
            f'gap={PATH_TO_GAP}',
            f'saucy={TOPSPIN_ROOT}/saucy/saucy',
            f'common={TOPSPIN_ROOT}/Common/',
            'explain=1',
            f'preprocessor_directives=-D__TOPSPIN__ -DNUM_THREADS={i} -DNUM_WAITERS={i - 1}'
        ])
        open('config.txt', 'w').write(config_content)
        topspin_cmd = ['java', '-jar', f'{TOPSPIN_ROOT}/TopSPIN.jar', f'../../../{model}.pml']
        topspin_process = subprocess.run(topspin_cmd, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
        print(' '.join(topspin_cmd))
        if topspin_process.returncode != 0:
            print("Error running TopSPIN")
            print(' '.join(topspin_cmd))
            print(topspin_process.stdout.decode('utf-8'))
            print(topspin_process.stderr.decode('utf-8'))
        os.chdir('..')
    os.chdir('..')
