// due to a compiler bug, this file cannot be automatically generated

pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int,
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*c_void;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = ?[*]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
pub const sig_atomic_t = __sig_atomic_t;
pub const __sigset_t = extern struct {
    __val: [16]c_ulong,
};
pub const sigset_t = __sigset_t;
pub const pid_t = __pid_t;
pub const uid_t = __uid_t;
pub const struct_timespec = extern struct {
    tv_sec: __time_t,
    tv_nsec: __syscall_slong_t,
};
pub const union_sigval = extern union {
    sival_int: c_int,
    sival_ptr: ?*c_void,
};
pub const __sigval_t = union_sigval;
pub const siginfo_t = extern struct {
    si_signo: c_int,
    si_errno: c_int,
    si_code: c_int,
    __pad0: c_int,
    _sifields: extern union {
        _pad: [28]c_int,
        _kill: extern struct {
            si_pid: __pid_t,
            si_uid: __uid_t,
        },
        _timer: extern struct {
            si_tid: c_int,
            si_overrun: c_int,
            si_sigval: __sigval_t,
        },
        _rt: extern struct {
            si_pid: __pid_t,
            si_uid: __uid_t,
            si_sigval: __sigval_t,
        },
        _sigchld: extern struct {
            si_pid: __pid_t,
            si_uid: __uid_t,
            si_status: c_int,
            si_utime: __clock_t,
            si_stime: __clock_t,
        },
        _sigfault: extern struct {
            si_addr: ?*c_void,
            si_addr_lsb: c_short,
            _bounds: extern union {
                _addr_bnd: extern struct {
                    _lower: ?*c_void,
                    _upper: ?*c_void,
                },
                _pkey: __uint32_t,
            },
        },
        _sigpoll: extern struct {
            si_band: c_long,
            si_fd: c_int,
        },
        _sigsys: extern struct {
            _call_addr: ?*c_void,
            _syscall: c_int,
            _arch: c_uint,
        },
    },
};
pub const SI_ASYNCNL = -60;
pub const SI_TKILL = -6;
pub const SI_SIGIO = -5;
pub const SI_ASYNCIO = -4;
pub const SI_MESGQ = -3;
pub const SI_TIMER = -2;
pub const SI_QUEUE = -1;
pub const SI_USER = 0;
pub const SI_KERNEL = 128;
pub const ILL_ILLOPC = 1;
pub const ILL_ILLOPN = 2;
pub const ILL_ILLADR = 3;
pub const ILL_ILLTRP = 4;
pub const ILL_PRVOPC = 5;
pub const ILL_PRVREG = 6;
pub const ILL_COPROC = 7;
pub const ILL_BADSTK = 8;
pub const FPE_INTDIV = 1;
pub const FPE_INTOVF = 2;
pub const FPE_FLTDIV = 3;
pub const FPE_FLTOVF = 4;
pub const FPE_FLTUND = 5;
pub const FPE_FLTRES = 6;
pub const FPE_FLTINV = 7;
pub const FPE_FLTSUB = 8;
pub const SEGV_MAPERR = 1;
pub const SEGV_ACCERR = 2;
pub const SEGV_BNDERR = 3;
pub const SEGV_PKUERR = 4;
pub const BUS_ADRALN = 1;
pub const BUS_ADRERR = 2;
pub const BUS_OBJERR = 3;
pub const BUS_MCEERR_AR = 4;
pub const BUS_MCEERR_AO = 5;
pub const CLD_EXITED = 1;
pub const CLD_KILLED = 2;
pub const CLD_DUMPED = 3;
pub const CLD_TRAPPED = 4;
pub const CLD_STOPPED = 5;
pub const CLD_CONTINUED = 6;
pub const POLL_IN = 1;
pub const POLL_OUT = 2;
pub const POLL_MSG = 3;
pub const POLL_ERR = 4;
pub const POLL_PRI = 5;
pub const POLL_HUP = 6;
pub const sigval_t = __sigval_t;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const struct_sigevent = extern struct {
    sigev_value: __sigval_t,
    sigev_signo: c_int,
    sigev_notify: c_int,
    _sigev_un: extern union {
        _pad: [12]c_int,
        _tid: __pid_t,
        _sigev_thread: extern struct {
            _function: ?extern fn(__sigval_t) void,
            _attribute: ?[*]pthread_attr_t,
        },
    },
};
pub const sigevent_t = struct_sigevent;
pub const SIGEV_SIGNAL = 0;
pub const SIGEV_NONE = 1;
pub const SIGEV_THREAD = 2;
pub const SIGEV_THREAD_ID = 4;
pub const __sighandler_t = ?extern fn(c_int) void;
pub extern fn __sysv_signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn signal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn kill(__pid: __pid_t, __sig: c_int) c_int;
pub extern fn killpg(__pgrp: __pid_t, __sig: c_int) c_int;
pub extern fn raise(__sig: c_int) c_int;
pub extern fn ssignal(__sig: c_int, __handler: __sighandler_t) __sighandler_t;
pub extern fn gsignal(__sig: c_int) c_int;
pub extern fn psignal(__sig: c_int, __s: ?[*]const u8) void;
pub extern fn psiginfo(__pinfo: ?[*]const siginfo_t, __s: ?[*]const u8) void;
pub extern fn sigblock(__mask: c_int) c_int;
pub extern fn sigsetmask(__mask: c_int) c_int;
pub extern fn siggetmask() c_int;
pub const sig_t = __sighandler_t;
pub extern fn sigemptyset(__set: ?[*]sigset_t) c_int;
pub extern fn sigfillset(__set: ?[*]sigset_t) c_int;
pub extern fn sigaddset(__set: ?[*]sigset_t, __signo: c_int) c_int;
pub extern fn sigdelset(__set: ?[*]sigset_t, __signo: c_int) c_int;
pub extern fn sigismember(__set: ?[*]const sigset_t, __signo: c_int) c_int;
pub const struct_sigaction = extern struct {
    __sigaction_handler: extern union {
        sa_handler: __sighandler_t,
        sa_sigaction: ?extern fn(c_int, ?[*]siginfo_t, ?*c_void) void,
    },
    sa_mask: __sigset_t,
    sa_flags: c_int,
    sa_restorer: ?extern fn() void,
};
pub extern fn sigprocmask(__how: c_int, noalias __set: ?[*]const sigset_t, noalias __oset: ?[*]sigset_t) c_int;
pub extern fn sigsuspend(__set: ?[*]const sigset_t) c_int;
pub extern fn sigaction(__sig: c_int, noalias __act: ?[*]const struct_sigaction, noalias __oact: ?[*]struct_sigaction) c_int;
pub extern fn sigpending(__set: ?[*]sigset_t) c_int;
pub extern fn sigwait(noalias __set: ?[*]const sigset_t, noalias __sig: ?[*]c_int) c_int;
pub extern fn sigwaitinfo(noalias __set: ?[*]const sigset_t, noalias __info: ?[*]siginfo_t) c_int;
pub extern fn sigtimedwait(noalias __set: ?[*]const sigset_t, noalias __info: ?[*]siginfo_t, noalias __timeout: ?[*]const struct_timespec) c_int;
pub extern fn sigqueue(__pid: __pid_t, __sig: c_int, __val: union_sigval) c_int;
pub extern const _sys_siglist: [65](?[*]const u8);
pub extern const sys_siglist: [65](?[*]const u8);
pub const struct__fpx_sw_bytes = extern struct {
    magic1: __uint32_t,
    extended_size: __uint32_t,
    xstate_bv: __uint64_t,
    xstate_size: __uint32_t,
    __glibc_reserved1: [7]__uint32_t,
};
pub const struct__fpreg = extern struct {
    significand: [4]c_ushort,
    exponent: c_ushort,
};
pub const struct__fpxreg = extern struct {
    significand: [4]c_ushort,
    exponent: c_ushort,
    __glibc_reserved1: [3]c_ushort,
};
pub const struct__xmmreg = extern struct {
    element: [4]__uint32_t,
};
pub const struct__fpstate = extern struct {
    cwd: __uint16_t,
    swd: __uint16_t,
    ftw: __uint16_t,
    fop: __uint16_t,
    rip: __uint64_t,
    rdp: __uint64_t,
    mxcsr: __uint32_t,
    mxcr_mask: __uint32_t,
    _st: [8]struct__fpxreg,
    _xmm: [16]struct__xmmreg,
    __glibc_reserved1: [24]__uint32_t,
};
pub const struct_sigcontext = extern struct {
    r8: __uint64_t,
    r9: __uint64_t,
    r10: __uint64_t,
    r11: __uint64_t,
    r12: __uint64_t,
    r13: __uint64_t,
    r14: __uint64_t,
    r15: __uint64_t,
    rdi: __uint64_t,
    rsi: __uint64_t,
    rbp: __uint64_t,
    rbx: __uint64_t,
    rdx: __uint64_t,
    rax: __uint64_t,
    rcx: __uint64_t,
    rsp: __uint64_t,
    rip: __uint64_t,
    eflags: __uint64_t,
    cs: c_ushort,
    gs: c_ushort,
    fs: c_ushort,
    __pad0: c_ushort,
    err: __uint64_t,
    trapno: __uint64_t,
    oldmask: __uint64_t,
    cr2: __uint64_t,
    @"": extern union {
        fpstate: ?[*]struct__fpstate,
        __fpstate_word: __uint64_t,
    },
    __reserved1: [8]__uint64_t,
};
pub const struct__xsave_hdr = extern struct {
    xstate_bv: __uint64_t,
    __glibc_reserved1: [2]__uint64_t,
    __glibc_reserved2: [5]__uint64_t,
};
pub const struct__ymmh_state = extern struct {
    ymmh_space: [64]__uint32_t,
};
pub const struct__xstate = extern struct {
    fpstate: struct__fpstate,
    xstate_hdr: struct__xsave_hdr,
    ymmh: struct__ymmh_state,
};
pub extern fn sigreturn(__scp: ?[*]struct_sigcontext) c_int;
pub const stack_t = extern struct {
    ss_sp: ?*c_void,
    ss_flags: c_int,
    ss_size: usize,
};
pub const greg_t = c_longlong;
pub const gregset_t = [23]greg_t;
pub const struct__libc_fpxreg = extern struct {
    significand: [4]c_ushort,
    exponent: c_ushort,
    __glibc_reserved1: [3]c_ushort,
};
pub const struct__libc_xmmreg = extern struct {
    element: [4]__uint32_t,
};
pub const struct__libc_fpstate = extern struct {
    cwd: __uint16_t,
    swd: __uint16_t,
    ftw: __uint16_t,
    fop: __uint16_t,
    rip: __uint64_t,
    rdp: __uint64_t,
    mxcsr: __uint32_t,
    mxcr_mask: __uint32_t,
    _st: [8]struct__libc_fpxreg,
    _xmm: [16]struct__libc_xmmreg,
    __glibc_reserved1: [24]__uint32_t,
};
pub const fpregset_t = ?[*]struct__libc_fpstate;
pub const mcontext_t = extern struct {
    gregs: gregset_t,
    fpregs: fpregset_t,
    __reserved1: [8]c_ulonglong,
};
pub const struct_ucontext_t = extern struct {
    uc_flags: c_ulong,
    uc_link: ?[*]struct_ucontext_t,
    uc_stack: stack_t,
    uc_mcontext: mcontext_t,
    uc_sigmask: sigset_t,
    __fpregs_mem: struct__libc_fpstate,
    __ssp: [4]c_ulonglong,
};
pub const ucontext_t = struct_ucontext_t;
pub extern fn siginterrupt(__sig: c_int, __interrupt: c_int) c_int;
pub const SS_ONSTACK = 1;
pub const SS_DISABLE = 2;
pub extern fn sigaltstack(noalias __ss: ?[*]const stack_t, noalias __oss: ?[*]stack_t) c_int;
pub const struct_sigstack = extern struct {
    ss_sp: ?*c_void,
    ss_onstack: c_int,
};
pub extern fn sigstack(__ss: ?[*]struct_sigstack, __oss: ?[*]struct_sigstack) c_int;
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint,
    __writers: c_uint,
    __wrphase_futex: c_uint,
    __writers_futex: c_uint,
    __pad3: c_uint,
    __pad4: c_uint,
    __cur_writer: c_int,
    __shared: c_int,
    __rwelision: i8,
    __pad1: [7]u8,
    __pad2: c_ulong,
    __flags: c_uint,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: ?[*]struct___pthread_internal_list,
    __next: ?[*]struct___pthread_internal_list,
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int,
    __count: c_uint,
    __owner: c_int,
    __nusers: c_uint,
    __kind: c_int,
    __spins: c_short,
    __elision: c_short,
    __list: __pthread_list_t,
};
pub const struct___pthread_cond_s = extern struct {
    @"": extern union {
        __wseq: c_ulonglong,
        __wseq32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    @"": extern union {
        __g1_start: c_ulonglong,
        __g1_start32: extern struct {
            __low: c_uint,
            __high: c_uint,
        },
    },
    __g_refs: [2]c_uint,
    __g_size: [2]c_uint,
    __g1_orig_size: c_uint,
    __wrefs: c_uint,
    __g_signals: [2]c_uint,
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub extern fn pthread_sigmask(__how: c_int, noalias __newmask: ?[*]const __sigset_t, noalias __oldmask: ?[*]__sigset_t) c_int;
pub extern fn pthread_kill(__threadid: pthread_t, __signo: c_int) c_int;
pub extern fn __libc_current_sigrtmin() c_int;
pub extern fn __libc_current_sigrtmax() c_int;
pub const SIG_SETMASK = 2;
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = 1;
pub const _STDC_PREDEF_H = 1;
pub const SIGPIPE = 13;
pub const _BITS_SIGEVENT_CONSTS_H = 1;
pub const __FLT16_MAX_EXP__ = 15;
pub const __BIGGEST_ALIGNMENT__ = 16;
pub const SIGTERM = 15;
pub const __INT64_FMTd__ = c"ld";
pub const __STDC_VERSION__ = c_long(201112);
pub const __SIZEOF_FLOAT__ = 4;
pub const __INT_LEAST32_FMTi__ = c"i";
pub const si_arch = _sifields._sigsys._arch;
pub const __INT_LEAST8_FMTi__ = c"hhi";
pub const si_int = _sifields._rt.si_sigval.sival_int;
pub const __LDBL_EPSILON__ = 0.000000;
pub const __INT_LEAST32_FMTd__ = c"d";
pub const __STDC_UTF_32__ = 1;
pub const __SIG_ATOMIC_WIDTH__ = 32;
pub const __UINT_FAST64_FMTX__ = c"lX";
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __clang_version__ = c"7.0.1 (tags/RELEASE_701/final)";
pub const __UINT_LEAST8_FMTo__ = c"hho";
pub const __SIZEOF_DOUBLE__ = 8;
pub const __INTMAX_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = 2;
pub const SIGPROF = 27;
pub const __INT_LEAST16_FMTi__ = c"hi";
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __MMX__ = 1;
pub const __SIZE_FMTX__ = c"lX";
pub const __ID_T_TYPE = __U32_TYPE;
pub const _THREAD_SHARED_TYPES_H = 1;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const _BITS_TYPES_H = 1;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __ptr_t = [*]void;
pub const __WCHAR_WIDTH__ = 32;
pub const __STDC_IEC_559_COMPLEX__ = 1;
pub const __USE_MISC = 1;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const SIGBUS = 10;
pub const __SIZEOF_PTHREAD_ATTR_T = 56;
pub const __DBL_MIN_EXP__ = -1021;
pub const __PTRDIFF_FMTd__ = c"ld";
pub const __FLT_EVAL_METHOD__ = 0;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SSE_MATH__ = 1;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST8_FMTo__ = c"hho";
pub const __UINT_LEAST64_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_LEAST64_FMTx__ = c"lx";
pub const SIGWINCH = 28;
pub const __INT8_MAX__ = 127;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __DBL_HAS_DENORM__ = 1;
pub const __FLOAT128__ = 1;
pub const __HAVE_GENERIC_SELECTION = 1;
pub const __FLT16_HAS_QUIET_NAN__ = 1;
pub const si_band = _sifields._sigpoll.si_band;
pub const __DBL_DECIMAL_DIG__ = 17;
pub const __ATOMIC_RELAXED = 0;
pub const __SIZEOF_SHORT__ = 2;
pub const __UINT16_FMTX__ = c"hX";
pub const __UINT_FAST16_MAX__ = 65535;
pub const SIG_BLOCK = 0;
pub const __PTHREAD_MUTEX_HAVE_PREV = 1;
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = 2;
pub const __CONSTANT_CFSTRINGS__ = 1;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const _SYS_CDEFS_H = 1;
pub const _ATFILE_SOURCE = 1;
pub const _BITS_SIGTHREAD_H = 1;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __WINT_MAX__ = c_uint(4294967295);
pub const __LDBL_MAX_EXP__ = 16384;
pub const __USE_POSIX199309 = 1;
pub const __STDC_ISO_10646__ = c_long(201706);
pub const SIGCHLD = 20;
pub const _BITS_SIGACTION_H = 1;
pub const __NO_MATH_INLINES = 1;
pub const __WCHAR_TYPE__ = int;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __LONG_MAX__ = c_long(9223372036854775807);
pub const _BITS_SIGNUM_GENERIC_H = 1;
pub const __SI_HAVE_SIGSYS = 1;
pub const __SIGEV_MAX_SIZE = 64;
pub const SIGPWR = 30;
pub const __STDC_HOSTED__ = 1;
pub const SIGSTKFLT = 16;
pub const __pic__ = 2;
pub const __INT_FAST16_FMTi__ = c"hi";
pub const __PTRDIFF_WIDTH__ = 64;
pub const __INT_LEAST32_TYPE__ = int;
pub const __SCHAR_MAX__ = 127;
pub const __USE_POSIX2 = 1;
pub const __LDBL_DENORM_MIN__ = 0.000000;
pub const __FLT16_MIN_EXP__ = -14;
pub const __USE_XOPEN2K = 1;
pub const __SI_MAX_SIZE = 128;
pub const __USE_FORTIFY_LEVEL = 0;
pub const __INT64_C_SUFFIX__ = L;
pub const __ELF__ = 1;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const SIG_ERR = if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Pointer) @ptrCast(__sighandler_t, -1) else if (@typeId(@typeOf(-1)) == @import("builtin").TypeId.Int) @intToPtr(__sighandler_t, -1) else __sighandler_t(-1);
pub const __LDBL_MANT_DIG__ = 64;
pub const __PTHREAD_MUTEX_LOCK_ELISION = 1;
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __USE_XOPEN2K8 = 1;
pub const __CLANG_ATOMIC_INT_LOCK_FREE = 2;
pub const __SIZEOF_PTRDIFF_T__ = 8;
pub const __SIG_ATOMIC_MAX__ = 2147483647;
pub const __USE_ATFILE = 1;
pub const __UINT64_FMTX__ = c"lX";
pub const si_upper = _sifields._sigfault._bounds._addr_bnd._upper;
pub const SIGSYS = 12;
pub const __UINT64_MAX__ = c_ulong(18446744073709551615);
pub const __DBL_MANT_DIG__ = 53;
pub const __FLT_DECIMAL_DIG__ = 9;
pub const __INT_LEAST32_MAX__ = 2147483647;
pub const __DBL_DIG__ = 15;
pub const __ATOMIC_ACQUIRE = 2;
pub const sigev_notify_attributes = _sigev_un._sigev_thread._attribute;
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = 1;
pub const __USE_ISOC95 = 1;
pub const SIG_IGN = if (@typeId(@typeOf(1)) == @import("builtin").TypeId.Pointer) @ptrCast(__sighandler_t, 1) else if (@typeId(@typeOf(1)) == @import("builtin").TypeId.Int) @intToPtr(__sighandler_t, 1) else __sighandler_t(1);
pub const __FLT16_HAS_DENORM__ = 1;
pub const SA_RESETHAND = 2147483648;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __UINT_FAST16_FMTu__ = c"hu";
pub const __INTPTR_FMTi__ = c"li";
pub const __SIGRTMIN = 32;
pub const __UINT_FAST8_FMTX__ = c"hhX";
pub const __LITTLE_ENDIAN__ = 1;
pub const __SSE__ = 1;
pub const SIGIOT = SIGABRT;
pub const __FLT_HAS_QUIET_NAN__ = 1;
pub const __SIZEOF_SIZE_T__ = 8;
pub const __UINT_LEAST16_FMTo__ = c"ho";
pub const __UINT8_FMTo__ = c"hho";
pub const si_timerid = _sifields._timer.si_tid;
pub const __UINT_LEAST16_FMTx__ = c"hx";
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __UINT_FAST16_FMTX__ = c"hX";
pub const __VERSION__ = c"4.2.1 Compatible Clang 7.0.1 (tags/RELEASE_701/final)";
pub const __UINT_FAST32_FMTx__ = c"x";
pub const __UINTPTR_MAX__ = c_ulong(18446744073709551615);
pub const SA_NOMASK = SA_NODEFER;
pub const __sigstack_defined = 1;
pub const si_syscall = _sifields._sigsys._syscall;
pub const __UINT_FAST8_FMTu__ = c"hhu";
pub const __UINT_LEAST8_FMTu__ = c"hhu";
pub const si_fd = _sifields._sigpoll.si_fd;
pub const __UINT_LEAST64_FMTo__ = c"lo";
pub const __UINT_LEAST8_MAX__ = 255;
pub const SIGURG = 16;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __warnattr = msg;
pub const __STD_TYPE = typedef;
pub const __SIZEOF_WCHAR_T__ = 4;
pub const __GLIBC_USE_DEPRECATED_GETS = 0;
pub const __LDBL_MAX__ = inf;
pub const __UINT16_MAX__ = 65535;
pub const _LP64 = 1;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __x86_64 = 1;
pub const __PTHREAD_RWLOCK_INT_FLAGS_SHARED = 1;
pub const linux = 1;
pub const __SIZEOF_WINT_T__ = 4;
pub const SA_NOCLDWAIT = 2;
pub const __UINTMAX_FMTo__ = c"lo";
pub const __FLT_DIG__ = 6;
pub const __UINT_LEAST8_FMTX__ = c"hhX";
pub const SIGABRT = 6;
pub const __INT16_MAX__ = 32767;
pub const __WINT_UNSIGNED__ = 1;
pub const __FLT_MAX_10_EXP__ = 38;
pub const _FEATURES_H = 1;
pub const __UINTPTR_FMTX__ = c"lX";
pub const __UINT_LEAST16_FMTu__ = c"hu";
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __WINT_WIDTH__ = 32;
pub const __SHRT_MAX__ = 32767;
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = 8;
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __POINTER_WIDTH__ = 64;
pub const __PTRDIFF_MAX__ = c_long(9223372036854775807);
pub const __INT32_FMTd__ = c"d";
pub const __FLT16_DIG__ = 3;
pub const __DBL_MIN__ = 0.000000;
pub const SA_NOCLDSTOP = 1;
pub const __SIZEOF_LONG__ = 8;
pub const __S32_TYPE = int;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __INTPTR_WIDTH__ = 64;
pub const __FLT16_MAX_10_EXP__ = 4;
pub const __INT_FAST32_TYPE__ = int;
pub const NGREG = __NGREG;
pub const __NO_INLINE__ = 1;
pub const __UINT_FAST32_FMTX__ = c"X";
pub const _POSIX_SOURCE = 1;
pub const __gnu_linux__ = 1;
pub const __INT_FAST32_MAX__ = 2147483647;
pub const _BITS_PTHREADTYPES_COMMON_H = 1;
pub const __UINTMAX_FMTu__ = c"lu";
pub const _BITS_SS_FLAGS_H = 1;
pub const __FLT_RADIX__ = 2;
pub const __GLIBC_MINOR__ = 28;
pub const __FLT16_HAS_INFINITY__ = 1;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = 1;
pub const __GCC_ATOMIC_INT_LOCK_FREE = 2;
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = 3;
pub const _STRUCT_TIMESPEC = 1;
pub const __FLT16_DECIMAL_DIG__ = 5;
pub const __PRAGMA_REDEFINE_EXTNAME = 1;
pub const __INT_FAST8_FMTd__ = c"hhd";
pub const sa_sigaction = __sigaction_handler.sa_sigaction;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __INT32_TYPE__ = int;
pub const __USE_POSIX199506 = 1;
pub const SIGTTIN = 21;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __UINTMAX_WIDTH__ = 64;
pub const __SI_ASYNCIO_AFTER_SIGIO = 1;
pub const si_addr = _sifields._sigfault.si_addr;
pub const __PTHREAD_MUTEX_USE_UNION = 0;
pub const __FLT_MIN__ = 0.000000;
pub const __INT64_FMTi__ = c"li";
pub const __UINT_FAST64_FMTu__ = c"lu";
pub const __INT8_FMTd__ = c"hhd";
pub const __INT_FAST16_TYPE__ = short;
pub const __FLT_MAX_EXP__ = 128;
pub const SIGTRAP = 5;
pub const SIGCLD = SIGCHLD;
pub const __DBL_MAX_10_EXP__ = 308;
pub const __LDBL_MIN__ = 0.000000;
pub const __INT_FAST64_FMTi__ = c"li";
pub const __INT_LEAST8_FMTd__ = c"hhd";
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = 2;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __SIGRTMAX = __SIGRTMIN;
pub const __UINT_LEAST32_FMTX__ = c"X";
pub const __PIC__ = 2;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __UINTMAX_MAX__ = c_ulong(18446744073709551615);
pub const __UINT_FAST16_FMTo__ = c"ho";
pub const _DEFAULT_SOURCE = 1;
pub const __FD_SETSIZE = 1024;
pub const __LDBL_DECIMAL_DIG__ = 21;
pub const __UINT_LEAST64_FMTX__ = c"lX";
pub const __clang_minor__ = 0;
pub const __LDBL_REDIR_DECL = name;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __SIZEOF_FLOAT128__ = 16;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __UINT_FAST64_FMTo__ = c"lo";
pub const __SIZE_FMTx__ = c"lx";
pub const __DBL_MAX__ = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878;
pub const __DBL_EPSILON__ = 0.000000;
pub const __UINT64_FMTx__ = c"lx";
pub const SIGQUIT = 3;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const si_status = _sifields._sigchld.si_status;
pub const __CHAR_BIT__ = 8;
pub const __INT16_FMTi__ = c"hi";
pub const __SLONG32_TYPE = int;
pub const _DEBUG = 1;
pub const __GNUC_MINOR__ = 2;
pub const SIGIO = SIGPOLL;
pub const __restrict_arr = __restrict;
pub const __UINT_FAST32_MAX__ = c_uint(4294967295);
pub const _BITS_SIGCONTEXT_H = 1;
pub const __RLIM_T_MATCHES_RLIM64_T = 1;
pub const __UINT8_FMTX__ = c"hhX";
pub const __FLT_EPSILON__ = 0.000000;
pub const __UINTPTR_WIDTH__ = 64;
pub const __llvm__ = 1;
pub const si_utime = _sifields._sigchld.si_utime;
pub const __UINT_FAST64_MAX__ = c_ulong(18446744073709551615);
pub const __INT_FAST32_FMTi__ = c"i";
pub const si_pkey = _sifields._sigfault._bounds._pkey;
pub const SA_RESTART = 268435456;
pub const MINSIGSTKSZ = 2048;
pub const __NGREG = 23;
pub const __FLT_HAS_INFINITY__ = 1;
pub const __k8 = 1;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const SIGUSR1 = 30;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __UINT8_FMTx__ = c"hhx";
pub const __INTMAX_C_SUFFIX__ = L;
pub const __ORDER_LITTLE_ENDIAN__ = 1234;
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const __INT16_FMTd__ = c"hd";
pub const __UINT32_FMTX__ = c"X";
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = 1;
pub const __PTHREAD_MUTEX_NUSERS_AFTER_KIND = 0;
pub const __UINT32_C_SUFFIX__ = U;
pub const __SI_ERRNO_THEN_CODE = 1;
pub const SIGPOLL = 23;
pub const __sig_atomic_t_defined = 1;
pub const __INT32_MAX__ = 2147483647;
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = 2;
pub const __INTMAX_WIDTH__ = 64;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = 2;
pub const __USE_POSIX = 1;
pub const __SIZE_FMTo__ = c"lo";
pub const __DBL_HAS_QUIET_NAN__ = 1;
pub const __INT_FAST8_FMTi__ = c"hhi";
pub const si_stime = _sifields._sigchld.si_stime;
pub const __UINT_LEAST32_FMTo__ = c"o";
pub const __STDC_UTF_16__ = 1;
pub const SA_INTERRUPT = 536870912;
pub const __UINT_LEAST32_MAX__ = c_uint(4294967295);
pub const __ATOMIC_RELEASE = 3;
pub const __UINT_FAST16_FMTx__ = c"hx";
pub const __UINTMAX_C_SUFFIX__ = UL;
pub const __FLT_MIN_EXP__ = -125;
pub const sa_handler = __sigaction_handler.sa_handler;
pub const SA_ONSTACK = 134217728;
pub const __SIZEOF_LONG_DOUBLE__ = 16;
pub const __UINT_LEAST64_FMTu__ = c"lu";
pub const __GCC_ATOMIC_LONG_LOCK_FREE = 2;
pub const __ORDER_PDP_ENDIAN__ = 3412;
pub const __SIZEOF_PTHREAD_BARRIER_T = 32;
pub const __INT_FAST64_FMTd__ = c"ld";
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = 2;
pub const SA_SIGINFO = 4;
pub const __GXX_ABI_VERSION = 1002;
pub const __INT16_TYPE__ = short;
pub const __SSE2_MATH__ = 1;
pub const __FLT_MANT_DIG__ = 24;
pub const __UINT_FAST64_FMTx__ = c"lx";
pub const SIGALRM = 14;
pub const __STDC__ = 1;
pub const __INT_FAST8_MAX__ = 127;
pub const __INTPTR_FMTd__ = c"ld";
pub const __GNUC_PATCHLEVEL__ = 1;
pub const __SIZE_WIDTH__ = 64;
pub const __UINT_LEAST8_FMTx__ = c"hhx";
pub const __INT_LEAST64_FMTi__ = c"li";
pub const __siginfo_t_defined = 1;
pub const __STDC_IEC_559__ = 1;
pub const SIGCONT = 19;
pub const __INT_FAST16_MAX__ = 32767;
pub const __USE_ISOC99 = 1;
pub const __INTPTR_MAX__ = c_long(9223372036854775807);
pub const si_value = _sifields._rt.si_sigval;
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = 2;
pub const si_ptr = _sifields._rt.si_sigval.sival_ptr;
pub const __UINT64_FMTu__ = c"lu";
pub const __have_pthread_attr_t = 1;
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __SSE2__ = 1;
pub const __INT_MAX__ = 2147483647;
pub const SIGINT = 2;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __INTMAX_FMTi__ = c"li";
pub const __DBL_DENORM_MIN__ = 0.000000;
pub const __clang_major__ = 7;
pub const __FLT16_MANT_DIG__ = 11;
pub const __GNUC__ = 4;
pub const __UINT32_MAX__ = c_uint(4294967295);
pub const SA_NODEFER = 1073741824;
pub const si_pid = _sifields._kill.si_pid;
pub const _POSIX_C_SOURCE = c_long(200809);
pub const __FLT_DENORM_MIN__ = 0.000000;
pub const __DBL_MAX_EXP__ = 1024;
pub const __INT8_FMTi__ = c"hhi";
pub const __UINT_LEAST16_MAX__ = 65535;
pub const __LDBL_HAS_DENORM__ = 1;
pub const __sigevent_t_defined = 1;
pub const __FLT16_MIN_10_EXP__ = -13;
pub const __LDBL_HAS_QUIET_NAN__ = 1;
pub const __UINT_FAST8_MAX__ = 255;
pub const __DBL_MIN_10_EXP__ = -307;
pub const _BITS_SIGINFO_CONSTS_H = 1;
pub const __SIZEOF_PTHREAD_MUTEX_T = 40;
pub const __UINT8_FMTu__ = c"hhu";
pub const __OFF_T_MATCHES_OFF64_T = 1;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const si_overrun = _sifields._timer.si_overrun;
pub const SIGTSTP = 18;
pub const __INT_FAST64_MAX__ = c_long(9223372036854775807);
pub const __UINT16_FMTu__ = c"hu";
pub const __ATOMIC_SEQ_CST = 5;
pub const __SIZE_FMTu__ = c"lu";
pub const __LDBL_MIN_EXP__ = -16381;
pub const __UINT_FAST32_FMTu__ = c"u";
pub const __pie__ = 2;
pub const __SSP_STRONG__ = 2;
pub const __clang_patchlevel__ = 1;
pub const _BITS_SIGSTACK_H = 1;
pub const SIGSEGV = 11;
pub const _BITS_SIGINFO_ARCH_H = 1;
pub const __SIZEOF_LONG_LONG__ = 8;
pub const __GNUC_STDC_INLINE__ = 1;
pub const __FXSR__ = 1;
pub const __UINT8_MAX__ = 255;
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = 1;
pub const NSIG = _NSIG;
pub const __UINT32_FMTx__ = c"x";
pub const SA_ONESHOT = SA_RESETHAND;
pub const __UINT16_FMTo__ = c"ho";
pub const __OPENCL_MEMORY_SCOPE_DEVICE = 2;
pub const __SIZEOF_PTHREAD_CONDATTR_T = 4;
pub const __UINT32_FMTu__ = c"u";
pub const SIGVTALRM = 26;
pub const __SIZEOF_PTHREAD_COND_T = 48;
pub const __SIZEOF_POINTER__ = 8;
pub const _BITS_SIGNUM_H = 1;
pub const __TIMER_T_TYPE = [*]void;
pub const __unix = 1;
pub const __SIZE_MAX__ = c_ulong(18446744073709551615);
pub const __SI_CLOCK_T = __clock_t;
pub const __INT_FAST16_FMTd__ = c"hd";
pub const unix = 1;
pub const SIGSTKSZ = 8192;
pub const __UINT_LEAST32_FMTu__ = c"u";
pub const __FLT_MAX__ = 340282346999999984391321947108527833088.000000;
pub const __USE_ISOC11 = 1;
pub const SIGHUP = 1;
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = 2;
pub const __k8__ = 1;
pub const SIGSTOP = 17;
pub const __ATOMIC_CONSUME = 1;
pub const __tune_k8__ = 1;
pub const __unix__ = 1;
pub const __x86_64__ = 1;
pub const FP_XSTATE_MAGIC1 = c_uint(1179670611);
pub const __LDBL_HAS_INFINITY__ = 1;
pub const __WORDSIZE_TIME64_COMPAT32 = 1;
pub const __UINT64_C_SUFFIX__ = UL;
pub const __GNU_LIBRARY__ = 6;
pub const SIGFPE = 8;
pub const __UINTMAX_FMTx__ = c"lx";
pub const __FLT_MIN_10_EXP__ = -37;
pub const SIGTTOU = 22;
pub const __INT_LEAST16_MAX__ = 32767;
pub const si_lower = _sifields._sigfault._bounds._addr_bnd._lower;
pub const __UINT32_FMTo__ = c"o";
pub const __UINTPTR_FMTo__ = c"lo";
pub const __INT_LEAST16_FMTd__ = c"hd";
pub const __UINTPTR_FMTx__ = c"lx";
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = 1;
pub const __INT_LEAST64_FMTd__ = c"ld";
pub const __INT_LEAST16_TYPE__ = short;
pub const __attribute_alloc_size__ = params;
pub const __ORDER_BIG_ENDIAN__ = 4321;
pub const __LDBL_MIN_10_EXP__ = -4931;
pub const __INT_LEAST8_MAX__ = 127;
pub const __SIZEOF_INT__ = 4;
pub const __USE_POSIX_IMPLICITLY = 1;
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = 2;
pub const __amd64 = 1;
pub const __OBJC_BOOL_IS_BOOL = 0;
pub const __LDBL_MAX_10_EXP__ = 4932;
pub const __SIZEOF_INT128__ = 16;
pub const __UINT_FAST8_FMTx__ = c"hhx";
pub const __PIE__ = 2;
pub const __SIZEOF_PTHREAD_RWLOCK_T = 56;
pub const __glibc_c99_flexarr_available = 1;
pub const __linux = 1;
pub const __sigset_t_defined = 1;
pub const __UINT16_FMTx__ = c"hx";
pub const __UINTPTR_FMTu__ = c"lu";
pub const __UINT_LEAST16_FMTX__ = c"hX";
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = 4;
pub const __amd64__ = 1;
pub const si_call_addr = _sifields._sigsys._call_addr;
pub const __UINT_FAST32_FMTo__ = c"o";
pub const __linux__ = 1;
pub const __clang__ = 1;
pub const __LP64__ = 1;
pub const __SYSCALL_WORDSIZE = 64;
pub const __PTRDIFF_FMTi__ = c"li";
pub const __LDBL_DIG__ = 18;
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const _BITS_TYPESIZES_H = 1;
pub const SIGXCPU = 24;
pub const SIGILL = 4;
pub const SIGXFSZ = 25;
pub const __UINT64_FMTo__ = c"lo";
pub const __INT_FAST32_FMTd__ = c"d";
pub const _BITS_PTHREADTYPES_ARCH_H = 1;
pub const SIGKILL = 9;
pub const SIGUSR2 = 31;
pub const __ATOMIC_ACQ_REL = 4;
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = 4;
pub const __LONG_LONG_MAX__ = c_longlong(9223372036854775807);
pub const SA_STACK = SA_ONSTACK;
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = 4;
pub const __INO_T_MATCHES_INO64_T = 1;
pub const __GLIBC__ = 2;
pub const SIG_DFL = if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Pointer) @ptrCast(__sighandler_t, 0) else if (@typeId(@typeOf(0)) == @import("builtin").TypeId.Int) @intToPtr(__sighandler_t, 0) else __sighandler_t(0);
pub const __INTMAX_MAX__ = c_long(9223372036854775807);
pub const __UINT_LEAST32_FMTx__ = c"x";
pub const __WORDSIZE = 64;
pub const __WCHAR_MAX__ = 2147483647;
pub const si_uid = _sifields._kill.si_uid;
pub const sigev_notify_function = _sigev_un._sigev_thread._function;
pub const __INT64_MAX__ = c_long(9223372036854775807);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = 2;
pub const __INT_LEAST64_MAX__ = c_long(9223372036854775807);
pub const __UINTMAX_FMTX__ = c"lX";
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = 0;
pub const __FLT_HAS_DENORM__ = 1;
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const si_addr_lsb = _sifields._sigfault.si_addr_lsb;
pub const _SYS_UCONTEXT_H = 1;
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __stack_t_defined = 1;
pub const __INT32_FMTi__ = c"i";
pub const SIG_UNBLOCK = 1;
pub const FP_XSTATE_MAGIC2 = c_uint(1179670597);
pub const __DBL_HAS_INFINITY__ = 1;
pub const __FINITE_MATH_ONLY__ = 0;
pub const timespec = struct_timespec;
pub const sigval = union_sigval;
pub const sigevent = struct_sigevent;
pub const _fpx_sw_bytes = struct__fpx_sw_bytes;
pub const _fpreg = struct__fpreg;
pub const _fpxreg = struct__fpxreg;
pub const _xmmreg = struct__xmmreg;
pub const _fpstate = struct__fpstate;
pub const sigcontext = struct_sigcontext;
pub const _xsave_hdr = struct__xsave_hdr;
pub const _ymmh_state = struct__ymmh_state;
pub const _xstate = struct__xstate;
pub const _libc_fpxreg = struct__libc_fpxreg;
pub const _libc_xmmreg = struct__libc_xmmreg;
pub const _libc_fpstate = struct__libc_fpstate;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_cond_s = struct___pthread_cond_s;
