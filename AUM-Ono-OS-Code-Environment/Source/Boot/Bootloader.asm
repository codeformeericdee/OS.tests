    bits 16 ;Set the bit limit.
BOOTLOADER_HEADER: ;Initial settings.
jmp 0x7c0:END_BOOTLOADER_HEADER ;Jump to the magic number address offset end label. If this sector has been loaded into the boot sector, it will be found.

    %include "/root/env/AUM-Ono-OS-Code-Environment/Source/Boot/Disk.asm" ;Include code to read from the disk and into memory.

    END_BOOTLOADER_HEADER: ;The code for loading the second stage of the boot process and use more than 512 bytes.
mov ax, 0x0e62 ;Move a lowercase b into al with the display instruction in ah.
int 0x10 ;Interrupt to read ax.
mov cl, 2 ;Read sector #2.
mov ch, 0 ;Read from cylinder #0.
mov dl, 0 ;Read from drive #0.
mov dh, 0 ;Read from head #0.
mov al, 1 ;Read 1 sector.
mov bx, 0x5100 ;Move the address of the second stage boot process into bx as per the specification of this OS.
mov [disk_to_address], bx ;Move that address into a parameter label for the disk function to recall.

    call DISK_TO_MEMORY ;Run the disk function to read from the designated disk locations into its recall address.

    mov ax, 0x0e30 ;Set ax per the specification of this OS - needed.
xor bx, bx ;Restore the b registers to zero.
xor cx, cx ;Restore the c registers to zero.
xor dx, dx ;Restore the d registers to zero.
mov es, bx ;Restore the Extra segment to zero - needed.
mov fs, bx ;Restore the Extra segment2 to zero.
mov gs, bx ;Restore the Extra segment3 to zero.
mov ds, bx ;Restore the Data segment to zero - needed.
mov ss, bx ;Restore the Stack segment (Stack address, data, and return addresses) to zero.
jmp 0:0x5100 ;Jump to the address of the second stage boot process as per the specification of this OS.

    times 510 - ($ - $$) db 0 ;Set the file size to exactly 510 bytes by padding to that point.
db 0x55 ;Add one byte to the file for 511 bytes that is part of the global standard to instruct a computer to boot.
db 0xaa ;Add one byte to the file for 512 bytes that is part of the global standard to instruct a computer to boot.
