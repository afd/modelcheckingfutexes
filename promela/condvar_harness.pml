// Harness for condition variables

// Simple mutex: mutex == true iff it is locked.
bool mutex;
inline mutex_lock() {d_step{ !mutex -> mutex = true }}
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
     cv_wait(); /*@\label{line:condvar:lostwaiter}@*/
     printf("T%d returns from cv_wait()\n", _pid);
     mutex_unlock()
  :: break
  od
  num_done++;
}

active proctype Signaller() {
  do
  :: num_signals_req > 0 -> /*@\label{line:condvar:signalrequired}@*/
     mutex_lock(); /*@\label{line:condvar:mustsignalstart}@*/
     printf("T%d must signal, num_signals_req=%d\n", _pid, num_signals_req);
     cv_signal();
     num_signals_req--;
     mutex_unlock() /*@\label{line:condvar:mustsignalend}@*/
  :: else -> /*@\label{line:condvar:nosignalrequired}@*/
     if
     :: true -> /*@\label{line:condvar:nondet1}@*/
        mutex_lock(); /*@\label{line:condvar:choosestosignalstart}@*/
        printf("T%d signals without need\n", _pid);
        cv_signal();
        num_signals_req = (num_signals_req > 0 -> num_signals_req - 1 : 0);
        mutex_unlock() /*@\label{line:condvar:choosestosignalend}@*/
     :: true -> printf("T%d won't signal until needed\n", _pid); /*@\label{line:condvar:nondet2}@*/
        if
        :: num_signals_req > 0 -> assert(num_done < NUM_WAITERS) /*@\label{line:condvar:signallerstuck}@*/
        :: num_done == NUM_WAITERS -> assert(num_signals_req == 0); break /*@\label{line:condvar:alldone}@*/
        fi
     fi
  od
}
