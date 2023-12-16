// Futex specification. This file is meant to be #include'd.

// Sentinel value for invalid thread ID.
#define INVALID_TID 255

// Total number of threads.
//
// Can be modified when calling spin, e.g. to run with 5 threads:
//   spin -DNUM_THREADS=5 ...
//
// Various arrays are declared with a size equal to NUM_THREADS. These arrays
// are indexed by the thread ID, i.e. the built-in `_pid` variable. Note that
// this requires to declare threads with something like:
//
//   active [NUM_THREADS] proctype Thread() { ... }
//
// In particular, we should not have an `init` process, otherwise the init
// process own _pid creates an offset in the _pid values of threads.
#ifndef NUM_THREADS
#define NUM_THREADS 2
#elif (NUM_THREADS < 2) || (NUM_THREADS >= INVALID_TID)
#error "NUM_THREADS must be in [2, INVALID_TID)"
#endif

// A Futex is the combination of a futex word and a wait queue of threads.
typedef Futex {
  // Futex word
  byte word;
  // Wait queue: array of bool indexed by thread IDs;
  // thread T is waiting iff wait[T] is true
  bool wait[NUM_THREADS];
  // Number of threads currently waiting
  byte num_waiting;
}

// futex_wait implements the FUTEX_WAIT operation: the calling thread goes to sleep only when the futex word equals the value argument.
inline futex_wait(futex, val) {
  if
  :: d_step { /*@\label{line:futexwait:dstep1}@*/
       futex.word == val -> /*@\label{line:futexwait:wordequalval}@*/
       printf(
         "T%d futex_wait, value match: %d; sleep\n",
         _pid, futex.word);
       // The thread must not be sleeping already
       assert(!futex.wait[_pid]);
       futex.wait[_pid] = true;
       futex.num_waiting++;
     }
     d_step { /*@\label{line:futexwait:dstep2}@*/
       !futex.wait[_pid] ->
       printf("T%d has woken\n", _pid);
     }
  :: d_step { /*@\label{line:futexwait:dstep3}@*/
       else -> printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", _pid, futex.word, val);
     }
  fi
}

// futex_wake implements the FUTEX_WAKE operation: it
// non-deterministically chooses num_to_wake sleeping threads and
// wakes them up.
inline futex_wake(futex, num_to_wake) {
  atomic {
    // The waker must not be asleep
    assert(!futex.wait[_pid]);
    byte num_woken = 0;
    do
    :: num_woken == num_to_wake ||
         futex.num_waiting == 0 ->
       break
    :: else ->
       if
       :: futex.wait[0] -> futex.wait[0] = false;
          printf("T%d wakes T0\n", _pid)
       :: futex.wait[1] -> futex.wait[1] = false;
          printf("T%d wakes T1\n", _pid)
#if NUM_THREADS > 2
       :: futex.wait[2] -> futex.wait[2] = false;
          printf("T%d wakes T2\n", _pid)
#endif
#if NUM_THREADS > 3
       :: futex.wait[3] -> futex.wait[3] = false;
          printf("T%d wakes T3\n", _pid)
#endif
#if NUM_THREADS > 4
       :: futex.wait[4] -> futex.wait[4] = false;
          printf("T%d wakes T4\n", _pid)
#endif
#if NUM_THREADS > 5
       :: futex.wait[5] -> futex.wait[5] = false;
          printf("T%d wakes T5\n", _pid)
#endif
#error "NUM_THREADS > 6, add more if branches in futex_wake"
#endif
       fi
       futex.num_waiting--;
       num_woken++;
    od
    printf("T%d woke up %d thread(s)\n",
           _pid, num_woken);
    // Reset to avoid state space explosion
    num_woken = 0;
  }
}
