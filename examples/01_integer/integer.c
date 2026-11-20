#include <stdint.h>

#if defined(__clang__)
#define JIT_HOT __attribute__((annotate("espb_jit_hot"), noinline))
#else
#define JIT_HOT __attribute__((noinline))
#endif

JIT_HOT uint32_t espb_integer_chain(uint32_t x)
{
    x = (x + 17u) * 3u;
    x ^= 0x5a5a1234u;
    x = (x << 5) | (x >> 27);
    return (x - 91u) ^ (x >> 3);
}

JIT_HOT int32_t espb_integer_signed(int32_t a, int32_t b)
{
    int32_t v = (a * 7) - (b * 3);
    return (v < 0) ? -v : v;
}

/* ESPB runtime entry point: the host supplies (I32, PTR, PTR). */
void app_main(int32_t seed, const char *text, void *user_data)
{
    const uint32_t a = espb_integer_chain((uint32_t)seed);
    const int32_t b = espb_integer_signed(seed, (int32_t)(uintptr_t)user_data);
    volatile uint32_t sink = a ^ (uint32_t)b ^ (text ? (uint8_t)text[0] : 0u);
    (void)sink;
}
