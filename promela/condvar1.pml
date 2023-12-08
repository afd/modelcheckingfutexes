// Condition variable: "simple but very wrong"
//
// Bug due to bad design: futex_wake() can be called after, in wait(),
// the mutex is unlocked, but before the call to futex_wait().
//
//   spin -DNUM_THREADS=2 -search -noclaim -m100000 -b condvar1.pml
//   ./pan -S

#include "atomics.pml"
#include "futex.pml"

Futex futex;

inline cv_wait() {
  mutex_unlock(); /*@\label{line:condvar1:mutexunlock}@*/
  futex_wait(futex, 0); /*@\label{line:condvar1:futexwait}@*/
  mutex_lock();
}

inline cv_signal() { futex_wake(futex, 1) }

#include "condvar_harness.pml"
