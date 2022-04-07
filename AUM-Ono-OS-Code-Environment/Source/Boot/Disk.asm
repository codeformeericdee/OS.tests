


;PARAMETERS:
;al - Read this many sectors
;cl - Sector
;ch - Cylinder or track
;dl - Drive
;dh - Head
disk_to_address:dw 0x0 ; - Label for address to load to 
DISK_TO_MEMORY:
    pusha
    mov ah, 2      ;Argument for reading disk
    xor bx, bx     ;Segment clear
    mov es, bx     ;Make bx readable
    mov bx, [disk_to_address] ;Address expected to find the kernel
    int 0x13       ;BIOS read disk

    jnc .EXIT
    mov ax, 0x0e65
    int 0x10
    jmp $

    .EXIT:
    popa
    ret
