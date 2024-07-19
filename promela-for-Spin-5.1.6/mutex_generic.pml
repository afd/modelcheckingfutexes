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
never  {    /* [](num_threads_in_cs <= 1) */
accept_init:
T0_init:
	do
	:: ((num_threads_in_cs <= 1)) -> goto T0_init
	od;
}
