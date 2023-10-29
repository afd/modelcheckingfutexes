# modelcheckingfutexes

Promela models of futex-based synchronisation primitives.

The `promela` subdirectory contains the relevant Promela models. For
examples on how to use [Spin](https://spinroot.com/) to verify these
models, see `promela/Makefile`.

The `cpp` subdirectory contains C++ samples based on code from
Drepper's "Futexes Are Tricky" paper and Denis-Courmont's ["Condition
variable with futex"](https://www.remlab.net/op/futex-condvar.shtml)
article.
