


bits 16
START_OF_HEADER:
    jmp 0x7c0:BOOTLOADER
%include "/root/env/AUM-Ono-OS-Code-Environment/Source/Boot/Disk.asm"
END_OF_HEADER:
BOOTLOADER:
    mov ax, 0x0e31
    int 0x10
    mov cl, 2 ;Read sector #2.
    mov ch, 0 ;Read from cylinder #0.
    mov dl, 0 ;Read from drive #0.
    mov dh, 0 ;Read from head #0.
    mov al, 1 ;Read 1 sector.
    mov bx, 0x5100
    mov [disk_to_address], bx
    call DISK_TO_MEMORY
    jmp 0:0x5100

times 510 - ($ - $$) db 0
db 0x55
db 0xaa
