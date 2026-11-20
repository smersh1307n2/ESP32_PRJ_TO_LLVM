#include <stdint.h>
#include <stdio.h>

#if defined(__clang__)
#define JIT_HOT __attribute__((annotate("espb_jit_hot"), noinline))
#else
#define JIT_HOT __attribute__((noinline))
#endif

JIT_HOT uint32_t espb_branch_loop(uint32_t n)
{
    uint32_t acc = 1;
    for (uint32_t i = 0; i < n; ++i) {
        if ((i & 3u) == 0u) acc += i * 3u;
        else if ((i & 1u) != 0u) acc ^= i + 11u;
        else acc -= i;
    }
    return acc;
}

JIT_HOT uint32_t espb_nested_branch(uint32_t x)
{
    if (x < 10u) return x * x + 1u;
    if (x < 100u) return (x >> 2) ^ (x * 5u);
    return (x % 17u) + (x / 7u);
}

static uint8_t espb_control_reported;

/* ESPB runtime entry point: exercise conditional and loop lowering. */
void app_main(int32_t seed, const char *text, void *user_data)
{
    const uint32_t a = espb_branch_loop((uint32_t)(seed & 31));
    const uint32_t b = espb_nested_branch((uint32_t)seed);
    volatile uint32_t sink = a ^ b ^ (text != 0) ^ (user_data != 0);
    if (!espb_control_reported) {
        espb_control_reported = 1;
        if (a == 249u && b == 165u && sink == 93u)
            printf("[ESPB_ASSERT] control_flow=PASS\\n");
        else
            printf("[ESPB_ASSERT] control_flow=FAIL a=%u b=%u sink=%u\\n", a, b, (uint32_t)sink);
    }
}
