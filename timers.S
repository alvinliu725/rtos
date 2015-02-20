; @file  timers.S
; @brief Interrupt service routines (ISRs) for timer interrupts

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

;
; Interrupt handler for the Timer 1 comparison match condition.
; We use this timer to indicate that it's time to switch tasks.
;
; The name is dictated by avr-libc to get it into the interrupt vector.
;
.global TIMER1_COMPA_vect

TIMER1_COMPA_vect:
	;
	; Save the register file.
	;
	; 'context_save' leaves a pointer to the register array in r24 and r25,
	; ready for a call into C code.
	;
	call	context_save

	; Set up R1 for C code (which expects that R1=0)
	eor	r1, r1

	; Create a C-compatible stack frame.
	push	r1
	push	r1
	in	r28, 0x3d
	in	r29, 0x3e

	call	scheduler_tick