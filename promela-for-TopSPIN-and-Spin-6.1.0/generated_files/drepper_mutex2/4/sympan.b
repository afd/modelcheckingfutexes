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

	case 8: /* STATE 7 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Monitor */
;
		
	case 9: /* STATE 1 */
		goto R999;

	case 10: /* STATE 4 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Thread */
	case 11: /* STATE 3 */
		sv_restor();
		goto R999;

	case 12: /* STATE 5 */
		;
	/* 0 */	((P0 *)this)->_2_old_value = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 13: /* STATE 11 */
		goto R999;
;
		
	case 14: /* STATE 9 */
		goto R999;

	case 15: /* STATE 13 */
		;
	/* 0 */	((P0 *)this)->_2_old_value = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 16: /* STATE 26 */
		goto R999;
;
		;
			case 18: /* STATE 18 */
		sv_restor();
		goto R999;

	case 19: /* STATE 20 */
		;
	/* 0 */	((P0 *)this)->_2_old_value = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 20: /* STATE 24 */
		goto R999;
	case 21: /* STATE 33 */
		sv_restor();
		goto R999;
	case 22: /* STATE 36 */
		sv_restor();
		goto R999;
	case 23: /* STATE 39 */
		sv_restor();
		goto R999;
	case 24: /* STATE 45 */
		sv_restor();
		goto R999;

	case 25: /* STATE 47 */
		;
	/* 0 */	((P0 *)this)->_2_old_value = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 26: /* STATE 53 */
		goto R999;
;
		
	case 27: /* STATE 51 */
		goto R999;

	case 28: /* STATE 60 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 61 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;
	case 30: /* STATE 67 */
		sv_restor();
		goto R999;
	case 31: /* STATE 71 */
		sv_restor();
		goto R999;

	case 32: /* STATE 73 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;

	case 33: /* STATE 93 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;

	case 34: /* STATE 88 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 35: /* STATE 88 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 36: /* STATE 88 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 37: /* STATE 88 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[4] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 38: /* STATE 88 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[1];
		now.futex.num_waiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 39: /* STATE 93 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;
	case 40: /* STATE 98 */
		sv_restor();
		goto R999;
;
		;
		
	case 42: /* STATE 107 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

