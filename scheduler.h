/**
 * @file  scheduler.h
 * @brief Declarations of task scheduling functions.
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

#ifndef SCHEDULER_H
#define SCHEDULER_H

#include <stdbool.h>

#include "task.h"


/** Allow a maximum of 255 tasks on the Arduino platform. */
typedef int8_t	task_count;


/** Initialize scheduler-internal data structures. */
bool		scheduler_init(task_count tasks);

/**
 * Create a new (named) task.
 *
 * @param  name      user-meaningful task name
 * @param  run       function pointer to function that begins the task
 */
struct task*	scheduler_create_task(const char *name, void (*run)(void*));

/**
 * Start running scheduled jobs.
 *
 * This function should never finish running.
 */
void		scheduler_run(void);

/**
 * A scheduling timer has fired: make a scheduling decision.
 */
void		scheduler_tick(struct pcb *);


#endif