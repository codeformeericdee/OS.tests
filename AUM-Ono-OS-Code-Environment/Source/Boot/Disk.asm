;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                       ;
; Writes to memory from a disk or drive ;
;                                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Registers:
    
; al                             | Read this many sectors.
; cl                             | Sector.
; ch                             | Cylinder or track.
; dl                             | Drive.
; dh                             | Head.
; Parameter: param_diskToAddress | The label for the address to load to from disk space.

    param_diskToAddress: dw 0

    DiskToMemory:                ; Function to load disk locations into memory.
pusha                            ; Push all current registers onto the stack to recall after the function is run.
mov ah, 2                        ; Since al is a variable parameter, only ah is hardcoded as an argument for reading from the disk.
xor bx, bx                       ; Reset the b registers to zero.
mov es, bx                       ; Reset the extra segment to zero in order to use zero as the base address to offset from.
mov bx, [param_diskToAddress]    ; Move the address given as a parameter to the offset.
int 0x13                         ; Interrupt to read the a registers with the read disk format.
jnc .Exit                        ; If there are not any carry flags set that means there weren't any errors, so jump to this exit.

    mov ax, 0x0e65               ; If there was a carry flag set, that means there was an error, so add a lowercase e to al with the display instruction in ah.
int 0x10                         ; Interrupt to read the a registers with the display format.
cli                              ; Clear interrupts
hlt                              ; Halt. Since this can be used in other runtimes, it will allow the use of non-maskable interrupts.

    .Exit:
popa                             ; Restore the registers from the stack that were placed onto it at the beginning of this function.
ret                              ; Return to the location this function was called from.