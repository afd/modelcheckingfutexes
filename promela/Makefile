###############################################################################
# A few reminders for the Spin commands used here.
# See also 'spin --help' and './pan --help'.
#
# Compile myfile.pml to the 'pan' executable, and run pan to check for
# LTL formula 'foobar', if the formula is not verified then a
# myfile.pml.trail file is created, containing a counter-example:
#
#   spin -search -ltl foobar myfile.pml
#
# Similar but check for invalid end-state, e.g. when not all threads
# have terminated, but no more threads can make progress:
#
#   spin -search -noclaim myfile.pml
#
# Ask pan to find shortest path to the error hit in the trail file,
# which is overwritten by the new shorter counter-example:
#
#   ./pan -i myfile.pml.trail
#
# Use pan to replay the counter example in the trail file via a silent
# replay, where only used-defined printf's are printed:
#
#   ./pan -S myfile.pml.trail
#
###############################################################################

# Spin max depth when exploring the state space.
MAXDEPTH=100000

# Drepper mutex, version 1, 2 threads: no issue.
drepper_mutex1_safe_cs_2threads:
	spin -DNUM_THREADS=2 -search -ltl safe_cs -m$(MAXDEPTH) drepper_mutex1.pml
drepper_mutex1_endstates_2threads:
	spin -DNUM_THREADS=2 -search -noclaim -m$(MAXDEPTH) drepper_mutex1.pml

# Drepper mutex, version 1, 3 threads: overflowing issue shows up.
drepper_mutex1_safe_cs_3threads:
	spin -DNUM_THREADS=3 -search -ltl safe_cs -m$(MAXDEPTH) drepper_mutex1.pml
	./pan -i drepper_mutex1.pml.trail
	./pan -S drepper_mutex1.pml.trail
drepper_mutex1_endstates_3threads:
	spin -DNUM_THREADS=3 -search -noclaim -m$(MAXDEPTH) drepper_mutex1.pml
	./pan -i drepper_mutex1.pml.trail
	./pan -S drepper_mutex1.pml.trail

# Drepper mutex, version 2, 3 threads: no issue.
drepper_mutex2_safe_cs_3threads:
	spin -DNUM_THREADS=3 -search -ltl safe_cs -m$(MAXDEPTH) drepper_mutex2.pml
drepper_mutex2_endstates_3threads:
	spin -DNUM_THREADS=3 -search -noclaim -m$(MAXDEPTH) drepper_mutex2.pml

# Condition variable, version 1: a futex_wake() call can be "missed"
# by the thread which is about to futex_wait().
condvar1_2threads:
	spin -DNUM_THREADS=2 -search -noclaim -m$(MAXDEPTH) condvar1.pml
	./pan -i condvar1.pml.trail
	./pan -S condvar1.pml.trail

# Condition variable, version 1: bug due to overflow.
condvar2_2threads:
	spin -DNUM_THREADS=2 -search -noclaim -m$(MAXDEPTH) condvar2.pml
	./pan -i condvar2.pml.trail
	./pan -S condvar2.pml.trail
