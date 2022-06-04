    %include "/root/env/AUM-Ono-OS-Code-Environment/Source/Headers/Boot-Addresses.asm" ; Includes labels for developer definitions.

    org ADDRESS_OF_KERNEL                                   ; Set the instruction pointer.
bits 16                                                     ; Use 16 bits.
int 0x10                                                    ; Supply an indication that the second stage boot loader is starting.
cmp ax, 0x0e31                                              ; Check if ax has been set per the specification of this OS (similar to bit flipping).
jz END_BOOT_STAGE_TWO_HEADER                                ; If equal, start the process.

    BOOT_STAGE_TWO_HEADER:                                  ; If not equal, run the header.
mov bx, cs                                                  ; Move the code into bx.
mov ds, bx                                                  ; Place bx into data.
inc ax                                                      ; Increment ax to indicate each line was operated on.
jmp ADDRESS_OF_KERNEL                                       ; Jump back to the origin.

    %include "/root/env/AUM-Ono-OS-Code-Environment/Source/Boot/Disk.asm"                         ; Includes code to read into RAM from the disk.

    END_BOOT_STAGE_TWO_HEADER:                              ; Signal to start the kernel hardware setup.
jmp 0:OPERATING_SYSTEM_SETUP                                ; Double check that the address has been set properly.

    OPERATING_SYSTEM_SETUP:                                 ; Start the kernel hardware setup.
mov ax, 0x0e42                                              ; Move a capital b into al with the display instruction in ah.
int 0x10                                                    ; Interrupt to read ax.

mov cl, 3                                                   ; Read sector #3.
mov ch, 0                                                   ; Read from cylinder #0.
mov dl, 0                                                   ; Read from drive #0.
mov dh, 0                                                   ; Read from head #0.
mov al, 1                                                   ; Read 1 sector.
xor bx, bx
mov bx, ADDRESS_OF_OS                                       ; Move the address of the second stage boot process into bx as per the specification of this OS.
mov [param_diskToAddress], bx                               ; Move that address into a parameter label for the disk function to recall.
    
    call DiskToMemory

mov ax, 0x63                                                ; Validates the OS/Acts as a serial number.
xor bx, bx                                                  ; Restore the b registers to zero.
xor cx, cx                                                  ; Restore the c registers to zero.
xor dx, dx                                                  ; Restore the d registers to zero.
mov es, bx                                                  ; Restore the Extra segment to zero - needed.
mov fs, bx                                                  ; Restore the Extra segment2 to zero.
mov gs, bx                                                  ; Restore the Extra segment3 to zero.
mov ds, bx                                                  ; Restore the Data segment to zero - needed.
mov ss, bx                                                  ; Restore the Stack segment (Stack address, data, and return addresses) to zero.
jmp 0:ADDRESS_OF_OS                                         ; Jump to the OS.

    times 512 - ($ - $$) db 0                               ; Set the file size to exactly 512 bytes by padding to that point.