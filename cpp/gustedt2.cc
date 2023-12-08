#define BUSYWAIT 10

#define set_lock(VAL)   (0x80000000u | (VAL))
#define unset_lock(VAL) (0x7FFFFFFFu & (VAL))
#define is_locked(VAL)  (0x80000000u & (VAL))
class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t cur = cmpxchg(futex_word, 0, set_lock(1)); /*@\label{line:gustedt2:firstcmpxchg}@*/
    if (cur == 0) return; /*@\label{line:gustedt2:fastpathreturn}@*/
    for (uint32_t i = 0; i < BUSYWAIT; i++) { /*@\label{line:gustedt2:busywait}@*/
      if (is_locked(cur)) cur = unset_lock(cur) - 1; /*@\label{line:gustedt2:busywaitdec}@*/
      uint32_t prev = cmpxchg(futex_word, cur, set_lock(cur+1)); /*@\label{line:gustedt2:busywaitcmpxchg}@*/
      if (prev == cur) return;
      cur = prev;
    }
    cur = futex_word.fetch_add(1) + 1; /*@\label{line:gustedt2:counterinc}@*/
    for (;;) { /*@\label{line:gustedt2:unboundedloop}@*/
      if (is_locked(cur)) {
        futex_wait(&futex_word, cur);
        cur = unset_lock(cur) - 1;
      }
      uint32_t prev = cmpxchg(futex_word, cur, set_lock(cur)); /*@\label{line:gustedt2:slowpathcmpxchg}@*/
      if (prev == cur) return; /*@\label{line:gustedt2:slowpathreturn}@*/
      cur = prev;
    }
  }
  void unlock() {
    uint32_t prev = futex_word.fetch_sub(set_lock(1));
    if (prev != set_lock(1)) {
      futex_wake(&futex_word, 1);
    }
  }

private:
  atomic<uint32_t> futex_word;
};
