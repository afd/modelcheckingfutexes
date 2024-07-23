/* Toggle
 *
 * TODO - write comment and give Spin commmand.
 *
 * With two threads, no problem:
 *   spin -DNUM_THREADS=2 -search -noclaim -m100000 condvar4.pml
 *
 * With three threads, invalid end state:
 *   spin -DNUM_THREADS=3 -search -DREACH -noclaim -m100000 condvar4.pml
 *   ./pan -i condvar4.pml.trail
 *   ./pan -S condvar4.pml.trail
 *
 */

#include "num_threads_condvar.pml"
#include "atomics.pml"
#include "futex.pml"

Futex futex;

inline cv_wait() {
  futex.word = 1;
  mutex_unlock();
  futex_wait(futex, 1);
  mutex_lock();
}

inline cv_signal() {
  futex.word = 0;
  futex_wake(futex, 1);
}

#include "condvar_harness.pml"
