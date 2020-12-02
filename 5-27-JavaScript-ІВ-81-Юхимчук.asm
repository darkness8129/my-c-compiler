
.486
.model flat, stdcall
option casemap : none

include \masm32\include\windows.inc
include \masm32\macros\macros.asm
include \masm32\include\masm32.inc
include \masm32\include\gdi32.inc
include \masm32\include\user32.inc
include \masm32\include\kernel32.inc
include \masm32\include\msvcrt.inc
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\gdi32.lib
includelib \masm32\lib\user32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\msvcrt.lib


.data?
    a dd ?
	b dd ?


.code
start:
    call main
    exit

multiply proc num1:DWORD, num2:DWORD
    mov eax, num1
    cdq
    imul num2
    ret
multiply endp 

divide proc num1:DWORD, num2:DWORD
  mov eax, num1
  cdq
  idiv num2
  ret
divide endp

xorOperation proc num1:DWORD, num2:DWORD
  mov eax, num1
  xor eax, num2
  ret
xorOperation endp

negation proc num1: DWORD
    cmp num1, 0
    je equal
    jne notequal

    equal:
        mov eax, 1
        ret

    notequal:
        xor eax, eax
        ret
    ret
negation endp

main proc

    mov eax, undefined
	push eax
	pop a
	invoke multiply, a, 1
	push eax
	pop b
	mov eax, 1
	push eax

    pop eax
    print str$(eax)
    print chr$(13, 10)
    mov eax, input("ENTER to continue. . . ")

    ret
main endp
end start