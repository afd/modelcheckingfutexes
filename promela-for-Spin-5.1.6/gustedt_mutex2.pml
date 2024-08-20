// Gustedt lock, musl version
//
// See https://git.musl-libc.org/cgit/musl/tree/src/thread/__lock.c?id=47d0bcd4762f223364e5b58d5a381aaa0cbd7c38
//
// The futex value is used for both:
// - a flag (high-order bit) to indicate that lock is acquired
// - a counter of congestion, i.e. number of threads in the CS
//
// Running checks, e.g. with 3 threads:
//   spin -DNUM_THREADS=3 -search -ltl safe_cs gustedt_mutex2.pml
//   spin -DNUM_THREADS=3 -search -noclaim gustedt_mutex2.pml

#include "num_threads_mutex.pml"
#include "futex.pml"
#include "atomics.pml"
#include "lockbit.pml"

Futex futex;

inline lock() {
  atomic {
    cmpxchg(futex.word, 0, set_locked(1), cur);
    if
    :: cur == 0 -> printf("T%d locks mutex on fast path\n", _pid);
       goto acquired_mutex
    :: else -> printf("T%d fails to lock mutex on fast path\n", _pid)
    fi
  }

  do // Busy wait loop
  :: true -> break
  :: true ->
     if
     :: is_locked(cur) -> cur = dec(unset_locked(cur));
     :: else
     fi;
     cmpxchg(futex.word, cur, set_locked(cur + 1), prev);
     if
     :: cur == prev -> goto acquired_mutex
     :: else -> cur = prev
     fi
  od;

  lockbit_fetch_inc(futex.word, cur);
  cur = cur + 1;

  do
  :: if
     :: is_locked(cur) ->
        futex_wait(futex, cur);
        cur = dec(unset_locked(cur))
     :: else
     fi;
     cmpxchg(futex.word, cur, set_locked(cur), prev);
     if
     :: cur == prev -> goto acquired_mutex
     :: else -> cur = prev
     fi
  od;

  acquired_mutex: prev = 0; cur = 0;
}

inline unlock() {
  d_step {
    lockbit_fetch_unlock_and_dec(futex.word, prev);
    printf("T%d unlocks: set futex word from %d to %d\n", _pid, prev, futex.word);
  }
  if
  :: prev != set_locked(1) -> futex_wake(futex, 1)
  :: else
  fi;
  prev = 0;
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
