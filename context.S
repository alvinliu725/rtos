; @file  context.S
; @brief Implementation of ATmega328[p] context switching.

;
; Copyright 2015 Jonathan Anderson
;
; Licensed under the Apache License, Version 2.0 (the "License");
; you may not use this file except in compliance with the License.
; You may obtain a copy of the License at
;
;     http://www.apache.org/licenses/LICENSE-2.0
;
; Unless required by applicable law or agreed to in writing, software
; distributed under the License is distributed on an "AS IS" BASIS,
; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
; See the License for the specific language governing permissions and
; limitations under the License.
;

#include <avr/io.h>


.extern saved_registers


.section .text

;
; Save the current execution context (with previous PC on the stack, as in
; an exception handler) into a PCB that looks like an array of registers.
;
; On completion, leaves a pointer to the PCB in r24-25.
;
.global context_save
context_save:
	; Save the 'Y' and 'Z' pointer register pairs.
	push	YL
	push	YH
	push	ZL
	push	ZH

	; Save the status register.
	in	YL, 0x3f
	push	YL

	; Load the address of 'saved_registers' into Z.
	ldi	ZL, lo8(saved_registers)
	ldi	ZH, hi8(saved_registers)

	; Save the stack pointer (not counting saved Y, Z, SREG or PCs)
	in	YL, 0x3D
	in	YH, 0x3E
	adiw	YL, 9	; ignore PC of caller *and* interrupt return location
	st	Z+, YL
	st	Z+, YH

	; Save the numbered registers.
	st	Z+, r0
	st	Z+, r1
	st	Z+, r2
	st	Z+, r3
	st	Z+, r4
	st	Z+, r5
	st	Z+, r6
	st	Z+, r7
	st	Z+, r8
	st	Z+, r9
	st	Z+, r10
	st	Z+, r11
	st	Z+, r12
	st	Z+, r13
	st	Z+, r14
	st	Z+, r15
	st	Z+, r16
	st	Z+, r17
	st	Z+, r18
	st	Z+, r19
	st	Z+, r20
	st	Z+, r21
	st	Z+, r22
	st	Z+, r23
	st	Z+, r24
	st	Z+, r25
	st	Z+, r26
	st	Z+, r27

	; Retrieve the status word from the stack
	pop	r0

	; Use the 'X' pointer registers to save 'Y' and 'Z'.
	movw	XL, ZL

	pop	ZH
	pop	ZL
	pop	YH
	pop	YL

	st	X+, r28
	st	X+, r29
	st	X+, r30
	st	X+, r31

	; Save the status word
	st	X+, r0

	;
	; Finally, save the PC that we came from before this call.
	;
	; context_save is called from places like interrupt handlers, which
	; start running with a PC saved on the stack. We want to put
	; that PC into our saved_registers, but the top of the stack is
	; currently the PC that context_save was called from, i.e.,
	; the next instruction in the interrupt handler, etc.
	;
	; Do a little dance to save the correct PC.
	;
	pop	YH	; this is the caller's return point
	pop	YL
	pop	ZH	; this is the PC we want to save
	pop	ZL

	st	X+, ZL
	st	X, ZH

	push	YL	; put the caller's PC back on the stack
	push	YH

	;
	; Now, prepare for a call into C code with the signature:
	; void fn(int8_t *registers)
	;

	; Restore the 'R1=0' invariant.
	eor	r1, r1

	; Load the address of 'saved_registers' into parameter registers.
	ldi	r24, lo8(saved_registers)
	ldi	r25, hi8(saved_registers)

	ret



;
; Restore the state of the processor from a PCB, which we treat as an
; array of register values. Takes one parameter according to the C calling
; convention: a pointer in r24-25 that points to the PCB.
;
.global context_restore

context_restore:
	; Put the PCB pointer (C parameter) into Z
	movw	ZL, r24

	; Restore the stack pointer.
	ld	YL, Z+
	ld	YH, Z+
	out	0x3D, YL
	out	0x3E, YH

	; Push the target PC on the stack.
	ldd	XL, Z+33	; position 35 in PCB, but Z has been
	ldd	XH, Z+34	; incremented twice when getting the SP
	push	XL
	push	XH

	; Load numbered registers up to Y
	ld	r0, Z+
	ld	r1, Z+
	ld	r2, Z+
	ld	r3, Z+
	ld	r4, Z+
	ld	r5, Z+
	ld	r6, Z+
	ld	r7, Z+
	ld	r8, Z+
	ld	r9, Z+
	ld	r10, Z+
	ld	r11, Z+
	ld	r12, Z+
	ld	r13, Z+
	ld	r14, Z+
	ld	r15, Z+
	ld	r16, Z+
	ld	r17, Z+
	ld	r18, Z+
	ld	r19, Z+
	ld	r20, Z+
	ld	r21, Z+
	ld	r22, Z+
	ld	r23, Z+
	ld	r24, Z+
	ld	r25, Z+
	ld	r26, Z+
	ld	r27, Z+
	ld	r28, Z+
	ld	r29, Z+

	; Save to-be-restored state of X: we need X to restore the remaining
	; registers (e.g., Z, which we had been using).
	push	XL
	push	XH
	movw	XL, ZL

	; Restore Z.
	ld	r30, X+
	ld	r31, X+

	; Restore the status register.
	push	r0
	ld	r0, X
	out	0x3f, r0
	pop	r0

	; Restore X from the stack.
	pop	XH
	pop	XL

	; At this point we should be left with the PC-to-restore on the stack.
	reti