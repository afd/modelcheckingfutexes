// Gustedt lock, research version
// See https://inria.hal.science/hal-01236734
// The futex value is used for both:
// - a flag (high-order bit) to indicate that lock is acquired
// - a counter of congestion, i.e. number of threads in the CS

#include "futex.pml"
#include "atomics.pml"
#include "lockbit.pml"

Futex futex;

inline lock() {
  byte tmp = 0;
  byte cur = 0;
  atomic {
    cmpxchg(futex.word, 0, set_locked(1), cur);
    if
    :: cur == 0 -> printf("T%d locks mutex on fast path\n", _pid);
       goto acquired_mutex
    :: else -> printf("T%d fails to lock mutex on fast path\n", _pid)
    fi
  }
  lockbit_fetch_inc(futex.word, cur);
  cur = cur + 1;

  retry: // Lock loop
  if
  :: !(is_locked(cur)) ->
     atomic {
       cmpxchg(futex.word, cur, set_locked(cur), tmp);
       if
       :: cur == tmp -> printf("T%d locks mutex\n", _pid);
          goto acquired_mutex
       :: else
       fi
     }
     cur = futex.word;
     do // Busy wait loop
     :: is_locked(cur) -> cur = futex.word
     :: true -> goto retry
     od
     goto retry
  :: else ->
     futex_wait(futex, cur);
     cur = futex.word;
     goto retry
  fi

  acquired_mutex: tmp = 0; cur = 0;
}

inline unlock() {
  byte prev = 0;
  d_step {
    lockbit_fetch_unlock_and_dec(futex.word, prev);
    printf("T%d unlocks: set futex word from %d to %d\n", _pid, prev, futex.word);
  }
  if
  :: prev != set_locked(1) -> futex_wake(futex, 1)
  :: else
  fi
  prev = 0;
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
