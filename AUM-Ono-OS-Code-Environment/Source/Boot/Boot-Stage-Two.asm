    org 0x5100 ;Set the instruction pointer.
bits 16 ;Use 16 bits.
int 0x10 ;Supply an indication that the second stage boot loader is starting.
cmp ax, 0x0e31 ;Check if ax has been set per the specification of this OS (similar to bit flipping).
jz END_BOOT_STAGE_TWO_HEADER ;If equal, start the process.

    BOOT_STAGE_TWO_HEADER: ;If not equal, run the header.
mov bx, cs ;Move the code into bx.
mov ds, bx ;Place bx into data.
inc ax ;Increment ax to indicate each line was operated on.
jmp 0x5100 ;Jump back to the origin.

    %include '/root/env/AUM-Ono-OS-Code-Environment/Source/Boot/Kernel.asm'

    END_BOOT_STAGE_TWO_HEADER: ;Signal to start the kernel hardware setup.
jmp 0x0:KERNEL_SETUP ;Double check that the address has been set properly.

    KERNEL_SETUP: ;Start the kernel hardware setup.
mov ax, 0x0e42 ;Move a capital b into al with the display instruction in ah.
int 0x10 ;Interrupt to read ax.

    call KERNEL

jmp $ ;Stall.

    times 512 - ($ - $$) db 0 ;Set the file size to exactly 512 bytes by padding to that point.
