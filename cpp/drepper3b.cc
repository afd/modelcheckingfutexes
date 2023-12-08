class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t old_value;
    if ((old_value = cmpxchg(futex_word, 0, 1)) != 0) {
      if (old_value != 2)
	old_value = xchg(futex_word, 2);
      while (old_value != 0) {
          futex_wait(&futex_word, 2);
	  old_value = xchg(futex_word, 2);
      }
    }
  }

  void unlock() {
    if (xchg(futex_word, 0) == 2) {
      futex_wake(&futex_word, 1);
    }
  }
  
private:
  atomic<uint32_t> futex_word;
};
