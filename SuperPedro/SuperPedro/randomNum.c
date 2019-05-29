#include "randomNum.h"

//typedef uint32_t rngword_t;

void seedRng(rngword_t* state, uint32_t seed) {
	*state = seed;
	for(int i = 0; i < 10; i++) {
		nextRnd(state);
	}
}

rngword_t nextRnd(rngword_t* state) {
	*state = *state * 0xDEADBEAD + 0x1;
	rngword_t x = *state;
	for(int i = 0; i < 3; i++) {
		x ^= (x >> 9) ^ (x >> 17);
		x *= 23456789;
	}
	return x;
}