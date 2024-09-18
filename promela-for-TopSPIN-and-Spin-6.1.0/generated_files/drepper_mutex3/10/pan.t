#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(4*sizeof(Trans **));

	/* proctype 2: :init: */

	trans[2] = (Trans **) emalloc(14*sizeof(Trans *));

	T = trans[ 2][12] = settr(125,2,0,0,0,"ATOMIC", 0, 2, 0);
	T->nxt	= settr(125,2,1,0,0,"ATOMIC", 0, 2, 0);
	trans[2][1]	= settr(114,2,2,3,3,"(run Thread())", 0, 2, 0);
	trans[2][2]	= settr(115,2,3,4,4,"(run Thread())", 0, 2, 0);
	trans[2][3]	= settr(116,2,4,5,5,"(run Thread())", 0, 2, 0);
	trans[2][4]	= settr(117,2,5,6,6,"(run Thread())", 0, 2, 0);
	trans[2][5]	= settr(118,2,6,7,7,"(run Thread())", 0, 2, 0);
	trans[2][6]	= settr(119,2,7,8,8,"(run Thread())", 0, 2, 0);
	trans[2][7]	= settr(120,2,8,9,9,"(run Thread())", 0, 2, 0);
	trans[2][8]	= settr(121,2,9,10,10,"(run Thread())", 0, 2, 0);
	trans[2][9]	= settr(122,2,10,11,11,"(run Thread())", 0, 2, 0);
	trans[2][10]	= settr(123,2,11,12,12,"(run Thread())", 0, 2, 0);
	trans[2][11]	= settr(124,0,13,13,13,"(run Monitor())", 0, 2, 0);
	trans[2][13]	= settr(126,0,0,14,14,"-end-", 0, 3500, 0);

	/* proctype 1: Monitor */

	trans[1] = (Trans **) emalloc(5*sizeof(Trans *));

	T = trans[ 1][3] = settr(112,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(112,2,1,0,0,"ATOMIC", 1, 2, 0);
	trans[1][1]	= settr(110,4,4,15,15,"((num_threads_in_cs>1))", 1, 2, 0); /* m: 2 -> 4,0 */
	reached1[2] = 1;
	trans[1][2]	= settr(0,0,0,0,0,"assert(0)",0,0,0);
	trans[1][4]	= settr(113,0,0,16,16,"-end-", 0, 3500, 0);

	/* proctype 0: Thread */

	trans[0] = (Trans **) emalloc(111*sizeof(Trans *));

	trans[0][108]	= settr(107,0,107,1,0,".(goto)", 0, 2, 0);
	T = trans[0][107] = settr(106,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(106,0,50,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(106,0,105,0,0,"DO", 0, 2, 0);
	T = trans[ 0][50] = settr(49,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(49,0,4,0,0,"sub-sequence", 0, 2, 0);
	T = trans[ 0][4] = settr(3,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(3,0,3,0,0,"sub-sequence", 0, 2, 0);
/*->*/	trans[0][3]	= settr(2,32,48,17,17,"D_STEP", 1, 2, 0);
	T = trans[0][48] = settr(47,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(47,0,7,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(47,0,47,0,0,"IF", 0, 2, 0);
	T = trans[ 0][7] = settr(6,2,0,0,0,"ATOMIC", 0, 2, 0);
	T->nxt	= settr(6,2,5,0,0,"ATOMIC", 0, 2, 0);
	trans[0][5]	= settr(4,4,17,18,18,"((old_value!=0))", 0, 2, 0); /* m: 6 -> 17,0 */
	reached0[6] = 1;
	trans[0][6]	= settr(0,0,0,0,0,"printf('T%d fails to lock mutex on fast path\\n',_pid)",0,0,0);
	T = trans[ 0][17] = settr(16,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(16,2,15,0,0,"ATOMIC", 1, 2, 0);
	T = trans[0][15] = settr(14,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(14,2,8,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(14,2,9,0,0,"IF", 1, 2, 0);
	trans[0][8]	= settr(7,0,42,19,19,"((old_value==2))", 1, 2, 0); /* m: 16 -> 42,0 */
	reached0[16] = 1;
	trans[0][16]	= settr(15,0,42,1,0,".(goto)", 1, 2, 0);
	trans[0][9]	= settr(8,2,10,2,0,"else", 1, 2, 0);
	trans[0][10]	= settr(9,2,14,20,0,"assert((old_value==1))", 1, 2, 0);
	T = trans[ 0][14] = settr(13,0,0,0,0,"sub-sequence", 1, 2, 0);
	T->nxt	= settr(13,0,13,0,0,"sub-sequence", 1, 2, 0);
/*->*/	trans[0][13]	= settr(12,34,16,21,21,"D_STEP", 1, 2, 0);
	trans[0][43]	= settr(42,0,42,1,0,".(goto)", 0, 2, 0);
	T = trans[0][42] = settr(41,0,0,0,0,"DO", 0, 2, 0);
	T = T->nxt	= settr(41,0,18,0,0,"DO", 0, 2, 0);
	    T->nxt	= settr(41,0,21,0,0,"DO", 0, 2, 0);
	trans[0][18]	= settr(17,0,51,22,22,"((old_value==0))", 0, 2, 0); /* m: 19 -> 51,0 */
	reached0[19] = 1;
	trans[0][19]	= settr(0,0,0,0,0,"printf('T%d locks mutex on slow path\\n',_pid)",0,0,0);
	trans[0][20]	= settr(19,0,51,1,0,"goto :b1", 0, 2, 0);
	trans[0][21]	= settr(20,0,22,2,0,"else", 0, 2, 0);
	trans[0][22]	= settr(21,0,37,23,0,"printf('T%d fails to lock mutex on slow path\\n',_pid)", 0, 2, 0);
	T = trans[ 0][37] = settr(36,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(36,0,35,0,0,"sub-sequence", 0, 2, 0);
	T = trans[0][35] = settr(34,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(34,0,28,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(34,0,34,0,0,"IF", 0, 2, 0);
/*->*/	trans[0][28]	= settr(27,32,31,24,24,"D_STEP", 1, 2, 0);
/*->*/	trans[0][31]	= settr(30,32,41,25,25,"D_STEP", 1, 2, 0);
	trans[0][36]	= settr(35,0,41,1,0,".(goto)", 0, 2, 0);
/*->*/	trans[0][34]	= settr(33,32,41,26,26,"D_STEP", 1, 2, 0);
	T = trans[ 0][41] = settr(40,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(40,0,40,0,0,"sub-sequence", 0, 2, 0);
/*->*/	trans[0][40]	= settr(39,32,42,27,27,"D_STEP", 1, 2, 0);
	trans[0][44]	= settr(43,0,51,1,0,"break", 0, 2, 0);
	trans[0][49]	= settr(48,0,51,1,0,".(goto)", 0, 2, 0);
	T = trans[ 0][47] = settr(46,2,0,0,0,"ATOMIC", 0, 2, 0);
	T->nxt	= settr(46,2,45,0,0,"ATOMIC", 0, 2, 0);
	trans[0][45]	= settr(44,2,46,2,0,"else", 0, 2, 0);
	trans[0][46]	= settr(45,0,51,28,0,"printf('T%d locks mutex on fast path\\n',_pid)", 0, 2, 0);
	trans[0][51]	= settr(50,0,52,29,29,"num_threads_in_cs = (num_threads_in_cs+1)", 1, 2, 0);
	trans[0][52]	= settr(51,0,104,30,30,"num_threads_in_cs = (num_threads_in_cs-1)", 1, 2, 0);
	T = trans[ 0][104] = settr(103,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(103,0,58,0,0,"sub-sequence", 0, 2, 0);
/*->*/	trans[0][58]	= settr(57,32,102,31,31,"D_STEP", 1, 2, 0);
	T = trans[0][102] = settr(101,0,0,0,0,"IF", 0, 2, 0);
	T = T->nxt	= settr(101,0,62,0,0,"IF", 0, 2, 0);
	    T->nxt	= settr(101,0,101,0,0,"IF", 0, 2, 0);
/*->*/	trans[0][62]	= settr(61,32,98,32,32,"D_STEP", 1, 2, 0);
	T = trans[ 0][98] = settr(97,0,0,0,0,"sub-sequence", 0, 2, 0);
	T->nxt	= settr(97,0,97,0,0,"sub-sequence", 0, 2, 0);
	T = trans[ 0][97] = settr(96,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(96,2,63,0,0,"ATOMIC", 1, 2, 0);
	trans[0][63]	= settr(62,2,92,33,33,"assert(!(futex.wait[_pid]))", 1, 2, 0); /* m: 64 -> 0,92 */
	reached0[64] = 1;
	trans[0][64]	= settr(0,0,0,0,0,"num_woken = 0",0,0,0);
	trans[0][93]	= settr(92,2,92,1,0,".(goto)", 1, 2, 0);
	T = trans[0][92] = settr(91,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(91,2,65,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(91,2,67,0,0,"DO", 1, 2, 0);
	trans[0][65]	= settr(64,0,107,34,34,"(((num_woken==1)||(futex.num_waiting==0)))", 1, 2, 0); /* m: 95 -> 107,0 */
	reached0[95] = 1;
	trans[0][66]	= settr(65,2,95,1,0,"goto :b2", 1, 2, 0); /* m: 95 -> 0,107 */
	reached0[95] = 1;
	trans[0][67]	= settr(66,2,88,2,0,"else", 1, 2, 0);
	T = trans[0][88] = settr(87,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,68,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,70,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,72,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,74,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,76,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,78,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,80,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,82,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(87,2,84,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(87,2,86,0,0,"IF", 1, 2, 0);
	trans[0][68]	= settr(67,2,92,35,35,"(futex.wait[1])", 1, 2, 0); /* m: 69 -> 92,0 */
	reached0[69] = 1;
	trans[0][69]	= settr(0,0,0,0,0,"futex.wait[1] = 0",0,0,0);
	trans[0][89]	= settr(88,2,90,1,0,".(goto)", 1, 2, 0); /* m: 90 -> 0,92 */
	reached0[90] = 1;
	trans[0][70]	= settr(69,2,92,36,36,"(futex.wait[2])", 1, 2, 0); /* m: 71 -> 92,0 */
	reached0[71] = 1;
	trans[0][71]	= settr(0,0,0,0,0,"futex.wait[2] = 0",0,0,0);
	trans[0][72]	= settr(71,2,92,37,37,"(futex.wait[3])", 1, 2, 0); /* m: 73 -> 92,0 */
	reached0[73] = 1;
	trans[0][73]	= settr(0,0,0,0,0,"futex.wait[3] = 0",0,0,0);
	trans[0][74]	= settr(73,2,92,38,38,"(futex.wait[4])", 1, 2, 0); /* m: 75 -> 92,0 */
	reached0[75] = 1;
	trans[0][75]	= settr(0,0,0,0,0,"futex.wait[4] = 0",0,0,0);
	trans[0][76]	= settr(75,2,92,39,39,"(futex.wait[5])", 1, 2, 0); /* m: 77 -> 92,0 */
	reached0[77] = 1;
	trans[0][77]	= settr(0,0,0,0,0,"futex.wait[5] = 0",0,0,0);
	trans[0][78]	= settr(77,2,92,40,40,"(futex.wait[6])", 1, 2, 0); /* m: 79 -> 92,0 */
	reached0[79] = 1;
	trans[0][79]	= settr(0,0,0,0,0,"futex.wait[6] = 0",0,0,0);
	trans[0][80]	= settr(79,2,92,41,41,"(futex.wait[7])", 1, 2, 0); /* m: 81 -> 92,0 */
	reached0[81] = 1;
	trans[0][81]	= settr(0,0,0,0,0,"futex.wait[7] = 0",0,0,0);
	trans[0][82]	= settr(81,2,92,42,42,"(futex.wait[8])", 1, 2, 0); /* m: 83 -> 92,0 */
	reached0[83] = 1;
	trans[0][83]	= settr(0,0,0,0,0,"futex.wait[8] = 0",0,0,0);
	trans[0][84]	= settr(83,2,92,43,43,"(futex.wait[9])", 1, 2, 0); /* m: 85 -> 92,0 */
	reached0[85] = 1;
	trans[0][85]	= settr(0,0,0,0,0,"futex.wait[9] = 0",0,0,0);
	trans[0][86]	= settr(85,2,92,44,44,"(futex.wait[10])", 1, 2, 0); /* m: 87 -> 92,0 */
	reached0[87] = 1;
	trans[0][87]	= settr(0,0,0,0,0,"futex.wait[10] = 0",0,0,0);
	trans[0][90]	= settr(89,2,92,45,45,"futex.num_waiting = (futex.num_waiting-1)", 1, 2, 0); /* m: 91 -> 0,92 */
	reached0[91] = 1;
	trans[0][91]	= settr(0,0,0,0,0,"num_woken = (num_woken+1)",0,0,0);
	trans[0][94]	= settr(93,2,95,1,0,"break", 1, 2, 0);
	trans[0][95]	= settr(94,0,107,46,46,"printf('T%d woke up %d thread(s)\\n',_pid,num_woken)", 1, 2, 0); /* m: 96 -> 0,107 */
	reached0[96] = 1;
	trans[0][96]	= settr(0,0,0,0,0,"num_woken = 0",0,0,0);
	trans[0][103]	= settr(102,0,107,1,0,".(goto)", 0, 2, 0);
/*->*/	trans[0][101]	= settr(100,32,107,47,47,"D_STEP", 0, 2, 0);
	trans[0][105]	= settr(104,0,110,48,0,"printf('T%d is done\\n',_pid)", 0, 2, 0);
	trans[0][106]	= settr(105,0,110,1,0,"goto :b0", 0, 2, 0);
	trans[0][109]	= settr(108,0,110,1,0,"break", 0, 2, 0);
	trans[0][110]	= settr(109,0,0,49,49,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3, *T4, *T5;
	int i, k;
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#ifndef LOOPSTATE
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lstate);
#ifdef T_REVERSE
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3) { T2->nxt = T3; }	/* add else */

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
#endif
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}
void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
