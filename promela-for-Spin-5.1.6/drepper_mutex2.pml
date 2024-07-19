/* Mutex, take 2 from the "Futexes Are Tricky" paper by U. Drepper.
 *
 * Test with 3 threads, checking critical section safety:
 *   spin -DNUM_THREADS=3 -search -ltl safe_cs -m100000 -b drepper_mutex2.pml
 *
 * Test with 3 threads, checking for invalid end states:
 *   spin -DNUM_THREADS=3 -search -noclaim -m100000 -b drepper_mutex2.pml
 */

#include "futex.pml"
#include "atomics.pml"

Futex futex;

inline lock() {
  byte old_value_lock;
  atomic {
    cmpxchg(futex.word, 0, 1, old_value_lock);
    if
    :: old_value_lock == 0 ->
       printf("T%d locks mutex on fast path\n", _pid);
       goto acquired_mutex
    :: else ->
       printf("T%d fails to lock mutex on fast path\n",
              _pid)
    fi
  }
  do
  :: atomic {
       if
       :: old_value_lock == 2
       :: else ->
          assert(old_value_lock == 1);
          cmpxchg(futex.word, 1, 2, old_value_lock)
          if
          :: old_value_lock == 0 -> goto retry
          :: else
          fi
       fi
     }
     futex_wait(futex, 2)        
retry:
     atomic {
       cmpxchg(futex.word, 0, 2, old_value_lock)
       if
       :: old_value_lock == 0 ->
          printf("T%d locks mutex on slow path\n",
                 _pid);
          goto acquired_mutex
       :: else ->
          printf(
            "T%d fails to lock mutex on slow path\n",
            	 _pid)
       fi
     }
  od;
acquired_mutex:
  skip;  
}

inline unlock() {
  byte old_value_unlock;
  d_step {
    fetch_dec(futex.word, old_value_unlock);
    printf("T%d decrements futex word from %d to %d\n",
           _pid, old_value_unlock, futex.word)
  }
  if
  :: d_step {
       old_value_unlock == 2 ->
       futex.word = 0;
       old_value_unlock = 0
     }
     futex_wake(futex, 1)
  :: d_step {
       old_value_unlock == 1 ->
       old_value_unlock = 0
     }
  fi
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
