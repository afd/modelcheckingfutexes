// Atomic compare-exchange.
inline cmpxchg(location, expected, desired, result) { d_step {
  result = location; location = (location == expected -> desired : location)
}}

// Atomic exchange.
inline xchg(location, new, result) {
  d_step {
    result = location;
    location = new
  }
}

// Max value for a byte. A byte value is in range [0, MAX_BYTE_VALUE].
#define MAX_BYTE_VALUE (NUM_THREADS + 1)
#define inc(a)  (a == MAX_BYTE_VALUE -> 0 : a + 1)
inline fetch_inc(location, result) {
  d_step { result = location; location = inc(location) }
}

#define dec(a)  (a == 0 -> MAX_BYTE_VALUE : a - 1)

// Atomic fetch-sub with wrapping behaviour constrained to small range.
inline fetch_dec(location, result) {
  d_step {
    result = location;
    location = dec(location);
  }
}

// Convenience macro for overflowing addition that does not
// return the previous value. Strictly this is not related to
// atomics, but it is convenient to include it here since it is
// used in conjunction with fetch_inc.
#define inc(a)  (a == MAX_BYTE_VALUE -> 0 : a + 1)
#define dec(a)  (a == 0 -> MAX_BYTE_VALUE : a - 1)
