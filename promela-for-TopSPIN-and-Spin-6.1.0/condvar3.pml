// Condition variable: "sequence counter, close but no cigar"
//
// Bug due to overflow of futex word.
//
//   spin -DNUM_THREADS=2 -search -noclaim -m100000 -b condvar2.pml
//   ./pan -S

#include "num_threads_condvar.pml"
#include "futex.pml"
#include "atomics.pml"

Futex futex;

inline cv_wait() {
  val = futex.word; /*@\label{line:condvar2:savefutexword}@*/
  mutex_unlock(); /*@\label{line:condvar2:mutexunlock}@*/
  futex_wait(futex, val); /*@\label{line:condvar2:futexwait}@*/
  mutex_lock();
  // Reset to avoid state space explosion
  val = 0;
}

inline cv_signal() {
  futex.word = inc(futex.word);
  futex_wake(futex, 1);
}

#include "condvar_harness.pml"
