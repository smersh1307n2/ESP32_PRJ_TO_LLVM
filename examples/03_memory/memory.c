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
