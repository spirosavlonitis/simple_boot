VIDEO_MEMORY	equ	0xb8000
WHITE_ON_BLACK	equ	0x0f

print_string_pm:
	pusha
	mov	edx, VIDEO_MEMORY
 print_pm_loop:
	mov	al, [ebx]
	mov	ah, WHITE_ON_BLACK
	cmp	al, 0
	je	print_string_pm_end
	mov	[edx], ax
	inc	ebx
	add	edx, 2
	jmp	print_pm_loop
 print_string_pm_end:
	popa
	ret
