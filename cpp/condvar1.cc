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
    m.unlock();
    futex_wait(&futex_word, 0);
    m.lock();
  }
  void cv_signal() { futex_wake(&futex_word, 1); }

private:
  atomic<uint32_t> futex_word;
};
