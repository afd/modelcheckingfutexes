/* Mutex, take 3 from the "Futexes Are Tricky" paper by U. Drepper.
 *
 * Test with 3 threads, checking critical section safety:
 *   spin -DNUM_THREADS=3 -search -ltl safe_cs -m100000 -b drepper_mutex3b.pml
 *
 * Test with 3 threads, checking for invalid end states:
 *   spin -DNUM_THREADS=3 -search -noclaim -m100000 -b drepper_mutex3b.pml
 */

#include "num_threads_mutex.pml"
#include "futex.pml"
#include "atomics.pml"

Futex futex;

#include "drepper_mutex3x_lock.pml"

inline unlock() {
  d_step {
    xchg(futex.word, 0, old_value);
    printf("T%d exchanges futex word with 0; old value was %d\n", _pid, old_value);
  }
  if
  :: d_step { old_value == 2 -> old_value = 0 }
     futex_wake(futex, 1)
  :: d_step { old_value == 1 -> old_value = 0 }
  fi
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
