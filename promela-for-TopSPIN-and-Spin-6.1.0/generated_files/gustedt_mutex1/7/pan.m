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
	case 10: /* STATE 8 - ../../../mutex_generic.pml:75 - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][8] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 10 - ../../../mutex_generic.pml:77 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][10] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Monitor */
	case 12: /* STATE 1 - ../../../mutex_generic.pml:39 - [((num_threads_in_cs>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.num_threads_in_cs)>1)))
			continue;
		/* merge: assert(0)(0, 2, 4) */
		reached[1][2] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 13: /* STATE 4 - ../../../mutex_generic.pml:41 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Thread */
	case 14: /* STATE 3 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][3] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_000_0: /* 2 */
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
S_001_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? (((1<<7)|1)) : (((int)now.futex.word)) );
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

	case 15: /* STATE 5 - ../../../gustedt_mutex1.pml:24 - [((cur==0))] (64:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->_2_cur)==0)))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.oval = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		/* merge: printf('T%d locks mutex on fast path\\n',_pid)(64, 6, 64) */
		reached[0][6] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(64, 7, 64) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 16: /* STATE 11 - ../../../gustedt_mutex1.pml:31 - [.(goto)] (0:21:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 9 - ../../../gustedt_mutex1.pml:28 - [printf('T%d fails to lock mutex on fast path\\n',_pid)] (0:21:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		Printf("T%d fails to lock mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: .(goto)(21, 11, 21) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 18: /* STATE 20 - ../../../lockbit.pml:8 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][20] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_012_0: /* 2 */
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
S_017_0: /* 2 */
S_013_0: /* 2 */
		if (!(((((1<<7)-1)&((int)now.futex.word))==(7+1))))
			goto S_017_1;
S_014_0: /* 2 */
		now.futex.word = ( ((((1<<7)&((int)now.futex.word))!=0)) ? (0) : (((1<<7)|0)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_018_0;
S_017_1: /* 3 */
S_015_0: /* 2 */
		/* else */;
S_016_0: /* 2 */
		now.futex.word = (((int)now.futex.word)+1);
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_018_0;
S_017_2: /* 3 */
		Uerror("blocking sel in d_step (nr.0, near line 10)");
S_018_0: /* 2 */
		goto S_021_0;
S_021_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 19: /* STATE 22 - ../../../gustedt_mutex1.pml:33 - [cur = (cur+1)] (0:62:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = (((int)((P0 *)this)->_2_cur)+1);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 20: /* STATE 23 - ../../../gustedt_mutex1.pml:37 - [((((1<<7)&cur)==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		if (!((((1<<7)&((int)((P0 *)this)->_2_cur))==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 21: /* STATE 26 - ../../../atomics.pml:3 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][26] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_023_0: /* 2 */
		((P0 *)this)->_2_tmp = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:tmp", ((int)((P0 *)this)->_2_tmp));
#endif
		;
S_024_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==((int)((P0 *)this)->_2_cur))) ? (((1<<7)|((int)((P0 *)this)->_2_cur))) : (((int)now.futex.word)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_031_0;
S_031_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 22: /* STATE 28 - ../../../gustedt_mutex1.pml:41 - [((cur==tmp))] (64:0:2 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((int)((P0 *)this)->_2_cur)==((int)((P0 *)this)->_2_tmp))))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		/* dead 1: _2_tmp */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->_2_tmp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_tmp = 0;
		/* merge: printf('T%d locks mutex\\n',_pid)(64, 29, 64) */
		reached[0][29] = 1;
		Printf("T%d locks mutex\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(64, 30, 64) */
		reached[0][30] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: /* STATE 35 - ../../../gustedt_mutex1.pml:47 - [cur = futex.word] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 36 - ../../../gustedt_mutex1.pml:49 - [(((1<<7)&cur))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!(((1<<7)&((int)((P0 *)this)->_2_cur))))
			continue;
		/* dead 1: _2_cur */  (trpt+1)->bup.oval = ((P0 *)this)->_2_cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_cur = 0;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 37 - ../../../gustedt_mutex1.pml:49 - [cur = futex.word] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][37] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 50 - ../../../futex.pml:17 - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==((int)((P0 *)this)->_2_cur))))
			continue;
		sv_save();
		reached[0][50] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_044_0: /* 2 */
		if (!((((int)now.futex.word)==((int)((P0 *)this)->_2_cur))))
			Uerror("block in d_step seq");
S_045_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_046_0: /* 2 */
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 9) ])), " !(futex.wait[_pid])", II, tt, t);
S_047_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 9) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 9) ]));
#endif
		;
S_048_0: /* 2 */
		now.futex.num_waiting = (((int)now.futex.num_waiting)+1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		goto S_052_0;
S_052_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 27: /* STATE 53 - ../../../futex.pml:27 - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 9) ]))))
			continue;
		sv_save();
		reached[0][53] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_050_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 9) ]))))
			Uerror("block in d_step seq");
S_051_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_057_0;
S_057_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 28: /* STATE 56 - ../../../futex.pml:31 - [D_STEP] */
		if (boq != -1 || (trpt->o_pm&1))
			continue;
		sv_save();
		reached[0][56] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_053_0: /* 2 */
		/* else */;
S_054_0: /* 2 */
		Printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word), ((int)((P0 *)this)->_2_cur));
		goto S_057_0; /* ';' */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 29: /* STATE 60 - ../../../gustedt_mutex1.pml:55 - [cur = futex.word] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][60] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: /* STATE 64 - ../../../gustedt_mutex1.pml:59 - [tmp = 0] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_tmp);
		((P0 *)this)->_2_tmp = 0;
#ifdef VAR_RANGES
		logval("Thread:tmp", ((int)((P0 *)this)->_2_tmp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: /* STATE 65 - ../../../gustedt_mutex1.pml:59 - [cur = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][65] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_cur);
		((P0 *)this)->_2_cur = 0;
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->_2_cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 32: /* STATE 67 - ../../../mutex_generic.pml:26 - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][67] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 33: /* STATE 68 - ../../../mutex_generic.pml:27 - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: /* STATE 75 - ../../../gustedt_mutex1.pml:63 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][75] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_072_0: /* 2 */
S_071_0: /* 2 */
S_068_0: /* 2 */
		((P0 *)this)->_2_prev = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
S_069_0: /* 2 */
		now.futex.word = (((1<<7)-1)&((int)now.futex.word));
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
S_070_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? ((7+1)) : ((((int)now.futex.word)-1)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_073_0;
S_073_0: /* 2 */
		Printf("T%d unlocks: set futex word from %d to %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_prev), ((int)now.futex.word));
		goto S_107_0;
S_107_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 35: /* STATE 76 - ../../../gustedt_mutex1.pml:70 - [((prev!=((1<<7)|1)))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][76] = 1;
		if (!((((int)((P0 *)this)->_2_prev)!=((1<<7)|1))))
			continue;
		/* dead 1: _2_prev */  (trpt+1)->bup.oval = ((P0 *)this)->_2_prev;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_prev = 0;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 77 - ../../../futex.pml:70 - [assert(!(futex.wait[_pid]))] (0:100:1 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 9) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(100, 78, 100) */
		reached[0][78] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 37: /* STATE 79 - ../../../futex.pml:74 - [(((num_woken==1)||(futex.num_waiting==0)))] (114:0:2 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!(((((int)((P0 *)this)->_2_num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b2(114, 80, 114) */
		reached[0][80] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(114, 103, 114) */
		reached[0][103] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(114, 104, 114) */
		reached[0][104] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(114, 109, 114) */
		reached[0][109] = 1;
		;
		/* merge: prev = 0(114, 110, 114) */
		reached[0][110] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 115, 114) */
		reached[0][115] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 38: /* STATE 82 - ../../../futex.pml:78 - [(futex.wait[1])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][82] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(100, 83, 100) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 39: /* STATE 84 - ../../../futex.pml:80 - [(futex.wait[2])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(100, 85, 100) */
		reached[0][85] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 40: /* STATE 86 - ../../../futex.pml:83 - [(futex.wait[3])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][86] = 1;
		if (!(((int)now.futex.wait[3])))
			continue;
		/* merge: futex.wait[3] = 0(100, 87, 100) */
		reached[0][87] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[3]);
		now.futex.wait[3] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[3]", ((int)now.futex.wait[3]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 41: /* STATE 88 - ../../../futex.pml:87 - [(futex.wait[4])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][88] = 1;
		if (!(((int)now.futex.wait[4])))
			continue;
		/* merge: futex.wait[4] = 0(100, 89, 100) */
		reached[0][89] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[4]);
		now.futex.wait[4] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[4]", ((int)now.futex.wait[4]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 42: /* STATE 90 - ../../../futex.pml:91 - [(futex.wait[5])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][90] = 1;
		if (!(((int)now.futex.wait[5])))
			continue;
		/* merge: futex.wait[5] = 0(100, 91, 100) */
		reached[0][91] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[5]);
		now.futex.wait[5] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[5]", ((int)now.futex.wait[5]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 43: /* STATE 92 - ../../../futex.pml:95 - [(futex.wait[6])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][92] = 1;
		if (!(((int)now.futex.wait[6])))
			continue;
		/* merge: futex.wait[6] = 0(100, 93, 100) */
		reached[0][93] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[6]);
		now.futex.wait[6] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[6]", ((int)now.futex.wait[6]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 44: /* STATE 94 - ../../../futex.pml:99 - [(futex.wait[7])] (100:0:3 - 1) */
		IfNotBlocked
		reached[0][94] = 1;
		if (!(((int)now.futex.wait[7])))
			continue;
		/* merge: futex.wait[7] = 0(100, 95, 100) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[7]);
		now.futex.wait[7] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[7]", ((int)now.futex.wait[7]));
#endif
		;
		/* merge: .(goto)(100, 97, 100) */
		reached[0][97] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(100, 98, 100) */
		reached[0][98] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 45: /* STATE 98 - ../../../futex.pml:101 - [futex.num_waiting = (futex.num_waiting-1)] (0:100:2 - 8) */
		IfNotBlocked
		reached[0][98] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(100, 99, 100) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 101, 100) */
		reached[0][101] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 46: /* STATE 103 - ../../../futex.pml:104 - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:114:2 - 3) */
		IfNotBlocked
		reached[0][103] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(114, 104, 114) */
		reached[0][104] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(114, 109, 114) */
		reached[0][109] = 1;
		;
		/* merge: prev = 0(114, 110, 114) */
		reached[0][110] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 115, 114) */
		reached[0][115] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 47: /* STATE 110 - ../../../gustedt_mutex1.pml:73 - [prev = 0] (0:114:1 - 3) */
		IfNotBlocked
		reached[0][110] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_prev);
		((P0 *)this)->_2_prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->_2_prev));
#endif
		;
		/* merge: .(goto)(0, 115, 114) */
		reached[0][115] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 48: /* STATE 112 - ../../../mutex_generic.pml:29 - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][112] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 49: /* STATE 117 - ../../../mutex_generic.pml:31 - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][117] = 1;
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

