;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                              ;
; Displays si with x amount of inserted values ;
;                                              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Parameters:

; Dx                                                                  | The amount of inserts.
; param_displayInsert                                                 | The insert label for before the string. It has a default value of line feed, carriage return, and the OS spec end of array.

    param_displayInsert: Db 0xa, 0xd, 0xff

    DisplaySi:
Mov di, si
    
    .DisplaySiLineLoop:
Mov ah, 0x0e
Cmp dx, 0
Jz .InitializeString

    Mov si, param_displayInsert
call .DisplaySiLoop
sub dx, 1
jmp .DisplaySiLineLoop

    .InitializeString:
mov si, di

    .DisplaySiLoop:
Mov al, [si]
Cmp al, 0xff
Jz .Exit

    int 0x10
inc si
jmp .DisplaySiLoop

    .Exit:
Ret




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                                   ;
; Pads an array with values from ax ;
;                                   ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Parameters:

; param_arrayInsert                                                   | The character, or value to pad the array with.

    param_arrayInsert: Db 0

    ArrayInsert:
Mov byte dl, [param_arrayInsert]

    .ArrayInsertLoop:
Cmp cx, 0
Jz .Exit

    Mov byte [si], dl
Inc si
Sub cx, 1
Jmp .ArrayInsertLoop

    .Exit:
Mov byte [si], 0xff
Ret




;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;
;                       ;
; Displays bx in binary ;
;                       ;
;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;

    ; Registers:

; Bx                                                                  | The number to convert to binary.

    ; Parameters:

; param_displayBinaryInsert                                           | The default bit value for not equal.

    param_displayBinaryInsert: Db 0
    
    local_displayBinaryNineBytes: Db 0, 0, 0, 0, 0, 0, 0, 0, 0        ; Octet label for displaying.
    
    DisplayBinary:
Pusha
Mov byte dl, [param_displayBinaryInsert]
Mov byte [param_arrayInsert], dl
Mov si, local_displayBinaryNineBytes
Mov cx, 8

    Call ArrayInsert

    Mov si, local_displayBinaryNineBytes
Mov ax, 0x80                                                          ; Start at 128.
Mov cx, 2                                                             ; Divisor.

    .DisplayBinaryLoop:
Cmp bx, 0
Jz .Exit

    Cmp bx, ax
Jg .Higher
Jl .Lower
Jz .Equals

    .Higher:
Mov byte [si], '1'
Inc si
Sub bx, ax
XOR dx, dx                                                            ; This register must be set to zero for the remainder output.
Div cx
Jmp .DisplayBinaryLoop

    .Lower:
Mov byte dl, [param_displayBinaryInsert]
Mov byte [si], dl
Inc si
XOR dx, dx                                                            ; This register must be set to zero for the remainder output.
Div cx
Jmp .DisplayBinaryLoop

    .Equals:
Mov byte [si], '1'
    
    .Exit:
Mov dx, 1
Mov si, local_displayBinaryNineBytes
Call DisplaySi
Popa
Ret