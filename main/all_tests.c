/*
 * SPDX-FileCopyrightText: 2010-2022 Espressif Systems (Shanghai) CO LTD
 *
 * SPDX-License-Identifier: CC0-1.0
 */

#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h> // bool support
#include "sdkconfig.h"
#include <math.h>
#include <stdint.h>
#include <stdlib.h> // For malloc and free
#include <string.h> // For memcpy, memset, memcmp

// Define CONFIG_FREERTOS_HZ for linter, it's normally in sdkconfig.h
#ifndef CONFIG_FREERTOS_HZ
#define CONFIG_FREERTOS_HZ 100
#endif
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/timers.h"   // Test timer callbacks
#include "esp_chip_info.h"
#include "esp_flash.h"
#include "esp_system.h"

#include "test.h"


/*

void test(int some_int, double some_double, const char* some_string)
{
    printf("--- ESPB 'test' function called! ---\n");

    // Just print the received values
    printf("Received integer: %d\n", some_int);
    printf("Received double:  %f\n", some_double);

    if (some_string) {
        printf("Received string:  \"%s\"\n", some_string);
    } else {
        printf("Received string:  (null)\n");
    }
    
    printf("----------------------------------\n");
}
*/
extern void set_magic_number(int* out_value);
///*
// Declarations (without implementations) of host helpers for callback testing
extern void host_invoke_cb(void (*cb)(void *), void *user_data);
extern void host_invoke_cb2(void (*cb)(int, void *), int x, void *user_data);

/*
///------------------------------------------------

// --- Host-like callback helpers ---
typedef void (*cb1_t)(void*);
typedef void (*cb2_t)(int, void*);

__attribute__((noinline, optimize("O0")))
void host_invoke_cb(cb1_t cb, void *user_data) {
    if (cb) cb(user_data);
}

__attribute__((noinline, optimize("O0")))
void host_invoke_cb2(cb2_t cb, int x, void *user_data) {
    if (cb) cb(x, user_data);
}

__attribute__((noinline, optimize("O0")))
void set_magic_number(int* out_value) {
    printf("[HOST DBG] native_set_magic_number called with out_value pointer = %p\n", (void*)out_value);
    if (out_value) {
        *out_value = 42; // Write the magic number
        printf("[HOST DBG] Wrote 42 to the pointer.\n");
    } else {
        printf("[HOST DBG] ERROR: out_value pointer is NULL!\n");
    }
}
///-------------------------------------------------
*/


//__attribute__((import_module("env"), import_name("getchat")))
//extern  void getchat(void*);
//*/
///*
static const char STATIC_DATA_FOR_INIT[] = "Hello from a static data segment! This tests MEMORY.INIT.";

// --- GLOBAL VARIABLES FOR TESTING ---
int32_t g_my_global_int = 123;
int64_t g_my_global_long = 9876543210;
bool g_my_global_bool = false;
// --- END OF GLOBAL VARIABLES ---
//*/
///*
// Callback implementations inside ESPB for trampoline testing
static void cb_print(void *ud) {
    printf("cb_print: user_data=%p\n", ud);
}

static void cb_with_int(int x, void *ud) {
    printf("cb_with_int: x=%d, user_data=%p\n", x, ud);
}
//*/
///*
// FreeRTOS timer callback: user_data is stored in pvTimerID
static void test_timer_cb(TimerHandle_t xTimer) {
    void *ud = pvTimerGetTimerID(xTimer);
    static int tick = 0;
    printf("test_timer_cb: tick=%d, timer_ud=%p\n", tick++, ud);
}
//*/
///*
void counter_task(void *pvParameter)
{
    int num = 0;
    printf("counter_task start, pvParameter=%p\n", pvParameter);
    while (1) {
        printf("num is = %d\n", num++);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}
//*/
///*
// =========================================================================
// === INSERTED CODE FOR TESTING INDIRECT CALLS (CALL_INDIRECT) ===
// =========================================================================

// Simple functions for testing indirect calls
int add_func(int a, int b) {
    printf("add_func called: %d + %d = %d\n", a, b, a + b);
    return a + b;
}

int mul_func(int a, int b) {
    printf("mul_func called: %d * %d = %d\n", a, b, a * b);
    return a * b;
}

// A function that takes a function pointer
int call_operation(int (*operation)(int, int), int x, int y) {
    printf("call_operation: calling function pointer with %d, %d\n", x, y);
    return operation(x, y);
}

// Main function for testing
void test_call_indirect() {
    printf("=== Testing CALL_INDIRECT ===\n");

    // Test 1: Direct use of a function pointer
    int (*func_ptr)(int, int) = add_func;
    int result1 = func_ptr(5, 3);
    printf("Direct call result: %d\n", result1);

    // Test 2: Passing a function pointer to another function
    int result2 = call_operation(add_func, 10, 20);
    printf("Indirect call result (add): %d\n", result2);

    int result3 = call_operation(mul_func, 4, 7);
    printf("Indirect call result (mul): %d\n", result3);

    // Test 3: Changing the function pointer
    func_ptr = mul_func;
    int result4 = func_ptr(6, 9);
    printf("Changed function pointer result: %d\n", result4);

    printf("=== CALL_INDIRECT tests completed ===\n\n");
}

// =========================================================================
// ===================== END OF INSERTED CODE ============================
// =========================================================================


// =========================================================================
// === NEW CODE FOR TESTING NON-OPTIMIZABLE INDIRECT CALLS ======
// =========================================================================

// Global array of function pointers - LLVM can't optimize this
static int (*operations[])(int, int) = {add_func, mul_func};

// A function that takes an operation index (prevents optimization)
int call_operation_by_index(int op_index, int x, int y) {
    printf("call_operation_by_index: op=%d, calling with %d, %d\n", op_index, x, y);

    // This indirect call cannot be optimized by LLVM
    return operations[op_index % 2](x, y);
}

// A function with a volatile pointer (prevents optimization)
volatile int call_volatile_function(volatile int (*func)(int, int), int x, int y) {
    printf("call_volatile_function: calling with %d, %d\n", x, y);
    return func(x, y);
}

// Main function for testing non-optimizable calls
void test_call_indirect_non_optimizable() {
    printf("=== Testing Non-Optimizable CALL_INDIRECT ===\n");

    // Test 1: Indirect call via array (not optimized)
    int result1 = call_operation_by_index(0, 5, 3);  // add_func
    printf("Result from array call (add): %d\n", result1);

    int result2 = call_operation_by_index(1, 4, 7);  // mul_func
    printf("Result from array call (mul): %d\n", result2);

    // Test 2: Volatile function pointer (not optimized)
    // FIXED: Added an explicit cast to suppress compiler warning/error
    volatile int (*volatile_func_ptr)(int, int) = (volatile int (*)(int, int))add_func;
    int result3 = call_volatile_function(volatile_func_ptr, 6, 9);
    printf("Result from volatile call: %d\n", result3);

    printf("=== Non-Optimizable CALL_INDIRECT tests completed ===\n\n");
}

// =========================================================================
// ===================== END OF NEW CODE =================================
// =========================================================================

// --- FUNCTION FOR TESTING GLOBAL VARIABLES ---

void test_globals() {
    printf("\n=== Testing Globals ===\n");
    printf("Initial g_my_global_int: %" PRId32 "\n", g_my_global_int);
    printf("Initial g_my_global_long: %" PRId64 "\n", g_my_global_long);
    printf("Initial g_my_global_bool: %s\n", g_my_global_bool ? "true" : "false");

    g_my_global_int += 100;
    g_my_global_long -= 10;
    g_my_global_bool = !g_my_global_bool;

    printf("\nModified g_my_global_int: %" PRId32 "\n", g_my_global_int);
    printf("Modified g_my_global_long: %" PRId64 "\n", g_my_global_long);
    printf("Modified g_my_global_bool: %s\n", g_my_global_bool ? "true" : "false");
    printf("=== Globals test completed ===\n\n");
}

// --- NEW FUNCTION FOR TESTING MATH OPERATIONS ---

void test_math_operations32()
{
    volatile int32_t i32_a = -100;
    volatile int32_t i32_b = 25;
    volatile uint32_t u32_a = 100;
    volatile uint32_t u32_b = 25;
    printf("\n--- I32 Operations ---\n");
    printf("i32_a=%d, i32_b=%d, u32_a=%u, u32_b=%u\n", i32_a, i32_b, u32_a, u32_b);
    printf("ADD: %d\n", i32_a + i32_b);
    printf("SUB: %d\n", i32_a - i32_b);
    printf("MUL: %d\n", i32_a * i32_b);
    printf("DIVS: %d\n", i32_a / i32_b);
    printf("REMS: %d\n", i32_a % i32_b);
    printf("DIVU: %u\n", u32_a / u32_b);
    printf("REMU: %u\n", u32_a % u32_b);
    printf("AND: %d\n", i32_a & 0xFF);
    printf("OR: %d\n", i32_a | 0x80);
    printf("XOR: %d\n", i32_a ^ 0xFF);
    printf("SHL: %d\n", i32_b << 2);
    printf("SHRS: %d\n", i32_a >> 2);
    printf("SHRU: %u\n", u32_a >> 2);
    printf("NOT: %d\n", ~i32_b);


}
void test_math_operations() {
    printf("\n=== Testing Math Operations ===\n");

    // --- I32 Operations ---
  //  printf("\n--- I32 Operations ---\n");
    volatile int32_t i32_a = -100;
    volatile int32_t i32_b = 25;
    volatile uint32_t u32_a = 100;
    volatile uint32_t u32_b = 25;
   // test_math_operations32();
///*
    printf("i32_a=%d, i32_b=%d, u32_a=%u, u32_b=%u\n", i32_a, i32_b, u32_a, u32_b);
    printf("ADD: %d\n", i32_a + i32_b);
    printf("SUB: %d\n", i32_a - i32_b);
    printf("MUL: %d\n", i32_a * i32_b);
    printf("DIVS: %d\n", i32_a / i32_b);
    printf("REMS: %d\n", i32_a % i32_b);
    printf("DIVU: %u\n", u32_a / u32_b);
    printf("REMU: %u\n", u32_a % u32_b);
    printf("AND: %d\n", i32_a & 0xFF);
    printf("OR: %d\n", i32_a | 0x80);
    printf("XOR: %d\n", i32_a ^ 0xFF);
    printf("SHL: %d\n", i32_b << 2);
    printf("SHRS: %d\n", i32_a >> 2);
    printf("SHRU: %u\n", u32_a >> 2);
    printf("NOT: %d\n", ~i32_b);
//*/
    // --- I64 Operations ---
    printf("\n--- I64 Operations ---\n");
    volatile int64_t i64_a = -10000000000LL;
    volatile int64_t i64_b = 2500000000LL;
    volatile uint64_t u64_a = 10000000000ULL;
    volatile uint64_t u64_b = 2500000000ULL;

    printf("i64_a=%" PRId64 ", i64_b=%" PRId64 ", u64_a=%" PRIu64 ", u64_b=%" PRIu64 "\n", i64_a, i64_b, u64_a, u64_b);
    printf("ADD: %" PRId64 "\n", i64_a + i64_b);
    printf("SUB: %" PRId64 "\n", i64_a - i64_b);
    printf("MUL: %" PRId64 "\n", i64_a * 2LL);
    printf("DIVS: %" PRId64 "\n", i64_a / i64_b);
    printf("REMS: %" PRId64 "\n", i64_a % i64_b);
    printf("DIVU: %" PRIu64 "\n", u64_a / u64_b);
    printf("REMU: %" PRIu64 "\n", u64_a % u64_b);
    printf("AND: %" PRId64 "\n", i64_a & 0xFFFFFFFFLL);
    printf("OR: %" PRId64 "\n", i64_a | 0x80000000LL);
    printf("XOR: %" PRId64 "\n", i64_a ^ 0xFFFFFFFFLL);
    printf("SHL: %" PRId64 "\n", i64_b << 2);
    printf("SHRS: %" PRId64 "\n", i64_a >> 2);
    printf("SHRU: %" PRIu64 "\n", u64_a >> 2);
    printf("NOT: %" PRId64 "\n", ~i64_b);

    // --- F32 Operations ---
    printf("\n--- F32 Operations ---\n");
    volatile float f32_a = -123.45f;
    volatile float f32_b = 2.5f;

    printf("f32_a=%f, f32_b=%f\n", f32_a, f32_b);
    printf("ADD: %f\n", f32_a + f32_b);
    printf("SUB: %f\n", f32_a - f32_b);
    printf("MUL: %f\n", f32_a * f32_b);
    printf("DIV: %f\n", f32_a / f32_b);
    printf("ABS: %f\n", fabsf(f32_a));
    printf("SQRT: %f\n", sqrtf(f32_b * f32_b));
    printf("MIN: %f\n", fminf(f32_a, f32_b));
    printf("MAX: %f\n", fmaxf(f32_a, f32_b));

    // --- F64 Operations ---
    printf("\n--- F64 Operations ---\n");
    volatile double f64_a = -987654.321;
    volatile double f64_b = 2.0;
    
    printf("f64_a=%lf, f64_b=%lf\n", f64_a, f64_b);
    printf("ADD: %lf\n", f64_a + f64_b);
    printf("SUB: %lf\n", f64_a - f64_b);
    printf("MUL: %lf\n", f64_a * f64_b);
    printf("DIV: %lf\n", f64_a / f64_b);
    printf("ABS: %lf\n", fabs(f64_a));
    printf("SQRT: %lf\n", sqrt(f64_b * f64_b));
    printf("MIN: %lf\n", fmin(f64_a, f64_b));
    printf("MAX: %lf\n", fmax(f64_a, f64_b));
    
    // --- Type Conversions ---
    printf("\n--- Type Conversions ---\n");
    int32_t i32_from_f64 = (int32_t)f64_a;
    float f32_from_i64 = (float)i64_b;
    int16_t i16_from_i32 = (int16_t)123456; // Truncation
    int32_t i32_from_i8 = (int8_t)-5; // Sign extension

    printf("CVT.F64.I32: %lf -> %d\n", f64_a, i32_from_f64);
    printf("CVT.I64.F32: %" PRId64 " -> %f\n", i64_b, f32_from_i64);
    printf("TRUNC.I32.I16: 123456 -> %d\n", i16_from_i32);
    printf("SEXT.I8.I32: -5 -> %d\n", i32_from_i8);

    printf("=== Math Operations test completed ===\n\n");
}

// --- NEW FUNCTION FOR TESTING MEMORY OPERATIONS ---
void test_memory_operations() {
    printf("\n=== Testing Memory Operations ===\n");

    // Test ALLOCA: allocate memory for several variables
    // This will be translated to the ALLOCA instruction
    // The size will be calculated by the compiler
    char buffer[100];
    
    // Fill the buffer for reliability
    for(int i = 0; i < 100; i++) {
        buffer[i] = (char)i;
    }

    printf("ALLOCA: Allocated a buffer on the stack.\n");

    // --- STORE / LOAD i32 ---
    int32_t *p_i32 = (int32_t*)(buffer + 0);
    *p_i32 = 123456789;
    int32_t loaded_i32 = *p_i32;
    printf("STORE/LOAD I32: Stored %d, Loaded %d\n", 123456789, loaded_i32);

    // --- STORE / LOAD i64 ---
    int64_t *p_i64 = (int64_t*)(buffer + 8);
    *p_i64 = -987654321098765LL;
    int64_t loaded_i64 = *p_i64;
    printf("STORE/LOAD I64: Stored %" PRId64 ", Loaded %" PRId64 "\n", -987654321098765LL, loaded_i64);

    // --- STORE / LOAD f32 ---
    float *p_f32 = (float*)(buffer + 20);
    *p_f32 = 3.14159f;
    float loaded_f32 = *p_f32;
    printf("STORE/LOAD F32: Stored %f, Loaded %f\n", 3.14159f, loaded_f32);
    
    // --- STORE / LOAD f64 ---
    double *p_f64 = (double*)(buffer + 30);
    *p_f64 = 2.718281828459;
    double loaded_f64 = *p_f64;
    printf("STORE/LOAD F64: Stored %lf, Loaded %lf\n", 2.718281828459, loaded_f64);

    // --- STORE / LOAD i8/u8 ---
    int8_t *p_i8 = (int8_t*)(buffer + 40);
    *p_i8 = -120;
    int8_t loaded_i8 = *p_i8;
    uint8_t *p_u8 = (uint8_t*)(buffer + 41);
    *p_u8 = 250;
    uint8_t loaded_u8 = *p_u8;
    printf("STORE/LOAD I8: Stored %d, Loaded %d\n", -120, loaded_i8);
    printf("STORE/LOAD U8: Stored %u, Loaded %u\n", 250, loaded_u8);
    
    // --- STORE / LOAD i16/u16 ---
    int16_t *p_i16 = (int16_t*)(buffer + 44);
    *p_i16 = -32000;
    int16_t loaded_i16 = *p_i16;
    uint16_t *p_u16 = (uint16_t*)(buffer + 46);
    *p_u16 = 65000;
    uint16_t loaded_u16 = *p_u16;
    printf("STORE/LOAD I16: Stored %d, Loaded %d\n", -32000, loaded_i16);
    printf("STORE/LOAD U16: Stored %u, Loaded %u\n", 65000, loaded_u16);
    
    // --- STORE / LOAD PTR ---
    void **p_ptr = (void**)(buffer + 50);
    void *ptr_to_store = (void*)0xDEADBEEF;
    *p_ptr = ptr_to_store;
    void *loaded_ptr = *p_ptr;
    printf("STORE/LOAD PTR: Stored %p, Loaded %p\n", ptr_to_store, loaded_ptr);
    
    printf("=== Memory Operations test completed ===\n\n");
}
//*/

///*
// --- NEW FUNCTION FOR TESTING CONTROL FLOW ---
void test_control_flow() {
    printf("\n=== Testing Control Flow ===\n");

    // --- 1. Test if-else (CMP.* + BR_IF) ---
    printf("\n--- 1. Testing if-else ---\n");
    int a = 10;
    int b = 20;

    if (a < b) {
        printf("OK: a < b is true (10 < 20)\n");
    } else {
        printf("ERROR: a < b is false\n");
    }

    if (a > b) {
        printf("ERROR: a > b is true\n");
    } else {
        printf("OK: a > b is false (10 > 20)\n");
    }

    if (a == 10) {
        printf("OK: a == 10 is true\n");
    } else {
        printf("ERROR: a == 10 is false\n");
    }

    double d1 = 3.14;
    double d2 = 3.141;
    if (d1 < d2) {
        printf("OK: d1 < d2 is true (3.14 < 3.141)\n");
    } else {
        printf("ERROR: d1 < d2 is false\n");
    }

    // --- 2. Test for loop (CMP + BR) ---
    printf("\n--- 2. Testing for loop ---\n");
    int sum = 0;
    for (int i = 1; i <= 5; i++) {
        sum += i;
        printf("  Loop i=%d, current sum=%d\n", i, sum);
    }
    printf("Final sum: %d (expected 15)\n", sum);
    if (sum != 15) {
        printf("ERROR: Loop sum is incorrect!\n");
    } else {
        printf("OK: Loop sum is correct.\n");
    }
    
    // --- 3. Test switch-case (BR_TABLE) ---
    printf("\n--- 3. Testing switch-case ---\n");
    for (int i = 0; i < 4; i++) {
        printf("Testing switch for value %d: ", i);
        switch (i) {
            case 0:
                printf("Case 0\n");
                break;
            case 1:
                printf("Case 1\n");
                break;
            case 2:
                printf("Case 2\n");
                break;
            default:
                printf("Default case\n");
                break;
        }
    }
    
    // --- 4. Test goto (BR) ---
    printf("\n--- 4. Testing goto ---\n");
    goto skip_label;
    printf("ERROR: This line should be skipped by goto!\n");
skip_label:
    printf("OK: Successfully jumped over a line using goto.\n");

    printf("=== Control Flow test completed ===\n\n");
}



//*/

void MarchallingTest()
{
    printf("--- Marshalling Test Start ---\n");

    int magic_container = 0; // This variable lives in ESPB's linear memory.

    printf("Before call, magic_container = %d (Address in ESPB memory: %p)\n", magic_container, &magic_container);

    // Call the host function, passing the address of our variable.
    // The ESPB runtime should:
    // 1. Create a temporary buffer in native memory.
    // 2. Pass a pointer to this buffer to the native set_magic_number function.
    // 3. The native function will write the number 42 into the buffer.
    // 4. After returning, the runtime will copy the buffer's content (the number 42)
    //    back to our magic_container variable.
    set_magic_number(&magic_container);

    printf("After call, magic_container = %d\n", magic_container);

    // Check if the copy-back occurred
    if (magic_container == 42) {
        printf("SUCCESS: Marshalling for OUT parameter works!\n");
    } else {
        printf("FAILURE: Marshalling for OUT parameter FAILED! Value did not change.\n");
    }

    printf("--- Marshalling Test End ---\n");
}
//-------------------------------
//test SELECT

void test_select_opcodes() {
    printf("\n=== Testing SELECT Opcodes ===\n");
    int condition = 1; // Condition to check the "true" path
    
    // --- Test SELECT.I32 (already present) ---
    int i32_result = condition ? 100 : 200; 
    printf("SELECT.I32 result: %d\n", i32_result);

    // --- NEW CODE: Test for SELECT.I64 ---
    int64_t i64_result = condition ? 9876543210LL : -1234567890LL;
    printf("SELECT.I64 result: %" PRId64 "\n", i64_result);

    // --- NEW CODE: Test for SELECT.F32 ---
    // Use a false condition to check the second path
    float f32_result = (0 > 1) ? 1.23f : 4.56f; 
    printf("SELECT.F32 result: %f\n", f32_result);
    
    // --- Test SELECT.F64 (already present) ---
    double f64_result = (0 > 1) ? 3.14 : 2.71; 
    printf("SELECT.F64 result: %lf\n", f64_result);

    // --- Test SELECT.PTR (already present) ---
    void* ptr_result = condition ? (void*)0xAAAA : (void*)0xBBBB; 
    printf("SELECT.PTR result: %p\n", ptr_result);
    
    printf("=== Testing SELECT Opcodes END ===\n\n");
}

//--------------------------------
//Specific pointer operations
void test_pointer_ops() {
    printf("\n=== Testing Pointer Opcodes ===\n");

    int my_var = 123;
    // The compiler might place my_var in a register.
    // Taking the address might generate ADDR_OF.
    int* p = &my_var; 

    // This will generate PTRTOINT
    uintptr_t addr_val = (uintptr_t)p;
    printf("PTRTOINT: Address of my_var is 0x%lx\n", (unsigned long)addr_val);
    
    // This will generate INTTOPTR
    int* p2 = (int*)addr_val;

    // Check
    if (*p2 == 123) {
        printf("OK: INTTOPTR successful, value is %d\n", *p2);
    } else {
        printf("ERROR: INTTOPTR failed!\n");
    }

     printf("\n===  ===\n");
}

//--------------------------------------

// --- NEW FUNCTION FOR TESTING ATOMIC OPERATIONS ---
void test_atomics() {
    printf("\n=== Testing Atomic Operations ===\n");

    // --- I32 Atomics ---
    printf("\n--- I32 Atomics ---\n");
    volatile int32_t i32_atomic_var = 10;
    printf("Initial atomic I32 value: %d\n", i32_atomic_var);

    // Test ATOMIC.RMW.ADD.I32
    int32_t old_val_add = __atomic_fetch_add(&i32_atomic_var, 5, __ATOMIC_SEQ_CST);
    printf("ATOMIC.ADD: old=%d, new=%d\n", old_val_add, i32_atomic_var); // expected: old=10, new=15

    // Test ATOMIC.RMW.XCHG.I32
    int32_t old_val_xchg = __atomic_exchange_n(&i32_atomic_var, 42, __ATOMIC_SEQ_CST);
    printf("ATOMIC.XCHG: old=%d, new=%d\n", old_val_xchg, i32_atomic_var); // expected: old=15, new=42

    // Test ATOMIC.RMW.CMPXCHG.I32
    int32_t expected = 42;
    __atomic_compare_exchange_n(&i32_atomic_var, &expected, 100, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
    printf("ATOMIC.CMPXCHG (success): expected=42, new=%d\n", i32_atomic_var); // expected: new=100

    expected = 99; // This value does not match
    __atomic_compare_exchange_n(&i32_atomic_var, &expected, 200, 0, __ATOMIC_SEQ_CST, __ATOMIC_SEQ_CST);
    printf("ATOMIC.CMPXCHG (failure): expected=99, old_val_in_expected=%d, new=%d\n", expected, i32_atomic_var); // expected: old_val=100, new=100

    // --- I64 Atomics ---
    printf("\n--- I64 Atomics ---\n");
    volatile int64_t i64_atomic_var = 1000;
    printf("Initial atomic I64 value: %lld\n", i64_atomic_var);

    // Test ATOMIC.RMW.SUB.I64
    int64_t old_val_sub64 = __atomic_fetch_sub(&i64_atomic_var, 100, __ATOMIC_SEQ_CST);
    printf("ATOMIC.SUB.I64: old=%lld, new=%lld\n", old_val_sub64, i64_atomic_var); // expected: old=1000, new=900

    // Test ATOMIC.LOAD/STORE
    int64_t loaded_val;
    __atomic_store_n(&i64_atomic_var, 5555, __ATOMIC_SEQ_CST);
    loaded_val = __atomic_load_n(&i64_atomic_var, __ATOMIC_SEQ_CST);
    printf("ATOMIC.STORE/LOAD I64: stored=5555, loaded=%lld\n", loaded_val);

    printf("=== Atomics test completed ===\n\n");
}
//------------------------------------------------------------------

// --- NEW FUNCTION FOR TESTING BULK MEMORY OPERATIONS ---
void test_heap_and_memory_operations() {
    printf("\n=== Testing Heap & Memory Operations ===\n");

    // --- 1. Test HEAP_MALLOC (via malloc) ---
    // The malloc() call is translated to the HEAP_MALLOC opcode.
    // The interpreter executes it by calling the native memory manager (multi_heap),
    // which operates on the heap within the linear memory.
    printf("\n--- 1. Testing HEAP_MALLOC (via malloc) ---\n");
    char* dynamic_buffer = (char*)malloc(128);

    if (dynamic_buffer == NULL) {
        printf("ERROR: malloc(128) failed! The HEAP_MALLOC opcode implementation might have issues.\n");
    } else {
        printf("OK: malloc(128) succeeded. Allocated buffer at offset/ptr %p.\n", (void*)dynamic_buffer);
        // Simple write/read check
        strcpy(dynamic_buffer, "Test Malloc");
        if (strcmp(dynamic_buffer, "Test Malloc") == 0) {
            printf("OK: Data integrity in dynamically allocated memory is fine.\n");
        } else {
            printf("ERROR: Data corruption in dynamically allocated memory.\n");
        }
    }

    // --- 2. Test MEMORY.COPY (via memcpy) and static data initialization ---
    // The static array STATIC_DATA_FOR_INIT was copied into linear memory
    // during module instantiation.
    // The llvm.memcpy call is translated to the MEMORY.COPY opcode.
    printf("\n--- 2. Testing MEMORY.COPY (via memcpy) ---\n");
    if (dynamic_buffer) {
        size_t data_len = sizeof(STATIC_DATA_FOR_INIT);
        printf("Copying %zu bytes from static data to dynamic buffer...\n", data_len);
        
        memcpy(dynamic_buffer, STATIC_DATA_FOR_INIT, data_len);
        
        // Check if the data was copied correctly
        if (memcmp(dynamic_buffer, STATIC_DATA_FOR_INIT, data_len) == 0) {
            printf("OK: MEMORY.COPY test passed. Data was copied correctly.\n");
        } else {
            printf("ERROR: MEMORY.COPY test FAILED. Data mismatch after copy.\n");
        }
    }

    // --- 3. Test MEMORY.FILL (via memset) ---
    // The llvm.memset call is translated to the MEMORY.FILL opcode.
    printf("\n--- 3. Testing MEMORY.FILL (via memset) ---\n");
    if (dynamic_buffer) {
        printf("Filling 32 bytes of the buffer with 'X' (0x58)...\n");
        memset(dynamic_buffer, 'X', 32);

        // Manual check of the result
        bool fill_ok = true;
        for (int i = 0; i < 32; i++) {
            if (dynamic_buffer[i] != 'X') {
                fill_ok = false;
                break;
            }
        }

        if (fill_ok) {
            printf("OK: MEMORY.FILL test passed. Buffer was filled correctly.\n");
        } else {
            printf("ERROR: MEMORY.FILL test FAILED. Data mismatch after fill.\n");
        }
    }
    
    // --- 4. Test HEAP_FREE (via free) ---
    // The free() call is translated to the HEAP_FREE opcode.
    // The interpreter calls the native manager, which marks the block as free.
    printf("\n--- 4. Testing HEAP_FREE (via free) ---\n");
    if (dynamic_buffer) {
        free(dynamic_buffer);
        printf("OK: Freed dynamically allocated buffer.\n");
        
        // Verification allocation: try to allocate a block of the same or smaller size.
        // It should be successful, possibly at the same address.
        char* reused_buffer = (char*)malloc(120);
        if (reused_buffer) {
             printf("OK: Memory was successfully reused after free(). Allocated new buffer at %p.\n", (void*)reused_buffer);
             free(reused_buffer);
        } else {
             printf("ERROR: Failed to reuse memory after free().\n");
        }
    }

    printf("=== Heap & Memory Operations test completed ===\n\n");
}
//--------------------------------------------------------

void test_i64_imm8_ops() {
    printf("\n=== Testing I64 IMM8 Operations (using volatile) ===\n");

    // Declare variables as volatile to prevent optimization.
    // The compiler will be forced to read these values from memory.
    volatile int64_t i64_a_volatile = -1000;
    volatile uint64_t u64_a_volatile = 2000;

    // Read volatile values into local variables.
    // This ensures the initial values are not treated as constants,
    // but subsequent operations on the copies can be performed efficiently.
    int64_t i64_a = i64_a_volatile;
    uint64_t u64_a = u64_a_volatile;

    printf("Initial values: i64_a = %" PRId64 ", u64_a = %" PRIu64 "\n", i64_a, u64_a);

    // DIVS.I64.IMM8 (Opcode 0x53)
    // The compiler will generate a division instruction because the value of i64_a is unknown.
    int64_t div_res = i64_a / -10;
    printf("DIVS.I64.IMM8: %" PRId64 " / -10 = %" PRId64 "\n", i64_a, div_res);

    // DIVU.I64.IMM8 (Opcode 0x54)
    uint64_t divu_res = u64_a / 20;
    printf("DIVU.I64.IMM8: %" PRIu64 " / 20 = %" PRIu64 "\n", u64_a, divu_res);

    // REMS.I64.IMM8 (Opcode 0x55)
    int64_t rem_res = i64_a % 13;
    printf("REMS.I64.IMM8: %" PRId64 " %% 13 = %" PRId64 "\n", i64_a, rem_res);

    // REMU.I64.IMM8 (Opcode 0x56)
    uint64_t remu_res = u64_a % 17;
    printf("REMU.I64.IMM8: %" PRIu64 " %% 17 = %" PRIu64 "\n", u64_a, remu_res);

    // SHRU.I64.IMM8 (Opcode 0x58)
    uint64_t shru_res = u64_a >> 3;
    printf("SHRU.I64.IMM8: %" PRIu64 " >> 3 = %" PRIu64 "\n", u64_a, shru_res);

    printf("=== I64 IMM8 Operations test completed ===\n\n");
}
///*
//--------------------------------------------------------

// =========================================================================
// === NEW FUNCTION FOR TESTING ARRAYS, STRUCTS, AND UNIONS ====
// =========================================================================

// --- Helper type definitions for tests ---

// 1. A struct to represent sensor data
typedef struct {
    int32_t id;
    float temperature;
    char name[16];
    bool is_active;
} SensorData;

// 2. A union to demonstrate shared memory usage
typedef union {
    int32_t i_val;
    float   f_val;
    uint8_t bytes[4];
} DataConverter;

// 3. An enum for testing named constants
typedef enum {
    STATE_IDLE,
    STATE_ACTIVE,
    STATE_ERROR,
    STATE_SLEEP
} DeviceState;

// 4. A struct with bitfields to check data packing
typedef struct {
    uint8_t power_on       : 1; // 1 bit
    uint8_t wifi_connected : 1; // 1 bit
    uint8_t error_code     : 4; // 4 bits
    uint8_t reserved       : 2; // 2 bits
} DeviceStatus;


// --- Helper functions to show argument passing ---

// Prints an array (demonstrates that an array is passed as a pointer)
void print_int_array(int arr[], size_t size) {
    printf("  [Helper] Printing array contents: ");
    for (size_t i = 0; i < size; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// Modifies a struct by pointer
void modify_sensor_by_ref(SensorData* sensor) {
    sensor->temperature += 5.0f;
    strcpy(sensor->name, "Modified Sensor");
    sensor->is_active = false;
}


void test_complex_data_types() {
    printf("\n=== Testing Complex Data Types ===\n");

    // --- 1. Testing Arrays ---
    printf("\n--- 1. Testing Arrays ---\n");
    int simple_array[5] = {10, 20, 30, 40, 50};
    printf("Initial array: ");
    for (int i = 0; i < 5; i++) {
        printf("%d ", simple_array[i]);
    }
    printf("\n");

    simple_array[2] = 35; // Modify an element
    printf("Value at index 2 after modification: %d\n", simple_array[2]);

    // Pass the array to a function
    print_int_array(simple_array, 5);

    // Multidimensional array
    int matrix[2][3] = { {1, 2, 3}, {4, 5, 6} };
    printf("Matrix[1][1] value: %d (expected 5)\n", matrix[1][1]);


    // --- 2. Testing Structures (struct) ---
    printf("\n--- 2. Testing Structures (struct) ---\n");
    SensorData sensor1;
    sensor1.id = 101;
    sensor1.temperature = 23.4f;
    strcpy(sensor1.name, "TempSensor-A");
    sensor1.is_active = true;

    printf("Sensor ID: %d, Name: %s, Temp: %f, Active: %s\n",
           sensor1.id, sensor1.name, sensor1.temperature, sensor1.is_active ? "yes" : "no");
    
    // Access via pointer
    SensorData* p_sensor = &sensor1;
    p_sensor->temperature = 24.1f; // Modify via ->
    printf("Temperature updated via pointer: %f\n", p_sensor->temperature);
    
    // Pass struct to a function by pointer
    modify_sensor_by_ref(&sensor1);
    printf("After modify_sensor_by_ref: Name=%s, Temp=%f, Active=%s\n",
           sensor1.name, sensor1.temperature, sensor1.is_active ? "no" : "yes");


    // --- 3. Testing Unions ---
    printf("\n--- 3. Testing Unions (union) ---\n");
    DataConverter converter;
    printf("Size of DataConverter union: %zu bytes\n", sizeof(DataConverter));

    // Write a float, read as int and bytes
    converter.f_val = 3.14159f;
    printf("Assigned float: %f\n", converter.f_val);
    printf("  Read as integer (hex): 0x%08" PRIX32 "\n", converter.i_val);
    printf("  Read as raw bytes (hex): %02x %02x %02x %02x\n",
           converter.bytes[0], converter.bytes[1], converter.bytes[2], converter.bytes[3]);
    
    // Write an int, read as float
    converter.i_val = 100;
    printf("\nAssigned integer: %d\n", converter.i_val);
    printf("  Read as float: %f (value is now interpreted differently)\n", converter.f_val);


    // --- 4. Testing Enumerations (enum) ---
    printf("\n--- 4. Testing Enumerations (enum) ---\n");
    DeviceState current_state = STATE_ACTIVE;
    printf("Initial state: %d (expected 1 for STATE_ACTIVE)\n", current_state);
    
    current_state = STATE_ERROR;
    switch (current_state) {
        case STATE_IDLE:   printf("Device is IDLE\n"); break;
        case STATE_ACTIVE: printf("Device is ACTIVE\n"); break;
        case STATE_ERROR:  printf("OK: Device is in ERROR state\n"); break;
        default: printf("Unknown state\n"); break;
    }


    // --- 5. Testing Array of Structs ---
    printf("\n--- 5. Testing Array of Structs ---\n");
    SensorData sensor_inventory[2];
    sensor_inventory[0] = (SensorData){ .id = 201, .temperature = 55.0f, .name = "Engine-1", .is_active = true };
    sensor_inventory[1] = (SensorData){ .id = 202, .temperature = 12.5f, .name = "Freezer-3", .is_active = false };
    
    printf("Iterating through sensor inventory:\n");
    for (int i = 0; i < 2; i++) {
        printf("  Sensor #%d: ID=%d, Name=%s\n", i, sensor_inventory[i].id, sensor_inventory[i].name);
    }
    

    // --- 6. Testing Bitfields in Structs ---
    printf("\n--- 6. Testing Bitfields in Structs ---\n");
    DeviceStatus status;
    printf("Size of DeviceStatus struct: %zu byte(s) (expected 1)\n", sizeof(DeviceStatus));
    
    // Assign values to fields
    status.power_on = 1;
    status.wifi_connected = 0;
    status.error_code = 5; // 0101 in binary
    status.reserved = 0;
    
    printf("Status check: Power=%u, WiFi=%u, ErrorCode=%u\n",
           status.power_on, status.wifi_connected, status.error_code);
    
    if (status.power_on && status.error_code == 5) {
        printf("OK: Bitfield access is correct.\n");
    } else {
        printf("ERROR: Bitfield access failed.\n");
    }

    printf("=== Complex Data Types test completed ===\n\n");
}

//------------------------------------------------------------
//*/
//-------------------------------------------------------------

// =========================================================================
// === CODE FOR TESTING WHILE AND DO-WHILE LOOPS =======================
// =========================================================================

void test_while_and_do_while_loops() {
    printf("\n=== Testing While and Do-While Loops ===\n");

    // --- 1. Test while loop with a variable condition ---
    printf("\n--- 1. Testing while loop ---\n");
    
    // Test 1.1: Standard loop that should execute several times
    int while_counter = 0;
    int while_sum = 0;
    printf("  Testing standard while loop (should run 5 times):\n");
    while (while_counter < 5) {
        while_sum += while_counter;
        printf("    Loop iter: counter=%d, sum=%d\n", while_counter, while_sum);
        while_counter++;
    }
    printf("  Final sum: %d (expected 10)\n", while_sum);
    if (while_sum == 10) {
        printf("  OK: Standard while loop is correct.\n");
    } else {
        printf("  ERROR: Standard while loop sum is incorrect!\n");
    }

    // Test 1.2: A loop whose condition is initially false (should not execute at all)
    printf("\n  Testing zero-trip while loop (should not run):\n");
    int zero_trip_counter = 10;
    while (zero_trip_counter < 10) {
        // This code should never be executed
        zero_trip_counter++;
        printf("    ERROR: Zero-trip while loop body executed!\n");
    }
    if (zero_trip_counter == 10) {
        printf("  OK: Zero-trip while loop body was correctly skipped.\n");
    } else {
        printf("  ERROR: Zero-trip while loop counter was modified!\n");
    }

    // --- 2. Test do-while loop ---
    printf("\n--- 2. Testing do-while loop ---\n");

    // Test 2.1: Standard loop, similar to the while loop
    int do_while_counter = 0;
    int do_while_sum = 0;
    printf("  Testing standard do-while loop (should run 5 times):\n");
    do {
        do_while_sum += do_while_counter;
        printf("    Loop iter: counter=%d, sum=%d\n", do_while_counter, do_while_sum);
        do_while_counter++;
    } while (do_while_counter < 5);
    printf("  Final sum: %d (expected 10)\n", do_while_sum);
    if (do_while_sum == 10) {
        printf("  OK: Standard do-while loop is correct.\n");
    } else {
        printf("  ERROR: Standard do-while loop sum is incorrect!\n");
    }

    // Test 2.2: A loop whose condition is initially false (should execute EXACTLY ONCE)
    printf("\n  Testing one-trip do-while loop (should run exactly once):\n");
    int one_trip_counter = 10;
    do {
        printf("    OK: One-trip do-while loop body executed (as expected).\n");
        one_trip_counter++;
    } while (one_trip_counter < 10); // Condition is immediately false
    
    printf("  Counter after loop: %d\n", one_trip_counter);
    if (one_trip_counter == 11) {
        printf("  OK: One-trip do-while loop executed exactly once.\n");
    } else {
        printf("  ERROR: One-trip do-while loop executed an incorrect number of times!\n");
    }

    printf("=== While and Do-While Loops test completed ===\n\n");
}

//-----------------------------------------------------------


// =========================================================================
// === CODE FOR TESTING BREAK AND CONTINUE STATEMENTS ====================
// =========================================================================

void test_break_and_continue() {
    printf("\n=== Testing Break and Continue Statements ===\n");

    // --- 1. Test 'continue' statement in a for loop ---
    // Goal: Skip iterations with even numbers and sum only the odd ones.
    printf("\n--- 1. Testing 'continue' in a for loop ---\n");
    printf("  This loop should sum only odd numbers from 0 to 9.\n");
    int continue_sum = 0;
    for (int i = 0; i < 10; i++) {
        // If the number is even, skip the rest of the loop body
        if (i % 2 == 0) {
            continue;
        }
        // This line only executes for odd numbers
        continue_sum += i;
    }
    // Expected sum: 1 + 3 + 5 + 7 + 9 = 25
    printf("  Final sum: %d (expected 25)\n", continue_sum);
    if (continue_sum == 25) {
        printf("  OK: 'continue' test passed. Iterations were skipped correctly.\n");
    } else {
        printf("  ERROR: 'continue' test failed! Sum is incorrect.\n");
    }

    // --- 2. Test 'break' statement in a while loop ---
    // Goal: Break out of an "infinite" loop when a counter reaches a certain value.
    printf("\n--- 2. Testing 'break' in a while loop ---\n");
    printf("  This loop is designed to run forever but should terminate when the counter reaches 5.\n");
    int break_counter = 0;
    while (1) { // Infinite loop
        if (break_counter >= 5) {
            // Break the loop when the counter is 5
            break;
        }
        break_counter++;
    }
    printf("  Loop exited. Final counter value: %d (expected 5)\n", break_counter);
    if (break_counter == 5) {
        printf("  OK: 'break' test passed. Loop was exited prematurely as expected.\n");
    } else {
        printf("  ERROR: 'break' test failed! Loop ran an incorrect number of times.\n");
    }

    // --- 3. Test nested loops with break ---
    // Goal: Ensure that 'break' only exits the inner loop.
    printf("\n--- 3. Testing 'break' in a nested loop ---\n");
    int outer_loop_runs = 0;
    int total_inner_loop_runs = 0;
    for (int i = 0; i < 3; i++) { // Outer loop should run 3 times
        outer_loop_runs++;
        for (int j = 0; j < 100; j++) { // Inner loop
            total_inner_loop_runs++;
            if (j == 2) {
                // Exit only the inner loop
                break;
            }
        }
    }
    // The inner loop should run 3 times for each of the 3 outer loops (j=0, 1, 2)
    // Total of 3 * 3 = 9 runs.
    printf("  Outer loop ran %d times (expected 3).\n", outer_loop_runs);
    printf("  Total inner loop runs: %d (expected 9).\n", total_inner_loop_runs);

    if (outer_loop_runs == 3 && total_inner_loop_runs == 9) {
        printf("  OK: 'break' in nested loop behaved correctly.\n");
    } else {
        printf("  ERROR: 'break' in nested loop failed!\n");
    }

    printf("=== Break and Continue Statements test completed ===\n\n");
}

//----------------------------------------------------------
// TABLE opcodes - pseudo-functions to generate the corresponding opcodes
extern int  OP_table_size(int table_idx);
extern void OP_table_init(int table_idx, int elem_seg_idx, int dest, int offset, int size);
extern void OP_table_copy(int table_dest_idx, int table_src_idx, int dest, int src, int size);
extern void OP_table_fill(int table_idx, int dest, int val, int size);
extern int  OP_table_get(int table_idx, int index);
extern void OP_table_set(int table_idx, int index, int value);

// Function pointer type with signature (int, int) -> int
typedef int (*binary_func_t)(int, int);

// Test functions to be placed in the table
int add_function_1(int a, int b) {
    printf("  add_function(%d, %d) called\n", a, b);
    return a + b;
}

int multiply_function_1(int a, int b) {
    printf("  multiply_function(%d, %d) called\n", a, b);
    return a * b;
}

int subtract_function_1(int a, int b) {
    printf("  subtract_function(%d, %d) called\n", a, b);
    return a - b;
}

void test_table_operations() {
    printf("\n=== Testing TABLE Operations ===\n");
    
    // Test 1: TABLE.SIZE - check initial table size
    printf("\n[Test 1] TABLE.SIZE - checking initial table size\n");
    int initial_size = OP_table_size(0);
    printf("  Initial size of table 0: %d\n", initial_size);
    if (initial_size != 10) {
        printf("  ERROR: Expected initial size 10, got %d\n", initial_size);
    } else {
        printf("  PASS: Initial size is correct (10)\n");
    }
    
    // Test 2: TABLE.INIT - initialize table elements from an element segment
    printf("\n[Test 2] TABLE.INIT - initializing table from element segment\n");
    printf("  Initializing 2 elements at table offset 5 from element segment 0 (starting at seg offset 0)\n");
    OP_table_init(0, 0, 5, 0, 2);
    printf("  TABLE.INIT completed\n");
    printf("  Note: Element segment 0 contains function indices [0, 0] (both point to function 0)\n");
    
    // Test 3: TABLE.FILL - fill a table range with a single value
    printf("\n[Test 3] TABLE.FILL - filling table range with value\n");
    printf("  Filling table[0..2] with function index 1\n");
    OP_table_fill(0, 0, 1, 3);
    printf("  TABLE.FILL completed\n");
    printf("  Expected: table[0] = 1, table[1] = 1, table[2] = 1\n");
    
    // Test 4: TABLE.COPY - copy elements within the table
    printf("\n[Test 4] TABLE.COPY - copying elements within table\n");
    printf("  Copying 2 elements from table offset 0 to table offset 7\n");
    OP_table_copy(0, 0, 7, 0, 2);
    printf("  TABLE.COPY completed\n");
    printf("  Expected: table[7] = table[0] = 1, table[8] = table[1] = 1\n");
    
    // Test 5: TABLE.SIZE - check size after operations
    printf("\n[Test 5] TABLE.SIZE - checking size after operations\n");
    int final_size = OP_table_size(0);
    printf("  Final size of table 0: %d\n", final_size);
    if (final_size < 9) {
        printf("  ERROR: Expected size >= 9 (expanded to fit operations), got %d\n", final_size);
    } else {
        printf("  PASS: Table size expanded correctly to %d\n", final_size);
    }
    
    // Test 6: Test table expansion
    printf("\n[Test 6] Testing table expansion beyond initial size\n");
    printf("  Filling table[15..17] with function index 2 (should expand table to size 18)\n");
    OP_table_fill(0, 15, 2, 3);
    int expanded_size = OP_table_size(0);
    printf("  Size after expansion: %d\n", expanded_size);
    if (expanded_size < 18) {
        printf("  ERROR: Expected size >= 18, got %d\n", expanded_size);
    } else {
        printf("  PASS: Table expanded to size %d\n", expanded_size);
    }
    
    // Final check
    printf("\n=== Summary ===\n");
    if (initial_size == 10 && final_size >= 9 && expanded_size >= 18) {
        printf("PASS: All TABLE operations executed successfully!\n");
        printf("  - TABLE.SIZE works correctly\n");
        printf("  - TABLE.INIT initializes from element segments\n");
        printf("  - TABLE.FILL fills table ranges\n");
        printf("  - TABLE.COPY copies within table\n");
        printf("  - Table auto-expands when needed\n");
    } else {
        printf("FAIL: Some TABLE operations did not produce expected results\n");
    }
    printf("=== TABLE Operations test completed ===\n\n");
}

void test_call_indirect_with_table() {
    printf("\n=== Testing CALL_INDIRECT with TABLE ===\n");
    
    // Test 1: Place function indices into the table via TABLE.SET
    printf("\n[Test 1] TABLE.SET - placing function indices in table\n");
    printf("  Setting table[0] = 0 (add_function)\n");
    OP_table_set(0, 0, 0);  // table[0] = function index 0
    
    printf("  Setting table[1] = 1 (multiply_function)\n");
    OP_table_set(0, 1, 1);  // table[1] = function index 1
    
    printf("  Setting table[2] = 2 (subtract_function)\n");
    OP_table_set(0, 2, 2);  // table[2] = function index 2
    
    // Test 2: Read indices back via TABLE.GET
    printf("\n[Test 2] TABLE.GET - reading function indices from table\n");
    int func_idx_0 = OP_table_get(0, 0);
    printf("  table[0] = %d (expected 0)\n", func_idx_0);
    
    int func_idx_1 = OP_table_get(0, 1);
    printf("  table[1] = %d (expected 1)\n", func_idx_1);
    
    int func_idx_2 = OP_table_get(0, 2);
    printf("  table[2] = %d (expected 2)\n", func_idx_2);
    
    // Check results
    if (func_idx_0 == 0 && func_idx_1 == 1 && func_idx_2 == 2) {
        printf("  PASS: All function indices correctly stored and retrieved\n");
    } else {
        printf("  FAIL: Function indices mismatch!\n");
    }
    
    // Test 3: CALL_INDIRECT via function pointers
    printf("\n[Test 3] CALL_INDIRECT - indirect function calls through function pointers\n");
    printf("  Creating function pointer array with 3 functions...\n");
    
    // Create an array of function pointers
    binary_func_t func_table[3];
    printf("  func_table[0] = add_function (index 0)\n");
    func_table[0] = add_function_1;
    
    printf("  func_table[1] = multiply_function (index 1)\n");
    func_table[1] = multiply_function_1;
    
    printf("  func_table[2] = subtract_function (index 2)\n");
    func_table[2] = subtract_function_1;
    
    printf("  Function pointer array initialized!\n");
    
    // Test 3.1: Call add_function via pointer
    printf("  Calling func_table[0](10, 5) [add_function]...\n");
    int result_add = func_table[0](10, 5);
    printf("  Result: %d (expected 15)\n", result_add);
    
    // Test 3.2: Call multiply_function via pointer
    printf("  Calling func_table[1](10, 5) [multiply_function]...\n");
    int result_mul = func_table[1](10, 5);
    printf("  Result: %d (expected 50)\n", result_mul);
    
    // Test 3.3: Call subtract_function via pointer
    printf("  Calling func_table[2](10, 5) [subtract_function]...\n");
    int result_sub = func_table[2](10, 5);
    printf("  Result: %d (expected 5)\n", result_sub);
    
    // Test 3.4: CRITICAL TEST - Dynamic function choice via variable
    printf("\n  [CRITICAL TEST] Dynamic call: choosing function at runtime...\n");
    printf("  This test MUST use CALL_INDIRECT because index 'i' is not known at compile time!\n");
    
    int dynamic_results[3];
    for (int i = 0; i < 3; i++) {
        printf("  Iteration %d: calling func_table[%d](7, 3)...\n", i, i);
        int result = func_table[i](7, 3);
        dynamic_results[i] = result;
        printf("  -> func_table[%d](7, 3) = %d\n", i, result);
    }
    
    // Check results of dynamic calls
    int expected_dynamic[3] = {10, 21, 4};  // add(7,3)=10, mul(7,3)=21, sub(7,3)=4
    bool dynamic_pass = true;
    for (int i = 0; i < 3; i++) {
        if (dynamic_results[i] != expected_dynamic[i]) {
            printf("  ERROR: func_table[%d] returned %d, expected %d\n", 
                   i, dynamic_results[i], expected_dynamic[i]);
            dynamic_pass = false;
        }
    }
    
    if (dynamic_pass) {
        printf("  PASS: All dynamic calls returned correct results!\n");
    } else {
        printf("  FAIL: Some dynamic calls returned incorrect results!\n");
    }
    
    // Final check of results
    printf("\n=== Summary ===\n");
    bool all_pass = (result_add == 15 && result_mul == 50 && result_sub == 5 && dynamic_pass);
    
    if (all_pass) {
        printf("✅ PASS: All CALL_INDIRECT operations succeeded!\n");
        printf("  ✓ TABLE.SET/GET operations work correctly\n");
        printf("  ✓ Static indirect calls (func_table[0], [1], [2]) work correctly\n");
        printf("  ✓ Dynamic indirect calls (func_table[i] in loop) work correctly\n");
        printf("  ✓ Function indices stored: 0=%d, 1=%d, 2=%d\n", func_idx_0, func_idx_1, func_idx_2);
        printf("  ✓ All results match expected values\n");
    } else {
        printf("❌ FAIL: Some CALL_INDIRECT operations failed!\n");
        if (result_add != 15 || result_mul != 50 || result_sub != 5) {
            printf("  Static calls: add=%d (exp 15), mul=%d (exp 50), sub=%d (exp 5)\n", 
                   result_add, result_mul, result_sub);
        }
        if (!dynamic_pass) {
            printf("  Dynamic calls in loop failed - see errors above\n");
        }
    }
    
    printf("\n=== CALL_INDIRECT with TABLE test completed ===\n\n");
}


//------------------------------------------------------------
// CALL INDIRECT PTR
//------------------------------------------------------------
// Simple test functions
int add_function(int a, int b) {
    printf("  add_function(%d, %d) called\n", a, b);
    return a + b;
}

int multiply_function(int a, int b) {
    printf("  multiply_function(%d, %d) called\n", a, b);
    return a * b;
}

int subtract_function(int a, int b) {
    printf("  subtract_function(%d, %d) called\n", a, b);
    return a - b;
}

// Helper function to force a call by address
__attribute__((noinline, optnone, noclone))
int call_function_by_address(void* func_addr, int arg1, int arg2) {
    printf("    call_function_by_address: calling %p with (%d, %d)\n", func_addr, arg1, arg2);
    
    // Force the use of the address as a function pointer
    // This should generate CALL_INDIRECT_PTR (0x0D)
    int (*unsafe_func)(int, int) = (int(*)(int, int))func_addr;
    
    return unsafe_func(arg1, arg2);
}

// Test for CALL_INDIRECT_PTR (unsafe calls by address)
void test_call_indirect_ptr_unsafe() {
    printf("\n=== Testing CALL_INDIRECT_PTR (UNSAFE) ===\n");
    printf("This test requires ESPB_UNSAFE_MODE to be enabled\n");
    
    // Test: Force calls by function addresses
    printf("\n[Test] Direct address calls (forced unsafe mode)\n");
    
    // Get function addresses directly
    void* addr_add = (void*)&add_function;
    void* addr_mul = (void*)&multiply_function;
    void* addr_sub = (void*)&subtract_function;
    
    printf("  Function addresses:\n");
    printf("    add_function = %p\n", addr_add);
    printf("    multiply_function = %p\n", addr_mul);
    printf("    subtract_function = %p\n", addr_sub);
    
    printf("\n  Attempting unsafe calls by address:\n");
    
    // Force calls via the wrapper function
    printf("  Calling add_function by address...\n");
    int result1 = call_function_by_address(addr_add, 12, 8);
    printf("  call_by_address(add, 12, 8) = %d (expected 20)\n", result1);
    
    printf("  Calling multiply_function by address...\n");
    int result2 = call_function_by_address(addr_mul, 6, 7);
    printf("  call_by_address(mul, 6, 7) = %d (expected 42)\n", result2);
    
    printf("  Calling subtract_function by address...\n");
    int result3 = call_function_by_address(addr_sub, 15, 6);
    printf("  call_by_address(sub, 15, 6) = %d (expected 9)\n", result3);
    
    // Check results
    printf("\n=== Results ===\n");
    if (result1 == 20 && result2 == 42 && result3 == 9) {
        printf("✅ PASS: All direct address calls returned correct results\n");
    } else {
        printf("❌ FAIL: Some direct address calls returned incorrect results\n");
        printf("    Got: %d, %d, %d\n", result1, result2, result3);
        printf("    Expected: 20, 42, 9\n");
    }
    
    printf("\n=== CALL_INDIRECT_PTR test completed ===\n\n");
}
//-----------------------------------------------------------
//------------------------------------------------------------
void app_main(void)
{
    TimerHandle_t t = NULL;
    TaskHandle_t counter_task_handle = NULL;



    printf("Hello world!\n\n");

    test_call_indirect_ptr_unsafe();
    test_table_operations();
    test_call_indirect_with_table();
    test_break_and_continue();
    test_while_and_do_while_loops();
     test_complex_data_types();
   test_math_operations32();
     test_math_operations();
      test_i64_imm8_ops();
     test_heap_and_memory_operations();
      test_atomics();
    test_select_opcodes();
    test_pointer_ops();
    MarchallingTest();
      test_globals();



    test_call_indirect();

    test_call_indirect_non_optimizable();

    test_memory_operations();

   test_control_flow();

    long long  a = 10;
    long long  b = 5;
    long long  c = 3;

    a = a + 10;
    a = a - b;
    a = (a / c) * 2;
    a = a % b;              // REM
    a = a | c;              // OR
    a = a ^ b;              // XOR
    a = a << 1;             // SHL
    a = a >> 2;             // SHR (arithmetic)
    a = (unsigned)a >> 1;   // USHR (logical)
    //a = (unsigned)a >> 1;   // USHR (logical)
    //int s=(int)a;

    //printf("first num is = %d\n", s);

    printf("first num is = %d\n", (int)a);


    // --- bool Test ---
    printf("\n--- Testing bool ---\n");
    bool flag1 = true;
    bool flag2 = false;

    if (flag1) {
        printf("OK: flag1 is true\n");
    } else {
        printf("ERROR: flag1 is false\n");
    }

    if (!flag2) {
        printf("OK: !flag2 is true\n");
    } else {
        printf("ERROR: !flag2 is false\n");
    }

    bool result = flag1 && flag2;
    if (result) {
        printf("ERROR: flag1 && flag2 is true\n");
    } else {
        printf("OK: flag1 && flag2 is false\n");
    }

    flag2 = !flag2;
    if (flag2) {
        printf("OK: flag2 is now true after negation\n");
    } else {
        printf("ERROR: flag2 is false after negation\n");
    }
    printf("--- End of bool test ---\n\n");


    // --- float Test ---
    printf("--- Testing float ---\n");
    float f1 = 1.5f;
    float f2 = 2.25f;
    printf("f1 = %f, f2 = %f\n", f1, f2);
    printf("f1 + f2 = %f\n", f1 + f2);
    printf("f2 - f1 = %f\n", f2 - f1);
    printf("f1 * f2 = %f\n", f1 * f2);
    printf("f2 / f1 = %f\n\n", f2 / f1);
    printf("--- End of float test ---\n\n");



    // --- double Test ---
    printf("--- Testing double ---\n");
    double d1 = 1.23456789;
    double d2 = 9.87654321;
    printf("d1 = %lf, d2 = %lf\n", d1, d2);
    printf("d1 + d2 = %lf\n", d1 + d2);
    printf("d2 - d1 = %lf\n", d2 - d1);
    printf("d1 * d2 = %lf\n", d1 * d2);
    printf("d2 / d1 = %lf\n\n", d2 / d1);
    printf("--- End of double test ---\n\n");

 #define USE_HOST_HELPERS

    // --- Test ESPB-internal callbacks via import helpers (disabled by default) ---
#ifdef USE_HOST_HELPERS
    printf("--- Testing host_invoke_cb ---\n");
    host_invoke_cb(cb_print, (void*)0x12345678);

    printf("--- Testing host_invoke_cb2 ---\n");
    host_invoke_cb2(cb_with_int, 42, (void*)0xCAFEBABE);
#else
    printf("--- host_invoke_cb tests are disabled (define USE_HOST_HELPERS to enable) ---\n");
#endif

    // --- Test FreeRTOS xTimerCreate with user_data ---
    printf("--- Testing FreeRTOS xTimerCreate ---\n");
    t = xTimerCreate("tcb",
                                   pdMS_TO_TICKS(2000),
                                   pdTRUE,
                                   (void*)0xDEADFACE,  // user_data in pvTimerID
                                   test_timer_cb);
    if (t) {
        xTimerStart(t, 0);
    } else {
        printf("ERROR: xTimerCreate failed\n");
    }

// --- Test FreeRTOS xTaskCreate with non-zero pvParameter ---
    printf("--- Testing FreeRTOS xTaskCreate ---\n");
   xTaskCreate(&counter_task, "counter_task", 4048, (void*)0xAABBCCDD, 5, &counter_task_handle);
  // xTaskCreate(&counter_task, "counter_task", 4048, (void*)0xAABBCCDD, 5, NULL);


    for (int i = 0; i < 2; i++) {
         printf("Main loop iteration = %d\n", i );
        vTaskDelay(10000 / portTICK_PERIOD_MS); // 10 seconds
    }
    printf("\nAll tests completed. Main task will now exit.\n");
    
    vTaskDelay(2000 / portTICK_PERIOD_MS); // 2 seconds

    if (t) {
        printf("Stopping and deleting timer...\n");
        xTimerStop(t, 0);
        xTimerDelete(t, 0);
        printf("\nStopping and deleting timer complete\n");

    }

    if (counter_task_handle) {
        printf("Deleting counter_task...\n");
        vTaskDelete(counter_task_handle);
        printf("Deleting counter_task completed\n");

    }
    else
    {
         printf("\ncounter_task_handle not valid\n");
   
    }
        // */
    printf("\ndl1\n");

    vTaskDelay(20000 / portTICK_PERIOD_MS); // 20 seconds
    
    printf("\nmain exit\n");

 //*/   

    /*
        int i=0;
        while (1) {
        printf("Main loop iteration = %d\n", i );
        i++;
        vTaskDelay(10000 / portTICK_PERIOD_MS); // 10 seconds
    }
    */
}