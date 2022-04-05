

bits 16 
    jmp 0x7c0:Bootloader
%include "/root/env/AUM-Ono-OS-Code-Environment/Source/Boot/Disk.asm"
Bootloader:
    mov ax, 0x0e31
    int 0x10
    call DISK_TO_MEMORY
    jmp 0:0x5100

times 510 - ($-$$) db 0
db 0x55
db 0xaa
