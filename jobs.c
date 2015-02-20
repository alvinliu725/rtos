/**
 * @file  jobs.c
 * @brief Definitions of jobs that we can run.
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

#include <stdbool.h>

#include <avr/io.h>
#include <util/delay.h>

#include "jobs.h"
#include "serial.h"


void
jobA()
{
    serial_println("\n\rStarting Job A...\n\r");
    
    while (true)
    {
        PORTD &= 0b10011111;
        PORTD |= 0b10000000;
        serial_print("+");
        _delay_ms(100);
    }
}


void
jobB()
{
    serial_println("\n\rStarting Job B...\n\r");
    
    while (true)
    {
        PORTD &= 0b01011111;
        PORTD |= 0b01000000;
        serial_print("-");
        _delay_ms(100);
    }
}


void
jobC()
{
    serial_println("\n\rStarting Job C...\n\r");
    
    while (true)
    {
        PORTD &= 0b00111111;
        PORTD |= 0b00111111;
        serial_print("*");
        _delay_ms(100);
    }
}