			#include<p18f4550.inc>

loop1 		set 0x00
loop2 		set 0x01

			org 0x00
			goto start
			org 0x08
			retfie
			org 0x18
			retfie

nothing 	macro n
			variable i
i=0
			while i < n
			nop
i+=1
			endw
			endm


start		call	delay
			


delay 		MOVLW 	D'250' 	;29msec delay
			MOVWF 	loop2,A ;20MHz
again 		MOVLW 	D'20'
			MOVWF 	loop1,A
again2		nothing D'26'
			DECFSZ 	loop1,F,A
			BRA 	again2
			DECFSZ 	loop2,F,A
			BRA 	again
			NOP
			RETURN
			end
			