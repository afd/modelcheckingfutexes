// The futex word is a byte, use most significant bit as lock flag
#define lock_bit_mask   (1 << 7)
#define is_locked(w)    (lock_bit_mask & (w))
#define set_locked(w)   (lock_bit_mask | (w))
#define unlock_bit_mask (lock_bit_mask - 1)
#define unset_locked(w) (unlock_bit_mask & (w))

inline lockbit_fetch_inc(location, result) {
  d_step{
    result = location;
    location = (unset_locked(location) == MAX_BYTE_VALUE -> 0 : location + 1)
  }
}

inline lockbit_fetch_unlock_and_dec(location, result) {
  d_step{
    result = location;
    location = unset_locked(location);
    location = dec(location);
  }
}
