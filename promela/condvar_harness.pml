// Harness for condition variables

// Simple mutex: mutex == true iff it is locked.
bool mutex;
inline mutex_lock() { d_step { !mutex -> mutex = true } }
inline mutex_unlock() { mutex = false }

// One thread is the signaler, the rest are waiters.
#define NUM_WAITERS (NUM_THREADS - 1)
byte num_signals_req; // Number of signals required
byte num_done; // Number of terminated waiter threads

active[NUM_WAITERS] proctype Waiter() {
  do
  :: mutex_lock() ->
     num_signals_req++;
     printf("T%d calls cv_wait()\n", _pid);
     cv_wait();
     printf("T%d returns from cv_wait()\n", _pid);
     mutex_unlock()
  :: break
  od
  num_done++;
}

active proctype Signaller() {
  do
  :: num_signals_req > 0 ->
     mutex_lock();
     printf("T%d must signal, num_signals_req=%d\n", _pid, num_signals_req);
     cv_signal();
     num_signals_req--;
     mutex_unlock()
  :: else ->
     if
     :: true ->
        mutex_lock();
        printf("T%d signals without need\n", _pid);
        cv_signal();
        if
        :: num_signals_req > 0 -> num_signals_req--;
        :: else
        fi
        mutex_unlock()
     :: true -> printf("T%d won't signal until needed\n", _pid);
        if
        :: num_signals_req > 0
        :: num_done == NUM_WAITERS -> break
        fi
     fi
  od
}
