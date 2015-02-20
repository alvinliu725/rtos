/**
 * @file  main.c
 * @brief Definition of @ref main function: set up processor and scheduler.
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

#include <Arduino.h>

#include "jobs.h"
#include "scheduler.h"
#include "serial.h"


int main(void)
{
    // Call the Atmel-provided initializers.
    init();
    
    // Set up output ports to send signals to lights.
    DDRB |= 0b00100000;
    DDRD |= 0b11100000;
    
    PORTB = 0x00;
    PORTD &= 0xfc;
    
    serial_init(9600);
    serial_print("\n\r"
                 "ArduinOS v" VERSION "\n\r"
                 "(c) 2015 Jonathan Anderson\n\r"
                 "\n\r");
    
    //
    // Disable interrupts until the scheduler starts running.
    // NOTE: serial_print() won't work until interrupts are re-enabled.
    //
    cli();
    
    //
    // Schedule and run some tasks.
    //
    scheduler_init(4);
   
    scheduler_create_task("Job A", jobA);
    scheduler_create_task("Job B", jobB);
    scheduler_create_task("Job C", jobC);
    
    scheduler_run();
    
    assert(false && "unreachable code");
    return 0;
}