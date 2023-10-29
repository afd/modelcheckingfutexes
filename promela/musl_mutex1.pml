// The paper version, see https://inria.hal.science/hal-01236734.

#include "futex.pml"
#include "atomics.pml"

#ifndef MUSL_BUSYWAIT_COUNT
#define MUSL_BUSYWAIT_COUNT 1
#endif

// The futex value is used for both:
// - a flag (sign bit) to indicate that lock is acquired
// - a counter of congestion, i.e. number of threads in the CS

// The futex word is a byte, it has 8 bits, use most significant
// bit as "locked" flag.
// Promela doesn't seem to support hexadecimal notation (0x...), so define a
// few helpers for this.
// lock_bit_mask == 0x80 == 128 on a C uchar.
#define lock_bit_mask 128
// unlock_bit_mask == 0x7F == 127 on a C uchar.
#define unlock_bit_mask 127
#define is_locked(w) (lock_bit_mask & (w))
#define reset_keep_lock_bit(w) (lock_bit_mask & (w))
#define set_locked(w) (lock_bit_mask | (w))
#define unset_locked(w) (unlock_bit_mask & (w))

// We need to redefine atomics operations since we have the locked
// bit flag, and we deal with MAX_BYTE_VALUE for overflow.
inline musl_fetch_inc(location, result) {
  d_step{
    result = location;
    if
    :: unset_locked(location) == MAX_BYTE_VALUE -> location = reset_keep_lock_bit(location)
    :: else -> location = location + 1
    fi
  }
}

inline musl_fetch_dec_and_unlock(location, result) {
  d_step{
    result = location;
    location = unset_locked(location) - 1;
  }
}

Futex futex;

// Version of the research report.

inline lock() {
  byte prev;
  byte current = 0;
  atomic {
    cmpxchg(futex.word, current, set_locked(1), prev);
    if
    :: prev == current -> printf("T%d locks mutex on fast path\n", _pid);
       goto acquired_mutex
    :: else -> printf("T%d fails to lock mutex on fast path\n", _pid)
    fi
  }

  // Lock is already acquired. Add ourselves to the congestion counter.
  d_step {
    musl_fetch_inc(futex.word, current);
    current = current + 1;
    printf("T%d read f.word and inc, now current: %d\n", _pid, current);
  }

  retry:

  if
  :: !(is_locked(current)) ->
     // Try to lock
     cmpxchg(futex.word, current, set_locked(current), prev);
     if
     :: prev == current -> goto acquired_mutex
     :: else
     fi
     // Busy wait loop to check if we can quickly get a non-locked current
     // Here prev is the loop counter.
     byte count = MUSL_BUSYWAIT_COUNT;
     current = futex.word;
     do
     :: (count == 0) || !(is_locked(current)) -> goto retry
     :: else -> count = count - 1; current = futex.word
     od
     goto retry
  :: else ->
     // Current is locked, we might have tried the busy wait loop
     // but without success.
     futex_wait(futex, current);
     current = futex.word;
     goto retry
  fi

  acquired_mutex:
}

inline unlock() {
  byte prev;
  atomic {
    musl_fetch_dec_and_unlock(futex.word, prev);
    printf("T%d unlocks, prev=%d\n", _pid, prev);
  }
  if
    :: atomic{
      prev != set_locked(1) -> futex_wake(futex, 1);
      printf("T%d called futex_wake\n", _pid)}
    :: else
  fi
}

/*****************************************************************************/

#include "mutex_generic.pml"

/*****************************************************************************/
