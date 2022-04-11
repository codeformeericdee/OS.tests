    KERNEL:
Mov dx, 1
Mov si, OS_WELCOME

    Call DISPLAY_SI

    Mov byte [Parameter_display_binary_insert], '0' 
Mov bx, 0xff 

    Call DISPLAY_BINARY

    Mov byte [Parameter_display_binary_insert], '-' 
Mov bx, 0x80 

    Call DISPLAY_BINARY

    Mov byte [Parameter_display_binary_insert], '_' 
Mov bx, 0x51

    Call DISPLAY_BINARY

    Mov byte [Parameter_display_binary_insert], '!' 
Mov bx, 0x10 

    Call DISPLAY_BINARY

Ret

;;;;;;;;;;;;;;;;;;;;;;;
;                     ;
; Application strings ;
;;;;;;;;;;;;;;;;;;;;;;;

    OS_WELCOME:
db "Welcome to AUM Ono's 16 bit operating system.", 0xff


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                             ;
; Display si with x amount of inserted values ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;PARAMETERS:
; Dx                       | The amount of inserts.
; Parameter_display_insert | The insert label for before the string. It has a default value of line feed, carriage return, and the OS spec end of array.



    Parameter_display_insert:Db 0xa, 0xd, 0xff

    DISPLAY_SI:
Mov di, si
.lineLoop:
Mov ah, 0x0e
Cmp dx, 0
Jz .initializeString

    Mov si, Parameter_display_insert
call .siLoop
sub dx, 1
jmp .lineLoop

    .initializeString:
mov si, di
.siLoop:
Mov al, [si]
Cmp al, 0xff
Jz .exit

    int 0x10
inc si
jmp .siLoop

    .exit:
Ret


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                  ;
; Pad an array with values from ax ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;PARAMETERS:
; Parameter_array_insert | The character, or value to pad the array with.



    Parameter_array_insert:Db 0

    ARRAY_INSERT:
Mov byte dl, [Parameter_array_insert]
.loop:
Cmp cx, 0
Jz .exit

    Mov byte [si], dl
Inc si
Sub cx, 1
Jmp .loop

    .exit:
Mov byte [si], 0xff
Ret


;;;;;;;;;;;;;;;;;;;;;;;;
;                      ;
; Display bx in binary ;
;;;;;;;;;;;;;;;;;;;;;;;;

    ;PARAMETERS:
; Bx                              | The number to convert to binary.
; Parameter_display_binary_insert | The default bit value for not equal.



    Parameter_display_binary_insert:Db 0
    
    Local_display_binary_nine_bytes:Db 0, 0, 0, 0, 0, 0, 0, 0, 0 ;Octet label for displaying.
    
    DISPLAY_BINARY:
Pusha
Mov byte dl, [Parameter_display_binary_insert]
Mov byte [Parameter_array_insert], dl
Mov si, Local_display_binary_nine_bytes
Mov cx, 8

    Call ARRAY_INSERT

    Mov si, Local_display_binary_nine_bytes
Mov ax, 0x80 ;Start at 128.
Mov cx, 2 ;Divisor.
.loop:
Cmp bx, 0
Jz .exit

    Cmp bx, ax
Jg .higher
Jl .lower
Jz .equal

    .higher:
Mov byte [si], '1'
Inc si
Sub bx, ax
XOR dx, dx ;This register must be set to zero for the remainder output.
Div cx
Jmp .loop

    .lower:
Mov byte dl, [Parameter_display_binary_insert]
Mov byte [si], dl
Inc si
XOR dx, dx ;This register must be set to zero for the remainder output.
Div cx
Jmp .loop

    .equal:
Mov byte [si], '1'
.exit:
Mov dx, 1
Mov si, Local_display_binary_nine_bytes
Call DISPLAY_SI
Popa
Ret
