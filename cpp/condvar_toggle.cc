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
    futex_word.store(1);
    m.unlock(); /*@\label{line:condvar_toggle:mutexunlock}@*/
    futex_wait(&futex_word, 1); /*@\label{line:condvar_toggle:futexwait}@*/
    m.lock();
  }
  void cv_signal() {
    futex_word.store(0);
    futex_wake(&futex_word, 1);
  }

private:
  atomic<uint32_t> futex_word;
};
