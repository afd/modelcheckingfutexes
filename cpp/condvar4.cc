#include <atomic>
#include <mutex>
void futex_wait(std::atomic<uint32_t> *, int);
void futex_wake(std::atomic<uint32_t> *, int);

using std::atomic;
using std::mutex;

class CondVar {
public:
  CondVar() : futex_word(0) {}
  void cv_wait(mutex &m) {
    previous.store(futex_word);
    uint32_t val = previous.load();
    m.unlock();
    futex_wait(&futex_word, val);
    m.lock();
  }
  void cv_signal() {
    uint32_t val = 1 + previous.load();
    futex_word.store(val);
    futex_wake(&futex_word, 1);
  }

private:
  atomic<uint32_t> futex_word;
  atomic<uint32_t> previous; // Additional state
};
