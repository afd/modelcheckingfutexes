// The futex word is a byte, use most significant bit as lock flag
#define lock_bit_mask   (1 << 7)
#define is_locked(w)    (lock_bit_mask & (w))
#define set_locked(w)   (lock_bit_mask | (w))
#define unset_locked(w) ((lock_bit_mask - 1) & (w))

inline lockbit_fetch_inc(location, result) {
  d_step{
    result = location;
    if
    :: unset_locked(location) == MAX_BYTE_VALUE -> /*@\label{line:lockbitpml:overflow}@*/
       location =
         (is_locked(location) != 0 -> 0 : set_locked(0))
    :: else -> location = location + 1
    fi
  }
}

inline lockbit_fetch_unlock_and_dec(location, result) {
  d_step{
    result = location;
    location = unset_locked(location);
    location = dec(location)
  }
}
