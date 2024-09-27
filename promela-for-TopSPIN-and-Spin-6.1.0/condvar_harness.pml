// Harness for condition variables

// Simple mutex: mutex == true iff it is locked.
bool mutex;
inline mutex_lock() {
  d_step {
    !mutex -> mutex = true
  }
}
inline mutex_unlock() {
  mutex = false
}

byte num_signals_req; // Number of signals required
byte num_done; // Number of terminated waiter threads

#ifndef __TOPSPIN__
active [NUM_WAITERS]
#endif
proctype Waiter() {
  byte val = 0;
  do
  :: mutex_lock() ->
     num_signals_req++;
     printf("T%d calls cv_wait()\n", _pid);
     cv_wait(); /*@\label{line:condvar:lostwaiter}@*/
     printf("T%d returns from cv_wait()\n", _pid);
     mutex_unlock()
  :: break
  od;
  num_done++;
}

#ifndef __TOPSPIN__
active
#endif
proctype Signaller() {
  byte num_woken = 0; // Used by "futex_wake"
  do
  :: num_signals_req > 0 -> /*@\label{line:condvar:signalrequired}@*/
     mutex_lock(); /*@\label{line:condvar:mustsignalstart}@*/
     printf("T%d must signal, num_signals_req=%d\n",
            _pid, num_signals_req);
     cv_signal();
     num_signals_req--;
     mutex_unlock() /*@\label{line:condvar:mustsignalend}@*/
  :: else -> /*@\label{line:condvar:nosignalrequired}@*/
     if
     :: true -> /*@\label{line:condvar:nondet1}@*/
        mutex_lock(); /*@\label{line:condvar:choosestosignalstart}@*/
        printf("T%d signals without need\n", _pid);
        cv_signal();
        num_signals_req =
          (num_signals_req > 0 -> num_signals_req - 1
                                : 0);
        mutex_unlock() /*@\label{line:condvar:choosestosignalend}@*/
     :: true ->  /*@\label{line:condvar:nondet2}@*/
        printf("T%d won't signal until needed\n", _pid);
        if
        :: num_signals_req > 0 -> /*@\label{line:condvar:signallerstuck}@*/
           assert(num_done < NUM_WAITERS)
        :: num_done == NUM_WAITERS -> /*@\label{line:condvar:alldone}@*/
           assert(num_signals_req == 0);
           break
        fi
     fi
  od
}

#ifdef __TOPSPIN__
init {
  atomic {
    run Waiter();
#if NUM_WAITERS > 1
    run Waiter();
#endif
#if NUM_WAITERS > 2
    run Waiter();
#endif
#if NUM_WAITERS > 3
    run Waiter();
#endif
#if NUM_WAITERS > 4
    run Waiter();
#endif
#if NUM_WAITERS > 5
    run Waiter();
#endif
#if NUM_WAITERS > 6
    run Waiter();
#endif
#if NUM_WAITERS > 7
    run Waiter();
#endif
#if NUM_WAITERS > 8
    run Waiter();
#endif
#if NUM_WAITERS > 9
    run Waiter();
#endif
#if NUM_WAITERS > 10
    run Waiter();
#endif
#if NUM_WAITERS > 11
    run Waiter();
#endif
#if NUM_WAITERS > 12
    run Waiter();
#endif
#if NUM_WAITERS > 13
    run Waiter();
#endif
#if NUM_WAITERS > 14
#error "NUM_WAITERS > 14 - edit macros to support more threads"
#endif
    run Signaller();
  }
}
#endif
