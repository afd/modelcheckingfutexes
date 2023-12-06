/* Sequence counter, with condvar_previous
 *
 *
 *
 *
 *
 *   spin -DNUM_THREADS=2 -search -noclaim -m100000 -b condvar3.pml
 *
 */

#include "futex.pml"
#include "atomics.pml"

Futex futex;

byte cv_previous; // Additional state in condition variable

inline cv_wait() {
  cv_previous = futex.word;
  byte val = cv_previous;
  mutex_unlock(); /*@\label{line:condvar3:mutexunlock}@*/
  futex_wait(futex, val); /*@\label{line:condvar3:futexwait}@*/
  mutex_lock();
}

inline cv_signal() {
  futex.word = inc(cv_previous); /*@\label{line:condvar3:incprevious}@*/
  printf("T%d sets futex.word to %d\n", _pid, futex.word);
  futex_wake(futex, 1);
}

#include "condvar_harness.pml"
