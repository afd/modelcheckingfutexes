#include <atomic>
#include <iostream>
#include <thread>
#include <vector>

#include <linux/futex.h>
#include <sys/syscall.h>
#include <unistd.h>

using std::atomic;

void futex_wait(atomic<uint32_t> * futex_word, uint32_t val) {
  syscall(SYS_futex, reinterpret_cast<int*>(futex_word), FUTEX_WAIT,
                val, nullptr, nullptr, 0);
}

void futex_wake(atomic<uint32_t> * futex_word, uint32_t num_to_wake) {
  syscall(SYS_futex, reinterpret_cast<int*>(futex_word), FUTEX_WAKE,
                num_to_wake, nullptr, nullptr, 0);
}

uint32_t cmpxchg(atomic<uint32_t> & futex_word, uint32_t expected, uint32_t desired) {
  futex_word.compare_exchange_strong(expected, desired);
  return expected;
}

#if MUTEX==1
#include "drepper1.cc"
#elif MUTEX==2
#include "drepper2.cc"
#elif MUTEX==3
#include "drepper3.cc"
#elif MUTEX==4
#include "drepper3b.cc"
#elif MUTEX==5
#include "gustedt1.cc"
#elif MUTEX==6
#include "gustedt2.cc"
#else
#error MUTEX not defined to a recognised value
#endif

#if NTHREADS <= 0
#error Must define NTHREADS
#endif

#if ELEMS_PER_THREAD <= 0
#error Must define ELEMS_PER_THREAD
#endif

int main() {
  Mutex mutex;
  int counter = 0;
  std::vector<std::thread> threads;
  for (int i = 0; i < NTHREADS; i++) {
    threads.emplace_back([&mutex, &counter]() -> void {
      for (int j = 0; j < ELEMS_PER_THREAD; j++) {
	mutex.lock();
	counter++;
	mutex.unlock();
      }
    });
  }
  for (auto& thread : threads) {
    thread.join();
  }
  const int expected_counter = NTHREADS * ELEMS_PER_THREAD;
  if (counter != expected_counter) {
    std::cout << "Final counter value is " << counter << "; expected " << expected_counter << std::endl;
  } else {
    std::cout << "Counter finished with expected value " << expected_counter << std::endl;
  }
}
