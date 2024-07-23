/* Mutex, take 3 from the "Futexes Are Tricky" paper by U. Drepper.
 *
 * Test with 3 threads, checking critical section safety:
 *   spin -DNUM_THREADS=3 -search -ltl safe_cs -m100000 -b drepper_mutex3.pml
 *
 * Test with 3 threads, checking for invalid end states:
 *   spin -DNUM_THREADS=3 -search -noclaim -m100000 -b drepper_mutex3.pml
 */

#include "num_threads_mutex.pml"
#include "futex.pml"
#include "atomics.pml"

Futex futex;

#include "drepper_mutex3x_lock.pml"

inline unlock() {
  byte old_value_unlock;
  d_step {
    fetch_dec(futex.word, old_value_unlock);
    printf("T%d decrements futex word from %d to %d\n", _pid, old_value_unlock, futex.word);
  }
  if
  :: d_step { old_value_unlock == 2 -> futex.word = 0; old_value_unlock = 0 }
     futex_wake(futex, 1)
  :: d_step { old_value_unlock == 1 -> old_value_unlock = 0 }
  fi
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
