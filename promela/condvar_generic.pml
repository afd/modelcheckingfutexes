/******************************************************************************/
/* Simple mutex */

bool mutex;

inline mutex_lock() {
  atomic {
    mutex == 0 -> mutex = 1
  }
}

inline mutex_unlock() {
  mutex = 0
}

/******************************************************************************/

/* Two threads: a waiter and a signaler.
 *
 * We're interested in detecting issues of "lost signal", i.e. a signal emitted
 * while the waiter thread is waiting doesn't wakes up the waiter thread.
 *
 * The waiter thread waits only once.
 *
 * We want the signaler thread to signal various times, since at least one bug
 * is related to many signal calls overflowing a counter. Also, we want to have
 * at least one signal after the waiter starts waiting. To achieve this, we
 * record the fact that the waiter starts waiting in the `start_wait` variable.
 * The signaler loops on calling signal(), if it detect that the waiter has
 * started waiting, it calls signal at least once (but potentially a lot of
 * times) before exiting the loop and terminating.
 *
 * With this harness, we just have to check that all threads can reach
 * termination.
 */

bool start_wait;

/* Needed for condvar3 */
byte condvar_previous;

active proctype ThreadWait() {
  byte locvar_val = 0;

  mutex_lock();
  start_wait = 1;
  printf("Waiter starts to wait\n");
  condvar_wait();
  printf("Waiter woke up\n");
  mutex_unlock();
}

active proctype ThreadSignal() {
  byte locvar_val = 0;

  bool can_break = 0;
  do
  :: mutex_lock() ->
    /* It is important to signal at least once after we detect that the waiter
     * has started to wait.
     */
    if
    :: start_wait -> can_break = 1
    :: else
    fi
    condvar_signal();
    mutex_unlock();
  :: can_break ->
    printf("Signaler breaks out of the loop\n");
    break
  od
}
