// Gustedt lock, musl version
// See https://git.musl-libc.org/cgit/musl/tree/src/thread/__lock.c?id=47d0bcd4762f223364e5b58d5a381aaa0cbd7c38
// The futex value is used for both:
// - a flag (high-order bit) to indicate that lock is acquired
// - a counter of congestion, i.e. number of threads in the CS

#include "futex.pml"
#include "atomics.pml"
#include "lockbit.pml"

#ifndef BUSYWAIT
#define BUSYWAIT 2
#endif

Futex futex;

inline lock() {
  byte prev = 0;
  byte cur = 0;
  atomic {
    cmpxchg(futex.word, 0, set_locked(1), cur);
    if
    :: cur == 0 -> printf("T%d locks mutex on fast path\n", _pid);
       goto acquired_mutex
    :: else -> printf("T%d fails to lock mutex on fast path\n", _pid)
    fi
  }

  byte count = BUSYWAIT;
  do
  :: count == 0 -> break
  :: else ->
     count = count - 1;
     if
     :: is_locked(cur) -> cur = dec(unset_locked(cur));
     :: else
     fi
     cmpxchg(futex.word, cur, set_locked(cur + 1), prev);
     if
     :: cur == prev -> goto acquired_mutex
     :: else -> cur = prev
     fi
  od

  lockbit_fetch_inc(futex.word, cur);
  cur = cur + 1;

  do
  :: if
     :: is_locked(cur) ->
        futex_wait(futex, cur);
        cur = dec(unset_locked(cur))
     :: else
     fi
     cmpxchg(futex.word, cur, set_locked(cur), prev);
     if
     :: cur == prev -> goto acquired_mutex
     :: else -> cur = prev
     fi
  od

  acquired_mutex: count = 0; prev = 0; cur = 0;
}

inline unlock() {
  byte prev;
  d_step {
    lockbit_fetch_unlock_and_dec(futex.word, prev);
    printf("T%d unlocks: set futex word from %d to %d\n", _pid, prev, futex.word);
  }
  if
  :: prev != set_locked(1) -> futex_wake(futex, 1)
  :: else
  fi
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
