/* The lock() function for drepper_mutex3 and drepper_mutex3b */

inline lock() {
  byte old_value_lock;
  cmpxchg(futex.word, 0, 1, old_value_lock);
  if
  :: atomic {
       old_value_lock != 0 ->
       printf("T%d fails to lock mutex on fast path\n", _pid)
     }
     atomic {
       if
       :: old_value_lock == 2
       :: else -> assert(old_value_lock == 1);
          xchg(futex.word, 2, old_value_lock)
       fi
     }
     do
     :: old_value_lock == 0 ->
        printf("T%d locks mutex on slow path\n", _pid);
	break;
     :: else ->
        printf("T%d fails to lock mutex on slow path\n", _pid);
        futex_wait(futex, 2);
        xchg(futex.word, 2, old_value_lock)
     od
  :: atomic {
       else -> printf("T%d locks mutex on fast path\n", _pid)
     }
  fi
}
