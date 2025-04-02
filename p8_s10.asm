IDEAL
STUDENT_NAME equ "__________"


;---------------------------------------------
; 
; Solution for Chapter 8 Work
;  
; This is personal task - Do not share it with others !!! 
;
;----------------------------------------------- 
 
MODEL small


public  aTom1
public  ZeroToNine2
public  ZeroToNine3
public  Array4 
public  BufferFromEx5
public  BufferToEx5
public  BufferFrom6 
public  BufferTo6
public  BufferTo6Len
public  MyLine7
public  Line7Length
public  MyWords7 
public  MyWords7Length 
public  MyQ8
public  MySum8  
public  MySet9  
public  Count1
public  Count2
public  Count3
public  Num10  
public  BinaryStr10  
public  EndGates11 
public  Gate78 
public  Num12A 
public  Num12B 
public  StrNum13 
public  WordNum13 
public  Num14Word 
public  StrWord14 


public  ShowAxDecimal
public  ex1      
public  ex2      
public  ex3      
public  ex4      
public  ex5      
public  ex6      
public  ex7a     
public  ex7b     
public  ex8      
public  ex9      
public  ex10     
public  ex11     
public  ex12     
public  ex13     
public  ex14c 

stack 256
DATASEG

		;exercise 1
		aTom1 db 13 dup(?),"$"

		;exercise 2
		ZeroToNine2 db 10 dup(?),"$"

		;exercise 3
		ZeroToNine3 db 10 dup(?),"$"
		
		;exercise 4
		Array4 db 100 dup(?),"$"
		
		;exercise 5
		BufferFromEx5 db 10 dup(1),"$"
		BufferToEx5 db 10 dup(?),"$"

		;exercise 6
		BufferFrom6 db -15, -8, -3, 0, 2, 5, 8, 10, 11, 12, 13, 15, 18, 21, 25, 30, 35, 40, 50, 55, 60
                db -20, -14, -9, -5, -2, 1, 4, 7, 9, 11, 12, 14, 16, 19, 22, 27, 32, 38, 45, 52, 58
                db -30, -25, -18, -12, -6, -1, 3, 6, 9, 12
				
		BufferTo6 db 50 dup(?),"$"
		BufferTo6Len dw 0
		
		;exercise 7
		MyLine7 db 11, 12, 14, 16, 19, 22, 27, 32, 38, 45, 52, 58, 0dh
		Line7Length db 0
		

		;exercise 7b
		 
		
		
		;exercise 8
		 
		 
		 
		;exercise 9
		 
		 
		 
		;exercise 10
		
		
		
		
		;exercise 11
		True11 db "both 7&8 are 1 ",'$'
		False11 db "at least one of the bits 7,8 is 0",'$'
		
		EndGates11 db ?
		Gate78 db ?
		
		;exercise 12
		Num12A db ?
		Num12B db ?
		
		;exercise 13
		StrNum13 db 6 dup(?),"$"
		WordNum13 db ?
		
		
		
		
		;exercise 14
		Num14Word   dw ?
	 	StrWord14   db ?,?,?,?
		

CODESEG
		

start:
		mov ax, @data
		mov ds,ax


		 

		

		;call ex1
	 
		;call ex2
	 
		;call ex3
	 
		;call ex4
	 
		;call ex5
	 
		;call ex6
	 
		;call ex7a 
		
		;call ex7b
		
		;call ex8
		
		;call ShowAxDecimal
	
		
		;call ex9
	 
		;call ex10
	 
		;call ex11
	 
		;call ex12
	 
		;call ex13
	 
	 
		mov [Num14Word], 0F70Ch  
 		;call ex14c     ; this will call to ex14b and ex14a
	 
		
		
		
		 ; call TTTTTttttttTTT
	 

exit:
		mov ax, 04C00h
		int 21h

		
	 

		
;------------------------------------------------
;------------------------------------------------
;-- End of Main Program ... Start of Procedures 
;------------------------------------------------
;------------------------------------------------


;================================================
; Description -  Move 'a' 'm'  to global var aTom1  
; INPUT: None
; OUTPUT: 
; Register Usage:                  ; only if value might be changed
;================================================
;================================================
; Description -  Move 'a' 'm'  to global var aTom1  
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex1
    push ax 
	push bx
	push cx

	mov si, 0
	mov al, 'a'
	
write_letters:
	mov[aTom1 + si], al
	
	inc si
	inc al
	cmp si, 13
	jne write_letters

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex1


;================================================
; Description: Write numbers from 0 to 9
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex2	
	push ax 
	push bx
	push cx
	
	mov si, 0
	mov al, '0'
	
write_letters1:
	mov[ZeroToNine2 + si], al
	
	inc si
	inc al
	cmp si, 10
	jne write_letters1

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex2


;================================================
; Description: Store numbers from 0 to 9 in memory
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex3
  	push ax 
	push bx
	push cx
	
	mov si, 0
	mov al, 0
	
write_letters2:
	mov[ZeroToNine3 + si], al
	
	inc si
	inc al
	cmp si, 10
	jne write_letters2

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex3


;================================================
; Description: Store value CCh in odd memory locations or multiples of 7
; INPUT: None
; OUTPUT: None
; Register Usage: AX, BX, CX, DL
;================================================
proc ex4
  	push ax 
	push bx
	push cx
	
	mov bx, 0
	mov cx, 100
	
start_loop:	
	mov dl, 7
	xor ax, ax
	
	test bl, 1
	jnz set
	
	mov al, bl
	div dl 
	
	cmp ah, 0
	jne next_call
	
set:
	mov [Array4 + bx], 0cch
	
next_call:
	inc bl
	loop start_loop

@@ret:
	pop cx
	pop bx
	pop ax
    ret
endp ex4


;================================================
; Description: Copy 10 bytes from one buffer to another
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex5
  	push ax 
	push bx
	push cx
	push si
	
	mov si, 0
	mov cx, 10
	
copy_to_buffer:
	mov al, [BufferFromEx5 + si]
	mov [BufferToEx5 + si], al
	inc si
	
	loop copy_to_buffer

@@ret:
	pop cx
	pop bx
	pop ax
	pop si
    ret 
endp ex5






;================================================
; Description: Copy all bytes greater than 12 from BufferFrom6 to BufferTo6
; INPUT: None
; OUTPUT: None
; Register Usage: AX, BX, CX, SI
;================================================
proc ex6
 	push ax 
	push bx
	push cx
	push si
	
	mov si, 0
	mov bx, 0
	mov cx, 50
	
start_loop1:	
	xor al, al
	mov al, [BufferFrom6 + bx]
	cmp al, 12
	jbe next_call1
	
set1:
	mov [BufferTo6 + si], al
	
	inc si
	
next_call1:
	inc bx
	loop start_loop1
	
	mov [BufferTo6Len], si
@@ret:
	pop cx
	pop bx
	pop ax
	pop si
    ret 
endp ex6


;================================================
; Description: Calculate the length of a byte array ending with CR (0Dh)
; INPUT: None
; OUTPUT: None
; Register Usage: AX, BX, CX, SI
;================================================
proc ex7a
 	push ax 
	push bx
	push cx
	push si
	
	mov bx, 0
	
do_again:
	mov al, [MyLine7 + bx]
	cmp al, 0dh
	je finish
	inc bx
	jmp do_again
	
finish:
	mov [Line7Length], bl
	mov ax, bx
	
	pop cx
	pop bx
	pop ax
	pop si
    ret 
endp ex7a


;================================================
; Description: Count the number of words in an array ending with 0DDDDh
; INPUT: None
; OUTPUT: None
; Register Usage: AX, DX
;================================================
proc ex7b

	push ax
	push dx

	mov dx,-2
loop_start_mod:
	add dx,2
	mov ax,[DataArray+dx]
	cmp ax,0DDDDh 
	jne loop_start_mod

	shr dl,1
	
	mov [DataArrayLength],dl

@@ret:
	pop dx
	pop ax
    ret
endp ex7b


;================================================
; Description: Sum all numbers greater than 100 in DataQ8 until 0 is encountered
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex8
	push ax
	push si
	
	xor ax,ax 
	xor si,si 
loop_start_mod8:
	mov al, [offset DataQ8+si]
	inc si
	cmp al,101
	jl skip_add
	add [TotalSum8],ax 
	
skip_add:
	cmp al,0
	jne loop_start_mod8
@@ret:
	pop si
	pop ax
    ret
endp ex8


;================================================
; Description: Count positive, negative, and zero values in DataSet9
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI
;================================================
proc ex9
	push ax 
	push si
	xor si,si
loop_start_mod9:
	mov ax, [DataSet9+si]
	inc si 
	inc si 
	cmp ax,0
	jng check_next
	inc [counterA]
	cmp ax,0ffffh
	jne loop_start_mod9
	jmp exit_loop
	
check_next:
	cmp ax,0
	jz found_zero
	inc [counterB]
	cmp ax,0ffffh
	jne loop_start_mod9
	jmp exit_loop
	
found_zero:
	inc [counterC]
	cmp ax,0ffffh
	jne loop_start_mod9
	jmp exit_loop
exit_loop:

	pop si 
	pop ax 
    ret

endp ex9


;================================================
; Description: Convert a byte value to binary string representation and print it
; INPUT: None
; OUTPUT: None
; Register Usage: AX, SI, CX, DX
;================================================
proc ex10
proc ex10_modified
	push ax
	push si 
	push cx 
	push dx
	xor si,si
	mov cx,8
	
loop_start_mod10:
	shl [value10],1
	JC set_one
set_zero:
	mov [BitStr10+si],0
	mov dl, 30h
	mov ah, 2
	int 21h
	jmp continue_iteration
set_one:
	mov [BitStr10+si],'1'
	mov dl, 31h
	mov ah, 2
	int 21h
continue_iteration:
	inc si 
	loop loop_start_mod10
	
	mov [BitStr10+8],'B'
	mov dl, "B"
	mov ah, 2
	int 21h
	
	pop dx 
	pop cx
	pop si
	pop ax 
    ret
endp ex10






;================================================
; Description: Check if bits 7 and 8 in EndGates11 are set and store result in Gate78
; INPUT: None
; OUTPUT: None
; Register Usage: AX, BX, CX
;================================================
proc ex11
push ax 
push bx
push cx
	mov bx, 11000000b
	mov ax, [EndGates11]
	and ax, bx
	
	cmp ax, bx
	jne Put_F
Put_T:
	mov [Gate78], 'T'
	mov dx, offset True11
	mov ah, 9
	int 21
	
	jmp finish
Put_F:
	mov [Gate78], 'F'
	mov dx, offset False11
	mov ah, 9
	int 21h
		
finish:
    ret
	pop cx
	pop bx
	pop ax
endp ex11


;================================================
; Description: Copy value from Num12A to Num12B if within range 10-70
; INPUT: None
; OUTPUT: None
; Register Usage: AX
;================================================
proc ex12
 	push ax 
	
	mov al, [Num12A]
	cmp al, 10
	jl finish
	cmp al, 70
	jg finish
	mov Num12B, al
finish:	
	pop ax
    ret 
endp ex12


;================================================
; Description: Convert a numeric string to a word value
; INPUT: None
; OUTPUT: None
; Register Usage: AX, BX, CX, SI, DL
;================================================
proc ex13
  	push ax 
	push bx
	push cx
	push si
	
	xor si, si
countLenght:
	mov al, [StrNum13 + si]
	cmp al, '!'
	inc si
	jne countLenght
	
	mov cx, si
	xor si, si
	xor bx, bx
	mov dl, 10
MakeNum:
	mov bl, [StrNum13 + si]
	add bl, '0'
	mul dl
	add ax, bx
	inc si
	loop MakeNum
		
	mov [WordNum13], ax
    pop cx
	pop bx
	pop ax
	pop si
    ret 
endp ex13


;================================================
; Description: Convert lower 4 bits of AL to hexadecimal ASCII character
; INPUT: AL
; OUTPUT: DL (ASCII character)
; Register Usage: AL, DL
;================================================
proc ex14a
    push ax 
    
    and al, 00001111b
    cmp al, 9
    jbe num
    
    sub al, 10      ; תוריד 10 (ולא 'A')
    add al, 'A'     ; תוסיף 'A'
    jmp Finish1
    
num:
    add al, '0'
    
Finish1:
    mov dl, al

    pop ax
    ret
endp ex14a


;================================================
; Description: Convert full byte in AL to two hexadecimal ASCII characters
; INPUT: AL
; OUTPUT: DH, DL (ASCII characters)
; Register Usage: AL, DH, DL
;================================================
proc ex14b
    push ax
    
    rol al, 4
    call ex14a
    mov dh, dl
    
    rol al, 4
    call ex14a

    pop ax
    ret
endp ex14b


;================================================
; Description: Convert word Num14Word to four hexadecimal ASCII characters in StrWord14
; INPUT: Num14Word
; OUTPUT: StrWord14
; Register Usage: AX, DH, DL
;================================================
proc ex14c
    push ax
    mov ax, Num14Word
    call ex14b
    mov [StrWord14 + 3], dl
    mov [StrWord14 + 2], dh
    
    rol ax, 8
    call ex14b
    mov [StrWord14 + 1], dl
    mov [StrWord14 + 0], dh
    pop ax
    ret
endp ex14c








;================================================
; Description: print ax bytes to the screen
; INPUT: bx = pointer to the bytes , ax = how many bytes
; OUTPUT: screen
; Register Usage:  ax ,bx 
;================================================
proc printAxBytes
	push cx
	push dx
	
	mov cx,ax
@@ag:
	mov dl, [bx]
	mov ah,2
	int 21h
	inc bx
	loop @@ag
	
	pop dx
	pop cx
	ret
endp printAxBytes

; guess what this proc does ?
; without good names and lack of description, 
; no comments .... itws very difficult
;================================================
; Description -  ??????????????????????? 
; INPUT: ????
; OUTPUT: ?????
; Register Usage: ????????????
;================================================
proc TTTTTttttttTTT
	
	mov bx,ax
	mov cx,4
CHChchchchc:
	
	mov dx,0f000h
	and dx,bx
	rol dx, 4          
	cmp dl, 9
	ja PPPFFFFpppfffff
	add dl, 48
	jmp ZzzzZzzZZZZ

PPPFFFFpppfffff:	 
	add dl, 55

ZzzzZzzZZZZ:
	mov ah, 2
	int 21h
	shl bx,4
	loop CHChchchchc
	
	ret
endp TTTTTttttttTTT





;================================================
; Description - Write on screen the value of ax (decimal)
;               the practice :  
;				Divide AX by 10 and put the Mod on stack 
;               Repeat Until AX smaller than 10 then print AX (MSB) 
;           	then pop from the stack all what we kept there and show it. 
; INPUT: AX
; OUTPUT: Screen 
; Register Usage:   
;================================================
proc ShowAxDecimal
	push ax
	push bx
	push cx
	push dx

	; check if negative
	test ax,08000h
	jz PositiveAx
		
	;  put '-' on the screen
	push ax
	mov dl,'-'
	mov ah,2
	int 21h
	pop ax

	neg ax ; make it positive
PositiveAx:
	mov cx,0   ; will count how many time we did push 
	mov bx,10  ; the divider

put_mode_to_stack:
	xor dx,dx
	div bx
	add dl,30h
	; dl is the current LSB digit 
	; we cant push only dl so we push all dx
	push dx    
	inc cx
	cmp ax,9   ; check if it is the last time to div
	jg put_mode_to_stack

	cmp ax,0
	jz pop_next  ; jump if ax was totally 0
	add al,30h  
	mov dl, al    
	mov ah, 2h
	int 21h        ; show first digit MSB
	   
pop_next: 
	pop ax    ; remove all rest LIFO (reverse) (MSB to LSB)
	mov dl, al
	mov ah, 2h
	int 21h        ; show all rest digits
	loop pop_next

	mov dl, ','
	mov ah, 2h
	int 21h

	pop dx
	pop cx
	pop bx
	pop ax

	ret
endp ShowAxDecimal

END start
 