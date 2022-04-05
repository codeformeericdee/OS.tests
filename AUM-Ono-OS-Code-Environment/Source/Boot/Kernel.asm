

bits 16
    org 0x5100
    mov ax, 0x0e32
    int 0x10

times 512 - ($-$$) db 0
