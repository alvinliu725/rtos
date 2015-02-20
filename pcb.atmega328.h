/**
 * @file  pcb.atmega328.h
 * @brief Declaration of the ATmega328[p] process control block (PCB).
 */
/*
 * Copyright 2015 Jonathan Anderson
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef PCB_ATMEGA328_H
#define PCB_ATMEGA328_H

#include <inttypes.h>

/**
 * A process control block (PCB) for an Atmel ATmega328[p].
 *
 * This data structure is packed so that our context-switching code can treat
 * it as an array of bytes.
 */
struct __attribute__((__packed__)) pcb
{
	/** Stack pointer. */
	int16_t p_sp;

	/** General-purpose registers. */
	int8_t	p_r0;
	int8_t	p_r1;
	int8_t	p_r2;
	int8_t	p_r3;
	int8_t	p_r4;
	int8_t	p_r5;
	int8_t	p_r6;
	int8_t	p_r7;
	int8_t	p_r8;
	int8_t	p_r9;
	int8_t	p_r10;
	int8_t	p_r11;
	int8_t	p_r12;
	int8_t	p_r13;
	int8_t	p_r14;
	int8_t	p_r15;
	int8_t	p_r16;
	int8_t	p_r17;
	int8_t	p_r18;
	int8_t	p_r19;
	int8_t	p_r20;
	int8_t	p_r21;
	int8_t	p_r22;
	int8_t	p_r23;
	int8_t	p_r24;
	int8_t	p_r25;
	int8_t	p_r26;
	int8_t	p_r27;
	int8_t	p_r28;
	int8_t	p_r29;
	int8_t	p_r30;
	int8_t	p_r31;

	/** Status register. */
	int8_t	p_sreg;

	/** Program counter. */
	int16_t	p_pc;
};

#endif