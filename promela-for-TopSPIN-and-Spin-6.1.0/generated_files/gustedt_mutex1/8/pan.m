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
/* STATE 3 - line 42 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
/* STATE 4 - line 45 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
/* STATE 5 - line 48 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
/* STATE 6 - line 51 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
/* STATE 7 - line 54 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
/* STATE 8 - line 57 "../../../mutex_generic.pml" - [(run Thread())] (0:0 - 1) same as 3 (0:0 - 1) */
	case 4: /* STATE 9 - line 68 "../../../mutex_generic.pml" - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][9] = 1;
		if (!(addproc(1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: /* STATE 11 - line 70 "../../../mutex_generic.pml" - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][11] = 1;
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
		((P0 *)this)->cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->cur));
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

	case 9: /* STATE 5 - line 26 "../../../gustedt_mutex1.pml" - [((cur==0))] (64:0:1 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->cur)==0)))
			continue;
		/* dead 1: cur */  (trpt+1)->bup.oval = ((P0 *)this)->cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->cur = 0;
		/* merge: printf('T%d locks mutex on fast path\\n',_pid)(64, 6, 64) */
		reached[0][6] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(64, 7, 64) */
		reached[0][7] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 10: /* STATE 11 - line 33 "../../../gustedt_mutex1.pml" - [.(goto)] (0:21:0 - 1) */
		IfNotBlocked
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 0 */
	case 11: /* STATE 9 - line 30 "../../../gustedt_mutex1.pml" - [printf('T%d fails to lock mutex on fast path\\n',_pid)] (0:21:0 - 1) */
		IfNotBlocked
		reached[0][9] = 1;
		Printf("T%d fails to lock mutex on fast path\n", ((int)((P0 *)this)->_pid));
		/* merge: .(goto)(21, 11, 21) */
		reached[0][11] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 12: /* STATE 20 - line 8 "../../../lockbit.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][20] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_012_0: /* 2 */
		((P0 *)this)->cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->cur));
#endif
		;
S_017_0: /* 2 */
S_013_0: /* 2 */
		if (!(((((1<<7)-1)&((int)now.futex.word))==(8+1))))
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

	case 13: /* STATE 22 - line 35 "../../../gustedt_mutex1.pml" - [cur = (cur+1)] (0:62:1 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->cur);
		((P0 *)this)->cur = (((int)((P0 *)this)->cur)+1);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 14: /* STATE 23 - line 39 "../../../gustedt_mutex1.pml" - [((((1<<7)&cur)==0))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][23] = 1;
		if (!((((1<<7)&((int)((P0 *)this)->cur))==0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: /* STATE 26 - line 3 "../../../atomics.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][26] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_023_0: /* 2 */
		((P0 *)this)->tmp = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
S_024_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==((int)((P0 *)this)->cur))) ? (((1<<7)|((int)((P0 *)this)->cur))) : (((int)now.futex.word)) );
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

	case 16: /* STATE 28 - line 43 "../../../gustedt_mutex1.pml" - [((cur==tmp))] (64:0:2 - 1) */
		IfNotBlocked
		reached[0][28] = 1;
		if (!((((int)((P0 *)this)->cur)==((int)((P0 *)this)->tmp))))
			continue;
		/* dead 1: cur */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)this)->cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->cur = 0;
		/* dead 1: tmp */  (trpt+1)->bup.ovals[1] = ((P0 *)this)->tmp;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->tmp = 0;
		/* merge: printf('T%d locks mutex\\n',_pid)(64, 29, 64) */
		reached[0][29] = 1;
		Printf("T%d locks mutex\n", ((int)((P0 *)this)->_pid));
		/* merge: goto acquired_mutex(64, 30, 64) */
		reached[0][30] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 17: /* STATE 35 - line 49 "../../../gustedt_mutex1.pml" - [cur = futex.word] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][35] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->cur);
		((P0 *)this)->cur = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 36 - line 51 "../../../gustedt_mutex1.pml" - [(((1<<7)&cur))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][36] = 1;
		if (!(((1<<7)&((int)((P0 *)this)->cur))))
			continue;
		/* dead 1: cur */  (trpt+1)->bup.oval = ((P0 *)this)->cur;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->cur = 0;
		_m = 3; goto P999; /* 0 */
/* STATE 37 - line 51 "../../../gustedt_mutex1.pml" - [cur = futex.word] (0:0 - 1) same as 17 (0:0 - 1) */
	case 19: /* STATE 50 - line 17 "../../../futex.pml" - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==((int)((P0 *)this)->cur))))
			continue;
		sv_save();
		reached[0][50] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_044_0: /* 2 */
		if (!((((int)now.futex.word)==((int)((P0 *)this)->cur))))
			Uerror("block in step seq");
S_045_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_046_0: /* 2 */
		assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 10) ])), " !(futex.wait[_pid])", II, tt, t);
S_047_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 10) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 10) ]));
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

	case 20: /* STATE 53 - line 27 "../../../futex.pml" - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 10) ]))))
			continue;
		sv_save();
		reached[0][53] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_050_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 10) ]))))
			Uerror("block in step seq");
S_051_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_057_0;
S_057_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 21: /* STATE 56 - line 31 "../../../futex.pml" - [D_STEP] */
		if (boq != -1 || (trpt->o_pm&1))
			continue;
		sv_save();
		reached[0][56] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_053_0: /* 2 */
		/* else */;
S_054_0: /* 2 */
		Printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word), ((int)((P0 *)this)->cur));
		goto S_057_0; /* ';' */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

/* STATE 60 - line 57 "../../../gustedt_mutex1.pml" - [cur = futex.word] (0:0 - 3) same as 17 (0:0 - 1) */
	case 22: /* STATE 64 - line 61 "../../../gustedt_mutex1.pml" - [tmp = 0] (0:0:1 - 3) */
		IfNotBlocked
		reached[0][64] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->tmp);
		((P0 *)this)->tmp = 0;
#ifdef VAR_RANGES
		logval("Thread:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 23: /* STATE 65 - line 61 "../../../gustedt_mutex1.pml" - [cur = 0] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][65] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->cur);
		((P0 *)this)->cur = 0;
#ifdef VAR_RANGES
		logval("Thread:cur", ((int)((P0 *)this)->cur));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 24: /* STATE 67 - line 19 "../../../mutex_generic.pml" - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][67] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 25: /* STATE 68 - line 20 "../../../mutex_generic.pml" - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][68] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 75 - line 66 "../../../gustedt_mutex1.pml" - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][75] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_072_0: /* 2 */
S_071_0: /* 2 */
S_068_0: /* 2 */
		((P0 *)this)->prev = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->prev));
#endif
		;
S_069_0: /* 2 */
		now.futex.word = (((1<<7)-1)&((int)now.futex.word));
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
S_070_0: /* 2 */
		now.futex.word = ( ((((int)now.futex.word)==0)) ? ((8+1)) : ((((int)now.futex.word)-1)) );
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_073_0;
S_073_0: /* 2 */
		Printf("T%d unlocks: set futex word from %d to %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->prev), ((int)now.futex.word));
		goto S_109_0;
S_109_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 27: /* STATE 76 - line 73 "../../../gustedt_mutex1.pml" - [((prev!=((1<<7)|1)))] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][76] = 1;
		if (!((((int)((P0 *)this)->prev)!=((1<<7)|1))))
			continue;
		/* dead 1: prev */  (trpt+1)->bup.oval = ((P0 *)this)->prev;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->prev = 0;
		_m = 3; goto P999; /* 0 */
	case 28: /* STATE 77 - line 70 "../../../futex.pml" - [assert(!(futex.wait[_pid]))] (0:102:1 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 10) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(102, 78, 102) */
		reached[0][78] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 29: /* STATE 79 - line 74 "../../../futex.pml" - [(((num_woken==1)||(futex.num_waiting==0)))] (116:0:2 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!(((((int)((P0 *)this)->num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b2(116, 80, 116) */
		reached[0][80] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(116, 105, 116) */
		reached[0][105] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->num_woken));
		/* merge: num_woken = 0(116, 106, 116) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(116, 111, 116) */
		reached[0][111] = 1;
		;
		/* merge: prev = 0(116, 112, 116) */
		reached[0][112] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->prev);
		((P0 *)this)->prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->prev));
#endif
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[0][117] = 1;
		;
		_m = 3; goto P999; /* 6 */
	case 30: /* STATE 82 - line 78 "../../../futex.pml" - [(futex.wait[1])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][82] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(102, 83, 102) */
		reached[0][83] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 31: /* STATE 84 - line 80 "../../../futex.pml" - [(futex.wait[2])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][84] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(102, 85, 102) */
		reached[0][85] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 32: /* STATE 86 - line 83 "../../../futex.pml" - [(futex.wait[3])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][86] = 1;
		if (!(((int)now.futex.wait[3])))
			continue;
		/* merge: futex.wait[3] = 0(102, 87, 102) */
		reached[0][87] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[3]);
		now.futex.wait[3] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[3]", ((int)now.futex.wait[3]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 33: /* STATE 88 - line 87 "../../../futex.pml" - [(futex.wait[4])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][88] = 1;
		if (!(((int)now.futex.wait[4])))
			continue;
		/* merge: futex.wait[4] = 0(102, 89, 102) */
		reached[0][89] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[4]);
		now.futex.wait[4] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[4]", ((int)now.futex.wait[4]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 34: /* STATE 90 - line 91 "../../../futex.pml" - [(futex.wait[5])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][90] = 1;
		if (!(((int)now.futex.wait[5])))
			continue;
		/* merge: futex.wait[5] = 0(102, 91, 102) */
		reached[0][91] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[5]);
		now.futex.wait[5] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[5]", ((int)now.futex.wait[5]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 35: /* STATE 92 - line 95 "../../../futex.pml" - [(futex.wait[6])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][92] = 1;
		if (!(((int)now.futex.wait[6])))
			continue;
		/* merge: futex.wait[6] = 0(102, 93, 102) */
		reached[0][93] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[6]);
		now.futex.wait[6] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[6]", ((int)now.futex.wait[6]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 36: /* STATE 94 - line 99 "../../../futex.pml" - [(futex.wait[7])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][94] = 1;
		if (!(((int)now.futex.wait[7])))
			continue;
		/* merge: futex.wait[7] = 0(102, 95, 102) */
		reached[0][95] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[7]);
		now.futex.wait[7] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[7]", ((int)now.futex.wait[7]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 37: /* STATE 96 - line 103 "../../../futex.pml" - [(futex.wait[8])] (102:0:3 - 1) */
		IfNotBlocked
		reached[0][96] = 1;
		if (!(((int)now.futex.wait[8])))
			continue;
		/* merge: futex.wait[8] = 0(102, 97, 102) */
		reached[0][97] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[8]);
		now.futex.wait[8] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[8]", ((int)now.futex.wait[8]));
#endif
		;
		/* merge: .(goto)(102, 99, 102) */
		reached[0][99] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(102, 100, 102) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 38: /* STATE 100 - line 105 "../../../futex.pml" - [futex.num_waiting = (futex.num_waiting-1)] (0:102:2 - 9) */
		IfNotBlocked
		reached[0][100] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(102, 101, 102) */
		reached[0][101] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = (((int)((P0 *)this)->num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(0, 103, 102) */
		reached[0][103] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: /* STATE 105 - line 108 "../../../futex.pml" - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:116:2 - 3) */
		IfNotBlocked
		reached[0][105] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->num_woken));
		/* merge: num_woken = 0(116, 106, 116) */
		reached[0][106] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)this)->num_woken);
		((P0 *)this)->num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->num_woken));
#endif
		;
		/* merge: .(goto)(116, 111, 116) */
		reached[0][111] = 1;
		;
		/* merge: prev = 0(116, 112, 116) */
		reached[0][112] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->prev);
		((P0 *)this)->prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->prev));
#endif
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[0][117] = 1;
		;
		_m = 3; goto P999; /* 4 */
	case 40: /* STATE 112 - line 76 "../../../gustedt_mutex1.pml" - [prev = 0] (0:116:1 - 3) */
		IfNotBlocked
		reached[0][112] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->prev);
		((P0 *)this)->prev = 0;
#ifdef VAR_RANGES
		logval("Thread:prev", ((int)((P0 *)this)->prev));
#endif
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[0][117] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 41: /* STATE 114 - line 22 "../../../mutex_generic.pml" - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][114] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 42: /* STATE 119 - line 24 "../../../mutex_generic.pml" - [-end-] (0:0:0 - 3) */
		IfNotBlocked
		reached[0][119] = 1;
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

