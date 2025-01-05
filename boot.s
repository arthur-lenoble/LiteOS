; boot.s
BITS 16
ORG 0x7C00

start:
    mov ax, 0x07C0
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 0x07C0
    mov ds, ax
    mov es, ax

    call load_kernel

    jmp $

load_kernel:
    mov bx, 0x1000
    mov ah, 0x02
    mov al, 1
    mov ch, 0
    mov cl, 2
    mov dh, 0
    int 0x13
    ret

times 510-($-$$) db 0
dw 0xAA55
