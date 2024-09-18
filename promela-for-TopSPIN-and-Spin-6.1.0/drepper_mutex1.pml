/* Mutex, take 1 from the "Futexes Are Tricky" paper by U. Drepper.
 *
 * This mutex has bugs.
 *
 * With 2 threads, no issue:
 *   spin -DNUM_THREADS=2 -search -ltl safe_cs drepper_mutex1.pml
 *
 * With 3 threads, overflowing issue shows up:
 *   spin -DNUM_THREADS=3 -search -ltl safe_cs drepper_mutex1.pml
 * See counter-example with:
 *   ./pan -S -r drepper_mutex1.pml.trail
 */

#include "num_threads_mutex.pml"
#include "futex.pml"
#include "atomics.pml"

// The global variable futex used in lock() and unlock().
Futex futex;

inline lock() {
  do
  :: atomic {
       fetch_inc(futex.word, old_value); /*@\label{line:drepper1:fetchinc}@*/
       if
       :: old_value == 0 ->
          printf("T%d locks mutex\n", _pid);
	  break
       :: else ->
          printf("T%d lock fail, old_value: %d\n",
                 _pid, old_value);
       fi
     }
     futex_wait(futex, inc(old_value)) /*@\label{line:drepper1:futexwait}@*/
  od
}

inline unlock() {
  d_step {
    futex.word = 0;
    printf("T%d unlocks mutex\n", _pid)
  }
  futex_wake(futex, 1)
}

#include "mutex_generic.pml"
