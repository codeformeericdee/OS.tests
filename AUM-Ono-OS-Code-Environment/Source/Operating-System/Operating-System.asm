    %include "/root/env/AUM-Ono-OS-Code-Environment/Source/Headers/Boot-Addresses.asm" ; Includes labels for developer definitions.

    org ADDRESS_OF_OS
bits 16
cmp ax, 0x63
jnz WRONG_OP_CODE
jmp OperatingSystem

    WRONG_OP_CODE:
mov ax, 0x0e57 ; If the serial number does not match:
int 0x10       ; Interrupt to read the a registers with the display format.
cli            ; Clear interrupts
hlt            ; Halt/allow non-maskable interrupts.

%include "/root/env/AUM-Ono-OS-Code-Environment/Source/BIOS/Display.asm"

    OperatingSystem:
Mov dx, 1
Mov si, OS_WELCOME

    Call DisplaySi

    Mov byte [param_displayBinaryInsert], '0' 
Mov bx, 0xff 

    Call DisplayBinary

    Mov byte [param_displayBinaryInsert], '-' 
Mov bx, 0x80 

    Call DisplayBinary

    Mov byte [param_displayBinaryInsert], '_' 
Mov bx, 0x51

    Call DisplayBinary

    Mov byte [param_displayBinaryInsert], '!' 
Mov bx, 0x10 

    Call DisplayBinary

jmp $




;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;
;                     ;
; Application strings ;
;                     ;
;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

    OS_WELCOME:
db "Welcome to AUM Ono's 16 bit operating system.", 0xff

    times 512 - ($ - $$) db 0                               ; Set the file size to exactly 512 bytes by padding to that point.