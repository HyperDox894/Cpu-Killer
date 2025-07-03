section .text
global cpu_overheat_kill_code
cpu_overheat_kill_code:
    ; Prologue
    push    rbp
    mov     rbp, rsp
    sub     rsp, 0x10

    ; Initialize registers and memory
    mov     rax, 0x0            ; Initialize rax to 0
    mov     rdi, 0x0            ; Initialize rdi to 0
    mov     qword [rbp-0x4], 0xFFFFFFFF  ; Initialize memory to 0xFFFFFFFF
    mov     qword [rbp-0x8], 0xFFFFFFFF
    mov     qword [rbp-0xC], 0xFFFFFFFF
    mov     qword [rbp-0x110], 0xFFFFFFFF
    mov     qword [rbp-0x114], 0xFFFFFFFF
    mov     qword [rbp-0x118], 0xFFFFFFFF
    mov     qword [rbp-0x11C], 0xFFFFFFFF

    ; Set the value of the MSR_IA32_MISC_ENABLE register
    mov     eax, 0xe4f0a4e4
    mov     r8d, eax
    mov     rax, r8

    ; Check bit 21 (cpu temp limit is disabled)
    bt      rax, 21
    jl      jump_label

    ; Set eax to 1 if bit 21 = 1
    mov     eax, 1
    jmp     end_label

jump_label:
    ; Set eax to 0 if bit 21 = 0
    xor     eax, eax

end_label:
    ; Load fence
    lfence

    ; Write model specific register
    wrmsr

    ; Epilogue
    leave
    ret
