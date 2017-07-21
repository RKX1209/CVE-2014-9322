//mmap
#define PROT_READ           1
#define PROT_WRITE          2
#define PROT_EXEC           4
#define MAP_FIXED           0x10
#define MAP_ANONYMOUS       0x20
#define MAP_PRIVATE         0x02
#define MAP_GROWSDOWN       0x100

//clone
#define CLONE_VM            0x100
#define CLONE_FS            0x200
#define CLONE_FILES         0x400
#define CLONE_SIGHAND       0x800
#define CLONE_PARENT        0x8000
#define CLONE_THREAD        0x10000
#define CLONE_IO            0x80000000

//syscall
#define SYS_mmap            9
#define SYS_nanosleep       35
#define SYS_clone           56
#define SYS_exit            60
#define SYS_modify_ldt      154

//segment
#define FALSE_SS_BASE       0x10000UL
#define MAP_SIZE            0x10000
