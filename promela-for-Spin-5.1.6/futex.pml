// Futex specification. This file is meant to be #include'd.

// A Futex is the combination of a futex word and a wait queue of threads.
typedef Futex {
  // Futex word
  byte word;
  // Wait queue: array of bool indexed by thread IDs;
  // thread T is waiting iff wait[T] is true
  bool wait[WAIT_SIZE];
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
       else ->
       printf(
         "T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n",
         _pid, futex.word, val);
     }
  fi
}

#ifdef __TOPSPIN__
#define TID0 1
#define TID1 2
#define TID2 3
#define TID3 4
#define TID4 5
#define TID5 6
#else
#define TID0 0
#define TID1 1
#define TID2 2
#define TID3 3
#define TID4 4
#define TID5 5
#endif

// futex_wake implements the FUTEX_WAKE operation: it
// non-deterministically chooses num_to_wake sleeping threads and
// wakes them up.
inline futex_wake(futex, num_to_wake) {
  atomic {
    // The waker must not be asleep
    assert(!futex.wait[_pid]);
    num_woken = 0; // "byte num_woken" needs to be in scope
    do
    :: num_woken == num_to_wake ||
         futex.num_waiting == 0 ->
       break
    :: else ->
       if
       :: futex.wait[TID0] -> futex.wait[TID0] = false;
          //printf("T%d wakes T0\n", _pid)
       :: futex.wait[TID1] -> futex.wait[TID1] = false;
          //printf("T%d wakes T1\n", _pid)
#if NUM_THREADS > 2
       :: futex.wait[TID2] -> futex.wait[TID2] = false;
          //printf("T%d wakes T2\n", _pid)
#endif
#if NUM_THREADS > 3
       :: futex.wait[TID3] -> futex.wait[TID3] = false;
          //printf("T%d wakes T3\n", _pid)
#endif
#if NUM_THREADS > 4
       :: futex.wait[TID4] -> futex.wait[TID4] = false;
          //printf("T%d wakes T4\n", _pid)
#endif
#if NUM_THREADS > 5
       :: futex.wait[TID5] -> futex.wait[TID5] = false;
          //printf("T%d wakes T5\n", _pid)
#endif
#if NUM_THREADS > 6
#error "NUM_THREADS > 6, add more if branches in futex_wake"
#endif
       fi;
       futex.num_waiting--;
       num_woken++;
    od;
    printf("T%d woke up %d thread(s)\n",
           _pid, num_woken);
    // Reset to avoid state space explosion
    num_woken = 0;
  }
}
