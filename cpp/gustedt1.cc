#define BUSYWAIT 10

#define set_locked(VAL) (0x80000000u | (VAL))
#define is_locked(VAL)  (0x80000000u & (VAL))
class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t cur = cmpxchg(futex_word, 0, set_locked(1)); /*@\label{line:gustedt1:firstcmpxchg}@*/
    if (cur == 0) return; /*@\label{line:gustedt1:fastpathreturn}@*/
    cur = futex_word.fetch_add(1) + 1; /*@\label{line:gustedt1:increment}@*/
    for (;;) { /*@\label{line:gustedt1:lockloop}@*/
      while (!is_locked(cur)) { /*@\label{line:gustedt1:subloop1}@*/
        uint32_t prev =
          cmpxchg(futex_word, cur, set_locked(cur)); /*@\label{line:gustedt1:secondcmpxchg}@*/
        if (prev == cur) return; /*@\label{line:gustedt1:return}@*/
        for (uint32_t i = 0;
             i < BUSYWAIT && is_locked(cur);
             i++) { /*@\label{line:gustedt1:busywait}@*/
          cur = futex_word.load();
        }
      }
      while (is_locked(cur)) { /*@\label{line:gustedt1:subloop2}@*/
        futex_wait(&futex_word, cur); /*@\label{line:gustedt1:futexwait}@*/
        cur = futex_word.load();
      }
    }
  }
  void unlock() {
    uint32_t prev = futex_word.fetch_sub(set_locked(1)); /*@\label{line:gustedt1:decrement}@*/
    if (prev != set_locked(1)) {
      futex_wake(&futex_word, 1); /*@\label{line:gustedt1:futexwake}@*/
    }
  }

private:
  atomic<uint32_t> futex_word;
};
