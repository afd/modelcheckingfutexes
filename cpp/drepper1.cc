class Mutex {
public:
  Mutex() : futex_word(0) {}
  void lock() {
    uint32_t old_value;
    while ((old_value = futex_word.fetch_add(1)) != 0)
      futex_wait(&futex_word, old_value + 1);
  }
  void unlock() {
    futex_word.store(0);
    futex_wake(&futex_word, 1);
  }

private:
  atomic<uint32_t> futex_word;
};
