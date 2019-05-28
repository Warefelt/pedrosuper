#pragma once

#include <stdint.h>

typedef uint32_t rngword_t;

void seedRng(rngword_t* state, uint32_t seed);
rngword_t nextRnd(rngword_t* state);
