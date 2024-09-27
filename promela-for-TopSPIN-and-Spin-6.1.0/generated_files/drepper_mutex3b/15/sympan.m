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
	case 16: /* STATE 14 - ../../../mutex_generic.pml:82 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][14] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: /* STATE 15 - ../../../mutex_generic.pml:85 - [(run Thread())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][15] = 1;
		if (!(addproc(II, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: /* STATE 16 - ../../../mutex_generic.pml:90 - [(run Monitor())] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][16] = 1;
		if (!(addproc(II, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 19: /* STATE 18 - ../../../mutex_generic.pml:92 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[2][18] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Monitor */
	case 20: /* STATE 1 - ../../../mutex_generic.pml:39 - [((num_threads_in_cs>1))] (4:0:0 - 1) */
		IfNotBlocked
		reached[1][1] = 1;
		if (!((((int)now.num_threads_in_cs)>1)))
			continue;
		/* merge: assert(0)(0, 2, 4) */
		reached[1][2] = 1;
		spin_assert(0, "0", II, tt, t);
		_m = 3; goto P999; /* 1 */
	case 21: /* STATE 4 - ../../../mutex_generic.pml:41 - [-end-] (0:0:0 - 1) */
		IfNotBlocked
		reached[1][4] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Thread */
	case 22: /* STATE 3 - ../../../atomics.pml:3 - [D_STEP] */
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
		goto S_047_0;
S_047_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 23: /* STATE 5 - ../../../drepper_mutex3x_lock.pml:7 - [((old_value!=0))] (17:0:0 - 1) */
		IfNotBlocked
		reached[0][5] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)!=0)))
			continue;
		/* merge: printf('T%d fails to lock mutex on fast path\\n',_pid)(0, 6, 17) */
		reached[0][6] = 1;
		Printf("T%d fails to lock mutex on fast path\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 1 */
	case 24: /* STATE 8 - ../../../drepper_mutex3x_lock.pml:12 - [((old_value==2))] (42:0:0 - 1) */
		IfNotBlocked
		reached[0][8] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==2)))
			continue;
		/* merge: .(goto)(0, 16, 42) */
		reached[0][16] = 1;
		;
		/* merge: .(goto)(0, 43, 42) */
		reached[0][43] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 25: /* STATE 10 - ../../../drepper_mutex3x_lock.pml:13 - [assert((old_value==1))] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][10] = 1;
		spin_assert((((int)((P0 *)this)->_2_old_value)==1), "(old_value==1)", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 26: /* STATE 13 - ../../../atomics.pml:13 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][13] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_010_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
S_011_0: /* 2 */
		now.futex.word = 2;
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_015_0;
S_015_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 27: /* STATE 18 - ../../../drepper_mutex3x_lock.pml:18 - [((old_value==0))] (51:0:1 - 1) */
		IfNotBlocked
		reached[0][18] = 1;
		if (!((((int)((P0 *)this)->_2_old_value)==0)))
			continue;
		/* dead 1: _2_old_value */  (trpt+1)->bup.oval = ((P0 *)this)->_2_old_value;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)this)->_2_old_value = 0;
		/* merge: printf('T%d locks mutex on slow path\\n',_pid)(0, 19, 51) */
		reached[0][19] = 1;
		Printf("T%d locks mutex on slow path\n", ((int)((P0 *)this)->_pid));
		/* merge: goto :b1(0, 20, 51) */
		reached[0][20] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 28: /* STATE 22 - ../../../drepper_mutex3x_lock.pml:22 - [printf('T%d fails to lock mutex on slow path\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][22] = 1;
		Printf("T%d fails to lock mutex on slow path\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 29: /* STATE 28 - ../../../futex.pml:17 - [D_STEP] */
		if (!(boq == -1 && (((int)now.futex.word)==2)))
			continue;
		sv_save();
		reached[0][28] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_022_0: /* 2 */
		if (!((((int)now.futex.word)==2)))
			Uerror("block in d_step seq");
S_023_0: /* 2 */
		Printf("T%d futex_wait, value match: %d; sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word));
S_024_0: /* 2 */
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 17) ])), " !(futex.wait[_pid])", II, tt, t);
S_025_0: /* 2 */
		now.futex.wait[ Index(((P0 *)this)->_pid, 17) ] = 1;
#ifdef VAR_RANGES
		logval("futex.wait[_pid]", ((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 17) ]));
#endif
		;
S_026_0: /* 2 */
		now.futex.num_waiting = (((int)now.futex.num_waiting)+1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		goto S_030_0;
S_030_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 30: /* STATE 31 - ../../../futex.pml:27 - [D_STEP] */
		if (!(boq == -1 &&  !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 17) ]))))
			continue;
		sv_save();
		reached[0][31] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_028_0: /* 2 */
		if (!( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 17) ]))))
			Uerror("block in d_step seq");
S_029_0: /* 2 */
		Printf("T%d has woken\n", ((int)((P0 *)this)->_pid));
		goto S_035_0;
S_035_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 31: /* STATE 34 - ../../../futex.pml:31 - [D_STEP] */
		if (boq != -1 || (trpt->o_pm&1))
			continue;
		sv_save();
		reached[0][34] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_031_0: /* 2 */
		/* else */;
S_032_0: /* 2 */
		Printf("T%d futex_wait, value mismatch: %d vs. %d; do not sleep\n", ((int)((P0 *)this)->_pid), ((int)now.futex.word), 2);
		goto S_035_0; /* ';' */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 32: /* STATE 40 - ../../../atomics.pml:13 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][40] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_037_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
S_038_0: /* 2 */
		now.futex.word = 2;
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_042_0;
S_042_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 33: /* STATE 46 - ../../../drepper_mutex3x_lock.pml:27 - [printf('T%d locks mutex on fast path\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][46] = 1;
		Printf("T%d locks mutex on fast path\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 34: /* STATE 51 - ../../../mutex_generic.pml:26 - [num_threads_in_cs = (num_threads_in_cs+1)] (0:0:1 - 5) */
		IfNotBlocked
		reached[0][51] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)+1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 35: /* STATE 52 - ../../../mutex_generic.pml:27 - [num_threads_in_cs = (num_threads_in_cs-1)] (0:0:1 - 1) */
		IfNotBlocked
		reached[0][52] = 1;
		(trpt+1)->bup.oval = ((int)now.num_threads_in_cs);
		now.num_threads_in_cs = (((int)now.num_threads_in_cs)-1);
#ifdef VAR_RANGES
		logval("num_threads_in_cs", ((int)now.num_threads_in_cs));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 36: /* STATE 58 - ../../../drepper_mutex3b.pml:19 - [D_STEP] */
		IfNotBlocked
		sv_save();
		reached[0][58] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_055_0: /* 2 */
S_054_0: /* 2 */
S_052_0: /* 2 */
		((P0 *)this)->_2_old_value = ((int)now.futex.word);
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
S_053_0: /* 2 */
		now.futex.word = 0;
#ifdef VAR_RANGES
		logval("futex.word", ((int)now.futex.word));
#endif
		;
		goto S_056_0;
S_056_0: /* 2 */
		Printf("T%d exchanges futex word with 0; old value was %d\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_old_value));
		goto S_110_0;
S_110_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 37: /* STATE 61 - ../../../drepper_mutex3b.pml:24 - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->_2_old_value)==2)))
			continue;
		sv_save();
		reached[0][61] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_058_0: /* 2 */
		if (!((((int)((P0 *)this)->_2_old_value)==2)))
			Uerror("block in d_step seq");
S_059_0: /* 2 */
		((P0 *)this)->_2_old_value = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
		goto S_106_0;
S_106_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 38: /* STATE 62 - ../../../futex.pml:80 - [assert(!(futex.wait[_pid]))] (0:101:1 - 1) */
		IfNotBlocked
		reached[0][62] = 1;
		spin_assert( !(((int)now.futex.wait[ Index(((int)((P0 *)this)->_pid), 17) ])), " !(futex.wait[_pid])", II, tt, t);
		/* merge: num_woken = 0(101, 63, 101) */
		reached[0][63] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: /* STATE 64 - ../../../futex.pml:84 - [(((num_woken==1)||(futex.num_waiting==0)))] (116:0:1 - 1) */
		IfNotBlocked
		reached[0][64] = 1;
		if (!(((((int)((P0 *)this)->_2_num_woken)==1)||(((int)now.futex.num_waiting)==0))))
			continue;
		/* merge: goto :b2(116, 65, 116) */
		reached[0][65] = 1;
		;
		/* merge: printf('T%d woke up %d thread(s)\\n',_pid,num_woken)(116, 104, 116) */
		reached[0][104] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(116, 105, 116) */
		reached[0][105] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 112, 116) */
		reached[0][112] = 1;
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[0][117] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 40: /* STATE 67 - ../../../futex.pml:88 - [(futex.wait[1])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][67] = 1;
		if (!(((int)now.futex.wait[1])))
			continue;
		/* merge: futex.wait[1] = 0(101, 68, 101) */
		reached[0][68] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[1]);
		now.futex.wait[1] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[1]", ((int)now.futex.wait[1]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 41: /* STATE 69 - ../../../futex.pml:90 - [(futex.wait[2])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][69] = 1;
		if (!(((int)now.futex.wait[2])))
			continue;
		/* merge: futex.wait[2] = 0(101, 70, 101) */
		reached[0][70] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[2]);
		now.futex.wait[2] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[2]", ((int)now.futex.wait[2]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 42: /* STATE 71 - ../../../futex.pml:93 - [(futex.wait[3])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][71] = 1;
		if (!(((int)now.futex.wait[3])))
			continue;
		/* merge: futex.wait[3] = 0(101, 72, 101) */
		reached[0][72] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[3]);
		now.futex.wait[3] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[3]", ((int)now.futex.wait[3]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 43: /* STATE 73 - ../../../futex.pml:97 - [(futex.wait[4])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][73] = 1;
		if (!(((int)now.futex.wait[4])))
			continue;
		/* merge: futex.wait[4] = 0(101, 74, 101) */
		reached[0][74] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[4]);
		now.futex.wait[4] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[4]", ((int)now.futex.wait[4]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 44: /* STATE 75 - ../../../futex.pml:101 - [(futex.wait[5])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][75] = 1;
		if (!(((int)now.futex.wait[5])))
			continue;
		/* merge: futex.wait[5] = 0(101, 76, 101) */
		reached[0][76] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[5]);
		now.futex.wait[5] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[5]", ((int)now.futex.wait[5]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 45: /* STATE 77 - ../../../futex.pml:105 - [(futex.wait[6])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][77] = 1;
		if (!(((int)now.futex.wait[6])))
			continue;
		/* merge: futex.wait[6] = 0(101, 78, 101) */
		reached[0][78] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[6]);
		now.futex.wait[6] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[6]", ((int)now.futex.wait[6]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 46: /* STATE 79 - ../../../futex.pml:109 - [(futex.wait[7])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][79] = 1;
		if (!(((int)now.futex.wait[7])))
			continue;
		/* merge: futex.wait[7] = 0(101, 80, 101) */
		reached[0][80] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[7]);
		now.futex.wait[7] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[7]", ((int)now.futex.wait[7]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 47: /* STATE 81 - ../../../futex.pml:113 - [(futex.wait[8])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][81] = 1;
		if (!(((int)now.futex.wait[8])))
			continue;
		/* merge: futex.wait[8] = 0(101, 82, 101) */
		reached[0][82] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[8]);
		now.futex.wait[8] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[8]", ((int)now.futex.wait[8]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 48: /* STATE 83 - ../../../futex.pml:117 - [(futex.wait[9])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][83] = 1;
		if (!(((int)now.futex.wait[9])))
			continue;
		/* merge: futex.wait[9] = 0(101, 84, 101) */
		reached[0][84] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[9]);
		now.futex.wait[9] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[9]", ((int)now.futex.wait[9]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 49: /* STATE 85 - ../../../futex.pml:121 - [(futex.wait[10])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][85] = 1;
		if (!(((int)now.futex.wait[10])))
			continue;
		/* merge: futex.wait[10] = 0(101, 86, 101) */
		reached[0][86] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[10]);
		now.futex.wait[10] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[10]", ((int)now.futex.wait[10]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 50: /* STATE 87 - ../../../futex.pml:125 - [(futex.wait[11])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][87] = 1;
		if (!(((int)now.futex.wait[11])))
			continue;
		/* merge: futex.wait[11] = 0(101, 88, 101) */
		reached[0][88] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[11]);
		now.futex.wait[11] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[11]", ((int)now.futex.wait[11]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 51: /* STATE 89 - ../../../futex.pml:129 - [(futex.wait[12])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][89] = 1;
		if (!(((int)now.futex.wait[12])))
			continue;
		/* merge: futex.wait[12] = 0(101, 90, 101) */
		reached[0][90] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[12]);
		now.futex.wait[12] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[12]", ((int)now.futex.wait[12]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 52: /* STATE 91 - ../../../futex.pml:133 - [(futex.wait[13])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][91] = 1;
		if (!(((int)now.futex.wait[13])))
			continue;
		/* merge: futex.wait[13] = 0(101, 92, 101) */
		reached[0][92] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[13]);
		now.futex.wait[13] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[13]", ((int)now.futex.wait[13]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 53: /* STATE 93 - ../../../futex.pml:137 - [(futex.wait[14])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][93] = 1;
		if (!(((int)now.futex.wait[14])))
			continue;
		/* merge: futex.wait[14] = 0(101, 94, 101) */
		reached[0][94] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[14]);
		now.futex.wait[14] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[14]", ((int)now.futex.wait[14]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 54: /* STATE 95 - ../../../futex.pml:141 - [(futex.wait[15])] (101:0:3 - 1) */
		IfNotBlocked
		reached[0][95] = 1;
		if (!(((int)now.futex.wait[15])))
			continue;
		/* merge: futex.wait[15] = 0(101, 96, 101) */
		reached[0][96] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.wait[15]);
		now.futex.wait[15] = 0;
#ifdef VAR_RANGES
		logval("futex.wait[15]", ((int)now.futex.wait[15]));
#endif
		;
		/* merge: .(goto)(101, 98, 101) */
		reached[0][98] = 1;
		;
		/* merge: futex.num_waiting = (futex.num_waiting-1)(101, 99, 101) */
		reached[0][99] = 1;
		(trpt+1)->bup.ovals[1] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 55: /* STATE 99 - ../../../futex.pml:148 - [futex.num_waiting = (futex.num_waiting-1)] (0:101:2 - 16) */
		IfNotBlocked
		reached[0][99] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)now.futex.num_waiting);
		now.futex.num_waiting = (((int)now.futex.num_waiting)-1);
#ifdef VAR_RANGES
		logval("futex.num_waiting", ((int)now.futex.num_waiting));
#endif
		;
		/* merge: num_woken = (num_woken+1)(101, 100, 101) */
		reached[0][100] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = (((int)((P0 *)this)->_2_num_woken)+1);
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 102, 101) */
		reached[0][102] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 56: /* STATE 104 - ../../../futex.pml:151 - [printf('T%d woke up %d thread(s)\\n',_pid,num_woken)] (0:116:1 - 3) */
		IfNotBlocked
		reached[0][104] = 1;
		Printf("T%d woke up %d thread(s)\n", ((int)((P0 *)this)->_pid), ((int)((P0 *)this)->_2_num_woken));
		/* merge: num_woken = 0(116, 105, 116) */
		reached[0][105] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)this)->_2_num_woken);
		((P0 *)this)->_2_num_woken = 0;
#ifdef VAR_RANGES
		logval("Thread:num_woken", ((int)((P0 *)this)->_2_num_woken));
#endif
		;
		/* merge: .(goto)(0, 112, 116) */
		reached[0][112] = 1;
		;
		/* merge: .(goto)(0, 117, 116) */
		reached[0][117] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 57: /* STATE 110 - ../../../drepper_mutex3b.pml:26 - [D_STEP] */
		if (!(boq == -1 && (((int)((P0 *)this)->_2_old_value)==1)))
			continue;
		sv_save();
		reached[0][110] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;
S_107_0: /* 2 */
		if (!((((int)((P0 *)this)->_2_old_value)==1)))
			Uerror("block in d_step seq");
S_108_0: /* 2 */
		((P0 *)this)->_2_old_value = 0;
#ifdef VAR_RANGES
		logval("Thread:old_value", ((int)((P0 *)this)->_2_old_value));
#endif
		;
		goto S_111_0;
S_111_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 58: /* STATE 114 - ../../../mutex_generic.pml:29 - [printf('T%d is done\\n',_pid)] (0:0:0 - 1) */
		IfNotBlocked
		reached[0][114] = 1;
		Printf("T%d is done\n", ((int)((P0 *)this)->_pid));
		_m = 3; goto P999; /* 0 */
	case 59: /* STATE 119 - ../../../mutex_generic.pml:31 - [-end-] (0:0:0 - 3) */
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

