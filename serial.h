/**
 * @file  serial.h
 * @brief A (very) simpler C wrapper around Arduino's C++ `Serial` class.
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

#ifndef SERIAL_H
#define SERIAL_H

#include "common.h"

BEGIN_DECLS

/**
 * Initialize the serial port.
 *
 * @param    rate       data rate [Baud]
 */
void	serial_init(int rate);

/** Print a string to the serial port. */
void	serial_print(const char *);

/** Print a line of text to the serial port. */
void	serial_println(const char *);

END_DECLS

#endif