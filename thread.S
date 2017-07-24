//Copyright 2017 - Ren Kimura (@RKX1209)

#define __ASSEMBLY__

#include "defines.h"
#define STACK_SIZE 4096

.text
.global stack_create
stack_create:
    movq $0, %rdi
    movq $(STACK_SIZE), %rsi
    movq $(PROT_WRITE | PROT_READ), %rdx
    movq $(MAP_ANONYMOUS | MAP_PRIVATE | MAP_GROWSDOWN), %r10
    movq $(SYS_mmap), %rax
    syscall
    ret

.global thread_create
thread_create:
    pushq %rdi
    call stack_create
    leaq STACK_SIZE-8(%rax), %rsi
    popq (%rsi)
    movq $(CLONE_VM | CLONE_FS | CLONE_FILES | CLONE_SIGHAND | \
         CLONE_PARENT | CLONE_THREAD | CLONE_IO), %rdi
    mov $(SYS_clone), %rax
    syscall
    ret

.global exit
exit:
    xorq %rdi, %rdi
    movq $SYS_exit, %rax
    syscall
