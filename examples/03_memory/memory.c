#include <stdint.h>

#if defined(__clang__)
#define JIT_HOT __attribute__((annotate("espb_jit_hot"), noinline))
#else
#define JIT_HOT __attribute__((noinline))
#endif

JIT_HOT uint32_t espb_array_checksum(const uint32_t *data, uint32_t count)
{
    uint32_t sum = 0;
    for (uint32_t i = 0; i < count; ++i)
        sum = (sum << 1) ^ (data[i] + (sum >> 7));
    return sum;
}

JIT_HOT void espb_array_transform(uint32_t *data, uint32_t count, uint32_t key)
{
    for (uint32_t i = 0; i < count; ++i)
        data[i] = (data[i] ^ key) + (i * 13u);
}

/* ESPB runtime entry point: exercise linear-memory arrays and indexed loads/stores. */
static uint32_t values[8];

void app_main(int32_t seed, const char *text, void *user_data)
{
    for (uint32_t i = 0; i < 8; ++i)
        values[i] = (uint32_t)seed + i * 7u;
    espb_array_transform(values, 8, (uint32_t)seed ^ (uint32_t)(uintptr_t)user_data);
    volatile uint32_t sink = espb_array_checksum(values, 8) ^ (text != 0);
    (void)sink;
}
