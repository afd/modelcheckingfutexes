#define SpinVersion	"Spin Version 5.1.6 -- 9 May 2008"
#define PanSource	"../../../gustedt_mutex1.pml"

#ifdef WIN64
#define ONE_L	((unsigned long) 1)
#define long	long long
#else
#define ONE_L	(1L)
#endif
char *TrailFile = PanSource; /* default */
char *trailfilename;
#if defined(BFS)
#ifndef SAFETY
#define SAFETY
#endif
#ifndef XUSAFE
#define XUSAFE
#endif
#endif
#ifndef uchar
#define uchar	unsigned char
#endif
#ifndef uint
#define uint	unsigned int
#endif
#ifndef HASH32
#define HASH64
#endif
#define DELTA	500
#ifdef MA
	#if NCORE>1 && !defined(SEP_STATE)
	#define SEP_STATE
	#endif
#if MA==1
#undef MA
#define MA	100
#endif
#endif
#ifdef W_XPT
#if W_XPT==1
#undef W_XPT
#define W_XPT 1000000
#endif
#endif
#ifndef NFAIR
#define NFAIR	2	/* must be >= 2 */
#endif
#define HAS_CODE
#define MERGED	1
#ifdef NP	/* includes np_ demon */
#define HAS_NP	2
#define VERI	3
#define endclaim	3 /* none */
#endif
typedef struct S_F_MAP {
	char *fnm; int from; int upto;
} S_F_MAP;

#define nstates2	10	/* :init: */
#define endstate2	9
short src_ln2 [] = {
	  0,  39,  40,  42,  45,  48,  51,  68, 
	 38,  70,   0, };
S_F_MAP src_file2 [] = {
	{ "-", 0, 0 },
	{ "../../../mutex_generic.pml", 1, 9 },
	{ "-", 10, 11 }
};
uchar reached2 [] = {
	  0,   1,   0,   0,   0,   0,   0,   0, 
	  0,   0,   0, };
uchar *loopstate2;

#define nstates1	5	/* Monitor */
#define endstate1	4
short src_ln1 [] = {
	  0,  32,  32,  31,  34,   0, };
S_F_MAP src_file1 [] = {
	{ "-", 0, 0 },
	{ "../../../mutex_generic.pml", 1, 4 },
	{ "-", 5, 6 }
};
uchar reached1 [] = {
	  0,   1,   0,   0,   0,   0, };
uchar *loopstate1;

#define nstates0	116	/* Thread */
#define endstate0	115
short src_ln0 [] = {
	  0,   0,   0,   3,   9,  26,  27,  28, 
	 29,  30,  25,  33,  23,   0,   0,   0, 
	  0,   0,   0,   0,   8,  17,  35,  39, 
	  0,   0,   3,   9,  43,  44,  45,  46, 
	 42,  48,  40,  49,  51,  51,  52,  52, 
	 50,  54,  50,  54,  55,   0,   0,   0, 
	  0,   0,  17,   0,   0,  27,   0,   0, 
	 31,  16,  38,  38,  57,  58,  38,  61, 
	 61,  61,  62,  19,  20,   0,   0,   0, 
	  0,   0,   0,  66,  73,  70,  71,  74, 
	 75,  76,  78,  78,  80,  80,  83,  83, 
	 87,  87,  91,  91,  95,  95,  77,  97, 
	 97,  98,  72, 100,  72, 100, 103,  68, 
	105,  74,  72,  76,  76,  77,  22,  22, 
	 17,  24,  17,  24,   0, };
S_F_MAP src_file0 [] = {
	{ "-", 0, 2 },
	{ "../../../atomics.pml", 3, 4 },
	{ "../../../gustedt_mutex1.pml", 5, 12 },
	{ "-", 13, 19 },
	{ "../../../lockbit.pml", 20, 21 },
	{ "../../../gustedt_mutex1.pml", 22, 23 },
	{ "-", 24, 25 },
	{ "../../../atomics.pml", 26, 27 },
	{ "../../../gustedt_mutex1.pml", 28, 44 },
	{ "-", 45, 49 },
	{ "../../../futex.pml", 50, 50 },
	{ "-", 51, 52 },
	{ "../../../futex.pml", 53, 53 },
	{ "-", 54, 55 },
	{ "../../../futex.pml", 56, 59 },
	{ "../../../gustedt_mutex1.pml", 60, 66 },
	{ "../../../mutex_generic.pml", 67, 68 },
	{ "-", 69, 74 },
	{ "../../../gustedt_mutex1.pml", 75, 76 },
	{ "../../../futex.pml", 77, 104 },
	{ "../../../gustedt_mutex1.pml", 105, 109 },
	{ "../../../mutex_generic.pml", 110, 115 },
	{ "-", 116, 117 }
};
uchar reached0 [] = {
	  0,   0,   1,   1,   1,   1,   0,   1, 
	  1,   0,   0,   1,   1,   0,   1,   1, 
	  1,   1,   0,   0,   1,   0,   0,   1, 
	  0,   1,   1,   1,   1,   0,   1,   1, 
	  0,   1,   0,   0,   1,   0,   1,   1, 
	  0,   1,   1,   1,   1,   0,   1,   1, 
	  1,   1,   1,   0,   1,   0,   0,   1, 
	  1,   1,   1,   0,   0,   1,   0,   1, 
	  0,   0,   1,   0,   0,   1,   1,   1, 
	  0,   0,   1,   1,   1,   1,   0,   1, 
	  1,   1,   1,   0,   1,   0,   1,   0, 
	  1,   0,   1,   0,   1,   0,   0,   1, 
	  0,   0,   0,   1,   1,   0,   0,   1, 
	  0,   1,   0,   1,   0,   0,   1,   1, 
	  0,   1,   1,   0,   0, };
uchar *loopstate0;
struct {
	int tp; short *src;
} src_all[] = {
	{ 2, &src_ln2[0] },
	{ 1, &src_ln1[0] },
	{ 0, &src_ln0[0] },
	{ 0, (short *) 0 }
};
short *frm_st0;
struct {
	char *c; char *t;
} code_lookup[] = {
	{ (char *) 0, "" }
};
#define _T5	41
#define _T2	42
#define T_ID	unsigned char
#define SYNC	0
#define ASYNC	0

#ifndef NCORE
	#ifdef DUAL_CORE
		#define NCORE	2
	#elif QUAD_CORE
		#define NCORE	4
	#else
		#define NCORE	1
	#endif
#endif
struct Futex { /* user defined type */
	uchar word;
	uchar wait[8];
	uchar num_waiting;
};
char *procname[] = {
   "Thread",
   "Monitor",
   ":init:",
   ":np_:",
};

#define Pinit	((P2 *)this)
typedef struct P2 { /* :init: */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
} P2;
#define Air2	(sizeof(P2) - 3)
#define PMonitor	((P1 *)this)
typedef struct P1 { /* Monitor */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
} P1;
#define Air1	(sizeof(P1) - 3)
#define PThread	((P0 *)this)
typedef struct P0 { /* Thread */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
	uchar num_woken;
	uchar tmp;
	uchar cur;
	uchar prev;
} P0;
#define Air0	(sizeof(P0) - Offsetof(P0, prev) - 1*sizeof(uchar))
typedef struct P3 { /* np_ */
	unsigned _pid : 8;  /* 0..255 */
	unsigned _t   : 3; /* proctype */
	unsigned _p   : 8; /* state    */
} P3;
#define Air3	(sizeof(P3) - 3)
#if defined(BFS) && defined(REACH)
#undef REACH
#endif
#ifdef VERI
#define BASE	1
#else
#define BASE	0
#endif
typedef struct Trans {
	short atom;	/* if &2 = atomic trans; if &8 local */
#ifdef HAS_UNLESS
	short escp[HAS_UNLESS];	/* lists the escape states */
	short e_trans;	/* if set, this is an escp-trans */
#endif
	short tpe[2];	/* class of operation (for reduction) */
	short qu[6];	/* for conditional selections: qid's  */
	uchar ty[6];	/* ditto: type's */
#ifdef NIBIS
	short om;	/* completion status of preselects */
#endif
	char *tp;	/* src txt of statement */
	int st;		/* the nextstate */
	int t_id;	/* transition id, unique within proc */
	int forw;	/* index forward transition */
	int back;	/* index return  transition */
	struct Trans *nxt;
} Trans;

#define qptr(x)	(((uchar *)&now)+(int)q_offset[x])
#define pptr(x)	(((uchar *)&now)+(int)proc_offset[x])
extern uchar *Pptr(int);
#define q_sz(x)	(((Q0 *)qptr(x))->Qlen)

#ifndef VECTORSZ
#define VECTORSZ	1024           /* sv   size in bytes */
#endif

#ifdef VERBOSE
#ifndef CHECK
#define CHECK
#endif
#ifndef DEBUG
#define DEBUG
#endif
#endif
#ifdef SAFETY
#ifndef NOFAIR
#define NOFAIR
#endif
#endif
#ifdef NOREDUCE
#ifndef XUSAFE
#define XUSAFE
#endif
#if !defined(SAFETY) && !defined(MA)
#define FULLSTACK
#endif
#else
#ifdef BITSTATE
#if defined(SAFETY) && !defined(HASH64)
#define CNTRSTACK
#else
#define FULLSTACK
#endif
#else
#define FULLSTACK
#endif
#endif
#ifdef BITSTATE
#ifndef NOCOMP
#define NOCOMP
#endif
#if !defined(LC) && defined(SC)
#define LC
#endif
#endif
#if defined(COLLAPSE2) || defined(COLLAPSE3) || defined(COLLAPSE4)
/* accept the above for backward compatibility */
#define COLLAPSE
#endif
#ifdef HC
#undef HC
#define HC4
#endif
#ifdef HC0
#define HC	0
#endif
#ifdef HC1
#define HC	1
#endif
#ifdef HC2
#define HC	2
#endif
#ifdef HC3
#define HC	3
#endif
#ifdef HC4
#define HC	4
#endif
#ifdef COLLAPSE
#if NCORE>1 && !defined(SEP_STATE)
unsigned long *ncomps;	/* in shared memory */
#else
unsigned long ncomps[256+2];
#endif
#endif
#define MAXQ   	255
#define MAXPROC	255
#define WS		sizeof(void *) /* word size in bytes */
typedef struct Stack  {	 /* for queues and processes */
#if VECTORSZ>32000
	int o_delta;
	int o_offset;
	int o_skip;
	int o_delqs;
#else
	short o_delta;
	short o_offset;
	short o_skip;
	short o_delqs;
#endif
	short o_boq;
#ifndef XUSAFE
	char *o_name;
#endif
	char *body;
	struct Stack *nxt;
	struct Stack *lst;
} Stack;

typedef struct Svtack { /* for complete state vector */
#if VECTORSZ>32000
	int o_delta;
	int m_delta;
#else
	short o_delta;	 /* current size of frame */
	short m_delta;	 /* maximum size of frame */
#endif
#if SYNC
	short o_boq;
#endif
#define StackSize	(WS)
	char *body;
	struct Svtack *nxt;
	struct Svtack *lst;
} Svtack;

Trans ***trans;	/* 1 ptr per state per proctype */

struct H_el *Lstate;
int depthfound = -1;	/* loop detection */
#if VECTORSZ>32000
int proc_offset[MAXPROC];
int q_offset[MAXQ];
#else
short proc_offset[MAXPROC];
short q_offset[MAXQ];
#endif
uchar proc_skip[MAXPROC];
uchar q_skip[MAXQ];
unsigned long  vsize;	/* vector size in bytes */
#ifdef SVDUMP
int vprefix=0, svfd;		/* runtime option -pN */
#endif
char *tprefix = "trail";	/* runtime option -tsuffix */
short boq = -1;		/* blocked_on_queue status */
typedef struct State {
	uchar _nr_pr;
	uchar _nr_qs;
	uchar   _a_t;	/* cycle detection */
#ifndef NOFAIR
	uchar   _cnt[NFAIR];	/* counters, weak fairness */
#endif
#ifndef NOVSZ
#if VECTORSZ<65536
	unsigned short _vsz;
#else
	unsigned long  _vsz;
#endif
#endif
#ifdef HAS_LAST
	uchar  _last;	/* pid executed in last step */
#endif
#ifdef EVENT_TRACE
#if nstates_event<256
	uchar _event;
#else
	unsigned short _event;
#endif
#endif
	uchar num_threads_in_cs;
	struct Futex futex;
	uchar sv[VECTORSZ];
} State;

#define HAS_TRACK	0
int _; /* a predefined write-only variable */

#define FORWARD_MOVES	"pan.m"
#define REVERSE_MOVES	"pan.b"
#define TRANSITIONS	"pan.t"
#define _NP_	3
uchar reached3[3];  /* np_ */
uchar *loopstate3;  /* np_ */
#define nstates3	3 /* np_ */
#define endstate3	2 /* np_ */

#define start3	0 /* np_ */
#define start2	8
#define start1	3
#define start0	112
#ifdef NP
	#define ACCEPT_LAB	1 /* at least 1 in np_ */
#else
	#define ACCEPT_LAB	0 /* user-defined accept labels */
#endif
#ifdef MEMCNT
	#ifdef MEMLIM
		#warning -DMEMLIM takes precedence over -DMEMCNT
		#undef MEMCNT
	#else
		#if MEMCNT<20
			#warning using minimal value -DMEMCNT=20 (=1MB)
			#define MEMLIM	(1)
			#undef MEMCNT
		#else
			#if MEMCNT==20
				#define MEMLIM	(1)
				#undef MEMCNT
			#else
			 #if MEMCNT>=50
			  #error excessive value for MEMCNT
			 #else
				#define MEMLIM	(1<<(MEMCNT-20))
			 #endif
			#endif
		#endif
	#endif
#endif
#if NCORE>1 && !defined(MEMLIM)
	#define MEMLIM	(2048)	/* need a default, using 2 GB */
#endif
#define PROG_LAB	0 /* progress labels */
uchar *accpstate[4];
uchar *progstate[4];
uchar *loopstate[4];
uchar *reached[4];
uchar *stopstate[4];
uchar *visstate[4];
short *mapstate[4];
#ifdef HAS_CODE
int NrStates[4];
#endif
#define NQS	0
short q_flds[1];
short q_max[1];
typedef struct Q0 {	/* generic q */
	uchar Qlen;	/* q_size */
	uchar _t;
} Q0;

/** function prototypes **/
char *emalloc(unsigned long);
char *Malloc(unsigned long);
int Boundcheck(int, int, int, int, Trans *);
int addqueue(int, int);
/* int atoi(char *); */
/* int abort(void); */
int close(int);
int delproc(int, int);
int endstate(void);
int hstore(char *, int);
#ifdef MA
int gstore(char *, int, uchar);
#endif
int q_cond(short, Trans *);
int q_full(int);
int q_len(int);
int q_zero(int);
int qrecv(int, int, int, int);
int unsend(int);
/* void *sbrk(int); */
void Uerror(char *);
void assert(int, char *, int, int, Trans *);
void c_chandump(int);
void c_globals(void);
void c_locals(int, int);
void checkcycles(void);
void crack(int, int, Trans *, short *);
void d_sfh(const char *, int);
void sfh(const char *, int);
void d_hash(uchar *, int);
void s_hash(uchar *, int);
void r_hash(uchar *, int);
void delq(int);
void do_reach(void);
void pan_exit(int);
void exit(int);
void hinit(void);
void imed(Trans *, int, int, int);
void new_state(void);
void p_restor(int);
void putpeg(int, int);
void putrail(void);
void q_restor(void);
void retrans(int, int, int, short *, uchar *, uchar *);
void settable(void);
void setq_claim(int, int, char *, int, char *);
void sv_restor(void);
void sv_save(void);
void tagtable(int, int, int, short *, uchar *);
void do_dfs(int, int, int, short *, uchar *, uchar *);
void uerror(char *);
void unrecv(int, int, int, int, int);
void usage(FILE *);
void wrap_stats(void);
#if defined(FULLSTACK) && defined(BITSTATE)
int  onstack_now(void);
void onstack_init(void);
void onstack_put(void);
void onstack_zap(void);
#endif
#ifndef XUSAFE
int q_S_check(int, int);
int q_R_check(int, int);
uchar q_claim[MAXQ+1];
char *q_name[MAXQ+1];
char *p_name[MAXPROC+1];
#endif
void qsend(int, int, int);
#define Addproc(x)	addproc(x)
#define LOCAL	1
#define Q_FULL_F	2
#define Q_EMPT_F	3
#define Q_EMPT_T	4
#define Q_FULL_T	5
#define TIMEOUT_F	6
#define GLOBAL	7
#define BAD	8
#define ALPHA_F	9
#define NTRANS	43
#ifdef PEG
long peg[NTRANS];
#endif
