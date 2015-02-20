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

#include <Arduino.h>

#include <assert.h>
#include <stdio.h>

#include "serial.h"


void serial_init(int rate)
{
	Serial.begin(rate);
}


void serial_print(const char *s)
{
	Serial.print(s);
	Serial.flush();
}


void serial_println(const char *s)
{
	Serial.println(s);
	Serial.flush();
}