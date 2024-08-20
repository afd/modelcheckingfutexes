/* The lock() function for drepper_mutex3 and drepper_mutex3b */

inline lock() {
  cmpxchg(futex.word, 0, 1, old_value);
  if
  :: atomic {
       old_value != 0 ->
       printf("T%d fails to lock mutex on fast path\n", _pid)
     }
     atomic {
       if
       :: old_value == 2
       :: else -> assert(old_value == 1);
          xchg(futex.word, 2, old_value)
       fi
     }
     do
     :: old_value == 0 ->
        printf("T%d locks mutex on slow path\n", _pid);
	break;
     :: else ->
        printf("T%d fails to lock mutex on slow path\n", _pid);
        futex_wait(futex, 2);
        xchg(futex.word, 2, old_value)
     od
  :: atomic {
       else -> printf("T%d locks mutex on fast path\n", _pid)
     }
  fi
}
