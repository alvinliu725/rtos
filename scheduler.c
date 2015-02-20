/**
 * @file  scheduler.c
 * @brief Definitions of task scheduling functions.
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

#include <assert.h>
#include <inttypes.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#include <avr/io.h>

#include "context.h"
#include "scheduler.h"
#include "serial.h"

static struct task **tasks = NULL;
static size_t max_tasks = 0;
static size_t current_task;



/** Run a @ref task, overwriting the current execution context. */
static void activate(struct task*);

/** Perform initial setup of the scheduler timer. */
static bool setup_timer();


bool
scheduler_init(task_count n)
{
    /*
     * Initialize `tasks`, `max_tasks` and `current_task`.
     */
    current_task = 0;
    max_tasks = n;
    //get rid of any existing tasks
    if(tasks != NULL){
        for (int i = 0; i < max_tasks; i++){
            struct task *task_ = tasks[i];
            free(task_);
        }
        free(tasks);
    }
    tasks =  malloc(max_tasks * (sizeof(struct task)));
	return setup_timer();
}


struct task*
scheduler_create_task(const char *name, void (*start)(void*))
{
    /*
     * Create a new task with the given name and start function.
     * Add it to `tasks`.
     */
    //find a location to put the new task in the `tasks`
    for (int i = 0; i < max_tasks; i++){
        if(tasks[i] == NULL){
            struct task *tempTask = malloc(sizeof(struct task));
            strcpy(tempTask->t_name, name);
            tempTask->t_blocked = false;
            tempTask->t_run = start;
            tempTask->t_ref = 1;
            tasks[i] = tempTask;
            current_task++;
            return tempTask;
        }
    }
    //did not find a position to put
	return NULL;
}


/*
 * Start running a runnable task.
 * This function will only return if that tasks completes
 * and we aren't interrupted to switch to an infinite task.
 */
void
scheduler_run()
{
    while(tasks != NULL){
     for(int i = 0; i < max_tasks; i++){
        if(tasks[i] != NULL){
            //start running the task
            struct task *cur_task = tasks[i];
            activate(cur_task);
            scheduler_tick(&cur_task->t_pcb);
            
            
            //finish the task, release it.
            //free(cur_task);
            //cur_task->t_ref--;
            //tasks[i] = NULL;
            
        }
      }
    }
}

/**
 * A scheduling timer has fired: make a scheduling decision.
 */
void
scheduler_tick(struct pcb *pcb)
{
	// XOR the state of the 'L' LED
	PORTB ^= 0x20;
   
	/*
	 * A scheduling quantum has elapsed:
	 * make a scheduling decision (e.g., switch task).
	 */
    int16_t pc = pcb->p_pc;
    //schedule next excution task, should determine when should switch task
    
    
    
    
}
//Since the operating system has effectively suspended the execution of the first process, it can now load the PCB and context of the second process. In doing so, the program counter from the PCB is loaded, and thus execution can continue in the new process. New processes are chosen from a queue or queues (often referred as ready queue). Process and thread priority can influence which process continues execution, with processes of the highest priority checked first for ready threads to execute.

static void
activate(struct task *t)
{
	static struct pcb pcb;
    
	// Has this task started running yet?
	if (t->t_pcb.p_pc)
	{
        pcb.p_pc = t->t_pcb.p_pc;
        pcb.p_sp = t->t_pcb.p_sp;
		/*
		 * Restore t's PCB into `pcb`.
		 */
        
	}
	else
	{
		// Initialize the PCB to start running in its own stack.
		memset(&pcb, 0, sizeof(pcb));
		pcb.p_pc = (int16_t) t->t_run;
		pcb.p_sp = (int16_t) t->t_stack - 1;

		// Push a 0 on the stack (no return address).
		*t->t_stack = 0;
        //save the current context of the process, when the scheduler gets back to the execution of first process, it can restore this state and continue.
        context_save(&pcb);
	}

    //restore the task state and continue;
	context_restore(&pcb);
}


static bool
setup_timer()
{
	// Set up 2Hz timer1 interrupt
	TCCR1A = 0;
	TCCR1B = 0;
	TCNT1 = 0;

	// Set CTC (Compare to Clear) mode on timer 1
	TCCR1B |= (1 << WGM12);

	// Set prescalar of 1024
	TCCR1B |= (1 << CS12) | (1 << CS10);

	// Set compare match register: 16 MHz / 1024 / 15625 = 1 Hz
	OCR1A = 15625;

	// Enable timer compare interrupt
	TIMSK1 |= (1 << OCIE1A);
}