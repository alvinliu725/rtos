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

#ifndef COMMON_H
#define COMMON_H


/*
 * Portable macros for declaring C functions visible to C++.
 */
#ifdef __cplusplus
#define BEGIN_DECLS extern "C" {
#define END_DECLS   }
#else
#define BEGIN_DECLS
#define END_DECLS
#endif


#endif /* COMMON_H */