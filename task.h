/**
 * @file  task.h
 * @brief Declaration of the @ref task structure.
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

#ifndef TASK_H
#define TASK_H

#include <stdbool.h>

#include "pcb.h"

/**
 * A task (thread) that can be executed independently of others.
 *
 * This is a portable representation: the MCU-specific parts should all be
 * inside of pcb.h (or the files it includes).
 */
struct task
{
	/**
	 * User-readable name.
	 */
	char		 *t_name;

	/**
	 * The task is currently blocked from running (e.g., waiting for
	 * an I/O or IPC event).
	 */
	bool		  t_blocked;

	/** Where to start the task on its first run. */
	void		(*t_run)();

	/** The base of this task's stack. */
	int8_t		 *t_stack;

	/**
	 * Saved state from previous execution.
	 */
	struct pcb	  t_pcb;

	/** Reference count. */
	int		  t_ref;
};

#endif