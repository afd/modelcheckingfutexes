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

	case 7: /* STATE 6 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Monitor */
;
		
	case 8: /* STATE 1 */
		goto R999;

	case 9: /* STATE 4 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Thread */
	case 10: /* STATE 3 */
		sv_restor();
		goto R999;
;
		
	case 11: /* STATE 5 */
		goto R999;
;
		
	case 12: /* STATE 8 */
		goto R999;
;
		;
			case 14: /* STATE 13 */
		sv_restor();
		goto R999;

	case 15: /* STATE 18 */
		;
	/* 0 */	((P0 *)this)->_2_old_value = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
			case 17: /* STATE 28 */
		sv_restor();
		goto R999;
	case 18: /* STATE 31 */
		sv_restor();
		goto R999;
	case 19: /* STATE 34 */
		sv_restor();
		goto R999;
	case 20: /* STATE 40 */
		sv_restor();
		goto R999;
;
		;
		
	case 22: /* STATE 51 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;

	case 23: /* STATE 52 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;
	case 24: /* STATE 58 */
		sv_restor();
		goto R999;
	case 25: /* STATE 61 */
		sv_restor();
		goto R999;

	case 26: /* STATE 63 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;

	case 27: /* STATE 81 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;

	case 28: /* STATE 76 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 29: /* STATE 76 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 30: /* STATE 76 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 31: /* STATE 76 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.ovals[1];
		now.futex.num_waiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 32: /* STATE 81 */
		;
		((P0 *)this)->_2_num_woken = trpt->bup.oval;
		;
		goto R999;
	case 33: /* STATE 86 */
		sv_restor();
		goto R999;
;
		;
		
	case 35: /* STATE 95 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

