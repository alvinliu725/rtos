/**
 * @file  pcb.h
 * @brief Header to include MCU-specific PCB data.
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

#ifndef PCB_H
#define PCB_H

#if defined(__AVR_ATmega328__) || defined(__AVR_ATmega328P__)
  #include "pcb.atmega328.h"

#else
  #error Unknown AVR MCU

#endif

#endif