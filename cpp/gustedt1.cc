#include <atomic>
void futex_wait(std::atomic<uint32_t> *, uint32_t);
void futex_wake(std::atomic<uint32_t> *, uint32_t);
uint32_t cmpxchg(std::atomic<uint32_t> &, uint32_t, uint32_t);
using std::atomic;

#define BUSYWAIT 10

#define set_lock(VAL)  (0x80000000u | (VAL))
#define is_locked(VAL) (0x80000000u & (VAL))
class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t cur = 0;
    if (cmpxchg(futex_word, cur, set_lock(1))) {
      cur = futex_word.fetch_add(1) + 1;
      for (;;) {
        while (!is_locked(cur)) {
          uint32_t prev = cmpxchg(futex_word, cur, set_lock(cur));
          if (prev == cur) return;
          for (uint32_t i = 0; i < BUSYWAIT && is_locked(cur); i++) {
            cur = futex_word.load();
          }
        }
        while (is_locked(cur)) {
          futex_wait(&futex_word, cur);
          cur = futex_word.load();
        }
      }
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
