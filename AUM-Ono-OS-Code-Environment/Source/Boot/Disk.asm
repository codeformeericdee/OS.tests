;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                      ;
; Write to memory from a disk or drive ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;PARAMETERS:
; Al                        | Read this many sectors.
; Cl                        | Sector.
; Ch                        | Cylinder or track.
; Dl                        | Drive.
; Dh                        | Head.
; Parameter_disk_to_address | The label for the address to load to from disk space.

    disk_to_address:dw 0x0

    DISK_TO_MEMORY: ;Function to load disk locations into memory.
pusha ;Push all current registers onto the stack to recall after the function is run.
mov ah, 2 ;Since al is a variable parameter, only ah is hardcoded as an argument for reading from the disk.
xor bx, bx ;Reset the b registers to zero.
mov es, bx ;Reset the extra segment to zero in order to use zero as the base address to offset from.
mov bx, [disk_to_address] ;Move the address given as a parameter to the offset.
int 0x13 ;Interrupt to read the a registers with the read disk format.
jnc .EXIT ;If there are not any carry flags set that means there weren't any errors, so jump to this exit.

    mov ax, 0x0e65 ;If there was a carry flag set, that means there was an error, so add a lowercase e to al with the display instruction in ah.
int 0x10 ;Interrupt to read the a registers with the display format.
cli ;Clear interrupts
hlt ;Halt. Since this can be used in other runtimes, it will allow the use of non-maskable interrupts.

    .EXIT:
popa ;Restore the registers from the stack that were placed onto it at the beginning of this function.
ret ;Return to the location this function was called from.
