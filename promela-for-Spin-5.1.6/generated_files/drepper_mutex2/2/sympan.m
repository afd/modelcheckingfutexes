#define rand	pan_rand
#if defined(HAS_CODE) && defined(VERBOSE)
	cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: /* STATE 1 - line 39 "../../../mutex_generic.pml" - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(0)))
			continue;
		_m = 3; goto P999; /* 0 */
/* STATE 2 - line 40 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
	case 4: /* STATE 3 - line 68 "../../../mutex_generic.pml" - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][3] = 1;
		if (!(addproc(1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 5 - line 70 "../../../mutex_generic.pml" - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][5] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Monitor */
	case 6: /* STATE 1 - line 32 "../../../mutex_generic.pml" - [((num_threads_in_cs>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.num_threads_in_cs)>1)))
			continue;
		/* merge: assert(0)(0, 2, 4) */
		reached[1][2] = 1;
		assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 7: /* STATE 4 - line 34 "../../../mutex_generic.pml" - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Thread */
	case 8: /* STATE 3 - line 3 "../../../atomics.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][3] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_000_0: /* 2 */
		((P0 *)this)->old_value_lock = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value_lock", ((int)((P0 *)this)->old_value_lock));
#endif
		;
S_001_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? (1) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_009_0;
S_009_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 9: /* STATE 5 - line 21 "../../../drepper_mutex2.pml" - [((old_value_lock==0))] (58:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->old_value_lock)==0)))
			continue;
		/* dead 1: old_value_lock */  (trpt+1)->bup.oval = ((P0 *)this)->old_value_lock;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->old_value_lock = 0;
		/* merge: printf('T%d locks mutex on fast path\\n',_pid)(58, 6, 58) */
		reached[0][6] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(58, 7, 58) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: /* STATE 11 - line 28 "../../../drepper_mutex2.pml" - [.(goto)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 11: /* STATE 9 - line 25 "../../../drepper_mutex2.pml" - [printf('T%d fails to lock mutex on fast path\\n',_pid)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		Printf("T%d fails to lock mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: .(goto)(55, 11, 55) */
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 12: /* STATE 13 - line 32 "../../../drepper_mutex2.pml" - [((old_value_lock==2))] (42:0:1 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)((P0 *)this)->old_value_lock)==2)))
			continue;
		/* dead 1: old_value_lock */  (trpt+1)->bup.oval = ((P0 *)this)->old_value_lock;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->old_value_lock = 0;
		/* merge: .(goto)(42, 26, 42) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 13: /* STATE 26 - line 41 "../../../drepper_mutex2.pml" - [.(goto)] (0:42:0 - 2) */
		IfNotBlocked
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 15 - line 34 "../../../drepper_mutex2.pml" - [assert((old_value_lock==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		assert((((int)((P0 *)this)->old_value_lock)==1), "(old_value_lock==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 18 - line 3 "../../../atomics.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][18] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_015_0: /* 2 */
		((P0 *)this)->old_value_lock = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value_lock", ((int)((P0 *)this)->old_value_lock));
#endif
		;
S_016_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==1)) ? (2) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_022_0;
S_022_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 16: /* STATE 20 - line 37 "../../../drepper_mutex2.pml" - [((old_value_lock==0))] (54:0:1 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		if (!((((int)((P0 *)this)->old_value_lock)==0)))
			continue;
		/* dead 1: old_value_lock */  (trpt+1)->bup.oval = ((P0 *)this)->old_value_lock;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->old_value_lock = 0;
		/* merge: goto retry(0, 21, 54) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 17: /* STATE 24 - line 40 "../../../drepper_mutex2.pml" - [.(goto)] (0:42:0 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		;
		/* merge: .(goto)(42, 26, 42) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: /* STATE 33 - line 17 "../../../futex.pml" - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==2)))
			continue;
		sv_save();
		reached[0][33] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_027_0: /* 2 */
		if (!((((int)now.futex.word)==2)))
			Uerror("block in step seq");
S_028_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_029_0: /* 2 */
		assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ])), " !(futex.wait[_pid])", II, tt, t);
S_030_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 4) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]));
#endif
		;
S_031_0: /* 2 */
		now.futex.num_waiting = (((int)now.futex.num_waiting)+1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		goto S_035_0;
S_035_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 19: /* STATE 36 - line 27 "../../../futex.pml" - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]))))
			continue;
		sv_save();
		reached[0][36] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_033_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ]))))
			Uerror("block in step seq");
S_034_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_040_0;
S_040_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 20: /* STATE 39 - line 31 "../../../futex.pml" - [D_STEP] */
		if (boq != -1 || (trpt->o_pm&1))
			continue;
		sv_save();
		reached[0][39] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_036_0: /* 2 */
		/* else */;
S_037_0: /* 2 */
		Printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word), 2);
		goto S_040_0; /* ';' */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 21: /* STATE 45 - line 3 "../../../atomics.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][45] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_042_0: /* 2 */
		((P0 *)this)->old_value_lock = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value_lock", ((int)((P0 *)this)->old_value_lock));
#endif
		;
S_043_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? (2) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_051_0;
S_051_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 22: /* STATE 47 - line 47 "../../../drepper_mutex2.pml" - [((old_value_lock==0))] (58:0:1 - 1) */
		IfNotBlocked
		reached[0][47] = 1;
		if (!((((int)((P0 *)this)->old_value_lock)==0)))
			continue;
		/* dead 1: old_value_lock */  (trpt+1)->bup.oval = ((P0 *)this)->old_value_lock;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->old_value_lock = 0;
		/* merge: printf('T%d locks mutex on slow path\\n',_pid)(58, 48, 58) */
		reached[0][48] = 1;
		Printf("T%d locks mutex on slow path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(58, 49, 58) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: /* STATE 53 - line 56 "../../../drepper_mutex2.pml" - [.(goto)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 24: /* STATE 51 - line 53 "../../../drepper_mutex2.pml" - [printf('T%d fails to lock mutex on slow path\\n',_pid)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][51] = 1;
		Printf("T%d fails to lock mutex on slow path\n", ((int)((P0 *)this)->_pid));
		/* merge: .(goto)(55, 53, 55) */
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: /* STATE 60 - line 19 "../../../mutex_generic.pml" - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 61 - line 20 "../../../mutex_generic.pml" - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 67 - line 64 "../../../drepper_mutex2.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][67] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_064_0: /* 2 */
S_063_0: /* 2 */
S_061_0: /* 2 */
		((P0 *)this)->old_value_unlock = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value_unlock", ((int)((P0 *)this)->old_value_unlock));
#endif
		;
S_062_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? ((2+1)) : ((((int)now.futex.word)-1)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_065_0;
S_065_0: /* 2 */
		Printf("T%d decrements futex word from %d to %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->old_value_unlock), ((int)now.futex.word));
		goto S_094_0;
S_094_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 28: /* STATE 71 - line 70 "../../../drepper_mutex2.pml" - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->old_value_unlock)==2)))
			continue;
		sv_save();
		reached[0][71] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_067_0: /* 2 */
		if (!((((int)((P0 *)this)->old_value_unlock)==2)))
			Uerror("block in step seq");
S_068_0: /* 2 */
		now.futex.word = 0;
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
S_069_0: /* 2 */
		((P0 *)this)->old_value_unlock = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value_unlock", ((int)((P0 *)this)->old_value_unlock));
#endif
		;
		goto S_090_0;
S_090_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 29: /* STATE 72 - line 70 "../../../futex.pml" - [assert(!(futex.wait[_pid]))] (0:85:1 - 1) */
		IfNotBlocked
		reached[0][72] = 1;
		assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 4) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(85, 73, 85) */
		reached[0][73] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 86, 85) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 30: /* STATE 74 - line 74 "../../../futex.pml" - [(((num_woken==1)||(futex.num_waiting==0)))] (100:0:1 - 1) */
		IfNotBlocked
		reached[0][74] = 1;
		if (!(((((int)((P0 *)this)->num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b2(100, 75, 100) */
		reached[0][75] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(100, 88, 100) */
		reached[0][88] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->num_woken));
		/* merge: num_woken = 0(100, 89, 100) */
		reached[0][89] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 96, 100) */
		reached[0][96] = 1;
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 31: /* STATE 77 - line 78 "../../../futex.pml" - [(futex.wait[1])] (85:0:3 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(85, 78, 85) */
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(85, 82, 85) */
		reached[0][82] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(85, 83, 85) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(85, 84, 85) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 86, 85) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 32: /* STATE 79 - line 80 "../../../futex.pml" - [(futex.wait[2])] (85:0:3 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(85, 80, 85) */
		reached[0][80] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(85, 82, 85) */
		reached[0][82] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(85, 83, 85) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(85, 84, 85) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 86, 85) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 33: /* STATE 83 - line 82 "../../../futex.pml" - [futex.num_waiting = (futex.num_waiting-1)] (0:85:2 - 3) */
		IfNotBlocked
		reached[0][83] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(85, 84, 85) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 86, 85) */
		reached[0][86] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: /* STATE 88 - line 85 "../../../futex.pml" - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:100:1 - 3) */
		IfNotBlocked
		reached[0][88] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->num_woken));
		/* merge: num_woken = 0(100, 89, 100) */
		reached[0][89] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 96, 100) */
		reached[0][96] = 1;
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 35: /* STATE 94 - line 76 "../../../drepper_mutex2.pml" - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->old_value_unlock)==1)))
			continue;
		sv_save();
		reached[0][94] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_091_0: /* 2 */
		if (!((((int)((P0 *)this)->old_value_unlock)==1)))
			Uerror("block in step seq");
S_092_0: /* 2 */
		((P0 *)this)->old_value_unlock = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value_unlock", ((int)((P0 *)this)->old_value_unlock));
#endif
		;
		goto S_095_0;
S_095_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 36: /* STATE 98 - line 22 "../../../mutex_generic.pml" - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][98] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 37: /* STATE 103 - line 24 "../../../mutex_generic.pml" - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][103] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

