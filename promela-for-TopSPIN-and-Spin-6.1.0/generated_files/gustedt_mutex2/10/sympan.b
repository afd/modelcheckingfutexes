	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: /* STATE 1 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: /* STATE 2 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: /* STATE 3 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: /* STATE 4 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: /* STATE 5 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: /* STATE 6 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: /* STATE 7 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: /* STATE 8 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: /* STATE 9 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: /* STATE 10 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: /* STATE 11 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: /* STATE 13 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Monitor */
;
		
	case 15: /* STATE 1 */
		goto R999;

	case 16: /* STATE 4 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Thread */
	case 17: /* STATE 3 */
		sv_restor();
		goto R999;

	case 18: /* STATE 5 */
		;
	/* 0 */	((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 19: /* STATE 11 */
		goto R999;
;
		
	case 20: /* STATE 9 */
		goto R999;

	case 21: /* STATE 17 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;
	case 22: /* STATE 23 */
		sv_restor();
		goto R999;

	case 23: /* STATE 25 */
		;
	/* 1 */	((P0 *)this)->_2_prev = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->_2_cur = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 24: /* STATE 28 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;
	case 25: /* STATE 41 */
		sv_restor();
		goto R999;

	case 26: /* STATE 43 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;
;
		;
			case 28: /* STATE 50 */
		sv_restor();
		goto R999;
	case 29: /* STATE 53 */
		sv_restor();
		goto R999;
	case 30: /* STATE 56 */
		sv_restor();
		goto R999;

	case 31: /* STATE 60 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;
	case 32: /* STATE 66 */
		sv_restor();
		goto R999;

	case 33: /* STATE 68 */
		;
	/* 1 */	((P0 *)this)->_2_prev = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->_2_cur = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: /* STATE 71 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;

	case 35: /* STATE 77 */
		;
		((P0 *)this)->_2_prev = trpt->bup.oval;
		;
		goto R999;

	case 36: /* STATE 78 */
		;
		((P0 *)this)->_2_cur = trpt->bup.oval;
		;
		goto R999;

	case 37: /* STATE 80 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;

	case 38: /* STATE 81 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;
	case 39: /* STATE 88 */
		sv_restor();
		goto R999;

	case 40: /* STATE 89 */
		;
	/* 0 */	((P0 *)this)->_2_prev = trpt->bup.oval;
		;
		;
		goto R999;

	case 41: /* STATE 91 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;

	case 42: /* STATE 129 */
		;
		((P0 *)this)->_2_prev = trpt->bup.ovals[1];
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 43: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 44: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 45: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 46: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[4] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 47: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[5] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 48: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[6] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 49: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[7] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 50: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[8] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 51: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[9] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 52: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[10] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 53: /* STATE 118 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[1];
		now.futex.num_waiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 54: /* STATE 129 */
		;
		((P0 *)this)->_2_prev = trpt->bup.ovals[1];
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 55: /* STATE 129 */
		;
		((P0 *)this)->_2_prev = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 57: /* STATE 136 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

