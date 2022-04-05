

; Requires parameters to continue.
DISK_TO_MEMORY:
    pusha
    mov dh, 0 ;Head
    mov dl, 0 ;Drive
    mov ch, 0 ;Cylinder or track
    mov cl, 2 ;Sector

    xor bx, bx     ;Segment clear
    mov es, bx     ;Make bx readable
    mov bx, 0x5100 ;Address expected to find the kernel
    mov ah, 2      ;Argument for reading disk
    mov al, 1      ;Read this many sectors
    int 0x13       ;BIOS read disk

    jnc .EXIT
    mov ax, 0x0e65
    int 0x10
    jmp $

    .EXIT:
    popa
    ret
