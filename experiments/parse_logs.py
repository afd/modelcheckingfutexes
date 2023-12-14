import os.path
import statistics

mutexes = [
    'drepper_mutex2',
    'drepper_mutex3',
    'drepper_mutex3b',
    'gustedt_mutex1',
    'gustedt_mutex2',
]

MAX_NUM_THREADS=6

for m in mutexes:
    for t in range(2, MAX_NUM_THREADS+1):
        durations = []
        num_states = 0
        for r in range(0, 10):
            logfile=f'logs/{m}.pml_{t}_safe_cs_{r}.txt'
            if os.path.isfile(logfile):
                with open(logfile, 'r') as f:
                    for l in f.readlines():
                        if 'states, stored' in l:
                            ns = float(l.strip().split(' ')[0])
                            if num_states == 0:
                                num_states = ns
                            elif num_states != ns:
                                print(f'Different number of states: {num_states} != {ns} ({logfile})')
                                exit(1)
                        elif 'pan: elapsed time ' in l:
                            durations.append(float(l.strip().split(' ')[3]))

        if len(durations) != 10: continue

        mean = statistics.mean(durations)
        stddev = statistics.stdev(durations, xbar=mean)
        coeff_variation = 0.0
        if mean > 0.1:
            coeff_variation = 100 * stddev / mean
        print(f'M:{m} T:{t} #S:{num_states} mean:{mean} coeff_variation:{coeff_variation}')
