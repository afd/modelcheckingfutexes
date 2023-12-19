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
    uint32_t old_value = futex_word; /*@\label{line:condvar2cpp:savefutexword}@*/
    m.unlock(); /*@\label{line:condvar2cpp:mutexunlock}@*/
    futex_wait(&futex_word, old_value); /*@\label{line:condvar2cpp:futexwait}@*/
    m.lock();
  }
  void cv_signal() {
    futex_word.fetch_add(1);
    futex_wake(&futex_word, 1);
  }

private:
  atomic<uint32_t> futex_word;
};
