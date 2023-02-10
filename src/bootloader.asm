[bits 16] ; 16-bit code
[org 0x7c00] ; bootloader offset

mov bx, TEXT
call print

; functions
print:
    pusha ; save registers

    start:
        mov al, [bx] ; 'bx' is the base address for the string
        cmp al, 0 ; check if we've reached the end of the string
        je end ; if so, jump to 'done'

        mov ah, 0x0e ; change the BIOS routine to "Teletype Output"
        int 0x10 ; call the BIOS routine

        inc bx ; increment the base address
        jmp start ; jump back to the start of the loop
    
    end:
        ret ; return from the function

    popa ; restore registers

; constants
TEXT db "ASDF", 0

times 510 - ($ - $$) db 0 ; pad to 510 bytes
dw 0xaa55 ; boot signature