/**
 * @file  context.h
 * @brief Declarations of context switching functions.
 */
/*
 * Copyright 2015 Jonathan Anderson
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef CONTEXT_H
#define CONTEXT_H

#include "pcb.h"

/**
 * Save the current execution context (with previous PC on the stack, as in
 * an exception handler) into a @ref pcb.
 */
void	context_save(struct pcb *);

/**
 * Restore a @ref pcb to the current execution context: change stack, set up
 * registers and program counter, etc., and then use the `reti` instruction
 * to "resume" running with interrupts enabled as per normal.
 */
void	context_restore(struct pcb *);

#endif