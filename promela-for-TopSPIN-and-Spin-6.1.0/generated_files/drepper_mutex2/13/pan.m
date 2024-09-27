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
	case 3: /* STATE 1 - ../../../mutex_generic.pml:46 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: /* STATE 2 - ../../../mutex_generic.pml:47 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 3 - ../../../mutex_generic.pml:49 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][3] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: /* STATE 4 - ../../../mutex_generic.pml:52 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][4] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: /* STATE 5 - ../../../mutex_generic.pml:55 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][5] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: /* STATE 6 - ../../../mutex_generic.pml:58 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][6] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: /* STATE 7 - ../../../mutex_generic.pml:61 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][7] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: /* STATE 8 - ../../../mutex_generic.pml:64 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][8] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 9 - ../../../mutex_generic.pml:67 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][9] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: /* STATE 10 - ../../../mutex_generic.pml:70 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][10] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: /* STATE 11 - ../../../mutex_generic.pml:73 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][11] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 12 - ../../../mutex_generic.pml:76 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][12] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 13 - ../../../mutex_generic.pml:79 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][13] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: /* STATE 14 - ../../../mutex_generic.pml:90 - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][14] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 16 - ../../../mutex_generic.pml:92 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][16] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Monitor */
	case 18: /* STATE 1 - ../../../mutex_generic.pml:39 - [((num_threads_in_cs>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.num_threads_in_cs)>1)))
			continue;
		/* merge: assert(0)(0, 2, 4) */
		reached[1][2] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 19: /* STATE 4 - ../../../mutex_generic.pml:41 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Thread */
	case 20: /* STATE 3 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][3] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_000_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
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

	case 21: /* STATE 5 - ../../../drepper_mutex2.pml:20 - [((old_value==0))] (58:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==0)))
			continue;
		/* dead 1: _2_old_value */  (trpt+1)->bup.oval = ((P0 *)this)->_2_old_value;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_old_value = 0;
		/* merge: printf('T%d locks mutex on fast path\\n',_pid)(58, 6, 58) */
		reached[0][6] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(58, 7, 58) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 22: /* STATE 11 - ../../../drepper_mutex2.pml:27 - [.(goto)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 23: /* STATE 9 - ../../../drepper_mutex2.pml:24 - [printf('T%d fails to lock mutex on fast path\\n',_pid)] (0:55:0 - 1) */
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
	case 24: /* STATE 13 - ../../../drepper_mutex2.pml:31 - [((old_value==2))] (42:0:1 - 1) */
		IfNotBlocked
		reached[0][13] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==2)))
			continue;
		/* dead 1: _2_old_value */  (trpt+1)->bup.oval = ((P0 *)this)->_2_old_value;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_old_value = 0;
		/* merge: .(goto)(42, 26, 42) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 25: /* STATE 26 - ../../../drepper_mutex2.pml:40 - [.(goto)] (0:42:0 - 2) */
		IfNotBlocked
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 15 - ../../../drepper_mutex2.pml:33 - [assert((old_value==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][15] = 1;
		spin_assert((((int)((P0 *)this)->_2_old_value)==1), "(old_value==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 27: /* STATE 18 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][18] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_015_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
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

	case 28: /* STATE 20 - ../../../drepper_mutex2.pml:36 - [((old_value==0))] (54:0:1 - 1) */
		IfNotBlocked
		reached[0][20] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==0)))
			continue;
		/* dead 1: _2_old_value */  (trpt+1)->bup.oval = ((P0 *)this)->_2_old_value;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_old_value = 0;
		/* merge: goto retry(0, 21, 54) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 29: /* STATE 24 - ../../../drepper_mutex2.pml:39 - [.(goto)] (0:42:0 - 1) */
		IfNotBlocked
		reached[0][24] = 1;
		;
		/* merge: .(goto)(42, 26, 42) */
		reached[0][26] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 30: /* STATE 33 - ../../../futex.pml:17 - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==2)))
			continue;
		sv_save();
		reached[0][33] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_027_0: /* 2 */
		if (!((((int)now.futex.word)==2)))
			Uerror("block in d_step seq");
S_028_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_029_0: /* 2 */
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 15) ])), " !(futex.wait[_pid])", II, tt, t);
S_030_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 15) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 15) ]));
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

	case 31: /* STATE 36 - ../../../futex.pml:27 - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 15) ]))))
			continue;
		sv_save();
		reached[0][36] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_033_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 15) ]))))
			Uerror("block in d_step seq");
S_034_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_040_0;
S_040_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 32: /* STATE 39 - ../../../futex.pml:31 - [D_STEP] */
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

	case 33: /* STATE 45 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][45] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_042_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
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

	case 34: /* STATE 47 - ../../../drepper_mutex2.pml:46 - [((old_value==0))] (58:0:1 - 1) */
		IfNotBlocked
		reached[0][47] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==0)))
			continue;
		/* dead 1: _2_old_value */  (trpt+1)->bup.oval = ((P0 *)this)->_2_old_value;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_old_value = 0;
		/* merge: printf('T%d locks mutex on slow path\\n',_pid)(58, 48, 58) */
		reached[0][48] = 1;
		Printf("T%d locks mutex on slow path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(58, 49, 58) */
		reached[0][49] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 35: /* STATE 53 - ../../../drepper_mutex2.pml:55 - [.(goto)] (0:55:0 - 1) */
		IfNotBlocked
		reached[0][53] = 1;
		;
		/* merge: .(goto)(0, 56, 55) */
		reached[0][56] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 36: /* STATE 51 - ../../../drepper_mutex2.pml:52 - [printf('T%d fails to lock mutex on slow path\\n',_pid)] (0:55:0 - 1) */
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
	case 37: /* STATE 60 - ../../../mutex_generic.pml:26 - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: /* STATE 61 - ../../../mutex_generic.pml:27 - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][61] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: /* STATE 67 - ../../../drepper_mutex2.pml:61 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][67] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_064_0: /* 2 */
S_063_0: /* 2 */
S_061_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
S_062_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? ((13+1)) : ((((int)now.futex.word)-1)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_065_0;
S_065_0: /* 2 */
		Printf("T%d decrements futex word from %d to %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_old_value), ((int)now.futex.word));
		goto S_116_0;
S_116_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 40: /* STATE 71 - ../../../drepper_mutex2.pml:67 - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->_2_old_value)==2)))
			continue;
		sv_save();
		reached[0][71] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_067_0: /* 2 */
		if (!((((int)((P0 *)this)->_2_old_value)==2)))
			Uerror("block in d_step seq");
S_068_0: /* 2 */
		now.futex.word = 0;
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
S_069_0: /* 2 */
		((P0 *)this)->_2_old_value = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
		goto S_112_0;
S_112_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 41: /* STATE 72 - ../../../futex.pml:80 - [assert(!(futex.wait[_pid]))] (0:107:1 - 1) */
		IfNotBlocked
		reached[0][72] = 1;
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 15) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(107, 73, 107) */
		reached[0][73] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: /* STATE 74 - ../../../futex.pml:84 - [(((num_woken==1)||(futex.num_waiting==0)))] (122:0:1 - 1) */
		IfNotBlocked
		reached[0][74] = 1;
		if (!(((((int)((P0 *)this)->_2_num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b2(122, 75, 122) */
		reached[0][75] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(122, 110, 122) */
		reached[0][110] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(122, 111, 122) */
		reached[0][111] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 118, 122) */
		reached[0][118] = 1;
		;
		/* merge: .(goto)(0, 123, 122) */
		reached[0][123] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 43: /* STATE 77 - ../../../futex.pml:88 - [(futex.wait[1])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(107, 78, 107) */
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 44: /* STATE 79 - ../../../futex.pml:90 - [(futex.wait[2])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(107, 80, 107) */
		reached[0][80] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 45: /* STATE 81 - ../../../futex.pml:93 - [(futex.wait[3])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][81] = 1;
		if (!(((int)now.futex.wait[3])))
			continue;
		/* merge: futex.wait[3] = 0(107, 82, 107) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[3]);
		now.futex.wait[3] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[3]", ((int)now.futex.wait[3]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 46: /* STATE 83 - ../../../futex.pml:97 - [(futex.wait[4])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][83] = 1;
		if (!(((int)now.futex.wait[4])))
			continue;
		/* merge: futex.wait[4] = 0(107, 84, 107) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[4]);
		now.futex.wait[4] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[4]", ((int)now.futex.wait[4]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 47: /* STATE 85 - ../../../futex.pml:101 - [(futex.wait[5])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][85] = 1;
		if (!(((int)now.futex.wait[5])))
			continue;
		/* merge: futex.wait[5] = 0(107, 86, 107) */
		reached[0][86] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[5]);
		now.futex.wait[5] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[5]", ((int)now.futex.wait[5]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 48: /* STATE 87 - ../../../futex.pml:105 - [(futex.wait[6])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][87] = 1;
		if (!(((int)now.futex.wait[6])))
			continue;
		/* merge: futex.wait[6] = 0(107, 88, 107) */
		reached[0][88] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[6]);
		now.futex.wait[6] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[6]", ((int)now.futex.wait[6]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 49: /* STATE 89 - ../../../futex.pml:109 - [(futex.wait[7])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][89] = 1;
		if (!(((int)now.futex.wait[7])))
			continue;
		/* merge: futex.wait[7] = 0(107, 90, 107) */
		reached[0][90] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[7]);
		now.futex.wait[7] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[7]", ((int)now.futex.wait[7]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 50: /* STATE 91 - ../../../futex.pml:113 - [(futex.wait[8])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][91] = 1;
		if (!(((int)now.futex.wait[8])))
			continue;
		/* merge: futex.wait[8] = 0(107, 92, 107) */
		reached[0][92] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[8]);
		now.futex.wait[8] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[8]", ((int)now.futex.wait[8]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 51: /* STATE 93 - ../../../futex.pml:117 - [(futex.wait[9])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][93] = 1;
		if (!(((int)now.futex.wait[9])))
			continue;
		/* merge: futex.wait[9] = 0(107, 94, 107) */
		reached[0][94] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[9]);
		now.futex.wait[9] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[9]", ((int)now.futex.wait[9]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 52: /* STATE 95 - ../../../futex.pml:121 - [(futex.wait[10])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][95] = 1;
		if (!(((int)now.futex.wait[10])))
			continue;
		/* merge: futex.wait[10] = 0(107, 96, 107) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[10]);
		now.futex.wait[10] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[10]", ((int)now.futex.wait[10]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 53: /* STATE 97 - ../../../futex.pml:125 - [(futex.wait[11])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][97] = 1;
		if (!(((int)now.futex.wait[11])))
			continue;
		/* merge: futex.wait[11] = 0(107, 98, 107) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[11]);
		now.futex.wait[11] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[11]", ((int)now.futex.wait[11]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 54: /* STATE 99 - ../../../futex.pml:129 - [(futex.wait[12])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][99] = 1;
		if (!(((int)now.futex.wait[12])))
			continue;
		/* merge: futex.wait[12] = 0(107, 100, 107) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[12]);
		now.futex.wait[12] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[12]", ((int)now.futex.wait[12]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 55: /* STATE 101 - ../../../futex.pml:133 - [(futex.wait[13])] (107:0:3 - 1) */
		IfNotBlocked
		reached[0][101] = 1;
		if (!(((int)now.futex.wait[13])))
			continue;
		/* merge: futex.wait[13] = 0(107, 102, 107) */
		reached[0][102] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[13]);
		now.futex.wait[13] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[13]", ((int)now.futex.wait[13]));
#endif
		;
		/* merge: .(goto)(107, 104, 107) */
		reached[0][104] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(107, 105, 107) */
		reached[0][105] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 56: /* STATE 105 - ../../../futex.pml:135 - [futex.num_waiting = (futex.num_waiting-1)] (0:107:2 - 14) */
		IfNotBlocked
		reached[0][105] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(107, 106, 107) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 108, 107) */
		reached[0][108] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 57: /* STATE 110 - ../../../futex.pml:138 - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:122:1 - 3) */
		IfNotBlocked
		reached[0][110] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(122, 111, 122) */
		reached[0][111] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 118, 122) */
		reached[0][118] = 1;
		;
		/* merge: .(goto)(0, 123, 122) */
		reached[0][123] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 58: /* STATE 116 - ../../../drepper_mutex2.pml:73 - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->_2_old_value)==1)))
			continue;
		sv_save();
		reached[0][116] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_113_0: /* 2 */
		if (!((((int)((P0 *)this)->_2_old_value)==1)))
			Uerror("block in d_step seq");
S_114_0: /* 2 */
		((P0 *)this)->_2_old_value = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
		goto S_117_0;
S_117_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 59: /* STATE 120 - ../../../mutex_generic.pml:29 - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][120] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 60: /* STATE 125 - ../../../mutex_generic.pml:31 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][125] = 1;
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

