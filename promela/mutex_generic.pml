/* Generic part of mutex specification. This file is meant to be #include'd.
 *
 * Given the mutex lock() and unlock() primitives, this file defines a generic
 * Thread() proctype that loops on locking and unlocking a mutex.
 *
 * It also contains a generic LTL formula.
 */

byte num_threads_in_cs; // Number of threads in the critical section (CS)

active [NUM_THREADS] proctype Thread() {
  do
  :: lock();
     num_threads_in_cs = inc(num_threads_in_cs);
     num_threads_in_cs = dec(num_threads_in_cs);
     unlock();
  :: printf("T%d is done\n", _pid) -> break
  od
}

ltl safe_cs { [](num_threads_in_cs <= 1) } // Never more than one thread in CS
