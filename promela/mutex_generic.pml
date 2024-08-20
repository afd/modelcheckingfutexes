/* Generic part of mutex specification. This file is meant to be #include'd.
 *
 * Given the mutex lock() and unlock() primitives, this file defines a generic
 * Thread() proctype that loops on locking and unlocking a mutex.
 *
 * It also contains a generic LTL formula.
 */

// Number of threads in the critical section (CS)
byte num_threads_in_cs;

active [NUM_THREADS] proctype Thread() {
  byte old_value; // Used by Drepper mutexes

  // Used by Gustedt mutexes
  byte prev = 0;
  byte tmp = 0;
  byte cur = 0;

  byte num_woken = 0; // Used by "futex_wake"
  do
  :: lock();
     num_threads_in_cs++;
     num_threads_in_cs--;
     unlock();
  :: printf("T%d is done\n", _pid) -> break
  od
}

// Never more than one thread in CS
active proctype Monitor() {
end:
  atomic {
    num_threads_in_cs > 1 -> assert(false);
  }
}
