#include <stdint.h>

#if defined(__clang__)
#define JIT_HOT __attribute__((annotate("espb_jit_hot"), noinline))
#else
#define JIT_HOT __attribute__((noinline))
#endif

static uint32_t mix(uint32_t x)
{
    x ^= x >> 16;
    x *= 0x7feb352du;
    x ^= x >> 15;
    x *= 0x846ca68bu;
    return x ^ (x >> 16);
}

JIT_HOT uint32_t espb_call_chain(uint32_t x, uint32_t rounds)
{
    for (uint32_t i = 0; i < rounds; ++i)
        x = mix(x + i);
    return x;
}
