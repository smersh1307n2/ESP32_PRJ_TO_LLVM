/*
 * SPDX-FileCopyrightText: 2021-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */

// --- PERFORMANCE TEST CODE ---

#include "esp_timer.h" // For high-precision time measurement
#include <inttypes.h>
#include "test.h"
//#ifdef GENERATE_PURE_IR
// For "pure" IR generation, declare functions as external
// to avoid assembly instructions from their header files.
//extern uint32_t esp_cpu_get_cycle_count(void);
//extern uint32_t esp_rom_get_cpu_ticks_per_us(void);
//#else
// For normal compilation, include header files as usual.
#include <esp_cpu.h>
#include <esp_rom_sys.h>
//#endif
extern void my_custom_print(const char* str);
// Iterative function to calculate Fibonacci numbers.
// Add volatile to prevent the compiler from calculating everything at compile time.
//__attribute__((noinline))
__attribute__((inline))
uint64_t fibonacci_iterative(int n) {
    if (n <= 1) {
        return n;
    }
   // volatile 
    uint64_t a = 0, b = 1;
    for (int i = 2; i <= n; i++) {
       // volatile 
        uint64_t temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

// Number of iterations for averaging the results
#define PERFORMANCE_TEST_RUNS 7000
// The value of N for Fibonacci. Chosen to take a noticeable amount of time.
// For ESP32-C3 @ 160MHz, N=90 gives a good time.
#define FIBONACCI_N 85

// Expected result for N=85 to verify correctness
#define FIBONACCI_N85_EXPECTED 259695496911122585ULL

// Function that will run the tests
void run_performance_test(void) {
    printf("\n\n=== Performance Benchmark: Fibonacci(%u) ===\n", (uint32_t)FIBONACCI_N);
    printf("Running %u iterations for averaging...\n\n", (uint32_t)PERFORMANCE_TEST_RUNS);

    volatile uint64_t result = 0;
    volatile int n = FIBONACCI_N;

    // Get CPU frequency for timing calculations
    uint32_t cpu_ticks_per_us = esp_rom_get_cpu_ticks_per_us();
    printf("CPU @ %u MHz\n", cpu_ticks_per_us);

    // Measure total execution time in CPU cycles
    uint32_t start_cycles = esp_cpu_get_cycle_count();
    for (int i = 0; i < PERFORMANCE_TEST_RUNS; i++) {
        result = fibonacci_iterative(n);
    }
    uint32_t end_cycles = esp_cpu_get_cycle_count();

    uint64_t total_cycles = end_cycles - start_cycles;
    uint64_t avg_cycles = total_cycles / PERFORMANCE_TEST_RUNS;
    uint64_t avg_time_us = avg_cycles / cpu_ticks_per_us;

    printf("Result: %llu (Expected: %llu)\n", result, FIBONACCI_N85_EXPECTED);
    if (result == FIBONACCI_N85_EXPECTED) {
        printf("Result is CORRECT.\n");
    } else {
        printf("Result is INCORRECT!\n");
    }
    
    uint64_t total_time_us = total_cycles / cpu_ticks_per_us;
    double total_time_s = (double)total_time_us / 1000000.0;

    printf("Total CPU cycles for %u runs: %llu\n", (uint32_t)PERFORMANCE_TEST_RUNS, total_cycles);
    printf("Total execution time: %.2f seconds\n\n", total_time_s);

    printf("Average CPU cycles per call: %llu\n", avg_cycles);
    printf("Average time per call: %llu microseconds\n", avg_time_us);
    printf("=============================================\n\n");
}


void app_main(int argc, char* argv[], char* envp[])
{
    printf("--- ESPB app_main called! ---\n");
   // my_custom_print("-hi-");
    // argc will be 1112
    printf("Received integer (argc): %d\n", argc); 

    // argv will be a pointer to the string "Hello from main!"
    if (argv) {
        printf("Received string (argv[0]): %s\n", (const char*)argv);
    } else {
        printf("Received string (argv[0]): (null)\n");
    }

    // envp will be NULL
    printf("Received pointer 2 (envp): %p\n", envp);
    
    printf("---------------------------\n");

    run_performance_test();
}
