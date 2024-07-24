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

# Produce Latex table lines
max_coeff_variation = 0.0
for t in range(2, MAX_NUM_THREADS+1):
    latexline = f'{t}'
    for m in mutexes:
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

        if len(durations) != 10:
            latexline += ' & n/a & n/a'
            continue

        mean = statistics.mean(durations)
        stddev = statistics.stdev(durations, xbar=mean)
        latexline  += f' & {int(num_states)} & {mean:.2f}'

        coeff_variation = 0.0
        if mean > 0.1:
            coeff_variation = 100 * stddev / mean
        max_coeff_variation = max(max_coeff_variation, coeff_variation)

    latexline += ' \\\\'
    print(latexline)

print()
print(f'%% max_coeff_variation: {max_coeff_variation}')
