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

	case 4: /* STATE 3 */
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: /* STATE 5 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Monitor */
;
		
	case 6: /* STATE 1 */
		goto R999;

	case 7: /* STATE 4 */
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Thread */
	case 8: /* STATE 3 */
		sv_restor();
		goto R999;

	case 9: /* STATE 5 */
		;
	/* 0 */	((P0 *)this)->cur = trpt->bup.oval;
		;
		;
		goto R999;
;
		
	case 10: /* STATE 11 */
		goto R999;
;
		
	case 11: /* STATE 9 */
		goto R999;
	case 12: /* STATE 20 */
		sv_restor();
		goto R999;

	case 13: /* STATE 22 */
		;
		((P0 *)this)->cur = trpt->bup.oval;
		;
		goto R999;
;
		;
			case 15: /* STATE 26 */
		sv_restor();
		goto R999;

	case 16: /* STATE 28 */
		;
	/* 1 */	((P0 *)this)->tmp = trpt->bup.ovals[1];
	/* 0 */	((P0 *)this)->cur = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 17: /* STATE 35 */
		;
		((P0 *)this)->cur = trpt->bup.oval;
		;
		goto R999;

	case 18: /* STATE 36 */
		;
	/* 0 */	((P0 *)this)->cur = trpt->bup.oval;
		;
		;
		goto R999;
	case 19: /* STATE 50 */
		sv_restor();
		goto R999;
	case 20: /* STATE 53 */
		sv_restor();
		goto R999;
	case 21: /* STATE 56 */
		sv_restor();
		goto R999;

	case 22: /* STATE 64 */
		;
		((P0 *)this)->tmp = trpt->bup.oval;
		;
		goto R999;

	case 23: /* STATE 65 */
		;
		((P0 *)this)->cur = trpt->bup.oval;
		;
		goto R999;

	case 24: /* STATE 67 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;

	case 25: /* STATE 68 */
		;
		now.num_threads_in_cs = trpt->bup.oval;
		;
		goto R999;
	case 26: /* STATE 75 */
		sv_restor();
		goto R999;

	case 27: /* STATE 76 */
		;
	/* 0 */	((P0 *)this)->prev = trpt->bup.oval;
		;
		;
		goto R999;

	case 28: /* STATE 78 */
		;
		((P0 *)this)->num_woken = trpt->bup.oval;
		;
		goto R999;

	case 29: /* STATE 100 */
		;
		((P0 *)this)->prev = trpt->bup.ovals[1];
		((P0 *)this)->num_woken = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 30: /* STATE 89 */
		;
		((P0 *)this)->num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[1] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 31: /* STATE 89 */
		;
		((P0 *)this)->num_woken = trpt->bup.ovals[2];
		now.futex.num_waiting = trpt->bup.ovals[1];
		now.futex.wait[2] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 32: /* STATE 89 */
		;
		((P0 *)this)->num_woken = trpt->bup.ovals[1];
		now.futex.num_waiting = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 33: /* STATE 100 */
		;
		((P0 *)this)->prev = trpt->bup.ovals[1];
		((P0 *)this)->num_woken = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 34: /* STATE 100 */
		;
		((P0 *)this)->prev = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 36: /* STATE 107 */
		;
		p_restor(II);
		;
		;
		goto R999;
	}

