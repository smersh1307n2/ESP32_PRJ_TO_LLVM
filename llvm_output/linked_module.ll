; ModuleID = 'llvm_output\linked_module.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-esp-unknown-elf"

%struct.SensorData = type { i32, float, [16 x i8], i8 }

@g_my_global_int = dso_local local_unnamed_addr global i32 123, align 4, !dbg !0
@g_my_global_long = dso_local local_unnamed_addr global i64 9876543210, align 8, !dbg !65
@g_my_global_bool = dso_local local_unnamed_addr global i8 0, align 1, !dbg !67
@.str = private unnamed_addr constant [36 x i8] c"counter_task start, pvParameter=%p\0A\00", align 1, !dbg !70
@.str.1 = private unnamed_addr constant [13 x i8] c"num is = %d\0A\00", align 1, !dbg !75
@.str.2 = private unnamed_addr constant [31 x i8] c"add_func called: %d + %d = %d\0A\00", align 1, !dbg !80
@.str.3 = private unnamed_addr constant [31 x i8] c"mul_func called: %d * %d = %d\0A\00", align 1, !dbg !85
@.str.4 = private unnamed_addr constant [54 x i8] c"call_operation: calling function pointer with %d, %d\0A\00", align 1, !dbg !87
@.str.6 = private unnamed_addr constant [24 x i8] c"Direct call result: %d\0A\00", align 1, !dbg !94
@.str.7 = private unnamed_addr constant [32 x i8] c"Indirect call result (add): %d\0A\00", align 1, !dbg !99
@.str.8 = private unnamed_addr constant [32 x i8] c"Indirect call result (mul): %d\0A\00", align 1, !dbg !104
@.str.9 = private unnamed_addr constant [37 x i8] c"Changed function pointer result: %d\0A\00", align 1, !dbg !106
@.str.11 = private unnamed_addr constant [53 x i8] c"call_operation_by_index: op=%d, calling with %d, %d\0A\00", align 1, !dbg !116
@operations = internal unnamed_addr constant [2 x ptr] [ptr @add_func, ptr @mul_func], align 4, !dbg !1089
@.str.12 = private unnamed_addr constant [45 x i8] c"call_volatile_function: calling with %d, %d\0A\00", align 1, !dbg !121
@.str.14 = private unnamed_addr constant [34 x i8] c"Result from array call (add): %d\0A\00", align 1, !dbg !131
@.str.15 = private unnamed_addr constant [34 x i8] c"Result from array call (mul): %d\0A\00", align 1, !dbg !136
@.str.16 = private unnamed_addr constant [31 x i8] c"Result from volatile call: %d\0A\00", align 1, !dbg !138
@.str.19 = private unnamed_addr constant [29 x i8] c"Initial g_my_global_int: %d\0A\00", align 1, !dbg !150
@.str.20 = private unnamed_addr constant [32 x i8] c"Initial g_my_global_long: %lld\0A\00", align 1, !dbg !155
@.str.21 = private unnamed_addr constant [30 x i8] c"Initial g_my_global_bool: %s\0A\00", align 1, !dbg !157
@.str.22 = private unnamed_addr constant [5 x i8] c"true\00", align 1, !dbg !162
@.str.23 = private unnamed_addr constant [6 x i8] c"false\00", align 1, !dbg !167
@.str.24 = private unnamed_addr constant [31 x i8] c"\0AModified g_my_global_int: %d\0A\00", align 1, !dbg !172
@.str.25 = private unnamed_addr constant [33 x i8] c"Modified g_my_global_long: %lld\0A\00", align 1, !dbg !174
@.str.26 = private unnamed_addr constant [31 x i8] c"Modified g_my_global_bool: %s\0A\00", align 1, !dbg !179
@.str.29 = private unnamed_addr constant [40 x i8] c"i32_a=%d, i32_b=%d, u32_a=%u, u32_b=%u\0A\00", align 1, !dbg !188
@.str.30 = private unnamed_addr constant [9 x i8] c"ADD: %d\0A\00", align 1, !dbg !190
@.str.31 = private unnamed_addr constant [9 x i8] c"SUB: %d\0A\00", align 1, !dbg !195
@.str.32 = private unnamed_addr constant [9 x i8] c"MUL: %d\0A\00", align 1, !dbg !197
@.str.33 = private unnamed_addr constant [10 x i8] c"DIVS: %d\0A\00", align 1, !dbg !199
@.str.34 = private unnamed_addr constant [10 x i8] c"REMS: %d\0A\00", align 1, !dbg !204
@.str.35 = private unnamed_addr constant [10 x i8] c"DIVU: %u\0A\00", align 1, !dbg !206
@.str.36 = private unnamed_addr constant [10 x i8] c"REMU: %u\0A\00", align 1, !dbg !208
@.str.37 = private unnamed_addr constant [9 x i8] c"AND: %d\0A\00", align 1, !dbg !210
@.str.38 = private unnamed_addr constant [8 x i8] c"OR: %d\0A\00", align 1, !dbg !212
@.str.39 = private unnamed_addr constant [9 x i8] c"XOR: %d\0A\00", align 1, !dbg !217
@.str.40 = private unnamed_addr constant [9 x i8] c"SHL: %d\0A\00", align 1, !dbg !219
@.str.41 = private unnamed_addr constant [10 x i8] c"SHRS: %d\0A\00", align 1, !dbg !221
@.str.42 = private unnamed_addr constant [10 x i8] c"SHRU: %u\0A\00", align 1, !dbg !223
@.str.43 = private unnamed_addr constant [9 x i8] c"NOT: %d\0A\00", align 1, !dbg !225
@.str.46 = private unnamed_addr constant [48 x i8] c"i64_a=%lld, i64_b=%lld, u64_a=%llu, u64_b=%llu\0A\00", align 1, !dbg !231
@.str.47 = private unnamed_addr constant [11 x i8] c"ADD: %lld\0A\00", align 1, !dbg !236
@.str.48 = private unnamed_addr constant [11 x i8] c"SUB: %lld\0A\00", align 1, !dbg !241
@.str.49 = private unnamed_addr constant [11 x i8] c"MUL: %lld\0A\00", align 1, !dbg !243
@.str.50 = private unnamed_addr constant [12 x i8] c"DIVS: %lld\0A\00", align 1, !dbg !245
@.str.51 = private unnamed_addr constant [12 x i8] c"REMS: %lld\0A\00", align 1, !dbg !250
@.str.52 = private unnamed_addr constant [12 x i8] c"DIVU: %llu\0A\00", align 1, !dbg !252
@.str.53 = private unnamed_addr constant [12 x i8] c"REMU: %llu\0A\00", align 1, !dbg !254
@.str.54 = private unnamed_addr constant [11 x i8] c"AND: %lld\0A\00", align 1, !dbg !256
@.str.55 = private unnamed_addr constant [10 x i8] c"OR: %lld\0A\00", align 1, !dbg !258
@.str.56 = private unnamed_addr constant [11 x i8] c"XOR: %lld\0A\00", align 1, !dbg !260
@.str.57 = private unnamed_addr constant [11 x i8] c"SHL: %lld\0A\00", align 1, !dbg !262
@.str.58 = private unnamed_addr constant [12 x i8] c"SHRS: %lld\0A\00", align 1, !dbg !264
@.str.59 = private unnamed_addr constant [12 x i8] c"SHRU: %llu\0A\00", align 1, !dbg !266
@.str.60 = private unnamed_addr constant [11 x i8] c"NOT: %lld\0A\00", align 1, !dbg !268
@.str.62 = private unnamed_addr constant [20 x i8] c"f32_a=%f, f32_b=%f\0A\00", align 1, !dbg !272
@.str.63 = private unnamed_addr constant [9 x i8] c"ADD: %f\0A\00", align 1, !dbg !277
@.str.64 = private unnamed_addr constant [9 x i8] c"SUB: %f\0A\00", align 1, !dbg !279
@.str.65 = private unnamed_addr constant [9 x i8] c"MUL: %f\0A\00", align 1, !dbg !281
@.str.66 = private unnamed_addr constant [9 x i8] c"DIV: %f\0A\00", align 1, !dbg !283
@.str.67 = private unnamed_addr constant [9 x i8] c"ABS: %f\0A\00", align 1, !dbg !285
@.str.68 = private unnamed_addr constant [10 x i8] c"SQRT: %f\0A\00", align 1, !dbg !287
@.str.69 = private unnamed_addr constant [9 x i8] c"MIN: %f\0A\00", align 1, !dbg !289
@.str.70 = private unnamed_addr constant [9 x i8] c"MAX: %f\0A\00", align 1, !dbg !291
@.str.72 = private unnamed_addr constant [22 x i8] c"f64_a=%lf, f64_b=%lf\0A\00", align 1, !dbg !295
@.str.73 = private unnamed_addr constant [10 x i8] c"ADD: %lf\0A\00", align 1, !dbg !300
@.str.74 = private unnamed_addr constant [10 x i8] c"SUB: %lf\0A\00", align 1, !dbg !302
@.str.75 = private unnamed_addr constant [10 x i8] c"MUL: %lf\0A\00", align 1, !dbg !304
@.str.76 = private unnamed_addr constant [10 x i8] c"DIV: %lf\0A\00", align 1, !dbg !306
@.str.77 = private unnamed_addr constant [10 x i8] c"ABS: %lf\0A\00", align 1, !dbg !308
@.str.78 = private unnamed_addr constant [11 x i8] c"SQRT: %lf\0A\00", align 1, !dbg !310
@.str.79 = private unnamed_addr constant [10 x i8] c"MIN: %lf\0A\00", align 1, !dbg !312
@.str.80 = private unnamed_addr constant [10 x i8] c"MAX: %lf\0A\00", align 1, !dbg !314
@.str.82 = private unnamed_addr constant [24 x i8] c"CVT.F64.I32: %lf -> %d\0A\00", align 1, !dbg !321
@.str.83 = private unnamed_addr constant [25 x i8] c"CVT.I64.F32: %lld -> %f\0A\00", align 1, !dbg !323
@.str.84 = private unnamed_addr constant [29 x i8] c"TRUNC.I32.I16: 123456 -> %d\0A\00", align 1, !dbg !325
@.str.85 = private unnamed_addr constant [23 x i8] c"SEXT.I8.I32: -5 -> %d\0A\00", align 1, !dbg !327
@.str.89 = private unnamed_addr constant [38 x i8] c"STORE/LOAD I32: Stored %d, Loaded %d\0A\00", align 1, !dbg !344
@.str.90 = private unnamed_addr constant [42 x i8] c"STORE/LOAD I64: Stored %lld, Loaded %lld\0A\00", align 1, !dbg !349
@.str.91 = private unnamed_addr constant [38 x i8] c"STORE/LOAD F32: Stored %f, Loaded %f\0A\00", align 1, !dbg !351
@.str.92 = private unnamed_addr constant [40 x i8] c"STORE/LOAD F64: Stored %lf, Loaded %lf\0A\00", align 1, !dbg !353
@.str.93 = private unnamed_addr constant [37 x i8] c"STORE/LOAD I8: Stored %d, Loaded %d\0A\00", align 1, !dbg !355
@.str.94 = private unnamed_addr constant [37 x i8] c"STORE/LOAD U8: Stored %u, Loaded %u\0A\00", align 1, !dbg !357
@.str.95 = private unnamed_addr constant [38 x i8] c"STORE/LOAD I16: Stored %d, Loaded %d\0A\00", align 1, !dbg !359
@.str.96 = private unnamed_addr constant [38 x i8] c"STORE/LOAD U16: Stored %u, Loaded %u\0A\00", align 1, !dbg !361
@.str.97 = private unnamed_addr constant [38 x i8] c"STORE/LOAD PTR: Stored %p, Loaded %p\0A\00", align 1, !dbg !363
@.str.110 = private unnamed_addr constant [29 x i8] c"  Loop i=%d, current sum=%d\0A\00", align 1, !dbg !395
@.str.111 = private unnamed_addr constant [29 x i8] c"Final sum: %d (expected 15)\0A\00", align 1, !dbg !397
@.str.115 = private unnamed_addr constant [30 x i8] c"Testing switch for value %d: \00", align 1, !dbg !405
@.str.124 = private unnamed_addr constant [64 x i8] c"Before call, magic_container = %d (Address in ESPB memory: %p)\0A\00", align 1, !dbg !429
@.str.125 = private unnamed_addr constant [34 x i8] c"After call, magic_container = %d\0A\00", align 1, !dbg !434
@.str.130 = private unnamed_addr constant [23 x i8] c"SELECT.I32 result: %d\0A\00", align 1, !dbg !447
@.str.131 = private unnamed_addr constant [25 x i8] c"SELECT.I64 result: %lld\0A\00", align 1, !dbg !449
@.str.132 = private unnamed_addr constant [23 x i8] c"SELECT.F32 result: %f\0A\00", align 1, !dbg !451
@.str.133 = private unnamed_addr constant [24 x i8] c"SELECT.F64 result: %lf\0A\00", align 1, !dbg !453
@.str.134 = private unnamed_addr constant [23 x i8] c"SELECT.PTR result: %p\0A\00", align 1, !dbg !455
@.str.137 = private unnamed_addr constant [38 x i8] c"PTRTOINT: Address of my_var is 0x%lx\0A\00", align 1, !dbg !461
@.str.138 = private unnamed_addr constant [38 x i8] c"OK: INTTOPTR successful, value is %d\0A\00", align 1, !dbg !463
@.str.143 = private unnamed_addr constant [30 x i8] c"Initial atomic I32 value: %d\0A\00", align 1, !dbg !473
@.str.144 = private unnamed_addr constant [28 x i8] c"ATOMIC.ADD: old=%d, new=%d\0A\00", align 1, !dbg !475
@.str.145 = private unnamed_addr constant [29 x i8] c"ATOMIC.XCHG: old=%d, new=%d\0A\00", align 1, !dbg !480
@.str.146 = private unnamed_addr constant [47 x i8] c"ATOMIC.CMPXCHG (success): expected=42, new=%d\0A\00", align 1, !dbg !482
@.str.147 = private unnamed_addr constant [71 x i8] c"ATOMIC.CMPXCHG (failure): expected=99, old_val_in_expected=%d, new=%d\0A\00", align 1, !dbg !484
@.str.149 = private unnamed_addr constant [32 x i8] c"Initial atomic I64 value: %lld\0A\00", align 1, !dbg !491
@.str.150 = private unnamed_addr constant [36 x i8] c"ATOMIC.SUB.I64: old=%lld, new=%lld\0A\00", align 1, !dbg !493
@.str.151 = private unnamed_addr constant [49 x i8] c"ATOMIC.STORE/LOAD I64: stored=5555, loaded=%lld\0A\00", align 1, !dbg !495
@.str.156 = private unnamed_addr constant [63 x i8] c"OK: malloc(128) succeeded. Allocated buffer at offset/ptr %p.\0A\00", align 1, !dbg !511
@.str.157 = private unnamed_addr constant [12 x i8] c"Test Malloc\00", align 1, !dbg !516
@.str.161 = private unnamed_addr constant [57 x i8] c"Copying %zu bytes from static data to dynamic buffer...\0A\00", align 1, !dbg !530
@STATIC_DATA_FOR_INIT = internal constant [58 x i8] c"Hello from a static data segment! This tests MEMORY.INIT.\00", align 1, !dbg !1092
@.str.170 = private unnamed_addr constant [78 x i8] c"OK: Memory was successfully reused after free(). Allocated new buffer at %p.\0A\00", align 1, !dbg !554
@.str.174 = private unnamed_addr constant [44 x i8] c"Initial values: i64_a = %lld, u64_a = %llu\0A\00", align 1, !dbg !571
@.str.175 = private unnamed_addr constant [34 x i8] c"DIVS.I64.IMM8: %lld / -10 = %lld\0A\00", align 1, !dbg !576
@.str.176 = private unnamed_addr constant [33 x i8] c"DIVU.I64.IMM8: %llu / 20 = %llu\0A\00", align 1, !dbg !578
@.str.177 = private unnamed_addr constant [34 x i8] c"REMS.I64.IMM8: %lld %% 13 = %lld\0A\00", align 1, !dbg !580
@.str.178 = private unnamed_addr constant [34 x i8] c"REMU.I64.IMM8: %llu %% 17 = %llu\0A\00", align 1, !dbg !582
@.str.179 = private unnamed_addr constant [33 x i8] c"SHRU.I64.IMM8: %llu >> 3 = %llu\0A\00", align 1, !dbg !584
@.str.181 = private unnamed_addr constant [37 x i8] c"  [Helper] Printing array contents: \00", align 1, !dbg !588
@.str.182 = private unnamed_addr constant [4 x i8] c"%d \00", align 1, !dbg !590
@.str.184 = private unnamed_addr constant [16 x i8] c"Modified Sensor\00", align 1, !dbg !600
@.str.187 = private unnamed_addr constant [16 x i8] c"Initial array: \00", align 1, !dbg !609
@.str.188 = private unnamed_addr constant [41 x i8] c"Value at index 2 after modification: %d\0A\00", align 1, !dbg !611
@.str.189 = private unnamed_addr constant [37 x i8] c"Matrix[1][1] value: %d (expected 5)\0A\00", align 1, !dbg !613
@.str.191 = private unnamed_addr constant [13 x i8] c"TempSensor-A\00", align 1, !dbg !617
@.str.192 = private unnamed_addr constant [47 x i8] c"Sensor ID: %d, Name: %s, Temp: %f, Active: %s\0A\00", align 1, !dbg !619
@.str.193 = private unnamed_addr constant [4 x i8] c"yes\00", align 1, !dbg !621
@.str.195 = private unnamed_addr constant [37 x i8] c"Temperature updated via pointer: %f\0A\00", align 1, !dbg !628
@.str.196 = private unnamed_addr constant [57 x i8] c"After modify_sensor_by_ref: Name=%s, Temp=%f, Active=%s\0A\00", align 1, !dbg !630
@.str.198 = private unnamed_addr constant [40 x i8] c"Size of DataConverter union: %zu bytes\0A\00", align 1, !dbg !634
@.str.199 = private unnamed_addr constant [20 x i8] c"Assigned float: %f\0A\00", align 1, !dbg !636
@.str.200 = private unnamed_addr constant [33 x i8] c"  Read as integer (hex): 0x%08X\0A\00", align 1, !dbg !638
@.str.201 = private unnamed_addr constant [48 x i8] c"  Read as raw bytes (hex): %02x %02x %02x %02x\0A\00", align 1, !dbg !640
@.str.202 = private unnamed_addr constant [23 x i8] c"\0AAssigned integer: %d\0A\00", align 1, !dbg !642
@.str.203 = private unnamed_addr constant [60 x i8] c"  Read as float: %f (value is now interpreted differently)\0A\00", align 1, !dbg !644
@.str.205 = private unnamed_addr constant [49 x i8] c"Initial state: %d (expected 1 for STATE_ACTIVE)\0A\00", align 1, !dbg !651
@.str.211 = private unnamed_addr constant [16 x i8] c"Engine-1\00\00\00\00\00\00\00\00", align 4, !dbg !669
@.str.212 = private unnamed_addr constant [16 x i8] c"Freezer-3\00\00\00\00\00\00\00", align 4, !dbg !671
@.str.214 = private unnamed_addr constant [30 x i8] c"  Sensor #%d: ID=%d, Name=%s\0A\00", align 1, !dbg !675
@.str.216 = private unnamed_addr constant [55 x i8] c"Size of DeviceStatus struct: %zu byte(s) (expected 1)\0A\00", align 1, !dbg !679
@.str.217 = private unnamed_addr constant [47 x i8] c"Status check: Power=%u, WiFi=%u, ErrorCode=%u\0A\00", align 1, !dbg !681
@.str.224 = private unnamed_addr constant [35 x i8] c"    Loop iter: counter=%d, sum=%d\0A\00", align 1, !dbg !695
@.str.225 = private unnamed_addr constant [31 x i8] c"  Final sum: %d (expected 10)\0A\00", align 1, !dbg !700
@.str.238 = private unnamed_addr constant [26 x i8] c"  Counter after loop: %d\0A\00", align 1, !dbg !732
@.str.245 = private unnamed_addr constant [31 x i8] c"  Final sum: %d (expected 25)\0A\00", align 1, !dbg !749
@.str.250 = private unnamed_addr constant [53 x i8] c"  Loop exited. Final counter value: %d (expected 5)\0A\00", align 1, !dbg !768
@.str.254 = private unnamed_addr constant [41 x i8] c"  Outer loop ran %d times (expected 3).\0A\00", align 1, !dbg !779
@.str.255 = private unnamed_addr constant [43 x i8] c"  Total inner loop runs: %d (expected 9).\0A\00", align 1, !dbg !781
@.str.259 = private unnamed_addr constant [31 x i8] c"  add_function(%d, %d) called\0A\00", align 1, !dbg !789
@.str.260 = private unnamed_addr constant [36 x i8] c"  multiply_function(%d, %d) called\0A\00", align 1, !dbg !791
@.str.261 = private unnamed_addr constant [36 x i8] c"  subtract_function(%d, %d) called\0A\00", align 1, !dbg !793
@.str.264 = private unnamed_addr constant [31 x i8] c"  Initial size of table 0: %d\0A\00", align 1, !dbg !799
@.str.265 = private unnamed_addr constant [43 x i8] c"  ERROR: Expected initial size 10, got %d\0A\00", align 1, !dbg !801
@.str.280 = private unnamed_addr constant [29 x i8] c"  Final size of table 0: %d\0A\00", align 1, !dbg !837
@.str.281 = private unnamed_addr constant [66 x i8] c"  ERROR: Expected size >= 9 (expanded to fit operations), got %d\0A\00", align 1, !dbg !839
@.str.282 = private unnamed_addr constant [45 x i8] c"  PASS: Table size expanded correctly to %d\0A\00", align 1, !dbg !841
@.str.285 = private unnamed_addr constant [28 x i8] c"  Size after expansion: %d\0A\00", align 1, !dbg !850
@.str.286 = private unnamed_addr constant [38 x i8] c"  ERROR: Expected size >= 18, got %d\0A\00", align 1, !dbg !852
@.str.287 = private unnamed_addr constant [35 x i8] c"  PASS: Table expanded to size %d\0A\00", align 1, !dbg !854
@.str.303 = private unnamed_addr constant [30 x i8] c"  table[0] = %d (expected 0)\0A\00", align 1, !dbg !886
@.str.304 = private unnamed_addr constant [30 x i8] c"  table[1] = %d (expected 1)\0A\00", align 1, !dbg !888
@.str.305 = private unnamed_addr constant [30 x i8] c"  table[2] = %d (expected 2)\0A\00", align 1, !dbg !890
@.str.315 = private unnamed_addr constant [28 x i8] c"  Result: %d (expected 15)\0A\00", align 1, !dbg !913
@.str.317 = private unnamed_addr constant [28 x i8] c"  Result: %d (expected 50)\0A\00", align 1, !dbg !917
@.str.319 = private unnamed_addr constant [27 x i8] c"  Result: %d (expected 5)\0A\00", align 1, !dbg !921
@.str.322 = private unnamed_addr constant [49 x i8] c"  Iteration %d: calling func_table[%d](7, 3)...\0A\00", align 1, !dbg !930
@.str.323 = private unnamed_addr constant [32 x i8] c"  -> func_table[%d](7, 3) = %d\0A\00", align 1, !dbg !932
@.str.324 = private unnamed_addr constant [50 x i8] c"  ERROR: func_table[%d] returned %d, expected %d\0A\00", align 1, !dbg !934
@.str.331 = private unnamed_addr constant [49 x i8] c"  \E2\9C\93 Function indices stored: 0=%d, 1=%d, 2=%d\0A\00", align 1, !dbg !948
@.str.337 = private unnamed_addr constant [56 x i8] c"    call_function_by_address: calling %p with (%d, %d)\0A\00", align 1, !dbg !960
@.str.342 = private unnamed_addr constant [23 x i8] c"    add_function = %p\0A\00", align 1, !dbg !970
@.str.343 = private unnamed_addr constant [28 x i8] c"    multiply_function = %p\0A\00", align 1, !dbg !972
@.str.344 = private unnamed_addr constant [28 x i8] c"    subtract_function = %p\0A\00", align 1, !dbg !974
@.str.347 = private unnamed_addr constant [50 x i8] c"  call_by_address(add, 12, 8) = %d (expected 20)\0A\00", align 1, !dbg !980
@.str.349 = private unnamed_addr constant [49 x i8] c"  call_by_address(mul, 6, 7) = %d (expected 42)\0A\00", align 1, !dbg !984
@.str.351 = private unnamed_addr constant [49 x i8] c"  call_by_address(sub, 15, 6) = %d (expected 9)\0A\00", align 1, !dbg !988
@.str.355 = private unnamed_addr constant [21 x i8] c"    Got: %d, %d, %d\0A\00", align 1, !dbg !996
@.str.359 = private unnamed_addr constant [19 x i8] c"first num is = %d\0A\00", align 1, !dbg !1004
@.str.371 = private unnamed_addr constant [18 x i8] c"f1 = %f, f2 = %f\0A\00", align 1, !dbg !1031
@.str.372 = private unnamed_addr constant [14 x i8] c"f1 + f2 = %f\0A\00", align 1, !dbg !1033
@.str.373 = private unnamed_addr constant [14 x i8] c"f2 - f1 = %f\0A\00", align 1, !dbg !1035
@.str.374 = private unnamed_addr constant [14 x i8] c"f1 * f2 = %f\0A\00", align 1, !dbg !1037
@.str.375 = private unnamed_addr constant [15 x i8] c"f2 / f1 = %f\0A\0A\00", align 1, !dbg !1039
@.str.378 = private unnamed_addr constant [20 x i8] c"d1 = %lf, d2 = %lf\0A\00", align 1, !dbg !1045
@.str.379 = private unnamed_addr constant [15 x i8] c"d1 + d2 = %lf\0A\00", align 1, !dbg !1047
@.str.380 = private unnamed_addr constant [15 x i8] c"d2 - d1 = %lf\0A\00", align 1, !dbg !1049
@.str.381 = private unnamed_addr constant [15 x i8] c"d1 * d2 = %lf\0A\00", align 1, !dbg !1051
@.str.382 = private unnamed_addr constant [16 x i8] c"d2 / d1 = %lf\0A\0A\00", align 1, !dbg !1053
@.str.387 = private unnamed_addr constant [4 x i8] c"tcb\00", align 1, !dbg !1063
@.str.390 = private unnamed_addr constant [13 x i8] c"counter_task\00", align 1, !dbg !1069
@.str.391 = private unnamed_addr constant [26 x i8] c"Main loop iteration = %d\0A\00", align 1, !dbg !1071
@.str.400 = private unnamed_addr constant [24 x i8] c"cb_print: user_data=%p\0A\00", align 1, !dbg !1098
@.str.401 = private unnamed_addr constant [33 x i8] c"cb_with_int: x=%d, user_data=%p\0A\00", align 1, !dbg !1100
@test_timer_cb.tick = internal unnamed_addr global i32 0, align 4, !dbg !1102
@.str.402 = private unnamed_addr constant [37 x i8] c"test_timer_cb: tick=%d, timer_ud=%p\0A\00", align 1, !dbg !1114
@str = private unnamed_addr constant [30 x i8] c"=== Testing CALL_INDIRECT ===\00", align 1
@str.403 = private unnamed_addr constant [39 x i8] c"=== CALL_INDIRECT tests completed ===\0A\00", align 1
@str.404 = private unnamed_addr constant [46 x i8] c"=== Testing Non-Optimizable CALL_INDIRECT ===\00", align 1
@str.405 = private unnamed_addr constant [55 x i8] c"=== Non-Optimizable CALL_INDIRECT tests completed ===\0A\00", align 1
@str.406 = private unnamed_addr constant [25 x i8] c"\0A=== Testing Globals ===\00", align 1
@str.407 = private unnamed_addr constant [32 x i8] c"=== Globals test completed ===\0A\00", align 1
@str.408 = private unnamed_addr constant [24 x i8] c"\0A--- I32 Operations ---\00", align 1
@str.409 = private unnamed_addr constant [33 x i8] c"\0A=== Testing Math Operations ===\00", align 1
@str.410 = private unnamed_addr constant [24 x i8] c"\0A--- I64 Operations ---\00", align 1
@str.411 = private unnamed_addr constant [24 x i8] c"\0A--- F32 Operations ---\00", align 1
@str.412 = private unnamed_addr constant [24 x i8] c"\0A--- F64 Operations ---\00", align 1
@str.413 = private unnamed_addr constant [26 x i8] c"\0A--- Type Conversions ---\00", align 1
@str.414 = private unnamed_addr constant [40 x i8] c"=== Math Operations test completed ===\0A\00", align 1
@str.415 = private unnamed_addr constant [35 x i8] c"\0A=== Testing Memory Operations ===\00", align 1
@str.416 = private unnamed_addr constant [41 x i8] c"ALLOCA: Allocated a buffer on the stack.\00", align 1
@str.417 = private unnamed_addr constant [42 x i8] c"=== Memory Operations test completed ===\0A\00", align 1
@str.418 = private unnamed_addr constant [30 x i8] c"\0A=== Testing Control Flow ===\00", align 1
@str.419 = private unnamed_addr constant [28 x i8] c"\0A--- 1. Testing if-else ---\00", align 1
@str.420 = private unnamed_addr constant [28 x i8] c"OK: a < b is true (10 < 20)\00", align 1
@str.421 = private unnamed_addr constant [29 x i8] c"OK: a > b is false (10 > 20)\00", align 1
@str.422 = private unnamed_addr constant [20 x i8] c"OK: a == 10 is true\00", align 1
@str.423 = private unnamed_addr constant [35 x i8] c"OK: d1 < d2 is true (3.14 < 3.141)\00", align 1
@str.424 = private unnamed_addr constant [29 x i8] c"\0A--- 2. Testing for loop ---\00", align 1
@str.425 = private unnamed_addr constant [25 x i8] c"OK: Loop sum is correct.\00", align 1
@str.427 = private unnamed_addr constant [32 x i8] c"\0A--- 3. Testing switch-case ---\00", align 1
@str.428 = private unnamed_addr constant [25 x i8] c"\0A--- 4. Testing goto ---\00", align 1
@str.429 = private unnamed_addr constant [48 x i8] c"OK: Successfully jumped over a line using goto.\00", align 1
@str.430 = private unnamed_addr constant [37 x i8] c"=== Control Flow test completed ===\0A\00", align 1
@str.431 = private unnamed_addr constant [7 x i8] c"Case 2\00", align 1
@str.432 = private unnamed_addr constant [7 x i8] c"Case 1\00", align 1
@str.433 = private unnamed_addr constant [7 x i8] c"Case 0\00", align 1
@str.434 = private unnamed_addr constant [13 x i8] c"Default case\00", align 1
@str.435 = private unnamed_addr constant [31 x i8] c"--- Marshalling Test Start ---\00", align 1
@str.436 = private unnamed_addr constant [69 x i8] c"FAILURE: Marshalling for OUT parameter FAILED! Value did not change.\00", align 1
@str.437 = private unnamed_addr constant [46 x i8] c"SUCCESS: Marshalling for OUT parameter works!\00", align 1
@str.438 = private unnamed_addr constant [29 x i8] c"--- Marshalling Test End ---\00", align 1
@str.439 = private unnamed_addr constant [32 x i8] c"\0A=== Testing SELECT Opcodes ===\00", align 1
@str.440 = private unnamed_addr constant [36 x i8] c"=== Testing SELECT Opcodes END ===\0A\00", align 1
@str.441 = private unnamed_addr constant [33 x i8] c"\0A=== Testing Pointer Opcodes ===\00", align 1
@str.442 = private unnamed_addr constant [24 x i8] c"ERROR: INTTOPTR failed!\00", align 1
@str.443 = private unnamed_addr constant [10 x i8] c"\0A===  ===\00", align 1
@str.444 = private unnamed_addr constant [35 x i8] c"\0A=== Testing Atomic Operations ===\00", align 1
@str.445 = private unnamed_addr constant [21 x i8] c"\0A--- I32 Atomics ---\00", align 1
@str.446 = private unnamed_addr constant [21 x i8] c"\0A--- I64 Atomics ---\00", align 1
@str.447 = private unnamed_addr constant [32 x i8] c"=== Atomics test completed ===\0A\00", align 1
@str.448 = private unnamed_addr constant [42 x i8] c"\0A=== Testing Heap & Memory Operations ===\00", align 1
@str.449 = private unnamed_addr constant [45 x i8] c"\0A--- 1. Testing HEAP_MALLOC (via malloc) ---\00", align 1
@str.450 = private unnamed_addr constant [56 x i8] c"ERROR: Data corruption in dynamically allocated memory.\00", align 1
@str.451 = private unnamed_addr constant [60 x i8] c"OK: Data integrity in dynamically allocated memory is fine.\00", align 1
@str.452 = private unnamed_addr constant [84 x i8] c"ERROR: malloc(128) failed! The HEAP_MALLOC opcode implementation might have issues.\00", align 1
@str.453 = private unnamed_addr constant [45 x i8] c"\0A--- 2. Testing MEMORY.COPY (via memcpy) ---\00", align 1
@str.454 = private unnamed_addr constant [58 x i8] c"ERROR: MEMORY.COPY test FAILED. Data mismatch after copy.\00", align 1
@str.455 = private unnamed_addr constant [56 x i8] c"OK: MEMORY.COPY test passed. Data was copied correctly.\00", align 1
@str.456 = private unnamed_addr constant [45 x i8] c"\0A--- 3. Testing MEMORY.FILL (via memset) ---\00", align 1
@str.457 = private unnamed_addr constant [50 x i8] c"Filling 32 bytes of the buffer with 'X' (0x58)...\00", align 1
@str.458 = private unnamed_addr constant [58 x i8] c"ERROR: MEMORY.FILL test FAILED. Data mismatch after fill.\00", align 1
@str.459 = private unnamed_addr constant [58 x i8] c"OK: MEMORY.FILL test passed. Buffer was filled correctly.\00", align 1
@str.460 = private unnamed_addr constant [41 x i8] c"\0A--- 4. Testing HEAP_FREE (via free) ---\00", align 1
@str.461 = private unnamed_addr constant [40 x i8] c"OK: Freed dynamically allocated buffer.\00", align 1
@str.462 = private unnamed_addr constant [44 x i8] c"ERROR: Failed to reuse memory after free().\00", align 1
@str.463 = private unnamed_addr constant [49 x i8] c"=== Heap & Memory Operations test completed ===\0A\00", align 1
@str.464 = private unnamed_addr constant [54 x i8] c"\0A=== Testing I64 IMM8 Operations (using volatile) ===\00", align 1
@str.465 = private unnamed_addr constant [44 x i8] c"=== I64 IMM8 Operations test completed ===\0A\00", align 1
@str.466 = private unnamed_addr constant [36 x i8] c"\0A=== Testing Complex Data Types ===\00", align 1
@str.467 = private unnamed_addr constant [27 x i8] c"\0A--- 1. Testing Arrays ---\00", align 1
@str.468 = private unnamed_addr constant [40 x i8] c"\0A--- 2. Testing Structures (struct) ---\00", align 1
@str.469 = private unnamed_addr constant [35 x i8] c"\0A--- 3. Testing Unions (union) ---\00", align 1
@str.470 = private unnamed_addr constant [40 x i8] c"\0A--- 4. Testing Enumerations (enum) ---\00", align 1
@str.471 = private unnamed_addr constant [29 x i8] c"OK: Device is in ERROR state\00", align 1
@str.472 = private unnamed_addr constant [37 x i8] c"\0A--- 5. Testing Array of Structs ---\00", align 1
@str.473 = private unnamed_addr constant [36 x i8] c"Iterating through sensor inventory:\00", align 1
@str.474 = private unnamed_addr constant [41 x i8] c"\0A--- 6. Testing Bitfields in Structs ---\00", align 1
@str.475 = private unnamed_addr constant [32 x i8] c"OK: Bitfield access is correct.\00", align 1
@str.476 = private unnamed_addr constant [43 x i8] c"=== Complex Data Types test completed ===\0A\00", align 1
@str.477 = private unnamed_addr constant [42 x i8] c"\0A=== Testing While and Do-While Loops ===\00", align 1
@str.478 = private unnamed_addr constant [31 x i8] c"\0A--- 1. Testing while loop ---\00", align 1
@str.479 = private unnamed_addr constant [52 x i8] c"  Testing standard while loop (should run 5 times):\00", align 1
@str.481 = private unnamed_addr constant [38 x i8] c"  OK: Standard while loop is correct.\00", align 1
@str.482 = private unnamed_addr constant [50 x i8] c"\0A  Testing zero-trip while loop (should not run):\00", align 1
@str.483 = private unnamed_addr constant [55 x i8] c"  OK: Zero-trip while loop body was correctly skipped.\00", align 1
@str.484 = private unnamed_addr constant [34 x i8] c"\0A--- 2. Testing do-while loop ---\00", align 1
@str.485 = private unnamed_addr constant [55 x i8] c"  Testing standard do-while loop (should run 5 times):\00", align 1
@str.487 = private unnamed_addr constant [41 x i8] c"  OK: Standard do-while loop is correct.\00", align 1
@str.488 = private unnamed_addr constant [61 x i8] c"\0A  Testing one-trip do-while loop (should run exactly once):\00", align 1
@str.489 = private unnamed_addr constant [60 x i8] c"    OK: One-trip do-while loop body executed (as expected).\00", align 1
@str.490 = private unnamed_addr constant [52 x i8] c"  OK: One-trip do-while loop executed exactly once.\00", align 1
@str.491 = private unnamed_addr constant [49 x i8] c"=== While and Do-While Loops test completed ===\0A\00", align 1
@str.492 = private unnamed_addr constant [47 x i8] c"\0A=== Testing Break and Continue Statements ===\00", align 1
@str.493 = private unnamed_addr constant [45 x i8] c"\0A--- 1. Testing 'continue' in a for loop ---\00", align 1
@str.494 = private unnamed_addr constant [53 x i8] c"  This loop should sum only odd numbers from 0 to 9.\00", align 1
@str.496 = private unnamed_addr constant [65 x i8] c"  OK: 'continue' test passed. Iterations were skipped correctly.\00", align 1
@str.497 = private unnamed_addr constant [44 x i8] c"\0A--- 2. Testing 'break' in a while loop ---\00", align 1
@str.498 = private unnamed_addr constant [88 x i8] c"  This loop is designed to run forever but should terminate when the counter reaches 5.\00", align 1
@str.500 = private unnamed_addr constant [68 x i8] c"  OK: 'break' test passed. Loop was exited prematurely as expected.\00", align 1
@str.501 = private unnamed_addr constant [45 x i8] c"\0A--- 3. Testing 'break' in a nested loop ---\00", align 1
@str.503 = private unnamed_addr constant [48 x i8] c"  OK: 'break' in nested loop behaved correctly.\00", align 1
@str.504 = private unnamed_addr constant [54 x i8] c"=== Break and Continue Statements test completed ===\0A\00", align 1
@str.505 = private unnamed_addr constant [34 x i8] c"\0A=== Testing TABLE Operations ===\00", align 1
@str.506 = private unnamed_addr constant [51 x i8] c"\0A[Test 1] TABLE.SIZE - checking initial table size\00", align 1
@str.507 = private unnamed_addr constant [37 x i8] c"  PASS: Initial size is correct (10)\00", align 1
@str.508 = private unnamed_addr constant [63 x i8] c"\0A[Test 2] TABLE.INIT - initializing table from element segment\00", align 1
@str.509 = private unnamed_addr constant [94 x i8] c"  Initializing 2 elements at table offset 5 from element segment 0 (starting at seg offset 0)\00", align 1
@str.510 = private unnamed_addr constant [23 x i8] c"  TABLE.INIT completed\00", align 1
@str.511 = private unnamed_addr constant [86 x i8] c"  Note: Element segment 0 contains function indices [0, 0] (both point to function 0)\00", align 1
@str.512 = private unnamed_addr constant [54 x i8] c"\0A[Test 3] TABLE.FILL - filling table range with value\00", align 1
@str.513 = private unnamed_addr constant [44 x i8] c"  Filling table[0..2] with function index 1\00", align 1
@str.514 = private unnamed_addr constant [23 x i8] c"  TABLE.FILL completed\00", align 1
@str.515 = private unnamed_addr constant [53 x i8] c"  Expected: table[0] = 1, table[1] = 1, table[2] = 1\00", align 1
@str.516 = private unnamed_addr constant [53 x i8] c"\0A[Test 4] TABLE.COPY - copying elements within table\00", align 1
@str.517 = private unnamed_addr constant [59 x i8] c"  Copying 2 elements from table offset 0 to table offset 7\00", align 1
@str.518 = private unnamed_addr constant [23 x i8] c"  TABLE.COPY completed\00", align 1
@str.519 = private unnamed_addr constant [61 x i8] c"  Expected: table[7] = table[0] = 1, table[8] = table[1] = 1\00", align 1
@str.520 = private unnamed_addr constant [54 x i8] c"\0A[Test 5] TABLE.SIZE - checking size after operations\00", align 1
@str.521 = private unnamed_addr constant [54 x i8] c"\0A[Test 6] Testing table expansion beyond initial size\00", align 1
@str.522 = private unnamed_addr constant [79 x i8] c"  Filling table[15..17] with function index 2 (should expand table to size 18)\00", align 1
@str.524 = private unnamed_addr constant [61 x i8] c"FAIL: Some TABLE operations did not produce expected results\00", align 1
@str.525 = private unnamed_addr constant [50 x i8] c"PASS: All TABLE operations executed successfully!\00", align 1
@str.526 = private unnamed_addr constant [31 x i8] c"  - TABLE.SIZE works correctly\00", align 1
@str.527 = private unnamed_addr constant [49 x i8] c"  - TABLE.INIT initializes from element segments\00", align 1
@str.528 = private unnamed_addr constant [34 x i8] c"  - TABLE.FILL fills table ranges\00", align 1
@str.529 = private unnamed_addr constant [35 x i8] c"  - TABLE.COPY copies within table\00", align 1
@str.530 = private unnamed_addr constant [35 x i8] c"  - Table auto-expands when needed\00", align 1
@str.531 = private unnamed_addr constant [41 x i8] c"=== TABLE Operations test completed ===\0A\00", align 1
@str.532 = private unnamed_addr constant [42 x i8] c"\0A=== Testing CALL_INDIRECT with TABLE ===\00", align 1
@str.533 = private unnamed_addr constant [56 x i8] c"\0A[Test 1] TABLE.SET - placing function indices in table\00", align 1
@str.534 = private unnamed_addr constant [38 x i8] c"  Setting table[0] = 0 (add_function)\00", align 1
@str.535 = private unnamed_addr constant [43 x i8] c"  Setting table[1] = 1 (multiply_function)\00", align 1
@str.536 = private unnamed_addr constant [43 x i8] c"  Setting table[2] = 2 (subtract_function)\00", align 1
@str.537 = private unnamed_addr constant [58 x i8] c"\0A[Test 2] TABLE.GET - reading function indices from table\00", align 1
@str.538 = private unnamed_addr constant [35 x i8] c"  FAIL: Function indices mismatch!\00", align 1
@str.539 = private unnamed_addr constant [60 x i8] c"  PASS: All function indices correctly stored and retrieved\00", align 1
@str.540 = private unnamed_addr constant [76 x i8] c"\0A[Test 3] CALL_INDIRECT - indirect function calls through function pointers\00", align 1
@str.541 = private unnamed_addr constant [54 x i8] c"  Creating function pointer array with 3 functions...\00", align 1
@str.542 = private unnamed_addr constant [41 x i8] c"  func_table[0] = add_function (index 0)\00", align 1
@str.543 = private unnamed_addr constant [46 x i8] c"  func_table[1] = multiply_function (index 1)\00", align 1
@str.544 = private unnamed_addr constant [46 x i8] c"  func_table[2] = subtract_function (index 2)\00", align 1
@str.545 = private unnamed_addr constant [38 x i8] c"  Function pointer array initialized!\00", align 1
@str.546 = private unnamed_addr constant [49 x i8] c"  Calling func_table[0](10, 5) [add_function]...\00", align 1
@str.547 = private unnamed_addr constant [54 x i8] c"  Calling func_table[1](10, 5) [multiply_function]...\00", align 1
@str.548 = private unnamed_addr constant [54 x i8] c"  Calling func_table[2](10, 5) [subtract_function]...\00", align 1
@str.549 = private unnamed_addr constant [65 x i8] c"\0A  [CRITICAL TEST] Dynamic call: choosing function at runtime...\00", align 1
@str.550 = private unnamed_addr constant [83 x i8] c"  This test MUST use CALL_INDIRECT because index 'i' is not known at compile time!\00", align 1
@str.551 = private unnamed_addr constant [55 x i8] c"  FAIL: Some dynamic calls returned incorrect results!\00", align 1
@str.552 = private unnamed_addr constant [52 x i8] c"  PASS: All dynamic calls returned correct results!\00", align 1
@str.553 = private unnamed_addr constant [17 x i8] c"\0A=== Summary ===\00", align 1
@str.554 = private unnamed_addr constant [48 x i8] c"\E2\9D\8C FAIL: Some CALL_INDIRECT operations failed!\00", align 1
@str.555 = private unnamed_addr constant [50 x i8] c"  Dynamic calls in loop failed - see errors above\00", align 1
@str.556 = private unnamed_addr constant [50 x i8] c"\E2\9C\85 PASS: All CALL_INDIRECT operations succeeded!\00", align 1
@str.557 = private unnamed_addr constant [46 x i8] c"  \E2\9C\93 TABLE.SET/GET operations work correctly\00", align 1
@str.558 = private unnamed_addr constant [69 x i8] c"  \E2\9C\93 Static indirect calls (func_table[0], [1], [2]) work correctly\00", align 1
@str.559 = private unnamed_addr constant [68 x i8] c"  \E2\9C\93 Dynamic indirect calls (func_table[i] in loop) work correctly\00", align 1
@str.560 = private unnamed_addr constant [40 x i8] c"  \E2\9C\93 All results match expected values\00", align 1
@str.561 = private unnamed_addr constant [50 x i8] c"\0A=== CALL_INDIRECT with TABLE test completed ===\0A\00", align 1
@str.562 = private unnamed_addr constant [44 x i8] c"\0A=== Testing CALL_INDIRECT_PTR (UNSAFE) ===\00", align 1
@str.563 = private unnamed_addr constant [50 x i8] c"This test requires ESPB_UNSAFE_MODE to be enabled\00", align 1
@str.564 = private unnamed_addr constant [50 x i8] c"\0A[Test] Direct address calls (forced unsafe mode)\00", align 1
@str.565 = private unnamed_addr constant [22 x i8] c"  Function addresses:\00", align 1
@str.566 = private unnamed_addr constant [39 x i8] c"\0A  Attempting unsafe calls by address:\00", align 1
@str.567 = private unnamed_addr constant [37 x i8] c"  Calling add_function by address...\00", align 1
@str.568 = private unnamed_addr constant [42 x i8] c"  Calling multiply_function by address...\00", align 1
@str.569 = private unnamed_addr constant [42 x i8] c"  Calling subtract_function by address...\00", align 1
@str.570 = private unnamed_addr constant [17 x i8] c"\0A=== Results ===\00", align 1
@str.571 = private unnamed_addr constant [63 x i8] c"\E2\9D\8C FAIL: Some direct address calls returned incorrect results\00", align 1
@str.572 = private unnamed_addr constant [24 x i8] c"    Expected: 20, 42, 9\00", align 1
@str.573 = private unnamed_addr constant [60 x i8] c"\E2\9C\85 PASS: All direct address calls returned correct results\00", align 1
@str.574 = private unnamed_addr constant [43 x i8] c"\0A=== CALL_INDIRECT_PTR test completed ===\0A\00", align 1
@str.575 = private unnamed_addr constant [14 x i8] c"Hello world!\0A\00", align 1
@str.576 = private unnamed_addr constant [22 x i8] c"\0A--- Testing bool ---\00", align 1
@str.577 = private unnamed_addr constant [18 x i8] c"OK: flag1 is true\00", align 1
@str.578 = private unnamed_addr constant [19 x i8] c"OK: !flag2 is true\00", align 1
@str.579 = private unnamed_addr constant [28 x i8] c"OK: flag1 && flag2 is false\00", align 1
@str.580 = private unnamed_addr constant [37 x i8] c"OK: flag2 is now true after negation\00", align 1
@str.581 = private unnamed_addr constant [26 x i8] c"--- End of bool test ---\0A\00", align 1
@str.582 = private unnamed_addr constant [22 x i8] c"--- Testing float ---\00", align 1
@str.583 = private unnamed_addr constant [27 x i8] c"--- End of float test ---\0A\00", align 1
@str.584 = private unnamed_addr constant [23 x i8] c"--- Testing double ---\00", align 1
@str.585 = private unnamed_addr constant [28 x i8] c"--- End of double test ---\0A\00", align 1
@str.586 = private unnamed_addr constant [31 x i8] c"--- Testing host_invoke_cb ---\00", align 1
@str.587 = private unnamed_addr constant [32 x i8] c"--- Testing host_invoke_cb2 ---\00", align 1
@str.588 = private unnamed_addr constant [38 x i8] c"--- Testing FreeRTOS xTimerCreate ---\00", align 1
@str.589 = private unnamed_addr constant [27 x i8] c"ERROR: xTimerCreate failed\00", align 1
@str.590 = private unnamed_addr constant [37 x i8] c"--- Testing FreeRTOS xTaskCreate ---\00", align 1
@str.591 = private unnamed_addr constant [47 x i8] c"\0AAll tests completed. Main task will now exit.\00", align 1
@str.592 = private unnamed_addr constant [31 x i8] c"Stopping and deleting timer...\00", align 1
@str.593 = private unnamed_addr constant [38 x i8] c"\0AStopping and deleting timer complete\00", align 1
@str.594 = private unnamed_addr constant [31 x i8] c"\0Acounter_task_handle not valid\00", align 1
@str.595 = private unnamed_addr constant [25 x i8] c"Deleting counter_task...\00", align 1
@str.596 = private unnamed_addr constant [32 x i8] c"Deleting counter_task completed\00", align 1
@str.597 = private unnamed_addr constant [5 x i8] c"\0Adl1\00", align 1
@str.598 = private unnamed_addr constant [11 x i8] c"\0Amain exit\00", align 1
@.str.1.2 = private unnamed_addr constant [22 x i8] c"Received integer: %d\0A\00", align 1, !dbg !1116
@.str.2.3 = private unnamed_addr constant [22 x i8] c"Received double:  %f\0A\00", align 1, !dbg !1119
@.str.3.4 = private unnamed_addr constant [24 x i8] c"Received string:  \22%s\22\0A\00", align 1, !dbg !1121
@str.1 = private unnamed_addr constant [37 x i8] c"--- ESPB 'test' function called! ---\00", align 1
@str.6 = private unnamed_addr constant [25 x i8] c"Received string:  (null)\00", align 1
@str.7 = private unnamed_addr constant [35 x i8] c"----------------------------------\00", align 1

; Function Attrs: noreturn nounwind
define dso_local void @counter_task(ptr noundef %0) #0 !dbg !1139 {
    #dbg_value(ptr %0, !1143, !DIExpression(), !1145)
    #dbg_value(i32 0, !1144, !DIExpression(), !1145)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %0), !dbg !1146
  br label %3, !dbg !1147

3:                                                ; preds = %3, %1
  %4 = phi i32 [ 0, %1 ], [ %5, %3 ], !dbg !1145
    #dbg_value(i32 %4, !1144, !DIExpression(), !1145)
  %5 = add nuw nsw i32 %4, 1, !dbg !1148
    #dbg_value(i32 %5, !1144, !DIExpression(), !1145)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %4), !dbg !1150
  tail call void @vTaskDelay(i32 noundef 100) #17, !dbg !1151
  br label %3, !dbg !1147, !llvm.loop !1152
}

; Function Attrs: nofree nounwind
declare !dbg !1155 dso_local noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #1

declare !dbg !1161 dso_local void @vTaskDelay(i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local noundef i32 @add_func(i32 noundef %0, i32 noundef %1) #3 !dbg !1166 {
    #dbg_value(i32 %0, !1168, !DIExpression(), !1170)
    #dbg_value(i32 %1, !1169, !DIExpression(), !1170)
  %3 = add nsw i32 %1, %0, !dbg !1171
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef %0, i32 noundef %1, i32 noundef %3), !dbg !1172
  ret i32 %3, !dbg !1173
}

; Function Attrs: nofree nounwind
define dso_local noundef i32 @mul_func(i32 noundef %0, i32 noundef %1) #3 !dbg !1174 {
    #dbg_value(i32 %0, !1176, !DIExpression(), !1178)
    #dbg_value(i32 %1, !1177, !DIExpression(), !1178)
  %3 = mul nsw i32 %1, %0, !dbg !1179
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %0, i32 noundef %1, i32 noundef %3), !dbg !1180
  ret i32 %3, !dbg !1181
}

; Function Attrs: nounwind
define dso_local i32 @call_operation(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 !dbg !1182 {
    #dbg_value(ptr %0, !1186, !DIExpression(), !1189)
    #dbg_value(i32 %1, !1187, !DIExpression(), !1189)
    #dbg_value(i32 %2, !1188, !DIExpression(), !1189)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef %1, i32 noundef %2), !dbg !1190
  %5 = tail call i32 %0(i32 noundef %1, i32 noundef %2) #17, !dbg !1191
  ret i32 %5, !dbg !1192
}

; Function Attrs: nofree nounwind
define dso_local void @test_call_indirect() local_unnamed_addr #3 !dbg !1193 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str), !dbg !1202
    #dbg_value(ptr @add_func, !1197, !DIExpression(), !1203)
    #dbg_value(i32 5, !1168, !DIExpression(), !1204)
    #dbg_value(i32 3, !1169, !DIExpression(), !1204)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef 5, i32 noundef 3, i32 noundef 8), !dbg !1206
    #dbg_value(i32 8, !1198, !DIExpression(), !1203)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.6, i32 noundef 8), !dbg !1207
    #dbg_value(ptr @add_func, !1186, !DIExpression(), !1208)
    #dbg_value(i32 10, !1187, !DIExpression(), !1208)
    #dbg_value(i32 20, !1188, !DIExpression(), !1208)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef 10, i32 noundef 20), !dbg !1210
    #dbg_value(i32 10, !1168, !DIExpression(), !1211)
    #dbg_value(i32 20, !1169, !DIExpression(), !1211)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef 10, i32 noundef 20, i32 noundef 30), !dbg !1213
    #dbg_value(i32 30, !1199, !DIExpression(), !1203)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.7, i32 noundef 30), !dbg !1214
    #dbg_value(ptr @mul_func, !1186, !DIExpression(), !1215)
    #dbg_value(i32 4, !1187, !DIExpression(), !1215)
    #dbg_value(i32 7, !1188, !DIExpression(), !1215)
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.4, i32 noundef 4, i32 noundef 7), !dbg !1217
    #dbg_value(i32 4, !1176, !DIExpression(), !1218)
    #dbg_value(i32 7, !1177, !DIExpression(), !1218)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef 4, i32 noundef 7, i32 noundef 28), !dbg !1220
    #dbg_value(i32 28, !1200, !DIExpression(), !1203)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.8, i32 noundef 28), !dbg !1221
    #dbg_value(ptr @mul_func, !1197, !DIExpression(), !1203)
    #dbg_value(i32 6, !1176, !DIExpression(), !1222)
    #dbg_value(i32 9, !1177, !DIExpression(), !1222)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef 6, i32 noundef 9, i32 noundef 54), !dbg !1224
    #dbg_value(i32 54, !1201, !DIExpression(), !1203)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.9, i32 noundef 54), !dbg !1225
  %12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.403), !dbg !1226
  ret void, !dbg !1227
}

; Function Attrs: nofree nounwind
declare noundef i32 @puts(ptr nocapture noundef readonly) local_unnamed_addr #5

; Function Attrs: nounwind
define dso_local i32 @call_operation_by_index(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 !dbg !1228 {
    #dbg_value(i32 %0, !1232, !DIExpression(), !1235)
    #dbg_value(i32 %1, !1233, !DIExpression(), !1235)
    #dbg_value(i32 %2, !1234, !DIExpression(), !1235)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef %0, i32 noundef %1, i32 noundef %2), !dbg !1236
  %5 = srem i32 %0, 2, !dbg !1237
  %6 = getelementptr inbounds [2 x ptr], ptr @operations, i32 0, i32 %5, !dbg !1238
  %7 = load ptr, ptr %6, align 4, !dbg !1238, !tbaa !1239
  %8 = tail call i32 %7(i32 noundef %1, i32 noundef %2) #17, !dbg !1238
  ret i32 %8, !dbg !1243
}

; Function Attrs: nounwind
define dso_local i32 @call_volatile_function(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #4 !dbg !1244 {
    #dbg_value(ptr %0, !1248, !DIExpression(), !1251)
    #dbg_value(i32 %1, !1249, !DIExpression(), !1251)
    #dbg_value(i32 %2, !1250, !DIExpression(), !1251)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef %1, i32 noundef %2), !dbg !1252
  %5 = tail call i32 %0(i32 noundef %1, i32 noundef %2) #17, !dbg !1253
  ret i32 %5, !dbg !1254
}

; Function Attrs: nofree nounwind
define dso_local void @test_call_indirect_non_optimizable() local_unnamed_addr #3 !dbg !1255 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.404), !dbg !1261
    #dbg_value(i32 0, !1232, !DIExpression(), !1262)
    #dbg_value(i32 5, !1233, !DIExpression(), !1262)
    #dbg_value(i32 3, !1234, !DIExpression(), !1262)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 0, i32 noundef 5, i32 noundef 3), !dbg !1264
    #dbg_value(i32 5, !1168, !DIExpression(), !1265)
    #dbg_value(i32 3, !1169, !DIExpression(), !1265)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef 5, i32 noundef 3, i32 noundef 8), !dbg !1267
    #dbg_value(i32 8, !1257, !DIExpression(), !1268)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.14, i32 noundef 8), !dbg !1269
    #dbg_value(i32 1, !1232, !DIExpression(), !1270)
    #dbg_value(i32 4, !1233, !DIExpression(), !1270)
    #dbg_value(i32 7, !1234, !DIExpression(), !1270)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.11, i32 noundef 1, i32 noundef 4, i32 noundef 7), !dbg !1272
    #dbg_value(i32 4, !1176, !DIExpression(), !1273)
    #dbg_value(i32 7, !1177, !DIExpression(), !1273)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef 4, i32 noundef 7, i32 noundef 28), !dbg !1275
    #dbg_value(i32 28, !1258, !DIExpression(), !1268)
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.15, i32 noundef 28), !dbg !1276
    #dbg_value(ptr @add_func, !1259, !DIExpression(), !1268)
    #dbg_value(ptr @add_func, !1248, !DIExpression(), !1277)
    #dbg_value(i32 6, !1249, !DIExpression(), !1277)
    #dbg_value(i32 9, !1250, !DIExpression(), !1277)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.12, i32 noundef 6, i32 noundef 9), !dbg !1279
    #dbg_value(i32 6, !1168, !DIExpression(), !1280)
    #dbg_value(i32 9, !1169, !DIExpression(), !1280)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2, i32 noundef 6, i32 noundef 9, i32 noundef 15), !dbg !1282
    #dbg_value(i32 15, !1260, !DIExpression(), !1268)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.16, i32 noundef 15), !dbg !1283
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.405), !dbg !1284
  ret void, !dbg !1285
}

; Function Attrs: nofree nounwind
define dso_local void @test_globals() local_unnamed_addr #3 !dbg !1286 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.406), !dbg !1287
  %2 = load i32, ptr @g_my_global_int, align 4, !dbg !1288, !tbaa !1289
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.19, i32 noundef %2), !dbg !1291
  %4 = load i64, ptr @g_my_global_long, align 8, !dbg !1292, !tbaa !1293
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.20, i64 noundef %4), !dbg !1295
  %6 = load i8, ptr @g_my_global_bool, align 1, !dbg !1296, !tbaa !1297, !range !1299, !noundef !1300
  %7 = icmp eq i8 %6, 0, !dbg !1296
  %8 = select i1 %7, ptr @.str.23, ptr @.str.22, !dbg !1296
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.21, ptr noundef nonnull %8), !dbg !1301
  %10 = load i32, ptr @g_my_global_int, align 4, !dbg !1302, !tbaa !1289
  %11 = add nsw i32 %10, 100, !dbg !1302
  store i32 %11, ptr @g_my_global_int, align 4, !dbg !1302, !tbaa !1289
  %12 = load i64, ptr @g_my_global_long, align 8, !dbg !1303, !tbaa !1293
  %13 = add nsw i64 %12, -10, !dbg !1303
  store i64 %13, ptr @g_my_global_long, align 8, !dbg !1303, !tbaa !1293
  %14 = load i8, ptr @g_my_global_bool, align 1, !dbg !1304, !tbaa !1297, !range !1299, !noundef !1300
  %15 = xor i8 %14, 1, !dbg !1305
  store i8 %15, ptr @g_my_global_bool, align 1, !dbg !1305, !tbaa !1297
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.24, i32 noundef %11), !dbg !1306
  %17 = load i64, ptr @g_my_global_long, align 8, !dbg !1307, !tbaa !1293
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.25, i64 noundef %17), !dbg !1308
  %19 = load i8, ptr @g_my_global_bool, align 1, !dbg !1309, !tbaa !1297, !range !1299, !noundef !1300
  %20 = icmp eq i8 %19, 0, !dbg !1309
  %21 = select i1 %20, ptr @.str.23, ptr @.str.22, !dbg !1309
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.26, ptr noundef nonnull %21), !dbg !1310
  %23 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.407), !dbg !1311
  ret void, !dbg !1312
}

; Function Attrs: nofree nounwind
define dso_local void @test_math_operations32() local_unnamed_addr #3 !dbg !1313 {
  %1 = alloca i32, align 4, !DIAssignID !1321
    #dbg_assign(i1 undef, !1315, !DIExpression(), !1321, ptr %1, !DIExpression(), !1322)
  %2 = alloca i32, align 4, !DIAssignID !1323
    #dbg_assign(i1 undef, !1317, !DIExpression(), !1323, ptr %2, !DIExpression(), !1322)
  %3 = alloca i32, align 4, !DIAssignID !1324
    #dbg_assign(i1 undef, !1318, !DIExpression(), !1324, ptr %3, !DIExpression(), !1322)
  %4 = alloca i32, align 4, !DIAssignID !1325
    #dbg_assign(i1 undef, !1320, !DIExpression(), !1325, ptr %4, !DIExpression(), !1322)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1), !dbg !1326
  store volatile i32 -100, ptr %1, align 4, !dbg !1327, !tbaa !1289, !DIAssignID !1328
    #dbg_assign(i32 -100, !1315, !DIExpression(), !1328, ptr %1, !DIExpression(), !1322)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !1329
  store volatile i32 25, ptr %2, align 4, !dbg !1330, !tbaa !1289, !DIAssignID !1331
    #dbg_assign(i32 25, !1317, !DIExpression(), !1331, ptr %2, !DIExpression(), !1322)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3), !dbg !1332
  store volatile i32 100, ptr %3, align 4, !dbg !1333, !tbaa !1289, !DIAssignID !1334
    #dbg_assign(i32 100, !1318, !DIExpression(), !1334, ptr %3, !DIExpression(), !1322)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4), !dbg !1335
  store volatile i32 25, ptr %4, align 4, !dbg !1336, !tbaa !1289, !DIAssignID !1337
    #dbg_assign(i32 25, !1320, !DIExpression(), !1337, ptr %4, !DIExpression(), !1322)
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.408), !dbg !1338
  %6 = load volatile i32, ptr %1, align 4, !dbg !1339, !tbaa !1289
  %7 = load volatile i32, ptr %2, align 4, !dbg !1340, !tbaa !1289
  %8 = load volatile i32, ptr %3, align 4, !dbg !1341, !tbaa !1289
  %9 = load volatile i32, ptr %4, align 4, !dbg !1342, !tbaa !1289
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.29, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32 noundef %9), !dbg !1343
  %11 = load volatile i32, ptr %1, align 4, !dbg !1344, !tbaa !1289
  %12 = load volatile i32, ptr %2, align 4, !dbg !1345, !tbaa !1289
  %13 = add nsw i32 %12, %11, !dbg !1346
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.30, i32 noundef %13), !dbg !1347
  %15 = load volatile i32, ptr %1, align 4, !dbg !1348, !tbaa !1289
  %16 = load volatile i32, ptr %2, align 4, !dbg !1349, !tbaa !1289
  %17 = sub nsw i32 %15, %16, !dbg !1350
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.31, i32 noundef %17), !dbg !1351
  %19 = load volatile i32, ptr %1, align 4, !dbg !1352, !tbaa !1289
  %20 = load volatile i32, ptr %2, align 4, !dbg !1353, !tbaa !1289
  %21 = mul nsw i32 %20, %19, !dbg !1354
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.32, i32 noundef %21), !dbg !1355
  %23 = load volatile i32, ptr %1, align 4, !dbg !1356, !tbaa !1289
  %24 = load volatile i32, ptr %2, align 4, !dbg !1357, !tbaa !1289
  %25 = sdiv i32 %23, %24, !dbg !1358
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.33, i32 noundef %25), !dbg !1359
  %27 = load volatile i32, ptr %1, align 4, !dbg !1360, !tbaa !1289
  %28 = load volatile i32, ptr %2, align 4, !dbg !1361, !tbaa !1289
  %29 = srem i32 %27, %28, !dbg !1362
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.34, i32 noundef %29), !dbg !1363
  %31 = load volatile i32, ptr %3, align 4, !dbg !1364, !tbaa !1289
  %32 = load volatile i32, ptr %4, align 4, !dbg !1365, !tbaa !1289
  %33 = udiv i32 %31, %32, !dbg !1366
  %34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.35, i32 noundef %33), !dbg !1367
  %35 = load volatile i32, ptr %3, align 4, !dbg !1368, !tbaa !1289
  %36 = load volatile i32, ptr %4, align 4, !dbg !1369, !tbaa !1289
  %37 = urem i32 %35, %36, !dbg !1370
  %38 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.36, i32 noundef %37), !dbg !1371
  %39 = load volatile i32, ptr %1, align 4, !dbg !1372, !tbaa !1289
  %40 = and i32 %39, 255, !dbg !1373
  %41 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.37, i32 noundef %40), !dbg !1374
  %42 = load volatile i32, ptr %1, align 4, !dbg !1375, !tbaa !1289
  %43 = or i32 %42, 128, !dbg !1376
  %44 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.38, i32 noundef %43), !dbg !1377
  %45 = load volatile i32, ptr %1, align 4, !dbg !1378, !tbaa !1289
  %46 = xor i32 %45, 255, !dbg !1379
  %47 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.39, i32 noundef %46), !dbg !1380
  %48 = load volatile i32, ptr %2, align 4, !dbg !1381, !tbaa !1289
  %49 = shl i32 %48, 2, !dbg !1382
  %50 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.40, i32 noundef %49), !dbg !1383
  %51 = load volatile i32, ptr %1, align 4, !dbg !1384, !tbaa !1289
  %52 = ashr i32 %51, 2, !dbg !1385
  %53 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.41, i32 noundef %52), !dbg !1386
  %54 = load volatile i32, ptr %3, align 4, !dbg !1387, !tbaa !1289
  %55 = lshr i32 %54, 2, !dbg !1388
  %56 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.42, i32 noundef %55), !dbg !1389
  %57 = load volatile i32, ptr %2, align 4, !dbg !1390, !tbaa !1289
  %58 = xor i32 %57, -1, !dbg !1391
  %59 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.43, i32 noundef %58), !dbg !1392
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4), !dbg !1393
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3), !dbg !1393
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !1393
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1), !dbg !1393
  ret void, !dbg !1393
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #6

; Function Attrs: nofree nounwind
define dso_local void @test_math_operations() local_unnamed_addr #3 !dbg !1394 {
  %1 = alloca i32, align 4, !DIAssignID !1419
    #dbg_assign(i1 undef, !1396, !DIExpression(), !1419, ptr %1, !DIExpression(), !1420)
  %2 = alloca i32, align 4, !DIAssignID !1421
    #dbg_assign(i1 undef, !1397, !DIExpression(), !1421, ptr %2, !DIExpression(), !1420)
  %3 = alloca i32, align 4, !DIAssignID !1422
    #dbg_assign(i1 undef, !1398, !DIExpression(), !1422, ptr %3, !DIExpression(), !1420)
  %4 = alloca i32, align 4, !DIAssignID !1423
    #dbg_assign(i1 undef, !1399, !DIExpression(), !1423, ptr %4, !DIExpression(), !1420)
  %5 = alloca i64, align 8, !DIAssignID !1424
    #dbg_assign(i1 undef, !1400, !DIExpression(), !1424, ptr %5, !DIExpression(), !1420)
  %6 = alloca i64, align 8, !DIAssignID !1425
    #dbg_assign(i1 undef, !1402, !DIExpression(), !1425, ptr %6, !DIExpression(), !1420)
  %7 = alloca i64, align 8, !DIAssignID !1426
    #dbg_assign(i1 undef, !1403, !DIExpression(), !1426, ptr %7, !DIExpression(), !1420)
  %8 = alloca i64, align 8, !DIAssignID !1427
    #dbg_assign(i1 undef, !1408, !DIExpression(), !1427, ptr %8, !DIExpression(), !1420)
  %9 = alloca float, align 4, !DIAssignID !1428
    #dbg_assign(i1 undef, !1409, !DIExpression(), !1428, ptr %9, !DIExpression(), !1420)
  %10 = alloca float, align 4, !DIAssignID !1429
    #dbg_assign(i1 undef, !1411, !DIExpression(), !1429, ptr %10, !DIExpression(), !1420)
  %11 = alloca double, align 8, !DIAssignID !1430
    #dbg_assign(i1 undef, !1412, !DIExpression(), !1430, ptr %11, !DIExpression(), !1420)
  %12 = alloca double, align 8, !DIAssignID !1431
    #dbg_assign(i1 undef, !1414, !DIExpression(), !1431, ptr %12, !DIExpression(), !1420)
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.409), !dbg !1432
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1), !dbg !1433
  store volatile i32 -100, ptr %1, align 4, !dbg !1434, !tbaa !1289, !DIAssignID !1435
    #dbg_assign(i32 -100, !1396, !DIExpression(), !1435, ptr %1, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2), !dbg !1436
  store volatile i32 25, ptr %2, align 4, !dbg !1437, !tbaa !1289, !DIAssignID !1438
    #dbg_assign(i32 25, !1397, !DIExpression(), !1438, ptr %2, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %3), !dbg !1439
  store volatile i32 100, ptr %3, align 4, !dbg !1440, !tbaa !1289, !DIAssignID !1441
    #dbg_assign(i32 100, !1398, !DIExpression(), !1441, ptr %3, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %4), !dbg !1442
  store volatile i32 25, ptr %4, align 4, !dbg !1443, !tbaa !1289, !DIAssignID !1444
    #dbg_assign(i32 25, !1399, !DIExpression(), !1444, ptr %4, !DIExpression(), !1420)
  %14 = load volatile i32, ptr %1, align 4, !dbg !1445, !tbaa !1289
  %15 = load volatile i32, ptr %2, align 4, !dbg !1446, !tbaa !1289
  %16 = load volatile i32, ptr %3, align 4, !dbg !1447, !tbaa !1289
  %17 = load volatile i32, ptr %4, align 4, !dbg !1448, !tbaa !1289
  %18 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.29, i32 noundef %14, i32 noundef %15, i32 noundef %16, i32 noundef %17), !dbg !1449
  %19 = load volatile i32, ptr %1, align 4, !dbg !1450, !tbaa !1289
  %20 = load volatile i32, ptr %2, align 4, !dbg !1451, !tbaa !1289
  %21 = add nsw i32 %20, %19, !dbg !1452
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.30, i32 noundef %21), !dbg !1453
  %23 = load volatile i32, ptr %1, align 4, !dbg !1454, !tbaa !1289
  %24 = load volatile i32, ptr %2, align 4, !dbg !1455, !tbaa !1289
  %25 = sub nsw i32 %23, %24, !dbg !1456
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.31, i32 noundef %25), !dbg !1457
  %27 = load volatile i32, ptr %1, align 4, !dbg !1458, !tbaa !1289
  %28 = load volatile i32, ptr %2, align 4, !dbg !1459, !tbaa !1289
  %29 = mul nsw i32 %28, %27, !dbg !1460
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.32, i32 noundef %29), !dbg !1461
  %31 = load volatile i32, ptr %1, align 4, !dbg !1462, !tbaa !1289
  %32 = load volatile i32, ptr %2, align 4, !dbg !1463, !tbaa !1289
  %33 = sdiv i32 %31, %32, !dbg !1464
  %34 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.33, i32 noundef %33), !dbg !1465
  %35 = load volatile i32, ptr %1, align 4, !dbg !1466, !tbaa !1289
  %36 = load volatile i32, ptr %2, align 4, !dbg !1467, !tbaa !1289
  %37 = srem i32 %35, %36, !dbg !1468
  %38 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.34, i32 noundef %37), !dbg !1469
  %39 = load volatile i32, ptr %3, align 4, !dbg !1470, !tbaa !1289
  %40 = load volatile i32, ptr %4, align 4, !dbg !1471, !tbaa !1289
  %41 = udiv i32 %39, %40, !dbg !1472
  %42 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.35, i32 noundef %41), !dbg !1473
  %43 = load volatile i32, ptr %3, align 4, !dbg !1474, !tbaa !1289
  %44 = load volatile i32, ptr %4, align 4, !dbg !1475, !tbaa !1289
  %45 = urem i32 %43, %44, !dbg !1476
  %46 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.36, i32 noundef %45), !dbg !1477
  %47 = load volatile i32, ptr %1, align 4, !dbg !1478, !tbaa !1289
  %48 = and i32 %47, 255, !dbg !1479
  %49 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.37, i32 noundef %48), !dbg !1480
  %50 = load volatile i32, ptr %1, align 4, !dbg !1481, !tbaa !1289
  %51 = or i32 %50, 128, !dbg !1482
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.38, i32 noundef %51), !dbg !1483
  %53 = load volatile i32, ptr %1, align 4, !dbg !1484, !tbaa !1289
  %54 = xor i32 %53, 255, !dbg !1485
  %55 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.39, i32 noundef %54), !dbg !1486
  %56 = load volatile i32, ptr %2, align 4, !dbg !1487, !tbaa !1289
  %57 = shl i32 %56, 2, !dbg !1488
  %58 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.40, i32 noundef %57), !dbg !1489
  %59 = load volatile i32, ptr %1, align 4, !dbg !1490, !tbaa !1289
  %60 = ashr i32 %59, 2, !dbg !1491
  %61 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.41, i32 noundef %60), !dbg !1492
  %62 = load volatile i32, ptr %3, align 4, !dbg !1493, !tbaa !1289
  %63 = lshr i32 %62, 2, !dbg !1494
  %64 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.42, i32 noundef %63), !dbg !1495
  %65 = load volatile i32, ptr %2, align 4, !dbg !1496, !tbaa !1289
  %66 = xor i32 %65, -1, !dbg !1497
  %67 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.43, i32 noundef %66), !dbg !1498
  %68 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.410), !dbg !1499
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %5), !dbg !1500
  store volatile i64 -10000000000, ptr %5, align 8, !dbg !1501, !tbaa !1293, !DIAssignID !1502
    #dbg_assign(i64 -10000000000, !1400, !DIExpression(), !1502, ptr %5, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %6), !dbg !1503
  store volatile i64 2500000000, ptr %6, align 8, !dbg !1504, !tbaa !1293, !DIAssignID !1505
    #dbg_assign(i64 2500000000, !1402, !DIExpression(), !1505, ptr %6, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %7), !dbg !1506
  store volatile i64 10000000000, ptr %7, align 8, !dbg !1507, !tbaa !1293, !DIAssignID !1508
    #dbg_assign(i64 10000000000, !1403, !DIExpression(), !1508, ptr %7, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %8), !dbg !1509
  store volatile i64 2500000000, ptr %8, align 8, !dbg !1510, !tbaa !1293, !DIAssignID !1511
    #dbg_assign(i64 2500000000, !1408, !DIExpression(), !1511, ptr %8, !DIExpression(), !1420)
  %69 = load volatile i64, ptr %5, align 8, !dbg !1512, !tbaa !1293
  %70 = load volatile i64, ptr %6, align 8, !dbg !1513, !tbaa !1293
  %71 = load volatile i64, ptr %7, align 8, !dbg !1514, !tbaa !1293
  %72 = load volatile i64, ptr %8, align 8, !dbg !1515, !tbaa !1293
  %73 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.46, i64 noundef %69, i64 noundef %70, i64 noundef %71, i64 noundef %72), !dbg !1516
  %74 = load volatile i64, ptr %5, align 8, !dbg !1517, !tbaa !1293
  %75 = load volatile i64, ptr %6, align 8, !dbg !1518, !tbaa !1293
  %76 = add nsw i64 %75, %74, !dbg !1519
  %77 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.47, i64 noundef %76), !dbg !1520
  %78 = load volatile i64, ptr %5, align 8, !dbg !1521, !tbaa !1293
  %79 = load volatile i64, ptr %6, align 8, !dbg !1522, !tbaa !1293
  %80 = sub nsw i64 %78, %79, !dbg !1523
  %81 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.48, i64 noundef %80), !dbg !1524
  %82 = load volatile i64, ptr %5, align 8, !dbg !1525, !tbaa !1293
  %83 = shl nsw i64 %82, 1, !dbg !1526
  %84 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.49, i64 noundef %83), !dbg !1527
  %85 = load volatile i64, ptr %5, align 8, !dbg !1528, !tbaa !1293
  %86 = load volatile i64, ptr %6, align 8, !dbg !1529, !tbaa !1293
  %87 = sdiv i64 %85, %86, !dbg !1530
  %88 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.50, i64 noundef %87), !dbg !1531
  %89 = load volatile i64, ptr %5, align 8, !dbg !1532, !tbaa !1293
  %90 = load volatile i64, ptr %6, align 8, !dbg !1533, !tbaa !1293
  %91 = srem i64 %89, %90, !dbg !1534
  %92 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.51, i64 noundef %91), !dbg !1535
  %93 = load volatile i64, ptr %7, align 8, !dbg !1536, !tbaa !1293
  %94 = load volatile i64, ptr %8, align 8, !dbg !1537, !tbaa !1293
  %95 = udiv i64 %93, %94, !dbg !1538
  %96 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.52, i64 noundef %95), !dbg !1539
  %97 = load volatile i64, ptr %7, align 8, !dbg !1540, !tbaa !1293
  %98 = load volatile i64, ptr %8, align 8, !dbg !1541, !tbaa !1293
  %99 = urem i64 %97, %98, !dbg !1542
  %100 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.53, i64 noundef %99), !dbg !1543
  %101 = load volatile i64, ptr %5, align 8, !dbg !1544, !tbaa !1293
  %102 = and i64 %101, 4294967295, !dbg !1545
  %103 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.54, i64 noundef %102), !dbg !1546
  %104 = load volatile i64, ptr %5, align 8, !dbg !1547, !tbaa !1293
  %105 = or i64 %104, 2147483648, !dbg !1548
  %106 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.55, i64 noundef %105), !dbg !1549
  %107 = load volatile i64, ptr %5, align 8, !dbg !1550, !tbaa !1293
  %108 = xor i64 %107, 4294967295, !dbg !1551
  %109 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.56, i64 noundef %108), !dbg !1552
  %110 = load volatile i64, ptr %6, align 8, !dbg !1553, !tbaa !1293
  %111 = shl i64 %110, 2, !dbg !1554
  %112 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.57, i64 noundef %111), !dbg !1555
  %113 = load volatile i64, ptr %5, align 8, !dbg !1556, !tbaa !1293
  %114 = ashr i64 %113, 2, !dbg !1557
  %115 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.58, i64 noundef %114), !dbg !1558
  %116 = load volatile i64, ptr %7, align 8, !dbg !1559, !tbaa !1293
  %117 = lshr i64 %116, 2, !dbg !1560
  %118 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.59, i64 noundef %117), !dbg !1561
  %119 = load volatile i64, ptr %6, align 8, !dbg !1562, !tbaa !1293
  %120 = xor i64 %119, -1, !dbg !1563
  %121 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.60, i64 noundef %120), !dbg !1564
  %122 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.411), !dbg !1565
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %9), !dbg !1566
  store volatile float 0xC05EDCCCC0000000, ptr %9, align 4, !dbg !1567, !tbaa !1568, !DIAssignID !1570
    #dbg_assign(float 0xC05EDCCCC0000000, !1409, !DIExpression(), !1570, ptr %9, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %10), !dbg !1571
  store volatile float 2.500000e+00, ptr %10, align 4, !dbg !1572, !tbaa !1568, !DIAssignID !1573
    #dbg_assign(float 2.500000e+00, !1411, !DIExpression(), !1573, ptr %10, !DIExpression(), !1420)
  %123 = load volatile float, ptr %9, align 4, !dbg !1574, !tbaa !1568
  %124 = fpext float %123 to double, !dbg !1574
  %125 = load volatile float, ptr %10, align 4, !dbg !1575, !tbaa !1568
  %126 = fpext float %125 to double, !dbg !1575
  %127 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.62, double noundef %124, double noundef %126), !dbg !1576
  %128 = load volatile float, ptr %9, align 4, !dbg !1577, !tbaa !1568
  %129 = load volatile float, ptr %10, align 4, !dbg !1578, !tbaa !1568
  %130 = fadd float %128, %129, !dbg !1579
  %131 = fpext float %130 to double, !dbg !1577
  %132 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.63, double noundef %131), !dbg !1580
  %133 = load volatile float, ptr %9, align 4, !dbg !1581, !tbaa !1568
  %134 = load volatile float, ptr %10, align 4, !dbg !1582, !tbaa !1568
  %135 = fsub float %133, %134, !dbg !1583
  %136 = fpext float %135 to double, !dbg !1581
  %137 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.64, double noundef %136), !dbg !1584
  %138 = load volatile float, ptr %9, align 4, !dbg !1585, !tbaa !1568
  %139 = load volatile float, ptr %10, align 4, !dbg !1586, !tbaa !1568
  %140 = fmul float %138, %139, !dbg !1587
  %141 = fpext float %140 to double, !dbg !1585
  %142 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.65, double noundef %141), !dbg !1588
  %143 = load volatile float, ptr %9, align 4, !dbg !1589, !tbaa !1568
  %144 = load volatile float, ptr %10, align 4, !dbg !1590, !tbaa !1568
  %145 = fdiv float %143, %144, !dbg !1591
  %146 = fpext float %145 to double, !dbg !1589
  %147 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.66, double noundef %146), !dbg !1592
  %148 = load volatile float, ptr %9, align 4, !dbg !1593, !tbaa !1568
  %149 = tail call float @llvm.fabs.f32(float %148), !dbg !1594
  %150 = fpext float %149 to double, !dbg !1594
  %151 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.67, double noundef %150), !dbg !1595
  %152 = load volatile float, ptr %10, align 4, !dbg !1596, !tbaa !1568
  %153 = load volatile float, ptr %10, align 4, !dbg !1597, !tbaa !1568
  %154 = fmul float %152, %153, !dbg !1598
  %155 = tail call float @sqrtf(float noundef %154) #17, !dbg !1599
  %156 = fpext float %155 to double, !dbg !1599
  %157 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.68, double noundef %156), !dbg !1600
  %158 = load volatile float, ptr %9, align 4, !dbg !1601, !tbaa !1568
  %159 = load volatile float, ptr %10, align 4, !dbg !1602, !tbaa !1568
  %160 = tail call float @llvm.minnum.f32(float %158, float %159), !dbg !1603
  %161 = fpext float %160 to double, !dbg !1603
  %162 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.69, double noundef %161), !dbg !1604
  %163 = load volatile float, ptr %9, align 4, !dbg !1605, !tbaa !1568
  %164 = load volatile float, ptr %10, align 4, !dbg !1606, !tbaa !1568
  %165 = tail call float @llvm.maxnum.f32(float %163, float %164), !dbg !1607
  %166 = fpext float %165 to double, !dbg !1607
  %167 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.70, double noundef %166), !dbg !1608
  %168 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.412), !dbg !1609
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %11), !dbg !1610
  store volatile double 0xC12E240CA45A1CAC, ptr %11, align 8, !dbg !1611, !tbaa !1612, !DIAssignID !1614
    #dbg_assign(double 0xC12E240CA45A1CAC, !1412, !DIExpression(), !1614, ptr %11, !DIExpression(), !1420)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %12), !dbg !1615
  store volatile double 2.000000e+00, ptr %12, align 8, !dbg !1616, !tbaa !1612, !DIAssignID !1617
    #dbg_assign(double 2.000000e+00, !1414, !DIExpression(), !1617, ptr %12, !DIExpression(), !1420)
  %169 = load volatile double, ptr %11, align 8, !dbg !1618, !tbaa !1612
  %170 = load volatile double, ptr %12, align 8, !dbg !1619, !tbaa !1612
  %171 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.72, double noundef %169, double noundef %170), !dbg !1620
  %172 = load volatile double, ptr %11, align 8, !dbg !1621, !tbaa !1612
  %173 = load volatile double, ptr %12, align 8, !dbg !1622, !tbaa !1612
  %174 = fadd double %172, %173, !dbg !1623
  %175 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.73, double noundef %174), !dbg !1624
  %176 = load volatile double, ptr %11, align 8, !dbg !1625, !tbaa !1612
  %177 = load volatile double, ptr %12, align 8, !dbg !1626, !tbaa !1612
  %178 = fsub double %176, %177, !dbg !1627
  %179 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.74, double noundef %178), !dbg !1628
  %180 = load volatile double, ptr %11, align 8, !dbg !1629, !tbaa !1612
  %181 = load volatile double, ptr %12, align 8, !dbg !1630, !tbaa !1612
  %182 = fmul double %180, %181, !dbg !1631
  %183 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.75, double noundef %182), !dbg !1632
  %184 = load volatile double, ptr %11, align 8, !dbg !1633, !tbaa !1612
  %185 = load volatile double, ptr %12, align 8, !dbg !1634, !tbaa !1612
  %186 = fdiv double %184, %185, !dbg !1635
  %187 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.76, double noundef %186), !dbg !1636
  %188 = load volatile double, ptr %11, align 8, !dbg !1637, !tbaa !1612
  %189 = tail call double @llvm.fabs.f64(double %188), !dbg !1638
  %190 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.77, double noundef %189), !dbg !1639
  %191 = load volatile double, ptr %12, align 8, !dbg !1640, !tbaa !1612
  %192 = load volatile double, ptr %12, align 8, !dbg !1641, !tbaa !1612
  %193 = fmul double %191, %192, !dbg !1642
  %194 = tail call double @sqrt(double noundef %193) #17, !dbg !1643
  %195 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.78, double noundef %194), !dbg !1644
  %196 = load volatile double, ptr %11, align 8, !dbg !1645, !tbaa !1612
  %197 = load volatile double, ptr %12, align 8, !dbg !1646, !tbaa !1612
  %198 = tail call double @llvm.minnum.f64(double %196, double %197), !dbg !1647
  %199 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.79, double noundef %198), !dbg !1648
  %200 = load volatile double, ptr %11, align 8, !dbg !1649, !tbaa !1612
  %201 = load volatile double, ptr %12, align 8, !dbg !1650, !tbaa !1612
  %202 = tail call double @llvm.maxnum.f64(double %200, double %201), !dbg !1651
  %203 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.80, double noundef %202), !dbg !1652
  %204 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.413), !dbg !1653
  %205 = load volatile double, ptr %11, align 8, !dbg !1654, !tbaa !1612
  %206 = fptosi double %205 to i32, !dbg !1655
    #dbg_value(i32 %206, !1415, !DIExpression(), !1420)
  %207 = load volatile i64, ptr %6, align 8, !dbg !1656, !tbaa !1293
  %208 = sitofp i64 %207 to float, !dbg !1657
    #dbg_value(float %208, !1416, !DIExpression(), !1420)
    #dbg_value(i16 -7616, !1417, !DIExpression(), !1420)
    #dbg_value(i32 -5, !1418, !DIExpression(), !1420)
  %209 = load volatile double, ptr %11, align 8, !dbg !1658, !tbaa !1612
  %210 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.82, double noundef %209, i32 noundef %206), !dbg !1659
  %211 = load volatile i64, ptr %6, align 8, !dbg !1660, !tbaa !1293
  %212 = fpext float %208 to double, !dbg !1661
  %213 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.83, i64 noundef %211, double noundef %212), !dbg !1662
  %214 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.84, i32 noundef -7616), !dbg !1663
  %215 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.85, i32 noundef -5), !dbg !1664
  %216 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.414), !dbg !1665
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %12), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %11), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %10), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %9), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %8), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %7), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %6), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %5), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %4), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %3), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2), !dbg !1666
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1), !dbg !1666
  ret void, !dbg !1666
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #7

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare !dbg !1667 dso_local float @sqrtf(float noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minnum.f32(float, float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maxnum.f32(float, float) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #7

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare !dbg !1671 dso_local double @sqrt(double noundef) local_unnamed_addr #8

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.minnum.f64(double, double) #7

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.maxnum.f64(double, double) #7

; Function Attrs: nofree nounwind
define dso_local void @test_memory_operations() local_unnamed_addr #3 !dbg !1674 {
    #dbg_assign(i1 poison, !1676, !DIExpression(), !1701, ptr undef, !DIExpression(), !1702)
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.415), !dbg !1703
    #dbg_value(i32 0, !1680, !DIExpression(), !1704)
    #dbg_value(i32 poison, !1680, !DIExpression(), !1704)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.416), !dbg !1705
    #dbg_value(ptr poison, !1682, !DIExpression(), !1702)
    #dbg_value(i32 123456789, !1683, !DIExpression(), !1702)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.89, i32 noundef 123456789, i32 noundef 123456789), !dbg !1706
    #dbg_value(ptr poison, !1684, !DIExpression(), !1702)
    #dbg_value(i64 -987654321098765, !1685, !DIExpression(), !1702)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.90, i64 noundef -987654321098765, i64 noundef -987654321098765), !dbg !1707
    #dbg_value(ptr poison, !1686, !DIExpression(), !1702)
    #dbg_value(float 0x400921FA00000000, !1687, !DIExpression(), !1702)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.91, double noundef 0x400921FA00000000, double noundef 0x400921FA00000000), !dbg !1708
    #dbg_value(ptr poison, !1688, !DIExpression(), !1702)
    #dbg_value(double 0x4005BF0A8B145703, !1689, !DIExpression(), !1702)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.92, double noundef 0x4005BF0A8B145703, double noundef 0x4005BF0A8B145703), !dbg !1709
    #dbg_value(ptr poison, !1690, !DIExpression(), !1702)
    #dbg_value(i8 -120, !1691, !DIExpression(), !1702)
    #dbg_value(ptr poison, !1692, !DIExpression(), !1702)
    #dbg_value(i8 -6, !1693, !DIExpression(), !1702)
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.93, i32 noundef -120, i32 noundef -120), !dbg !1710
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.94, i32 noundef 250, i32 noundef 250), !dbg !1711
    #dbg_value(ptr poison, !1694, !DIExpression(), !1702)
    #dbg_value(i16 -32000, !1695, !DIExpression(), !1702)
    #dbg_value(ptr poison, !1696, !DIExpression(), !1702)
    #dbg_value(i16 -536, !1697, !DIExpression(), !1702)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.95, i32 noundef -32000, i32 noundef -32000), !dbg !1712
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.96, i32 noundef 65000, i32 noundef 65000), !dbg !1713
    #dbg_value(ptr poison, !1698, !DIExpression(), !1702)
    #dbg_value(ptr inttoptr (i32 -559038737 to ptr), !1699, !DIExpression(), !1702)
    #dbg_value(ptr inttoptr (i32 -559038737 to ptr), !1700, !DIExpression(), !1702)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.97, ptr noundef nonnull inttoptr (i32 -559038737 to ptr), ptr noundef nonnull inttoptr (i32 -559038737 to ptr)), !dbg !1714
  %12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.417), !dbg !1715
  ret void, !dbg !1716
}

; Function Attrs: nofree nounwind
define dso_local void @test_control_flow() local_unnamed_addr #3 !dbg !1717 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.418), !dbg !1729
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.419), !dbg !1730
    #dbg_value(i32 10, !1719, !DIExpression(), !1731)
    #dbg_value(i32 20, !1720, !DIExpression(), !1731)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.420), !dbg !1732
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.421), !dbg !1735
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.422), !dbg !1738
    #dbg_value(double 3.140000e+00, !1721, !DIExpression(), !1731)
    #dbg_value(double 3.141000e+00, !1722, !DIExpression(), !1731)
  %6 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.423), !dbg !1741
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.424), !dbg !1744
    #dbg_value(i32 0, !1723, !DIExpression(), !1731)
    #dbg_value(i32 1, !1724, !DIExpression(), !1745)
  br label %12, !dbg !1746

8:                                                ; preds = %12
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.111, i32 noundef 15), !dbg !1747
  %10 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.425), !dbg !1748
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.427), !dbg !1751
    #dbg_value(i32 0, !1726, !DIExpression(), !1752)
  br label %23, !dbg !1753

12:                                               ; preds = %0, %12
  %13 = phi i32 [ 1, %0 ], [ %17, %12 ]
  %14 = phi i32 [ 0, %0 ], [ %15, %12 ]
    #dbg_value(i32 %13, !1724, !DIExpression(), !1745)
    #dbg_value(i32 %14, !1723, !DIExpression(), !1731)
  %15 = add nuw nsw i32 %13, %14, !dbg !1754
    #dbg_value(i32 %15, !1723, !DIExpression(), !1731)
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.110, i32 noundef %13, i32 noundef %15), !dbg !1757
  %17 = add nuw nsw i32 %13, 1, !dbg !1758
    #dbg_value(i32 %17, !1724, !DIExpression(), !1745)
  %18 = icmp eq i32 %17, 6, !dbg !1759
  br i1 %18, label %8, label %12, !dbg !1746, !llvm.loop !1760

19:                                               ; preds = %29
  %20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.428), !dbg !1763
    #dbg_label(!1728, !1764)
  %21 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.429), !dbg !1765
  %22 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.430), !dbg !1766
  ret void, !dbg !1767

23:                                               ; preds = %8, %29
  %24 = phi i32 [ 0, %8 ], [ %32, %29 ]
    #dbg_value(i32 %24, !1726, !DIExpression(), !1752)
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.115, i32 noundef %24), !dbg !1768
  switch i32 %24, label %28 [
    i32 0, label %29
    i32 1, label %26
    i32 2, label %27
  ], !dbg !1771

26:                                               ; preds = %23
  br label %29, !dbg !1772

27:                                               ; preds = %23
  br label %29, !dbg !1774

28:                                               ; preds = %23
  br label %29, !dbg !1775

29:                                               ; preds = %23, %26, %27, %28
  %30 = phi ptr [ @str.432, %26 ], [ @str.431, %27 ], [ @str.434, %28 ], [ @str.433, %23 ]
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) %30), !dbg !1776
  %32 = add nuw nsw i32 %24, 1, !dbg !1777
    #dbg_value(i32 %32, !1726, !DIExpression(), !1752)
  %33 = icmp eq i32 %32, 4, !dbg !1778
  br i1 %33, label %19, label %23, !dbg !1753, !llvm.loop !1779
}

; Function Attrs: nounwind
define dso_local void @MarchallingTest() local_unnamed_addr #4 !dbg !1781 {
  %1 = alloca i32, align 4, !DIAssignID !1784
    #dbg_assign(i1 undef, !1783, !DIExpression(), !1784, ptr %1, !DIExpression(), !1785)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.435), !dbg !1786
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #17, !dbg !1787
  store i32 0, ptr %1, align 4, !dbg !1788, !tbaa !1289, !DIAssignID !1789
    #dbg_assign(i32 0, !1783, !DIExpression(), !1789, ptr %1, !DIExpression(), !1785)
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.124, i32 noundef 0, ptr noundef nonnull %1), !dbg !1790
  call void @set_magic_number(ptr noundef nonnull %1) #17, !dbg !1791
  %4 = load i32, ptr %1, align 4, !dbg !1792, !tbaa !1289
  %5 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.125, i32 noundef %4), !dbg !1793
  %6 = load i32, ptr %1, align 4, !dbg !1794, !tbaa !1289
  %7 = icmp eq i32 %6, 42, !dbg !1796
  %8 = select i1 %7, ptr @str.437, ptr @str.436
  %9 = call i32 @puts(ptr nonnull dereferenceable(1) %8), !dbg !1797
  %10 = call i32 @puts(ptr nonnull dereferenceable(1) @str.438), !dbg !1798
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #17, !dbg !1799
  ret void, !dbg !1799
}

declare !dbg !1800 dso_local void @set_magic_number(ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @test_select_opcodes() local_unnamed_addr #3 !dbg !1803 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.439), !dbg !1811
    #dbg_value(i32 1, !1805, !DIExpression(), !1812)
    #dbg_value(i32 100, !1806, !DIExpression(), !1812)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.130, i32 noundef 100), !dbg !1813
    #dbg_value(i64 9876543210, !1807, !DIExpression(), !1812)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.131, i64 noundef 9876543210), !dbg !1814
    #dbg_value(float 0x40123D70A0000000, !1808, !DIExpression(), !1812)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.132, double noundef 0x40123D70A0000000), !dbg !1815
    #dbg_value(double 2.710000e+00, !1809, !DIExpression(), !1812)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.133, double noundef 2.710000e+00), !dbg !1816
    #dbg_value(ptr inttoptr (i32 43690 to ptr), !1810, !DIExpression(), !1812)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.134, ptr noundef nonnull inttoptr (i32 43690 to ptr)), !dbg !1817
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.440), !dbg !1818
  ret void, !dbg !1819
}

; Function Attrs: nofree nounwind
define dso_local void @test_pointer_ops() local_unnamed_addr #3 !dbg !1820 {
  %1 = alloca i32, align 4, !DIAssignID !1826
    #dbg_assign(i1 undef, !1822, !DIExpression(), !1826, ptr %1, !DIExpression(), !1827)
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.441), !dbg !1828
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #17, !dbg !1829
  store i32 123, ptr %1, align 4, !dbg !1830, !tbaa !1289, !DIAssignID !1831
    #dbg_assign(i32 123, !1822, !DIExpression(), !1831, ptr %1, !DIExpression(), !1827)
    #dbg_value(ptr %1, !1823, !DIExpression(), !1827)
  %3 = ptrtoint ptr %1 to i32, !dbg !1832
    #dbg_value(i32 %3, !1824, !DIExpression(), !1827)
  %4 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.137, i32 noundef %3), !dbg !1833
    #dbg_value(ptr %1, !1825, !DIExpression(), !1827)
  %5 = load i32, ptr %1, align 4, !dbg !1834, !tbaa !1289
  %6 = icmp eq i32 %5, 123, !dbg !1836
  br i1 %6, label %7, label %9, !dbg !1837

7:                                                ; preds = %0
  %8 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.138, i32 noundef 123), !dbg !1838
  br label %11, !dbg !1840

9:                                                ; preds = %0
  %10 = call i32 @puts(ptr nonnull dereferenceable(1) @str.442), !dbg !1841
  br label %11

11:                                               ; preds = %9, %7
  %12 = call i32 @puts(ptr nonnull dereferenceable(1) @str.443), !dbg !1843
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #17, !dbg !1844
  ret void, !dbg !1844
}

; Function Attrs: nounwind
define dso_local void @test_atomics() local_unnamed_addr #4 !dbg !1845 {
  %1 = alloca i32, align 4, !DIAssignID !1854
    #dbg_assign(i1 undef, !1847, !DIExpression(), !1854, ptr %1, !DIExpression(), !1855)
  %2 = alloca i64, align 8, !DIAssignID !1856
    #dbg_assign(i1 undef, !1851, !DIExpression(), !1856, ptr %2, !DIExpression(), !1855)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.444), !dbg !1857
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.445), !dbg !1858
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #17, !dbg !1859
  store volatile i32 10, ptr %1, align 4, !dbg !1860, !tbaa !1289, !DIAssignID !1861
    #dbg_assign(i32 10, !1847, !DIExpression(), !1861, ptr %1, !DIExpression(), !1855)
  %5 = load volatile i32, ptr %1, align 4, !dbg !1862, !tbaa !1289
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.143, i32 noundef %5), !dbg !1863
  %7 = atomicrmw volatile add ptr %1, i32 5 seq_cst, align 4, !dbg !1864
    #dbg_value(i32 %7, !1848, !DIExpression(), !1855)
  %8 = load volatile i32, ptr %1, align 4, !dbg !1865, !tbaa !1289
  %9 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.144, i32 noundef %7, i32 noundef %8), !dbg !1866
  %10 = atomicrmw volatile xchg ptr %1, i32 42 seq_cst, align 4, !dbg !1867
    #dbg_value(i32 %10, !1849, !DIExpression(), !1855)
  %11 = load volatile i32, ptr %1, align 4, !dbg !1868, !tbaa !1289
  %12 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.145, i32 noundef %10, i32 noundef %11), !dbg !1869
    #dbg_value(i32 42, !1850, !DIExpression(), !1855)
  %13 = cmpxchg volatile ptr %1, i32 42, i32 100 seq_cst seq_cst, align 4, !dbg !1870
  %14 = load volatile i32, ptr %1, align 4, !dbg !1871, !tbaa !1289
  %15 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.146, i32 noundef %14), !dbg !1872
    #dbg_value(i32 99, !1850, !DIExpression(), !1855)
  %16 = cmpxchg volatile ptr %1, i32 99, i32 200 seq_cst seq_cst, align 4, !dbg !1873
  %17 = extractvalue { i32, i1 } %16, 0, !dbg !1873
    #dbg_value(i32 %17, !1850, !DIExpression(), !1855)
  %18 = load volatile i32, ptr %1, align 4, !dbg !1874, !tbaa !1289
  %19 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.147, i32 noundef %17, i32 noundef %18), !dbg !1875
  %20 = call i32 @puts(ptr nonnull dereferenceable(1) @str.446), !dbg !1876
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2) #17, !dbg !1877
  store volatile i64 1000, ptr %2, align 8, !dbg !1878, !tbaa !1293, !DIAssignID !1879
    #dbg_assign(i64 1000, !1851, !DIExpression(), !1879, ptr %2, !DIExpression(), !1855)
  %21 = load volatile i64, ptr %2, align 8, !dbg !1880, !tbaa !1293
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.149, i64 noundef %21), !dbg !1881
  %23 = call i64 @__atomic_fetch_sub_8(ptr noundef nonnull %2, i64 noundef 100, i32 noundef 5), !dbg !1882
    #dbg_value(i64 %23, !1852, !DIExpression(), !1855)
  %24 = load volatile i64, ptr %2, align 8, !dbg !1883, !tbaa !1293
  %25 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.150, i64 noundef %23, i64 noundef %24), !dbg !1884
  call void @__atomic_store_8(ptr noundef nonnull %2, i64 noundef 5555, i32 noundef 5), !dbg !1885
  %26 = call i64 @__atomic_load_8(ptr noundef nonnull %2, i32 noundef 5), !dbg !1886
    #dbg_value(i64 %26, !1853, !DIExpression(), !1855)
  %27 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.151, i64 noundef %26), !dbg !1887
  %28 = call i32 @puts(ptr nonnull dereferenceable(1) @str.447), !dbg !1888
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2) #17, !dbg !1889
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #17, !dbg !1889
  ret void, !dbg !1889
}

; Function Attrs: mustprogress nounwind willreturn
declare dso_local i64 @__atomic_fetch_sub_8(ptr, i64, i32) local_unnamed_addr #9

; Function Attrs: mustprogress nounwind willreturn
declare dso_local void @__atomic_store_8(ptr, i64, i32) local_unnamed_addr #9

; Function Attrs: mustprogress nounwind willreturn
declare dso_local i64 @__atomic_load_8(ptr, i32) local_unnamed_addr #9

; Function Attrs: nounwind
define dso_local void @test_heap_and_memory_operations() local_unnamed_addr #4 !dbg !1890 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.448), !dbg !1908
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.449), !dbg !1909
  %3 = tail call noalias dereferenceable_or_null(128) ptr @malloc(i32 noundef 128) #18, !dbg !1910
    #dbg_value(ptr %3, !1892, !DIExpression(), !1911)
  %4 = icmp eq ptr %3, null, !dbg !1912
  br i1 %4, label %27, label %5, !dbg !1914

5:                                                ; preds = %0
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.156, ptr noundef nonnull %3), !dbg !1915
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(12) %3, ptr noundef nonnull align 1 dereferenceable(12) @.str.157, i32 12, i1 false), !dbg !1917
  %7 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %3, ptr noundef nonnull dereferenceable(12) @.str.157), !dbg !1918
  %8 = icmp eq i32 %7, 0, !dbg !1920
  %9 = select i1 %8, ptr @str.451, ptr @str.450
  %10 = tail call i32 @puts(ptr nonnull dereferenceable(1) %9), !dbg !1921
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.453), !dbg !1922
    #dbg_value(i32 58, !1893, !DIExpression(), !1923)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.161, i32 noundef 58), !dbg !1924
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(58) %3, ptr noundef nonnull align 1 dereferenceable(58) @STATIC_DATA_FOR_INIT, i32 58, i1 false), !dbg !1925
  %13 = tail call i32 @memcmp(ptr noundef nonnull dereferenceable(58) %3, ptr noundef nonnull dereferenceable(58) @STATIC_DATA_FOR_INIT, i32 noundef 58), !dbg !1926
  %14 = icmp eq i32 %13, 0, !dbg !1928
  %15 = select i1 %14, ptr @str.455, ptr @str.454
  %16 = tail call i32 @puts(ptr nonnull dereferenceable(1) %15), !dbg !1929
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.456), !dbg !1930
  %18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.457), !dbg !1931
  tail call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %3, i8 88, i32 32, i1 false), !dbg !1932
    #dbg_value(i8 1, !1900, !DIExpression(), !1933)
    #dbg_value(i32 0, !1903, !DIExpression(), !1934)
  br label %22, !dbg !1935

19:                                               ; preds = %22
  %20 = add nuw nsw i32 %23, 1, !dbg !1936
    #dbg_value(i32 %20, !1903, !DIExpression(), !1934)
    #dbg_value(i32 %20, !1903, !DIExpression(), !1934)
  %21 = icmp eq i32 %20, 32, !dbg !1938
  br i1 %21, label %30, label %22, !dbg !1935, !llvm.loop !1939

22:                                               ; preds = %5, %19
  %23 = phi i32 [ 0, %5 ], [ %20, %19 ]
    #dbg_value(i32 %23, !1903, !DIExpression(), !1934)
  %24 = getelementptr inbounds i8, ptr %3, i32 %23, !dbg !1941
  %25 = load i8, ptr %24, align 1, !dbg !1941, !tbaa !1944
  %26 = icmp eq i8 %25, 88, !dbg !1945
    #dbg_value(i32 %23, !1903, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1934)
  br i1 %26, label %19, label %30, !dbg !1946

27:                                               ; preds = %0
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.452), !dbg !1921
  %29 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.453), !dbg !1922
  br label %30, !dbg !1947

30:                                               ; preds = %22, %19, %27
  %31 = phi ptr [ @str.456, %27 ], [ @str.458, %22 ], [ @str.459, %19 ]
  %32 = tail call i32 @puts(ptr nonnull dereferenceable(1) %31), !dbg !1911
  %33 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.460), !dbg !1948
  br i1 %4, label %42, label %34, !dbg !1949

34:                                               ; preds = %30
  tail call void @free(ptr noundef %3), !dbg !1950
  %35 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.461), !dbg !1951
  %36 = tail call noalias dereferenceable_or_null(120) ptr @malloc(i32 noundef 120) #18, !dbg !1952
    #dbg_value(ptr %36, !1905, !DIExpression(), !1953)
  %37 = icmp eq ptr %36, null, !dbg !1954
  br i1 %37, label %40, label %38, !dbg !1956

38:                                               ; preds = %34
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.170, ptr noundef nonnull %36), !dbg !1957
  tail call void @free(ptr noundef %36), !dbg !1959
  br label %42, !dbg !1960

40:                                               ; preds = %34
  %41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.462), !dbg !1961
  br label %42

42:                                               ; preds = %38, %40, %30
  %43 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.463), !dbg !1963
  ret void, !dbg !1964
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare !dbg !1965 dso_local noalias noundef ptr @malloc(i32 noundef) local_unnamed_addr #10

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #11

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare !dbg !1971 dso_local i32 @strcmp(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #12

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare !dbg !1975 dso_local i32 @memcmp(ptr nocapture noundef, ptr nocapture noundef, i32 noundef) local_unnamed_addr #12

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #13

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare !dbg !1980 dso_local void @free(ptr allocptr nocapture noundef) local_unnamed_addr #14

; Function Attrs: nofree nounwind
define dso_local void @test_i64_imm8_ops() local_unnamed_addr #3 !dbg !1981 {
  %1 = alloca i64, align 8, !DIAssignID !1992
    #dbg_assign(i1 undef, !1983, !DIExpression(), !1992, ptr %1, !DIExpression(), !1993)
  %2 = alloca i64, align 8, !DIAssignID !1994
    #dbg_assign(i1 undef, !1984, !DIExpression(), !1994, ptr %2, !DIExpression(), !1993)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.464), !dbg !1995
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %1), !dbg !1996
  store volatile i64 -1000, ptr %1, align 8, !dbg !1997, !tbaa !1293, !DIAssignID !1998
    #dbg_assign(i64 -1000, !1983, !DIExpression(), !1998, ptr %1, !DIExpression(), !1993)
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %2), !dbg !1999
  store volatile i64 2000, ptr %2, align 8, !dbg !2000, !tbaa !1293, !DIAssignID !2001
    #dbg_assign(i64 2000, !1984, !DIExpression(), !2001, ptr %2, !DIExpression(), !1993)
  %4 = load volatile i64, ptr %1, align 8, !dbg !2002, !tbaa !1293
    #dbg_value(i64 %4, !1985, !DIExpression(), !1993)
  %5 = load volatile i64, ptr %2, align 8, !dbg !2003, !tbaa !1293
    #dbg_value(i64 %5, !1986, !DIExpression(), !1993)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.174, i64 noundef %4, i64 noundef %5), !dbg !2004
  %7 = sdiv i64 %4, -10, !dbg !2005
    #dbg_value(i64 %7, !1987, !DIExpression(), !1993)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.175, i64 noundef %4, i64 noundef %7), !dbg !2006
  %9 = udiv i64 %5, 20, !dbg !2007
    #dbg_value(i64 %9, !1988, !DIExpression(), !1993)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.176, i64 noundef %5, i64 noundef %9), !dbg !2008
  %11 = srem i64 %4, 13, !dbg !2009
    #dbg_value(i64 %11, !1989, !DIExpression(), !1993)
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.177, i64 noundef %4, i64 noundef %11), !dbg !2010
  %13 = urem i64 %5, 17, !dbg !2011
    #dbg_value(i64 %13, !1990, !DIExpression(), !1993)
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.178, i64 noundef %5, i64 noundef %13), !dbg !2012
  %15 = lshr i64 %5, 3, !dbg !2013
    #dbg_value(i64 %15, !1991, !DIExpression(), !1993)
  %16 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.179, i64 noundef %5, i64 noundef %15), !dbg !2014
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.465), !dbg !2015
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %2), !dbg !2016
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %1), !dbg !2016
  ret void, !dbg !2016
}

; Function Attrs: nofree nounwind
define dso_local void @print_int_array(ptr nocapture noundef readonly %0, i32 noundef %1) local_unnamed_addr #3 !dbg !2017 {
    #dbg_value(ptr %0, !2021, !DIExpression(), !2025)
    #dbg_value(i32 %1, !2022, !DIExpression(), !2025)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.181), !dbg !2026
    #dbg_value(i32 0, !2023, !DIExpression(), !2027)
  %4 = icmp eq i32 %1, 0, !dbg !2028
  br i1 %4, label %5, label %7, !dbg !2030

5:                                                ; preds = %7, %2
  %6 = tail call i32 @putchar(i32 10), !dbg !2031
  ret void, !dbg !2032

7:                                                ; preds = %2, %7
  %8 = phi i32 [ %12, %7 ], [ 0, %2 ]
    #dbg_value(i32 %8, !2023, !DIExpression(), !2027)
  %9 = getelementptr inbounds i32, ptr %0, i32 %8, !dbg !2033
  %10 = load i32, ptr %9, align 4, !dbg !2033, !tbaa !1289
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.182, i32 noundef %10), !dbg !2035
  %12 = add nuw i32 %8, 1, !dbg !2036
    #dbg_value(i32 %12, !2023, !DIExpression(), !2027)
  %13 = icmp eq i32 %12, %1, !dbg !2028
  br i1 %13, label %5, label %7, !dbg !2030, !llvm.loop !2037
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite)
define dso_local void @modify_sensor_by_ref(ptr nocapture noundef %0) local_unnamed_addr #15 !dbg !2039 {
    #dbg_value(ptr %0, !2051, !DIExpression(), !2052)
  %2 = getelementptr inbounds %struct.SensorData, ptr %0, i32 0, i32 1, !dbg !2053
  %3 = load float, ptr %2, align 4, !dbg !2054, !tbaa !2055
  %4 = fadd float %3, 5.000000e+00, !dbg !2054
  store float %4, ptr %2, align 4, !dbg !2054, !tbaa !2055
  %5 = getelementptr inbounds %struct.SensorData, ptr %0, i32 0, i32 2, !dbg !2057
  tail call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %5, ptr noundef nonnull align 1 dereferenceable(16) @.str.184, i32 16, i1 false), !dbg !2058
  %6 = getelementptr inbounds %struct.SensorData, ptr %0, i32 0, i32 3, !dbg !2059
  store i8 0, ptr %6, align 4, !dbg !2060, !tbaa !2061
  ret void, !dbg !2062
}

; Function Attrs: nofree nounwind
define dso_local void @test_complex_data_types() local_unnamed_addr #3 !dbg !2063 {
  %1 = alloca [5 x i32], align 4, !DIAssignID !2096
    #dbg_assign(i1 undef, !2065, !DIExpression(), !2096, ptr %1, !DIExpression(), !2097)
  %2 = alloca %struct.SensorData, align 4, !DIAssignID !2098
    #dbg_assign(i1 undef, !2072, !DIExpression(), !2098, ptr %2, !DIExpression(), !2097)
  %3 = alloca [2 x %struct.SensorData], align 4, !DIAssignID !2099
    #dbg_assign(i1 undef, !2084, !DIExpression(), !2099, ptr %3, !DIExpression(), !2097)
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.466), !dbg !2100
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.467), !dbg !2101
  call void @llvm.lifetime.start.p0(i64 20, ptr nonnull %1) #17, !dbg !2102
  store i32 10, ptr %1, align 4, !dbg !2103, !DIAssignID !2104
    #dbg_assign(i32 10, !2065, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2104, ptr %1, !DIExpression(), !2097)
  %6 = getelementptr inbounds i32, ptr %1, i32 1, !dbg !2103
  store i32 20, ptr %6, align 4, !dbg !2103, !DIAssignID !2105
    #dbg_assign(i32 20, !2065, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2105, ptr %6, !DIExpression(), !2097)
  %7 = getelementptr inbounds i32, ptr %1, i32 2, !dbg !2103
  store i32 30, ptr %7, align 4, !dbg !2103, !DIAssignID !2106
    #dbg_assign(i32 30, !2065, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !2106, ptr %7, !DIExpression(), !2097)
  %8 = getelementptr inbounds i32, ptr %1, i32 3, !dbg !2103
  store i32 40, ptr %8, align 4, !dbg !2103, !DIAssignID !2107
    #dbg_assign(i32 40, !2065, !DIExpression(DW_OP_LLVM_fragment, 96, 32), !2107, ptr %8, !DIExpression(), !2097)
  %9 = getelementptr inbounds i32, ptr %1, i32 4, !dbg !2103
  store i32 50, ptr %9, align 4, !dbg !2103, !DIAssignID !2108
    #dbg_assign(i32 50, !2065, !DIExpression(DW_OP_LLVM_fragment, 128, 32), !2108, ptr %9, !DIExpression(), !2097)
  %10 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.187), !dbg !2109
    #dbg_value(i32 0, !2067, !DIExpression(), !2110)
  br label %54, !dbg !2111

11:                                               ; preds = %54
  %12 = tail call i32 @putchar(i32 10), !dbg !2112
  store i32 35, ptr %7, align 4, !dbg !2113, !tbaa !1289, !DIAssignID !2114
    #dbg_assign(i32 35, !2065, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !2114, ptr %7, !DIExpression(), !2097)
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.188, i32 noundef 35), !dbg !2115
    #dbg_value(ptr %1, !2021, !DIExpression(), !2116)
    #dbg_value(i32 5, !2022, !DIExpression(), !2116)
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.181), !dbg !2118
    #dbg_value(i32 0, !2023, !DIExpression(), !2119)
  br label %15

15:                                               ; preds = %15, %11
  %16 = phi i32 [ %20, %15 ], [ 0, %11 ]
    #dbg_value(i32 %16, !2023, !DIExpression(), !2119)
  %17 = getelementptr inbounds i32, ptr %1, i32 %16, !dbg !2120
  %18 = load i32, ptr %17, align 4, !dbg !2120, !tbaa !1289
  %19 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.182, i32 noundef %18), !dbg !2121
  %20 = add nuw nsw i32 %16, 1, !dbg !2122
    #dbg_value(i32 %20, !2023, !DIExpression(), !2119)
  %21 = icmp eq i32 %20, 5, !dbg !2123
  br i1 %21, label %22, label %15, !dbg !2124, !llvm.loop !2125

22:                                               ; preds = %15
  %23 = tail call i32 @putchar(i32 10), !dbg !2127
    #dbg_value(i32 1, !2069, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2097)
    #dbg_value(i32 2, !2069, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2097)
    #dbg_value(i32 3, !2069, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !2097)
    #dbg_value(i32 4, !2069, !DIExpression(DW_OP_LLVM_fragment, 96, 32), !2097)
    #dbg_value(i32 5, !2069, !DIExpression(DW_OP_LLVM_fragment, 128, 32), !2097)
    #dbg_value(i32 6, !2069, !DIExpression(DW_OP_LLVM_fragment, 160, 32), !2097)
  %24 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.189, i32 noundef 5), !dbg !2128
  %25 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.468), !dbg !2129
  call void @llvm.lifetime.start.p0(i64 28, ptr nonnull %2) #17, !dbg !2130
  store i32 101, ptr %2, align 4, !dbg !2131, !tbaa !2132, !DIAssignID !2133
    #dbg_assign(i32 101, !2072, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2133, ptr %2, !DIExpression(), !2097)
  %26 = getelementptr inbounds %struct.SensorData, ptr %2, i32 0, i32 1, !dbg !2134
  store float 0x4037666660000000, ptr %26, align 4, !dbg !2135, !tbaa !2055, !DIAssignID !2136
    #dbg_assign(float 0x4037666660000000, !2072, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2136, ptr %26, !DIExpression(), !2097)
  %27 = getelementptr inbounds %struct.SensorData, ptr %2, i32 0, i32 2, !dbg !2137
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(13) %27, ptr noundef nonnull align 1 dereferenceable(13) @.str.191, i32 13, i1 false), !dbg !2138
  %28 = getelementptr inbounds %struct.SensorData, ptr %2, i32 0, i32 3, !dbg !2139
  store i8 1, ptr %28, align 4, !dbg !2140, !tbaa !2061, !DIAssignID !2141
    #dbg_assign(i8 1, !2072, !DIExpression(DW_OP_LLVM_fragment, 192, 8), !2141, ptr %28, !DIExpression(), !2097)
  %29 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.192, i32 noundef 101, ptr noundef nonnull %27, double noundef 0x4037666660000000, ptr noundef nonnull @.str.193), !dbg !2142
    #dbg_value(ptr %2, !2073, !DIExpression(), !2097)
  store float 0x40381999A0000000, ptr %26, align 4, !dbg !2143, !tbaa !2055
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.195, double noundef 0x40381999A0000000), !dbg !2144
    #dbg_value(ptr %2, !2051, !DIExpression(), !2145)
  %31 = load float, ptr %26, align 4, !dbg !2147, !tbaa !2055
  %32 = fadd float %31, 5.000000e+00, !dbg !2147
  store float %32, ptr %26, align 4, !dbg !2147, !tbaa !2055, !DIAssignID !2148
    #dbg_assign(float %32, !2072, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2148, ptr %26, !DIExpression(), !2097)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(16) %27, ptr noundef nonnull align 1 dereferenceable(16) @.str.184, i32 16, i1 false), !dbg !2149, !DIAssignID !2150
    #dbg_assign(i1 undef, !2072, !DIExpression(DW_OP_LLVM_fragment, 64, 128), !2150, ptr %27, !DIExpression(), !2097)
  store i8 0, ptr %28, align 4, !dbg !2151, !tbaa !2061, !DIAssignID !2152
    #dbg_assign(i8 0, !2072, !DIExpression(DW_OP_LLVM_fragment, 192, 8), !2152, ptr %28, !DIExpression(), !2097)
  %33 = fpext float %32 to double, !dbg !2153
  %34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.196, ptr noundef nonnull %27, double noundef %33, ptr noundef nonnull @.str.193), !dbg !2154
  %35 = call i32 @puts(ptr nonnull dereferenceable(1) @str.469), !dbg !2155
  %36 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.198, i32 noundef 4), !dbg !2156
    #dbg_value(i32 1078530000, !2074, !DIExpression(), !2097)
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.199, double noundef 0x400921FA00000000), !dbg !2157
  %38 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.200, i32 noundef 1078530000), !dbg !2158
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.201, i32 noundef 208, i32 noundef 15, i32 noundef 73, i32 noundef 64), !dbg !2159
    #dbg_value(i32 100, !2074, !DIExpression(), !2097)
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.202, i32 noundef 100), !dbg !2160
  %41 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.203, double noundef 0x3709000000000000), !dbg !2161
  %42 = call i32 @puts(ptr nonnull dereferenceable(1) @str.470), !dbg !2162
    #dbg_value(i32 1, !2082, !DIExpression(), !2097)
  %43 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.205, i32 noundef 1), !dbg !2163
    #dbg_value(i32 2, !2082, !DIExpression(), !2097)
  %44 = call i32 @puts(ptr nonnull dereferenceable(1) @str.471), !dbg !2164
  %45 = call i32 @puts(ptr nonnull dereferenceable(1) @str.472), !dbg !2166
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %3) #17, !dbg !2167
  store i32 201, ptr %3, align 4, !dbg !2168, !tbaa.struct !2169, !DIAssignID !2170
  %46 = getelementptr inbounds i8, ptr %3, i32 4, !dbg !2168
  store float 5.500000e+01, ptr %46, align 4, !dbg !2168, !tbaa.struct !2171, !DIAssignID !2172
  %47 = getelementptr inbounds i8, ptr %3, i32 8, !dbg !2168
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(16) %47, ptr noundef nonnull align 4 dereferenceable(16) @.str.211, i32 16, i1 false), !dbg !2168, !tbaa.struct !2173, !DIAssignID !2174
  %48 = getelementptr inbounds i8, ptr %3, i32 24, !dbg !2168
  store i8 1, ptr %48, align 4, !dbg !2168, !tbaa.struct !2175, !DIAssignID !2176
    #dbg_assign(i32 201, !2084, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2170, ptr %3, !DIExpression(), !2097)
    #dbg_assign(float 5.500000e+01, !2084, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2172, ptr %46, !DIExpression(), !2097)
    #dbg_assign(i1 undef, !2084, !DIExpression(DW_OP_LLVM_fragment, 64, 128), !2174, ptr %47, !DIExpression(), !2097)
    #dbg_assign(i8 1, !2084, !DIExpression(DW_OP_LLVM_fragment, 192, 8), !2176, ptr %48, !DIExpression(), !2097)
    #dbg_assign(i1 undef, !2084, !DIExpression(DW_OP_LLVM_fragment, 200, 24), !2177, ptr %3, !DIExpression(DW_OP_plus_uconst, 25), !2097)
  %49 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 1, !dbg !2178
  store i32 202, ptr %49, align 4, !dbg !2179, !tbaa.struct !2169, !DIAssignID !2180
  %50 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 1, i32 1, !dbg !2179
  store float 1.250000e+01, ptr %50, align 4, !dbg !2179, !tbaa.struct !2171, !DIAssignID !2181
  %51 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 1, i32 2, !dbg !2179
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 4 dereferenceable(16) %51, ptr noundef nonnull align 4 dereferenceable(16) @.str.212, i32 16, i1 false), !dbg !2179, !tbaa.struct !2173, !DIAssignID !2182
  %52 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 1, i32 3, !dbg !2179
  store i8 0, ptr %52, align 4, !dbg !2179, !tbaa.struct !2175, !DIAssignID !2183
    #dbg_assign(i32 202, !2084, !DIExpression(DW_OP_LLVM_fragment, 224, 32), !2180, ptr %49, !DIExpression(), !2097)
    #dbg_assign(float 1.250000e+01, !2084, !DIExpression(DW_OP_LLVM_fragment, 256, 32), !2181, ptr %50, !DIExpression(), !2097)
    #dbg_assign(i1 undef, !2084, !DIExpression(DW_OP_LLVM_fragment, 288, 128), !2182, ptr %51, !DIExpression(), !2097)
    #dbg_assign(i8 0, !2084, !DIExpression(DW_OP_LLVM_fragment, 416, 8), !2183, ptr %52, !DIExpression(), !2097)
    #dbg_assign(i1 undef, !2084, !DIExpression(DW_OP_LLVM_fragment, 424, 24), !2184, ptr %3, !DIExpression(DW_OP_plus_uconst, 53), !2097)
  %53 = call i32 @puts(ptr nonnull dereferenceable(1) @str.473), !dbg !2185
    #dbg_value(i32 0, !2086, !DIExpression(), !2186)
  br label %67, !dbg !2187

54:                                               ; preds = %0, %54
  %55 = phi i32 [ 0, %0 ], [ %59, %54 ]
    #dbg_value(i32 %55, !2067, !DIExpression(), !2110)
  %56 = getelementptr inbounds [5 x i32], ptr %1, i32 0, i32 %55, !dbg !2188
  %57 = load i32, ptr %56, align 4, !dbg !2188, !tbaa !1289
  %58 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.182, i32 noundef %57), !dbg !2191
  %59 = add nuw nsw i32 %55, 1, !dbg !2192
    #dbg_value(i32 %59, !2067, !DIExpression(), !2110)
  %60 = icmp eq i32 %59, 5, !dbg !2193
  br i1 %60, label %11, label %54, !dbg !2111, !llvm.loop !2194

61:                                               ; preds = %67
  %62 = call i32 @puts(ptr nonnull dereferenceable(1) @str.474), !dbg !2196
  %63 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.216, i32 noundef 1), !dbg !2197
    #dbg_value(i8 1, !2088, !DIExpression(), !2097)
    #dbg_value(i8 1, !2088, !DIExpression(), !2097)
    #dbg_value(i8 21, !2088, !DIExpression(), !2097)
    #dbg_value(i8 21, !2088, !DIExpression(), !2097)
  %64 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.217, i32 noundef 1, i32 noundef 0, i32 noundef 5), !dbg !2198
  %65 = call i32 @puts(ptr nonnull dereferenceable(1) @str.475), !dbg !2199
  %66 = call i32 @puts(ptr nonnull dereferenceable(1) @str.476), !dbg !2202
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %3) #17, !dbg !2203
  call void @llvm.lifetime.end.p0(i64 28, ptr nonnull %2) #17, !dbg !2203
  call void @llvm.lifetime.end.p0(i64 20, ptr nonnull %1) #17, !dbg !2203
  ret void, !dbg !2203

67:                                               ; preds = %22, %67
  %68 = phi i32 [ 0, %22 ], [ %73, %67 ]
    #dbg_value(i32 %68, !2086, !DIExpression(), !2186)
  %69 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 %68, !dbg !2204
  %70 = load i32, ptr %69, align 4, !dbg !2207, !tbaa !2132
  %71 = getelementptr inbounds [2 x %struct.SensorData], ptr %3, i32 0, i32 %68, i32 2, !dbg !2208
  %72 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.214, i32 noundef %68, i32 noundef %70, ptr noundef nonnull %71), !dbg !2209
  %73 = add nuw nsw i32 %68, 1, !dbg !2210
    #dbg_value(i32 %73, !2086, !DIExpression(), !2186)
  %74 = icmp eq i32 %68, 0, !dbg !2211
  br i1 %74, label %67, label %61, !dbg !2187, !llvm.loop !2212
}

; Function Attrs: nofree nounwind
define dso_local void @test_while_and_do_while_loops() local_unnamed_addr #3 !dbg !2214 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.477), !dbg !2222
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.478), !dbg !2223
    #dbg_value(i32 0, !2216, !DIExpression(), !2224)
    #dbg_value(i32 0, !2217, !DIExpression(), !2224)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.479), !dbg !2225
    #dbg_value(i32 0, !2217, !DIExpression(), !2224)
    #dbg_value(i32 0, !2216, !DIExpression(), !2224)
  br label %4, !dbg !2226

4:                                                ; preds = %0, %4
  %5 = phi i32 [ 0, %0 ], [ %7, %4 ]
  %6 = phi i32 [ 0, %0 ], [ %9, %4 ]
    #dbg_value(i32 %5, !2217, !DIExpression(), !2224)
    #dbg_value(i32 %6, !2216, !DIExpression(), !2224)
  %7 = add nuw nsw i32 %5, %6, !dbg !2227
    #dbg_value(i32 %7, !2217, !DIExpression(), !2224)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.224, i32 noundef %6, i32 noundef %7), !dbg !2229
  %9 = add nuw nsw i32 %6, 1, !dbg !2230
    #dbg_value(i32 %9, !2216, !DIExpression(), !2224)
  %10 = icmp eq i32 %9, 5, !dbg !2231
  br i1 %10, label %11, label %4, !dbg !2226, !llvm.loop !2232

11:                                               ; preds = %4
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.225, i32 noundef 10), !dbg !2234
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.481), !dbg !2235
  %14 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.482), !dbg !2238
    #dbg_value(i32 10, !2218, !DIExpression(), !2224)
    #dbg_value(i32 10, !2218, !DIExpression(), !2224)
  %15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.483), !dbg !2239
  %16 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.484), !dbg !2242
    #dbg_value(i32 0, !2219, !DIExpression(), !2224)
    #dbg_value(i32 0, !2220, !DIExpression(), !2224)
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.485), !dbg !2243
  br label %18, !dbg !2244

18:                                               ; preds = %18, %11
  %19 = phi i32 [ 0, %11 ], [ %23, %18 ], !dbg !2224
  %20 = phi i32 [ 0, %11 ], [ %21, %18 ], !dbg !2224
    #dbg_value(i32 %20, !2220, !DIExpression(), !2224)
    #dbg_value(i32 %19, !2219, !DIExpression(), !2224)
  %21 = add nuw nsw i32 %20, %19, !dbg !2245
    #dbg_value(i32 %21, !2220, !DIExpression(), !2224)
  %22 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.224, i32 noundef %19, i32 noundef %21), !dbg !2247
  %23 = add nuw nsw i32 %19, 1, !dbg !2248
    #dbg_value(i32 %23, !2219, !DIExpression(), !2224)
  %24 = icmp eq i32 %23, 5, !dbg !2249
  br i1 %24, label %25, label %18, !dbg !2250, !llvm.loop !2251

25:                                               ; preds = %18
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.225, i32 noundef 10), !dbg !2253
  %27 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.487), !dbg !2254
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.488), !dbg !2257
    #dbg_value(i32 10, !2221, !DIExpression(), !2224)
    #dbg_value(i32 10, !2221, !DIExpression(), !2224)
  %29 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.489), !dbg !2258
    #dbg_value(i32 11, !2221, !DIExpression(), !2224)
  %30 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.238, i32 noundef 11), !dbg !2260
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.490), !dbg !2261
  %32 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.491), !dbg !2264
  ret void, !dbg !2265
}

; Function Attrs: nofree nounwind
define dso_local void @test_break_and_continue() local_unnamed_addr #3 !dbg !2266 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.492), !dbg !2280
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.493), !dbg !2281
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.494), !dbg !2282
    #dbg_value(i32 0, !2268, !DIExpression(), !2283)
    #dbg_value(i32 0, !2269, !DIExpression(), !2284)
    #dbg_value(i32 undef, !2269, !DIExpression(), !2284)
    #dbg_value(i32 poison, !2268, !DIExpression(), !2283)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.245, i32 noundef 25), !dbg !2285
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.496), !dbg !2286
  %6 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.497), !dbg !2289
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.498), !dbg !2290
    #dbg_value(i32 0, !2271, !DIExpression(), !2283)
    #dbg_value(i32 poison, !2271, !DIExpression(), !2283)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.250, i32 noundef 5), !dbg !2291
  %9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.500), !dbg !2292
  %10 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.501), !dbg !2295
    #dbg_value(i32 0, !2272, !DIExpression(), !2283)
    #dbg_value(i32 0, !2273, !DIExpression(), !2283)
    #dbg_value(i32 0, !2274, !DIExpression(), !2296)
    #dbg_value(i32 poison, !2274, !DIExpression(), !2296)
    #dbg_value(i32 poison, !2273, !DIExpression(), !2283)
    #dbg_value(i32 poison, !2272, !DIExpression(), !2283)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.254, i32 noundef 3), !dbg !2297
  %12 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.255, i32 noundef 9), !dbg !2298
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.503), !dbg !2299
  %14 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.504), !dbg !2302
  ret void, !dbg !2303
}

; Function Attrs: nofree nounwind
define dso_local i32 @add_function_1(i32 noundef %0, i32 noundef %1) #3 !dbg !2304 {
    #dbg_value(i32 %0, !2306, !DIExpression(), !2308)
    #dbg_value(i32 %1, !2307, !DIExpression(), !2308)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.259, i32 noundef %0, i32 noundef %1), !dbg !2309
  %4 = add nsw i32 %1, %0, !dbg !2310
  ret i32 %4, !dbg !2311
}

; Function Attrs: nofree nounwind
define dso_local i32 @multiply_function_1(i32 noundef %0, i32 noundef %1) #3 !dbg !2312 {
    #dbg_value(i32 %0, !2314, !DIExpression(), !2316)
    #dbg_value(i32 %1, !2315, !DIExpression(), !2316)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.260, i32 noundef %0, i32 noundef %1), !dbg !2317
  %4 = mul nsw i32 %1, %0, !dbg !2318
  ret i32 %4, !dbg !2319
}

; Function Attrs: nofree nounwind
define dso_local i32 @subtract_function_1(i32 noundef %0, i32 noundef %1) #3 !dbg !2320 {
    #dbg_value(i32 %0, !2322, !DIExpression(), !2324)
    #dbg_value(i32 %1, !2323, !DIExpression(), !2324)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.261, i32 noundef %0, i32 noundef %1), !dbg !2325
  %4 = sub nsw i32 %0, %1, !dbg !2326
  ret i32 %4, !dbg !2327
}

; Function Attrs: nounwind
define dso_local void @test_table_operations() local_unnamed_addr #4 !dbg !2328 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.505), !dbg !2333
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.506), !dbg !2334
  %3 = tail call i32 @OP_table_size(i32 noundef 0) #17, !dbg !2335
    #dbg_value(i32 %3, !2330, !DIExpression(), !2336)
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.264, i32 noundef %3), !dbg !2337
  %5 = icmp eq i32 %3, 10, !dbg !2338
  br i1 %5, label %8, label %6, !dbg !2340

6:                                                ; preds = %0
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.265, i32 noundef %3), !dbg !2341
  br label %10, !dbg !2343

8:                                                ; preds = %0
  %9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.507), !dbg !2344
  br label %10

10:                                               ; preds = %8, %6
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.508), !dbg !2346
  %12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.509), !dbg !2347
  tail call void @OP_table_init(i32 noundef 0, i32 noundef 0, i32 noundef 5, i32 noundef 0, i32 noundef 2) #17, !dbg !2348
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.510), !dbg !2349
  %14 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.511), !dbg !2350
  %15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.512), !dbg !2351
  %16 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.513), !dbg !2352
  tail call void @OP_table_fill(i32 noundef 0, i32 noundef 0, i32 noundef 1, i32 noundef 3) #17, !dbg !2353
  %17 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.514), !dbg !2354
  %18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.515), !dbg !2355
  %19 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.516), !dbg !2356
  %20 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.517), !dbg !2357
  tail call void @OP_table_copy(i32 noundef 0, i32 noundef 0, i32 noundef 7, i32 noundef 0, i32 noundef 2) #17, !dbg !2358
  %21 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.518), !dbg !2359
  %22 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.519), !dbg !2360
  %23 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.520), !dbg !2361
  %24 = tail call i32 @OP_table_size(i32 noundef 0) #17, !dbg !2362
    #dbg_value(i32 %24, !2331, !DIExpression(), !2336)
  %25 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.280, i32 noundef %24), !dbg !2363
  %26 = icmp slt i32 %24, 9, !dbg !2364
  %27 = select i1 %26, ptr @.str.281, ptr @.str.282
  %28 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) %27, i32 noundef %24), !dbg !2366
  %29 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.521), !dbg !2367
  %30 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.522), !dbg !2368
  tail call void @OP_table_fill(i32 noundef 0, i32 noundef 15, i32 noundef 2, i32 noundef 3) #17, !dbg !2369
  %31 = tail call i32 @OP_table_size(i32 noundef 0) #17, !dbg !2370
    #dbg_value(i32 %31, !2332, !DIExpression(), !2336)
  %32 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.285, i32 noundef %31), !dbg !2371
  %33 = icmp slt i32 %31, 18, !dbg !2372
  %34 = select i1 %33, ptr @.str.286, ptr @.str.287, !dbg !2374
  %35 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) %34, i32 noundef %31), !dbg !2375
  %36 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.553), !dbg !2376
  %37 = icmp sgt i32 %24, 8
  %38 = icmp sgt i32 %31, 17
  %39 = and i1 %37, %38, !dbg !2377
  %40 = and i1 %5, %39, !dbg !2377
  br i1 %40, label %41, label %47, !dbg !2377

41:                                               ; preds = %10
  %42 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.525), !dbg !2379
  %43 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.526), !dbg !2381
  %44 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.527), !dbg !2382
  %45 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.528), !dbg !2383
  %46 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.529), !dbg !2384
  br label %47, !dbg !2385

47:                                               ; preds = %10, %41
  %48 = phi ptr [ @str.530, %41 ], [ @str.524, %10 ]
  %49 = tail call i32 @puts(ptr nonnull dereferenceable(1) %48), !dbg !2386
  %50 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.531), !dbg !2387
  ret void, !dbg !2388
}

declare !dbg !2389 dso_local i32 @OP_table_size(i32 noundef) local_unnamed_addr #2

declare !dbg !2392 dso_local void @OP_table_init(i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare !dbg !2395 dso_local void @OP_table_fill(i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare !dbg !2398 dso_local void @OP_table_copy(i32 noundef, i32 noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define dso_local void @test_call_indirect_with_table() local_unnamed_addr #4 !dbg !2399 {
  %1 = alloca [3 x ptr], align 4, !DIAssignID !2422
    #dbg_assign(i1 undef, !2404, !DIExpression(), !2422, ptr %1, !DIExpression(), !2423)
  %2 = alloca [3 x i32], align 4, !DIAssignID !2424
    #dbg_assign(i1 undef, !2410, !DIExpression(), !2424, ptr %2, !DIExpression(), !2423)
  %3 = alloca [3 x i32], align 4, !DIAssignID !2425
    #dbg_assign(i1 undef, !2417, !DIExpression(), !2425, ptr %3, !DIExpression(), !2423)
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.532), !dbg !2426
  %5 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.533), !dbg !2427
  %6 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.534), !dbg !2428
  tail call void @OP_table_set(i32 noundef 0, i32 noundef 0, i32 noundef 0) #17, !dbg !2429
  %7 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.535), !dbg !2430
  tail call void @OP_table_set(i32 noundef 0, i32 noundef 1, i32 noundef 1) #17, !dbg !2431
  %8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.536), !dbg !2432
  tail call void @OP_table_set(i32 noundef 0, i32 noundef 2, i32 noundef 2) #17, !dbg !2433
  %9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.537), !dbg !2434
  %10 = tail call i32 @OP_table_get(i32 noundef 0, i32 noundef 0) #17, !dbg !2435
    #dbg_value(i32 %10, !2401, !DIExpression(), !2423)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.303, i32 noundef %10), !dbg !2436
  %12 = tail call i32 @OP_table_get(i32 noundef 0, i32 noundef 1) #17, !dbg !2437
    #dbg_value(i32 %12, !2402, !DIExpression(), !2423)
  %13 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.304, i32 noundef %12), !dbg !2438
  %14 = tail call i32 @OP_table_get(i32 noundef 0, i32 noundef 2) #17, !dbg !2439
    #dbg_value(i32 %14, !2403, !DIExpression(), !2423)
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.305, i32 noundef %14), !dbg !2440
  %16 = icmp eq i32 %10, 0, !dbg !2441
  %17 = icmp eq i32 %12, 1
  %18 = and i1 %16, %17, !dbg !2443
  %19 = icmp eq i32 %14, 2
  %20 = and i1 %18, %19, !dbg !2443
  %21 = select i1 %20, ptr @str.539, ptr @str.538
  %22 = tail call i32 @puts(ptr nonnull dereferenceable(1) %21), !dbg !2444
  %23 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.540), !dbg !2445
  %24 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.541), !dbg !2446
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %1) #17, !dbg !2447
  %25 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.542), !dbg !2448
  store ptr @add_function_1, ptr %1, align 4, !dbg !2449, !tbaa !1239, !DIAssignID !2450
    #dbg_assign(ptr @add_function_1, !2404, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2450, ptr %1, !DIExpression(), !2423)
  %26 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.543), !dbg !2451
  %27 = getelementptr inbounds [3 x ptr], ptr %1, i32 0, i32 1, !dbg !2452
  store ptr @multiply_function_1, ptr %27, align 4, !dbg !2453, !tbaa !1239, !DIAssignID !2454
    #dbg_assign(ptr @multiply_function_1, !2404, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2454, ptr %27, !DIExpression(), !2423)
  %28 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.544), !dbg !2455
  %29 = getelementptr inbounds [3 x ptr], ptr %1, i32 0, i32 2, !dbg !2456
  store ptr @subtract_function_1, ptr %29, align 4, !dbg !2457, !tbaa !1239, !DIAssignID !2458
    #dbg_assign(ptr @subtract_function_1, !2404, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !2458, ptr %29, !DIExpression(), !2423)
  %30 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.545), !dbg !2459
  %31 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.546), !dbg !2460
    #dbg_value(i32 10, !2306, !DIExpression(), !2461)
    #dbg_value(i32 5, !2307, !DIExpression(), !2461)
  %32 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.259, i32 noundef 10, i32 noundef 5), !dbg !2463
    #dbg_value(i32 15, !2407, !DIExpression(), !2423)
  %33 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.315, i32 noundef 15), !dbg !2464
  %34 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.547), !dbg !2465
    #dbg_value(i32 10, !2314, !DIExpression(), !2466)
    #dbg_value(i32 5, !2315, !DIExpression(), !2466)
  %35 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.260, i32 noundef 10, i32 noundef 5), !dbg !2468
    #dbg_value(i32 50, !2408, !DIExpression(), !2423)
  %36 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.317, i32 noundef 50), !dbg !2469
  %37 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.548), !dbg !2470
    #dbg_value(i32 10, !2322, !DIExpression(), !2471)
    #dbg_value(i32 5, !2323, !DIExpression(), !2471)
  %38 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.261, i32 noundef 10, i32 noundef 5), !dbg !2473
    #dbg_value(i32 5, !2409, !DIExpression(), !2423)
  %39 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.319, i32 noundef 5), !dbg !2474
  %40 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.549), !dbg !2475
  %41 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.550), !dbg !2476
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %2) #17, !dbg !2477
    #dbg_value(i32 0, !2412, !DIExpression(), !2478)
  br label %45, !dbg !2479

42:                                               ; preds = %45
  call void @llvm.lifetime.start.p0(i64 12, ptr nonnull %3) #17, !dbg !2480
  store i32 10, ptr %3, align 4, !dbg !2481, !DIAssignID !2482
    #dbg_assign(i32 10, !2417, !DIExpression(DW_OP_LLVM_fragment, 0, 32), !2482, ptr %3, !DIExpression(), !2423)
  %43 = getelementptr inbounds i32, ptr %3, i32 1, !dbg !2481
  store i32 21, ptr %43, align 4, !dbg !2481, !DIAssignID !2483
    #dbg_assign(i32 21, !2417, !DIExpression(DW_OP_LLVM_fragment, 32, 32), !2483, ptr %43, !DIExpression(), !2423)
  %44 = getelementptr inbounds i32, ptr %3, i32 2, !dbg !2481
  store i32 4, ptr %44, align 4, !dbg !2481, !DIAssignID !2484
    #dbg_assign(i32 4, !2417, !DIExpression(DW_OP_LLVM_fragment, 64, 32), !2484, ptr %44, !DIExpression(), !2423)
    #dbg_value(i8 1, !2418, !DIExpression(), !2423)
    #dbg_value(i32 0, !2419, !DIExpression(), !2485)
    #dbg_value(i8 poison, !2418, !DIExpression(), !2423)
  br label %59, !dbg !2486

45:                                               ; preds = %0, %45
  %46 = phi i32 [ 0, %0 ], [ %53, %45 ]
    #dbg_value(i32 %46, !2412, !DIExpression(), !2478)
  %47 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.322, i32 noundef %46, i32 noundef %46), !dbg !2487
  %48 = getelementptr inbounds [3 x ptr], ptr %1, i32 0, i32 %46, !dbg !2488
  %49 = load ptr, ptr %48, align 4, !dbg !2488, !tbaa !1239
  %50 = tail call i32 %49(i32 noundef 7, i32 noundef 3) #17, !dbg !2488
    #dbg_value(i32 %50, !2414, !DIExpression(), !2489)
  %51 = getelementptr inbounds [3 x i32], ptr %2, i32 0, i32 %46, !dbg !2490
  store i32 %50, ptr %51, align 4, !dbg !2491, !tbaa !1289
  %52 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.323, i32 noundef %46, i32 noundef %50), !dbg !2492
  %53 = add nuw nsw i32 %46, 1, !dbg !2493
    #dbg_value(i32 %53, !2412, !DIExpression(), !2478)
  %54 = icmp eq i32 %53, 3, !dbg !2494
  br i1 %54, label %42, label %45, !dbg !2479, !llvm.loop !2495

55:                                               ; preds = %69
  %56 = select i1 %70, ptr @str.552, ptr @str.551
  %57 = tail call i32 @puts(ptr nonnull dereferenceable(1) %56), !dbg !2497
  %58 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.553), !dbg !2499
    #dbg_value(i1 %70, !2421, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2423)
  br i1 %70, label %73, label %79, !dbg !2500

59:                                               ; preds = %42, %69
  %60 = phi i32 [ 0, %42 ], [ %71, %69 ]
  %61 = phi i1 [ true, %42 ], [ %70, %69 ]
    #dbg_value(i32 %60, !2419, !DIExpression(), !2485)
  %62 = getelementptr inbounds [3 x i32], ptr %2, i32 0, i32 %60, !dbg !2501
  %63 = load i32, ptr %62, align 4, !dbg !2501, !tbaa !1289
  %64 = getelementptr inbounds [3 x i32], ptr %3, i32 0, i32 %60, !dbg !2505
  %65 = load i32, ptr %64, align 4, !dbg !2505, !tbaa !1289
  %66 = icmp eq i32 %63, %65, !dbg !2506
  br i1 %66, label %69, label %67, !dbg !2507

67:                                               ; preds = %59
  %68 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.324, i32 noundef %60, i32 noundef %63, i32 noundef %65), !dbg !2508
    #dbg_value(i8 0, !2418, !DIExpression(), !2423)
  br label %69, !dbg !2510

69:                                               ; preds = %59, %67
  %70 = phi i1 [ false, %67 ], [ %61, %59 ]
    #dbg_value(i8 poison, !2418, !DIExpression(), !2423)
  %71 = add nuw nsw i32 %60, 1, !dbg !2511
    #dbg_value(i32 %71, !2419, !DIExpression(), !2485)
  %72 = icmp eq i32 %71, 3, !dbg !2512
  br i1 %72, label %55, label %59, !dbg !2486, !llvm.loop !2513

73:                                               ; preds = %55
  %74 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.556), !dbg !2515
  %75 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.557), !dbg !2518
  %76 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.558), !dbg !2519
  %77 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.559), !dbg !2520
  %78 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.331, i32 noundef %10, i32 noundef %12, i32 noundef %14), !dbg !2521
  br label %81, !dbg !2522

79:                                               ; preds = %55
  %80 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.554), !dbg !2523
  br label %81, !dbg !2525

81:                                               ; preds = %79, %73
  %82 = phi ptr [ @str.555, %79 ], [ @str.560, %73 ]
  %83 = tail call i32 @puts(ptr nonnull dereferenceable(1) %82), !dbg !2528
  %84 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.561), !dbg !2529
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %3) #17, !dbg !2530
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %2) #17, !dbg !2530
  call void @llvm.lifetime.end.p0(i64 12, ptr nonnull %1) #17, !dbg !2530
  ret void, !dbg !2530
}

declare !dbg !2531 dso_local void @OP_table_set(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

declare !dbg !2534 dso_local i32 @OP_table_get(i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local i32 @add_function(i32 noundef %0, i32 noundef %1) #3 !dbg !2535 {
    #dbg_value(i32 %0, !2537, !DIExpression(), !2539)
    #dbg_value(i32 %1, !2538, !DIExpression(), !2539)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.259, i32 noundef %0, i32 noundef %1), !dbg !2540
  %4 = add nsw i32 %1, %0, !dbg !2541
  ret i32 %4, !dbg !2542
}

; Function Attrs: nofree nounwind
define dso_local i32 @multiply_function(i32 noundef %0, i32 noundef %1) #3 !dbg !2543 {
    #dbg_value(i32 %0, !2545, !DIExpression(), !2547)
    #dbg_value(i32 %1, !2546, !DIExpression(), !2547)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.260, i32 noundef %0, i32 noundef %1), !dbg !2548
  %4 = mul nsw i32 %1, %0, !dbg !2549
  ret i32 %4, !dbg !2550
}

; Function Attrs: nofree nounwind
define dso_local i32 @subtract_function(i32 noundef %0, i32 noundef %1) #3 !dbg !2551 {
    #dbg_value(i32 %0, !2553, !DIExpression(), !2555)
    #dbg_value(i32 %1, !2554, !DIExpression(), !2555)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.261, i32 noundef %0, i32 noundef %1), !dbg !2556
  %4 = sub nsw i32 %0, %1, !dbg !2557
  ret i32 %4, !dbg !2558
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @call_function_by_address(ptr noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #16 !dbg !2559 {
  %4 = alloca ptr, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 4
  store ptr %0, ptr %4, align 4, !tbaa !1239
    #dbg_declare(ptr %4, !2563, !DIExpression(), !2567)
  store i32 %1, ptr %5, align 4, !tbaa !1289
    #dbg_declare(ptr %5, !2564, !DIExpression(), !2568)
  store i32 %2, ptr %6, align 4, !tbaa !1289
    #dbg_declare(ptr %6, !2565, !DIExpression(), !2569)
  %8 = load ptr, ptr %4, align 4, !dbg !2570, !tbaa !1239
  %9 = load i32, ptr %5, align 4, !dbg !2571, !tbaa !1289
  %10 = load i32, ptr %6, align 4, !dbg !2572, !tbaa !1289
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.337, ptr noundef %8, i32 noundef %9, i32 noundef %10), !dbg !2573
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #17, !dbg !2574
    #dbg_declare(ptr %7, !2566, !DIExpression(), !2575)
  %12 = load ptr, ptr %4, align 4, !dbg !2576, !tbaa !1239
  store ptr %12, ptr %7, align 4, !dbg !2575, !tbaa !1239
  %13 = load ptr, ptr %7, align 4, !dbg !2577, !tbaa !1239
  %14 = load i32, ptr %5, align 4, !dbg !2578, !tbaa !1289
  %15 = load i32, ptr %6, align 4, !dbg !2579, !tbaa !1289
  %16 = call i32 %13(i32 noundef %14, i32 noundef %15), !dbg !2577
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #17, !dbg !2580
  ret i32 %16, !dbg !2581
}

; Function Attrs: nounwind
define dso_local void @test_call_indirect_ptr_unsafe() local_unnamed_addr #4 !dbg !2582 {
  %1 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.562), !dbg !2590
  %2 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.563), !dbg !2591
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.564), !dbg !2592
    #dbg_value(ptr @add_function, !2584, !DIExpression(), !2593)
    #dbg_value(ptr @multiply_function, !2585, !DIExpression(), !2593)
    #dbg_value(ptr @subtract_function, !2586, !DIExpression(), !2593)
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.565), !dbg !2594
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.342, ptr noundef nonnull @add_function), !dbg !2595
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.343, ptr noundef nonnull @multiply_function), !dbg !2596
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.344, ptr noundef nonnull @subtract_function), !dbg !2597
  %8 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.566), !dbg !2598
  %9 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.567), !dbg !2599
  %10 = tail call i32 @call_function_by_address(ptr noundef nonnull @add_function, i32 noundef 12, i32 noundef 8), !dbg !2600
    #dbg_value(i32 %10, !2587, !DIExpression(), !2593)
  %11 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.347, i32 noundef %10), !dbg !2601
  %12 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.568), !dbg !2602
  %13 = tail call i32 @call_function_by_address(ptr noundef nonnull @multiply_function, i32 noundef 6, i32 noundef 7), !dbg !2603
    #dbg_value(i32 %13, !2588, !DIExpression(), !2593)
  %14 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.349, i32 noundef %13), !dbg !2604
  %15 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.569), !dbg !2605
  %16 = tail call i32 @call_function_by_address(ptr noundef nonnull @subtract_function, i32 noundef 15, i32 noundef 6), !dbg !2606
    #dbg_value(i32 %16, !2589, !DIExpression(), !2593)
  %17 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.351, i32 noundef %16), !dbg !2607
  %18 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.570), !dbg !2608
  %19 = icmp eq i32 %10, 20, !dbg !2609
  %20 = icmp eq i32 %13, 42
  %21 = and i1 %19, %20, !dbg !2611
  %22 = icmp eq i32 %16, 9
  %23 = and i1 %21, %22, !dbg !2611
  br i1 %23, label %27, label %24, !dbg !2611

24:                                               ; preds = %0
  %25 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.571), !dbg !2612
  %26 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.355, i32 noundef %10, i32 noundef %13, i32 noundef %16), !dbg !2614
  br label %27

27:                                               ; preds = %0, %24
  %28 = phi ptr [ @str.572, %24 ], [ @str.573, %0 ]
  %29 = tail call i32 @puts(ptr nonnull dereferenceable(1) %28), !dbg !2615
  %30 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.574), !dbg !2616
  ret void, !dbg !2617
}

; Function Attrs: nounwind
define dso_local void @app_main() local_unnamed_addr #4 !dbg !2618 {
  %1 = alloca i32, align 4, !DIAssignID !2637
  %2 = alloca ptr, align 4, !DIAssignID !2638
    #dbg_assign(i1 undef, !2621, !DIExpression(), !2638, ptr %2, !DIExpression(), !2639)
    #dbg_value(ptr null, !2620, !DIExpression(), !2639)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %2) #17, !dbg !2640
  store ptr null, ptr %2, align 4, !dbg !2641, !tbaa !1239, !DIAssignID !2642
    #dbg_assign(ptr null, !2621, !DIExpression(), !2642, ptr %2, !DIExpression(), !2639)
  %3 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.575), !dbg !2643
  tail call void @test_call_indirect_ptr_unsafe(), !dbg !2644
  tail call void @test_table_operations(), !dbg !2645
  tail call void @test_call_indirect_with_table(), !dbg !2646
  tail call void @test_break_and_continue(), !dbg !2647
  tail call void @test_while_and_do_while_loops(), !dbg !2648
  tail call void @test_complex_data_types(), !dbg !2649
  tail call void @test_math_operations32(), !dbg !2650
  tail call void @test_math_operations(), !dbg !2651
  tail call void @test_i64_imm8_ops(), !dbg !2652
  tail call void @test_heap_and_memory_operations(), !dbg !2653
  tail call void @test_atomics(), !dbg !2654
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.439), !dbg !2655
    #dbg_value(i32 1, !1805, !DIExpression(), !2657)
    #dbg_value(i32 100, !1806, !DIExpression(), !2657)
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.130, i32 noundef 100), !dbg !2658
    #dbg_value(i64 9876543210, !1807, !DIExpression(), !2657)
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.131, i64 noundef 9876543210), !dbg !2659
    #dbg_value(float 0x40123D70A0000000, !1808, !DIExpression(), !2657)
  %7 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.132, double noundef 0x40123D70A0000000), !dbg !2660
    #dbg_value(double 2.710000e+00, !1809, !DIExpression(), !2657)
  %8 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.133, double noundef 2.710000e+00), !dbg !2661
    #dbg_value(ptr inttoptr (i32 43690 to ptr), !1810, !DIExpression(), !2657)
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.134, ptr noundef nonnull inttoptr (i32 43690 to ptr)), !dbg !2662
  %10 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.440), !dbg !2663
    #dbg_assign(i1 undef, !1822, !DIExpression(), !2637, ptr %1, !DIExpression(), !2664)
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.441), !dbg !2666
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #17, !dbg !2667
  store i32 123, ptr %1, align 4, !dbg !2668, !tbaa !1289, !DIAssignID !2669
    #dbg_assign(i32 123, !1822, !DIExpression(), !2669, ptr %1, !DIExpression(), !2664)
    #dbg_value(ptr %1, !1823, !DIExpression(), !2664)
  %12 = ptrtoint ptr %1 to i32, !dbg !2670
    #dbg_value(i32 %12, !1824, !DIExpression(), !2664)
  %13 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.137, i32 noundef %12), !dbg !2671
    #dbg_value(ptr %1, !1825, !DIExpression(), !2664)
  %14 = load i32, ptr %1, align 4, !dbg !2672, !tbaa !1289
  %15 = icmp eq i32 %14, 123, !dbg !2673
  br i1 %15, label %16, label %18, !dbg !2674

16:                                               ; preds = %0
  %17 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.138, i32 noundef 123), !dbg !2675
  br label %20, !dbg !2676

18:                                               ; preds = %0
  %19 = call i32 @puts(ptr nonnull dereferenceable(1) @str.442), !dbg !2677
  br label %20

20:                                               ; preds = %16, %18
  %21 = call i32 @puts(ptr nonnull dereferenceable(1) @str.443), !dbg !2678
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #17, !dbg !2679
  call void @MarchallingTest(), !dbg !2680
  call void @test_globals(), !dbg !2681
  call void @test_call_indirect(), !dbg !2682
  call void @test_call_indirect_non_optimizable(), !dbg !2683
  call void @test_memory_operations(), !dbg !2684
  call void @test_control_flow(), !dbg !2685
    #dbg_value(i64 10, !2625, !DIExpression(), !2639)
    #dbg_value(i64 5, !2626, !DIExpression(), !2639)
    #dbg_value(i64 3, !2627, !DIExpression(), !2639)
    #dbg_value(i64 20, !2625, !DIExpression(), !2639)
    #dbg_value(i64 15, !2625, !DIExpression(), !2639)
    #dbg_value(i64 10, !2625, !DIExpression(), !2639)
    #dbg_value(i64 0, !2625, !DIExpression(), !2639)
    #dbg_value(i64 3, !2625, !DIExpression(), !2639)
    #dbg_value(i64 6, !2625, !DIExpression(), !2639)
    #dbg_value(i64 12, !2625, !DIExpression(), !2639)
    #dbg_value(i64 3, !2625, !DIExpression(), !2639)
    #dbg_value(i64 1, !2625, !DIExpression(), !2639)
  %22 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.359, i32 noundef 1), !dbg !2686
  %23 = call i32 @puts(ptr nonnull dereferenceable(1) @str.576), !dbg !2687
    #dbg_value(i8 1, !2628, !DIExpression(), !2639)
    #dbg_value(i8 0, !2629, !DIExpression(), !2639)
  %24 = call i32 @puts(ptr nonnull dereferenceable(1) @str.577), !dbg !2688
  %25 = call i32 @puts(ptr nonnull dereferenceable(1) @str.578), !dbg !2691
    #dbg_value(i8 0, !2630, !DIExpression(), !2639)
  %26 = call i32 @puts(ptr nonnull dereferenceable(1) @str.579), !dbg !2694
    #dbg_value(i8 1, !2629, !DIExpression(), !2639)
  %27 = call i32 @puts(ptr nonnull dereferenceable(1) @str.580), !dbg !2697
  %28 = call i32 @puts(ptr nonnull dereferenceable(1) @str.581), !dbg !2700
  %29 = call i32 @puts(ptr nonnull dereferenceable(1) @str.582), !dbg !2701
    #dbg_value(float 1.500000e+00, !2631, !DIExpression(), !2639)
    #dbg_value(float 2.250000e+00, !2632, !DIExpression(), !2639)
  %30 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.371, double noundef 1.500000e+00, double noundef 2.250000e+00), !dbg !2702
  %31 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.372, double noundef 3.750000e+00), !dbg !2703
  %32 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.373, double noundef 7.500000e-01), !dbg !2704
  %33 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.374, double noundef 3.375000e+00), !dbg !2705
  %34 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.375, double noundef 1.500000e+00), !dbg !2706
  %35 = call i32 @puts(ptr nonnull dereferenceable(1) @str.583), !dbg !2707
  %36 = call i32 @puts(ptr nonnull dereferenceable(1) @str.584), !dbg !2708
    #dbg_value(double 0x3FF3C0CA4283DE1B, !2633, !DIExpression(), !2639)
    #dbg_value(double 0x4023C0CA4588F633, !2634, !DIExpression(), !2639)
  %37 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.378, double noundef 0x3FF3C0CA4283DE1B, double noundef 0x4023C0CA4588F633), !dbg !2709
  %38 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.379, double noundef 0x402638E38DD971F6), !dbg !2710
  %39 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.380, double noundef 0x402148B0FD387A70), !dbg !2711
  %40 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.381, double noundef 0x402862F361ECCCD3), !dbg !2712
  %41 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.382, double noundef 0x40200000027234CC), !dbg !2713
  %42 = call i32 @puts(ptr nonnull dereferenceable(1) @str.585), !dbg !2714
  %43 = call i32 @puts(ptr nonnull dereferenceable(1) @str.586), !dbg !2715
  call void @host_invoke_cb(ptr noundef nonnull @cb_print, ptr noundef nonnull inttoptr (i32 305419896 to ptr)) #17, !dbg !2716
  %44 = call i32 @puts(ptr nonnull dereferenceable(1) @str.587), !dbg !2717
  call void @host_invoke_cb2(ptr noundef nonnull @cb_with_int, i32 noundef 42, ptr noundef nonnull inttoptr (i32 -889275714 to ptr)) #17, !dbg !2718
  %45 = call i32 @puts(ptr nonnull dereferenceable(1) @str.588), !dbg !2719
  %46 = call ptr @xTimerCreate(ptr noundef nonnull @.str.387, i32 noundef 200, i32 noundef 1, ptr noundef nonnull inttoptr (i32 -559023410 to ptr), ptr noundef nonnull @test_timer_cb) #17, !dbg !2720
    #dbg_value(ptr %46, !2620, !DIExpression(), !2639)
  %47 = icmp eq ptr %46, null, !dbg !2721
  br i1 %47, label %51, label %48, !dbg !2723

48:                                               ; preds = %20
  %49 = call i32 @xTaskGetTickCount() #17, !dbg !2724
  %50 = call i32 @xTimerGenericCommand(ptr noundef nonnull %46, i32 noundef 1, i32 noundef %49, ptr noundef null, i32 noundef 0) #17, !dbg !2724
  br label %53, !dbg !2726

51:                                               ; preds = %20
  %52 = call i32 @puts(ptr nonnull dereferenceable(1) @str.589), !dbg !2727
  br label %53

53:                                               ; preds = %51, %48
  %54 = call i32 @puts(ptr nonnull dereferenceable(1) @str.590), !dbg !2729
    #dbg_value(ptr @counter_task, !2730, !DIExpression(), !2749)
    #dbg_value(ptr @.str.390, !2744, !DIExpression(), !2749)
    #dbg_value(i32 4048, !2745, !DIExpression(), !2749)
    #dbg_value(ptr inttoptr (i32 -1430532899 to ptr), !2746, !DIExpression(), !2749)
    #dbg_value(i32 5, !2747, !DIExpression(), !2749)
    #dbg_value(ptr %2, !2748, !DIExpression(), !2749)
  %55 = call i32 @xTaskCreatePinnedToCore(ptr noundef nonnull @counter_task, ptr noundef nonnull @.str.390, i32 noundef 4048, ptr noundef nonnull inttoptr (i32 -1430532899 to ptr), i32 noundef 5, ptr noundef nonnull %2, i32 noundef 2147483647) #17, !dbg !2751
    #dbg_value(i32 0, !2635, !DIExpression(), !2752)
  br label %58, !dbg !2753

56:                                               ; preds = %58
  %57 = call i32 @puts(ptr nonnull dereferenceable(1) @str.591), !dbg !2754
  call void @vTaskDelay(i32 noundef 200) #17, !dbg !2755
  br i1 %47, label %68, label %63, !dbg !2756

58:                                               ; preds = %53, %58
  %59 = phi i32 [ 0, %53 ], [ %61, %58 ]
    #dbg_value(i32 %59, !2635, !DIExpression(), !2752)
  %60 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.391, i32 noundef %59), !dbg !2757
  call void @vTaskDelay(i32 noundef 1000) #17, !dbg !2760
  %61 = add nuw nsw i32 %59, 1, !dbg !2761
    #dbg_value(i32 %61, !2635, !DIExpression(), !2752)
  %62 = icmp eq i32 %59, 0, !dbg !2762
  br i1 %62, label %58, label %56, !dbg !2753, !llvm.loop !2763

63:                                               ; preds = %56
  %64 = call i32 @puts(ptr nonnull dereferenceable(1) @str.592), !dbg !2765
  %65 = call i32 @xTimerGenericCommand(ptr noundef nonnull %46, i32 noundef 3, i32 noundef 0, ptr noundef null, i32 noundef 0) #17, !dbg !2768
  %66 = call i32 @xTimerGenericCommand(ptr noundef nonnull %46, i32 noundef 5, i32 noundef 0, ptr noundef null, i32 noundef 0) #17, !dbg !2769
  %67 = call i32 @puts(ptr nonnull dereferenceable(1) @str.593), !dbg !2770
  br label %68, !dbg !2771

68:                                               ; preds = %63, %56
  %69 = load ptr, ptr %2, align 4, !dbg !2772, !tbaa !1239
  %70 = icmp eq ptr %69, null, !dbg !2772
  br i1 %70, label %74, label %71, !dbg !2774

71:                                               ; preds = %68
  %72 = call i32 @puts(ptr nonnull dereferenceable(1) @str.595), !dbg !2775
  %73 = load ptr, ptr %2, align 4, !dbg !2777, !tbaa !1239
  call void @vTaskDelete(ptr noundef %73) #17, !dbg !2778
  br label %74, !dbg !2779

74:                                               ; preds = %68, %71
  %75 = phi ptr [ @str.596, %71 ], [ @str.594, %68 ]
  %76 = call i32 @puts(ptr nonnull dereferenceable(1) %75), !dbg !2780
  %77 = call i32 @puts(ptr nonnull dereferenceable(1) @str.597), !dbg !2781
  call void @vTaskDelay(i32 noundef 2000) #17, !dbg !2782
  %78 = call i32 @puts(ptr nonnull dereferenceable(1) @str.598), !dbg !2783
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %2) #17, !dbg !2784
  ret void, !dbg !2784
}

; Function Attrs: nofree nounwind
define internal void @cb_print(ptr noundef %0) #3 !dbg !2785 {
    #dbg_value(ptr %0, !2787, !DIExpression(), !2788)
  %2 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.400, ptr noundef %0), !dbg !2789
  ret void, !dbg !2790
}

declare !dbg !2791 dso_local void @host_invoke_cb(ptr noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define internal void @cb_with_int(i32 noundef %0, ptr noundef %1) #3 !dbg !2794 {
    #dbg_value(i32 %0, !2798, !DIExpression(), !2800)
    #dbg_value(ptr %1, !2799, !DIExpression(), !2800)
  %3 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.401, i32 noundef %0, ptr noundef %1), !dbg !2801
  ret void, !dbg !2802
}

declare !dbg !2803 dso_local void @host_invoke_cb2(ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #2

; Function Attrs: nounwind
define internal void @test_timer_cb(ptr noundef %0) #4 !dbg !1104 {
    #dbg_value(ptr %0, !1112, !DIExpression(), !2807)
  %2 = tail call ptr @pvTimerGetTimerID(ptr noundef %0) #17, !dbg !2808
    #dbg_value(ptr %2, !1113, !DIExpression(), !2807)
  %3 = load i32, ptr @test_timer_cb.tick, align 4, !dbg !2809, !tbaa !1289
  %4 = add nsw i32 %3, 1, !dbg !2809
  store i32 %4, ptr @test_timer_cb.tick, align 4, !dbg !2809, !tbaa !1289
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.402, i32 noundef %3, ptr noundef %2), !dbg !2810
  ret void, !dbg !2811
}

declare !dbg !2812 dso_local ptr @xTimerCreate(ptr noundef, i32 noundef, i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #2

declare !dbg !2818 dso_local i32 @xTaskGetTickCount() local_unnamed_addr #2

declare !dbg !2821 dso_local i32 @xTimerGenericCommand(ptr noundef, i32 noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

declare !dbg !2826 dso_local i32 @xTaskCreatePinnedToCore(ptr noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #2

declare !dbg !2829 dso_local void @vTaskDelete(ptr noundef) local_unnamed_addr #2

declare !dbg !2832 dso_local ptr @pvTimerGetTimerID(ptr noundef) local_unnamed_addr #2

; Function Attrs: nofree nounwind
define dso_local void @test(i32 noundef %0, double noundef %1, ptr noundef %2) local_unnamed_addr #3 !dbg !2836 {
    #dbg_value(i32 %0, !2840, !DIExpression(), !2843)
    #dbg_value(double %1, !2841, !DIExpression(), !2843)
    #dbg_value(ptr %2, !2842, !DIExpression(), !2843)
  %4 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.1), !dbg !2844
  %5 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1.2, i32 noundef %0), !dbg !2845
  %6 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.2.3, double noundef %1), !dbg !2846
  %7 = icmp eq ptr %2, null, !dbg !2847
  br i1 %7, label %10, label %8, !dbg !2849

8:                                                ; preds = %3
  %9 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.3.4, ptr noundef nonnull %2), !dbg !2850
  br label %12, !dbg !2852

10:                                               ; preds = %3
  %11 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.6), !dbg !2853
  br label %12

12:                                               ; preds = %10, %8
  %13 = tail call i32 @puts(ptr nonnull dereferenceable(1) @str.7), !dbg !2855
  ret void, !dbg !2856
}

attributes #0 = { noreturn nounwind "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #3 = { nofree nounwind "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #4 = { nounwind "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #5 = { nofree nounwind }
attributes #6 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #9 = { mustprogress nounwind willreturn }
attributes #10 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #11 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #12 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #13 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #14 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #15 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: readwrite) "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #16 = { noinline nounwind optnone "no-jump-tables"="true" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+m,+relax,+zicsr,+zifencei,-d,-e,-experimental-zacas,-experimental-zcmop,-experimental-zfbfmin,-experimental-zicfilp,-experimental-zicfiss,-experimental-zimop,-experimental-ztso,-experimental-zvfbfmin,-experimental-zvfbfwma,-f,-h,-smaia,-smepmp,-ssaia,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xesppie,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-za128rs,-za64rs,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmp,-zcmt,-zdinx,-zfa,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-zmmul,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #17 = { nounwind }
attributes #18 = { allocsize(0) }

!llvm.dbg.cu = !{!2, !1123}
!llvm.ident = !{!1132, !1132}
!llvm.module.flags = !{!1133, !1134, !1135, !1136, !1137, !1138}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g_my_global_int", scope: !2, file: !6, line: 93, type: !25, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 18.1.2 (https://github.com/espressif/llvm-project.git esp-18.1.2_20240912)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !13, globals: !64, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "C:\\Andrey\\Projects\\VS_Code\\ESPB PRODACTION\\LLVM_TO_ESPB\\main/all_tests.c", directory: "C:/Andrey/Projects/VS_Code/ESPB PRODACTION/LLVM_TO_ESPB")
!4 = !{!5}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 804, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "C:\\Andrey\\Projects\\VS_Code\\ESPB PRODACTION\\LLVM_TO_ESPB\\main\\all_tests.c", directory: "")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12}
!9 = !DIEnumerator(name: "STATE_IDLE", value: 0)
!10 = !DIEnumerator(name: "STATE_ACTIVE", value: 1)
!11 = !DIEnumerator(name: "STATE_ERROR", value: 2)
!12 = !DIEnumerator(name: "STATE_SLEEP", value: 3)
!13 = !{!14, !20, !25, !27, !28, !31, !34, !35, !36, !40, !41, !43, !44, !48, !49, !53, !54, !55, !57, !58, !59, !60, !7, !24, !63}
!14 = !DIDerivedType(tag: DW_TAG_typedef, name: "TickType_t", file: !15, line: 110, baseType: !16)
!15 = !DIFile(filename: "Programs/Espressif/frameworks/esp-idf-v5.4/components/freertos/FreeRTOS-Kernel/portable/riscv/include/freertos/portmacro.h", directory: "C:/Andrey")
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !17, line: 48, baseType: !18)
!17 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/sys/_stdint.h", directory: "C:/Andrey")
!18 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !19, line: 79, baseType: !7)
!19 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/machine/_default_types.h", directory: "C:/Andrey")
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 32)
!21 = !DISubroutineType(types: !22)
!22 = !{!23, !24, !24}
!23 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !24)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !17, line: 44, baseType: !26)
!26 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !19, line: 77, baseType: !24)
!27 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!28 = !DIDerivedType(tag: DW_TAG_typedef, name: "int16_t", file: !17, line: 32, baseType: !29)
!29 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int16_t", file: !19, line: 55, baseType: !30)
!30 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!31 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !17, line: 20, baseType: !32)
!32 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !19, line: 41, baseType: !33)
!33 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!34 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_unsigned_char)
!35 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 32)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 32)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !17, line: 56, baseType: !38)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !19, line: 103, baseType: !39)
!39 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 32)
!42 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 32)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 32)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !17, line: 24, baseType: !46)
!46 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !19, line: 43, baseType: !47)
!47 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !28, size: 32)
!49 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 32)
!50 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !17, line: 36, baseType: !51)
!51 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !19, line: 57, baseType: !52)
!52 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 32)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "uintptr_t", file: !17, line: 82, baseType: !56)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uintptr_t", file: !19, line: 232, baseType: !7)
!57 = !DIBasicType(name: "unsigned long", size: 32, encoding: DW_ATE_unsigned)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 32)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !34, size: 32)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 32)
!61 = !DISubroutineType(types: !62)
!62 = !{!24, !24, !24}
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "BaseType_t", file: !15, line: 103, baseType: !24)
!64 = !{!0, !65, !67, !70, !75, !80, !85, !87, !92, !94, !99, !104, !106, !111, !116, !121, !126, !131, !136, !138, !140, !145, !150, !155, !157, !162, !167, !172, !174, !179, !181, !183, !188, !190, !195, !197, !199, !204, !206, !208, !210, !212, !217, !219, !221, !223, !225, !227, !229, !231, !236, !241, !243, !245, !250, !252, !254, !256, !258, !260, !262, !264, !266, !268, !270, !272, !277, !279, !281, !283, !285, !287, !289, !291, !293, !295, !300, !302, !304, !306, !308, !310, !312, !314, !316, !321, !323, !325, !327, !332, !337, !339, !344, !349, !351, !353, !355, !357, !359, !361, !363, !365, !370, !372, !374, !376, !378, !380, !382, !387, !389, !391, !393, !395, !397, !399, !401, !403, !405, !407, !409, !411, !413, !418, !420, !425, !427, !429, !434, !436, !438, !443, !445, !447, !449, !451, !453, !455, !457, !459, !461, !463, !465, !467, !469, !471, !473, !475, !480, !482, !484, !489, !491, !493, !495, !497, !499, !501, !506, !511, !516, !518, !523, !528, !530, !532, !534, !539, !541, !546, !548, !550, !552, !554, !559, !561, !566, !571, !576, !578, !580, !582, !584, !586, !588, !590, !595, !600, !605, !607, !609, !611, !613, !615, !617, !619, !621, !623, !628, !630, !632, !634, !636, !638, !640, !642, !644, !649, !651, !653, !655, !660, !662, !667, !669, !671, !673, !675, !677, !679, !681, !683, !685, !687, !689, !691, !693, !695, !700, !702, !707, !709, !711, !713, !715, !717, !719, !721, !723, !725, !730, !732, !734, !736, !741, !743, !745, !747, !749, !751, !756, !761, !763, !768, !770, !775, !777, !779, !781, !783, !785, !787, !789, !791, !793, !795, !797, !799, !801, !803, !805, !807, !812, !814, !819, !821, !823, !825, !827, !829, !831, !833, !835, !837, !839, !841, !843, !845, !850, !852, !854, !856, !858, !860, !862, !864, !866, !868, !870, !872, !874, !876, !878, !880, !882, !884, !886, !888, !890, !892, !894, !896, !901, !903, !905, !907, !909, !911, !913, !915, !917, !919, !921, !923, !925, !930, !932, !934, !936, !938, !940, !942, !944, !946, !948, !950, !952, !954, !956, !958, !960, !962, !964, !966, !968, !970, !972, !974, !976, !978, !980, !982, !984, !986, !988, !990, !992, !994, !996, !998, !1000, !1002, !1004, !1009, !1011, !1013, !1015, !1017, !1019, !1021, !1023, !1025, !1027, !1029, !1031, !1033, !1035, !1037, !1039, !1041, !1043, !1045, !1047, !1049, !1051, !1053, !1055, !1057, !1059, !1061, !1063, !1065, !1067, !1069, !1071, !1073, !1075, !1077, !1079, !1081, !1083, !1085, !1087, !1089, !1092, !1098, !1100, !1102, !1114}
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "g_my_global_long", scope: !2, file: !6, line: 94, type: !37, isLocal: false, isDefinition: true)
!67 = !DIGlobalVariableExpression(var: !68, expr: !DIExpression())
!68 = distinct !DIGlobalVariable(name: "g_my_global_bool", scope: !2, file: !6, line: 95, type: !69, isLocal: false, isDefinition: true)
!69 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!70 = !DIGlobalVariableExpression(var: !71, expr: !DIExpression())
!71 = distinct !DIGlobalVariable(scope: null, file: !6, line: 120, type: !72, isLocal: true, isDefinition: true)
!72 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 288, elements: !73)
!73 = !{!74}
!74 = !DISubrange(count: 36)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(scope: null, file: !6, line: 122, type: !77, isLocal: true, isDefinition: true)
!77 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 104, elements: !78)
!78 = !{!79}
!79 = !DISubrange(count: 13)
!80 = !DIGlobalVariableExpression(var: !81, expr: !DIExpression())
!81 = distinct !DIGlobalVariable(scope: null, file: !6, line: 134, type: !82, isLocal: true, isDefinition: true)
!82 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 248, elements: !83)
!83 = !{!84}
!84 = !DISubrange(count: 31)
!85 = !DIGlobalVariableExpression(var: !86, expr: !DIExpression())
!86 = distinct !DIGlobalVariable(scope: null, file: !6, line: 139, type: !82, isLocal: true, isDefinition: true)
!87 = !DIGlobalVariableExpression(var: !88, expr: !DIExpression())
!88 = distinct !DIGlobalVariable(scope: null, file: !6, line: 145, type: !89, isLocal: true, isDefinition: true)
!89 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 432, elements: !90)
!90 = !{!91}
!91 = !DISubrange(count: 54)
!92 = !DIGlobalVariableExpression(var: !93, expr: !DIExpression())
!93 = distinct !DIGlobalVariable(scope: null, file: !6, line: 151, type: !82, isLocal: true, isDefinition: true)
!94 = !DIGlobalVariableExpression(var: !95, expr: !DIExpression())
!95 = distinct !DIGlobalVariable(scope: null, file: !6, line: 156, type: !96, isLocal: true, isDefinition: true)
!96 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 192, elements: !97)
!97 = !{!98}
!98 = !DISubrange(count: 24)
!99 = !DIGlobalVariableExpression(var: !100, expr: !DIExpression())
!100 = distinct !DIGlobalVariable(scope: null, file: !6, line: 160, type: !101, isLocal: true, isDefinition: true)
!101 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 256, elements: !102)
!102 = !{!103}
!103 = !DISubrange(count: 32)
!104 = !DIGlobalVariableExpression(var: !105, expr: !DIExpression())
!105 = distinct !DIGlobalVariable(scope: null, file: !6, line: 163, type: !101, isLocal: true, isDefinition: true)
!106 = !DIGlobalVariableExpression(var: !107, expr: !DIExpression())
!107 = distinct !DIGlobalVariable(scope: null, file: !6, line: 168, type: !108, isLocal: true, isDefinition: true)
!108 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 296, elements: !109)
!109 = !{!110}
!110 = !DISubrange(count: 37)
!111 = !DIGlobalVariableExpression(var: !112, expr: !DIExpression())
!112 = distinct !DIGlobalVariable(scope: null, file: !6, line: 170, type: !113, isLocal: true, isDefinition: true)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 320, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 40)
!116 = !DIGlobalVariableExpression(var: !117, expr: !DIExpression())
!117 = distinct !DIGlobalVariable(scope: null, file: !6, line: 187, type: !118, isLocal: true, isDefinition: true)
!118 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 424, elements: !119)
!119 = !{!120}
!120 = !DISubrange(count: 53)
!121 = !DIGlobalVariableExpression(var: !122, expr: !DIExpression())
!122 = distinct !DIGlobalVariable(scope: null, file: !6, line: 195, type: !123, isLocal: true, isDefinition: true)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 360, elements: !124)
!124 = !{!125}
!125 = !DISubrange(count: 45)
!126 = !DIGlobalVariableExpression(var: !127, expr: !DIExpression())
!127 = distinct !DIGlobalVariable(scope: null, file: !6, line: 201, type: !128, isLocal: true, isDefinition: true)
!128 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 376, elements: !129)
!129 = !{!130}
!130 = !DISubrange(count: 47)
!131 = !DIGlobalVariableExpression(var: !132, expr: !DIExpression())
!132 = distinct !DIGlobalVariable(scope: null, file: !6, line: 205, type: !133, isLocal: true, isDefinition: true)
!133 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 272, elements: !134)
!134 = !{!135}
!135 = !DISubrange(count: 34)
!136 = !DIGlobalVariableExpression(var: !137, expr: !DIExpression())
!137 = distinct !DIGlobalVariable(scope: null, file: !6, line: 208, type: !133, isLocal: true, isDefinition: true)
!138 = !DIGlobalVariableExpression(var: !139, expr: !DIExpression())
!139 = distinct !DIGlobalVariable(scope: null, file: !6, line: 214, type: !82, isLocal: true, isDefinition: true)
!140 = !DIGlobalVariableExpression(var: !141, expr: !DIExpression())
!141 = distinct !DIGlobalVariable(scope: null, file: !6, line: 216, type: !142, isLocal: true, isDefinition: true)
!142 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 448, elements: !143)
!143 = !{!144}
!144 = !DISubrange(count: 56)
!145 = !DIGlobalVariableExpression(var: !146, expr: !DIExpression())
!146 = distinct !DIGlobalVariable(scope: null, file: !6, line: 226, type: !147, isLocal: true, isDefinition: true)
!147 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 208, elements: !148)
!148 = !{!149}
!149 = !DISubrange(count: 26)
!150 = !DIGlobalVariableExpression(var: !151, expr: !DIExpression())
!151 = distinct !DIGlobalVariable(scope: null, file: !6, line: 227, type: !152, isLocal: true, isDefinition: true)
!152 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 232, elements: !153)
!153 = !{!154}
!154 = !DISubrange(count: 29)
!155 = !DIGlobalVariableExpression(var: !156, expr: !DIExpression())
!156 = distinct !DIGlobalVariable(scope: null, file: !6, line: 228, type: !101, isLocal: true, isDefinition: true)
!157 = !DIGlobalVariableExpression(var: !158, expr: !DIExpression())
!158 = distinct !DIGlobalVariable(scope: null, file: !6, line: 229, type: !159, isLocal: true, isDefinition: true)
!159 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 240, elements: !160)
!160 = !{!161}
!161 = !DISubrange(count: 30)
!162 = !DIGlobalVariableExpression(var: !163, expr: !DIExpression())
!163 = distinct !DIGlobalVariable(scope: null, file: !6, line: 229, type: !164, isLocal: true, isDefinition: true)
!164 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 40, elements: !165)
!165 = !{!166}
!166 = !DISubrange(count: 5)
!167 = !DIGlobalVariableExpression(var: !168, expr: !DIExpression())
!168 = distinct !DIGlobalVariable(scope: null, file: !6, line: 229, type: !169, isLocal: true, isDefinition: true)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 48, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 6)
!172 = !DIGlobalVariableExpression(var: !173, expr: !DIExpression())
!173 = distinct !DIGlobalVariable(scope: null, file: !6, line: 235, type: !82, isLocal: true, isDefinition: true)
!174 = !DIGlobalVariableExpression(var: !175, expr: !DIExpression())
!175 = distinct !DIGlobalVariable(scope: null, file: !6, line: 236, type: !176, isLocal: true, isDefinition: true)
!176 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 264, elements: !177)
!177 = !{!178}
!178 = !DISubrange(count: 33)
!179 = !DIGlobalVariableExpression(var: !180, expr: !DIExpression())
!180 = distinct !DIGlobalVariable(scope: null, file: !6, line: 237, type: !82, isLocal: true, isDefinition: true)
!181 = !DIGlobalVariableExpression(var: !182, expr: !DIExpression())
!182 = distinct !DIGlobalVariable(scope: null, file: !6, line: 238, type: !176, isLocal: true, isDefinition: true)
!183 = !DIGlobalVariableExpression(var: !184, expr: !DIExpression())
!184 = distinct !DIGlobalVariable(scope: null, file: !6, line: 249, type: !185, isLocal: true, isDefinition: true)
!185 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 200, elements: !186)
!186 = !{!187}
!187 = !DISubrange(count: 25)
!188 = !DIGlobalVariableExpression(var: !189, expr: !DIExpression())
!189 = distinct !DIGlobalVariable(scope: null, file: !6, line: 250, type: !113, isLocal: true, isDefinition: true)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(scope: null, file: !6, line: 251, type: !192, isLocal: true, isDefinition: true)
!192 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 72, elements: !193)
!193 = !{!194}
!194 = !DISubrange(count: 9)
!195 = !DIGlobalVariableExpression(var: !196, expr: !DIExpression())
!196 = distinct !DIGlobalVariable(scope: null, file: !6, line: 252, type: !192, isLocal: true, isDefinition: true)
!197 = !DIGlobalVariableExpression(var: !198, expr: !DIExpression())
!198 = distinct !DIGlobalVariable(scope: null, file: !6, line: 253, type: !192, isLocal: true, isDefinition: true)
!199 = !DIGlobalVariableExpression(var: !200, expr: !DIExpression())
!200 = distinct !DIGlobalVariable(scope: null, file: !6, line: 254, type: !201, isLocal: true, isDefinition: true)
!201 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 80, elements: !202)
!202 = !{!203}
!203 = !DISubrange(count: 10)
!204 = !DIGlobalVariableExpression(var: !205, expr: !DIExpression())
!205 = distinct !DIGlobalVariable(scope: null, file: !6, line: 255, type: !201, isLocal: true, isDefinition: true)
!206 = !DIGlobalVariableExpression(var: !207, expr: !DIExpression())
!207 = distinct !DIGlobalVariable(scope: null, file: !6, line: 256, type: !201, isLocal: true, isDefinition: true)
!208 = !DIGlobalVariableExpression(var: !209, expr: !DIExpression())
!209 = distinct !DIGlobalVariable(scope: null, file: !6, line: 257, type: !201, isLocal: true, isDefinition: true)
!210 = !DIGlobalVariableExpression(var: !211, expr: !DIExpression())
!211 = distinct !DIGlobalVariable(scope: null, file: !6, line: 258, type: !192, isLocal: true, isDefinition: true)
!212 = !DIGlobalVariableExpression(var: !213, expr: !DIExpression())
!213 = distinct !DIGlobalVariable(scope: null, file: !6, line: 259, type: !214, isLocal: true, isDefinition: true)
!214 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 64, elements: !215)
!215 = !{!216}
!216 = !DISubrange(count: 8)
!217 = !DIGlobalVariableExpression(var: !218, expr: !DIExpression())
!218 = distinct !DIGlobalVariable(scope: null, file: !6, line: 260, type: !192, isLocal: true, isDefinition: true)
!219 = !DIGlobalVariableExpression(var: !220, expr: !DIExpression())
!220 = distinct !DIGlobalVariable(scope: null, file: !6, line: 261, type: !192, isLocal: true, isDefinition: true)
!221 = !DIGlobalVariableExpression(var: !222, expr: !DIExpression())
!222 = distinct !DIGlobalVariable(scope: null, file: !6, line: 262, type: !201, isLocal: true, isDefinition: true)
!223 = !DIGlobalVariableExpression(var: !224, expr: !DIExpression())
!224 = distinct !DIGlobalVariable(scope: null, file: !6, line: 263, type: !201, isLocal: true, isDefinition: true)
!225 = !DIGlobalVariableExpression(var: !226, expr: !DIExpression())
!226 = distinct !DIGlobalVariable(scope: null, file: !6, line: 264, type: !192, isLocal: true, isDefinition: true)
!227 = !DIGlobalVariableExpression(var: !228, expr: !DIExpression())
!228 = distinct !DIGlobalVariable(scope: null, file: !6, line: 269, type: !133, isLocal: true, isDefinition: true)
!229 = !DIGlobalVariableExpression(var: !230, expr: !DIExpression())
!230 = distinct !DIGlobalVariable(scope: null, file: !6, line: 296, type: !185, isLocal: true, isDefinition: true)
!231 = !DIGlobalVariableExpression(var: !232, expr: !DIExpression())
!232 = distinct !DIGlobalVariable(scope: null, file: !6, line: 302, type: !233, isLocal: true, isDefinition: true)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 384, elements: !234)
!234 = !{!235}
!235 = !DISubrange(count: 48)
!236 = !DIGlobalVariableExpression(var: !237, expr: !DIExpression())
!237 = distinct !DIGlobalVariable(scope: null, file: !6, line: 303, type: !238, isLocal: true, isDefinition: true)
!238 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 88, elements: !239)
!239 = !{!240}
!240 = !DISubrange(count: 11)
!241 = !DIGlobalVariableExpression(var: !242, expr: !DIExpression())
!242 = distinct !DIGlobalVariable(scope: null, file: !6, line: 304, type: !238, isLocal: true, isDefinition: true)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(scope: null, file: !6, line: 305, type: !238, isLocal: true, isDefinition: true)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !6, line: 306, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 96, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 12)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !6, line: 307, type: !247, isLocal: true, isDefinition: true)
!252 = !DIGlobalVariableExpression(var: !253, expr: !DIExpression())
!253 = distinct !DIGlobalVariable(scope: null, file: !6, line: 308, type: !247, isLocal: true, isDefinition: true)
!254 = !DIGlobalVariableExpression(var: !255, expr: !DIExpression())
!255 = distinct !DIGlobalVariable(scope: null, file: !6, line: 309, type: !247, isLocal: true, isDefinition: true)
!256 = !DIGlobalVariableExpression(var: !257, expr: !DIExpression())
!257 = distinct !DIGlobalVariable(scope: null, file: !6, line: 310, type: !238, isLocal: true, isDefinition: true)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(scope: null, file: !6, line: 311, type: !201, isLocal: true, isDefinition: true)
!260 = !DIGlobalVariableExpression(var: !261, expr: !DIExpression())
!261 = distinct !DIGlobalVariable(scope: null, file: !6, line: 312, type: !238, isLocal: true, isDefinition: true)
!262 = !DIGlobalVariableExpression(var: !263, expr: !DIExpression())
!263 = distinct !DIGlobalVariable(scope: null, file: !6, line: 313, type: !238, isLocal: true, isDefinition: true)
!264 = !DIGlobalVariableExpression(var: !265, expr: !DIExpression())
!265 = distinct !DIGlobalVariable(scope: null, file: !6, line: 314, type: !247, isLocal: true, isDefinition: true)
!266 = !DIGlobalVariableExpression(var: !267, expr: !DIExpression())
!267 = distinct !DIGlobalVariable(scope: null, file: !6, line: 315, type: !247, isLocal: true, isDefinition: true)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(scope: null, file: !6, line: 316, type: !238, isLocal: true, isDefinition: true)
!270 = !DIGlobalVariableExpression(var: !271, expr: !DIExpression())
!271 = distinct !DIGlobalVariable(scope: null, file: !6, line: 319, type: !185, isLocal: true, isDefinition: true)
!272 = !DIGlobalVariableExpression(var: !273, expr: !DIExpression())
!273 = distinct !DIGlobalVariable(scope: null, file: !6, line: 323, type: !274, isLocal: true, isDefinition: true)
!274 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 160, elements: !275)
!275 = !{!276}
!276 = !DISubrange(count: 20)
!277 = !DIGlobalVariableExpression(var: !278, expr: !DIExpression())
!278 = distinct !DIGlobalVariable(scope: null, file: !6, line: 324, type: !192, isLocal: true, isDefinition: true)
!279 = !DIGlobalVariableExpression(var: !280, expr: !DIExpression())
!280 = distinct !DIGlobalVariable(scope: null, file: !6, line: 325, type: !192, isLocal: true, isDefinition: true)
!281 = !DIGlobalVariableExpression(var: !282, expr: !DIExpression())
!282 = distinct !DIGlobalVariable(scope: null, file: !6, line: 326, type: !192, isLocal: true, isDefinition: true)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(scope: null, file: !6, line: 327, type: !192, isLocal: true, isDefinition: true)
!285 = !DIGlobalVariableExpression(var: !286, expr: !DIExpression())
!286 = distinct !DIGlobalVariable(scope: null, file: !6, line: 328, type: !192, isLocal: true, isDefinition: true)
!287 = !DIGlobalVariableExpression(var: !288, expr: !DIExpression())
!288 = distinct !DIGlobalVariable(scope: null, file: !6, line: 329, type: !201, isLocal: true, isDefinition: true)
!289 = !DIGlobalVariableExpression(var: !290, expr: !DIExpression())
!290 = distinct !DIGlobalVariable(scope: null, file: !6, line: 330, type: !192, isLocal: true, isDefinition: true)
!291 = !DIGlobalVariableExpression(var: !292, expr: !DIExpression())
!292 = distinct !DIGlobalVariable(scope: null, file: !6, line: 331, type: !192, isLocal: true, isDefinition: true)
!293 = !DIGlobalVariableExpression(var: !294, expr: !DIExpression())
!294 = distinct !DIGlobalVariable(scope: null, file: !6, line: 334, type: !185, isLocal: true, isDefinition: true)
!295 = !DIGlobalVariableExpression(var: !296, expr: !DIExpression())
!296 = distinct !DIGlobalVariable(scope: null, file: !6, line: 338, type: !297, isLocal: true, isDefinition: true)
!297 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 176, elements: !298)
!298 = !{!299}
!299 = !DISubrange(count: 22)
!300 = !DIGlobalVariableExpression(var: !301, expr: !DIExpression())
!301 = distinct !DIGlobalVariable(scope: null, file: !6, line: 339, type: !201, isLocal: true, isDefinition: true)
!302 = !DIGlobalVariableExpression(var: !303, expr: !DIExpression())
!303 = distinct !DIGlobalVariable(scope: null, file: !6, line: 340, type: !201, isLocal: true, isDefinition: true)
!304 = !DIGlobalVariableExpression(var: !305, expr: !DIExpression())
!305 = distinct !DIGlobalVariable(scope: null, file: !6, line: 341, type: !201, isLocal: true, isDefinition: true)
!306 = !DIGlobalVariableExpression(var: !307, expr: !DIExpression())
!307 = distinct !DIGlobalVariable(scope: null, file: !6, line: 342, type: !201, isLocal: true, isDefinition: true)
!308 = !DIGlobalVariableExpression(var: !309, expr: !DIExpression())
!309 = distinct !DIGlobalVariable(scope: null, file: !6, line: 343, type: !201, isLocal: true, isDefinition: true)
!310 = !DIGlobalVariableExpression(var: !311, expr: !DIExpression())
!311 = distinct !DIGlobalVariable(scope: null, file: !6, line: 344, type: !238, isLocal: true, isDefinition: true)
!312 = !DIGlobalVariableExpression(var: !313, expr: !DIExpression())
!313 = distinct !DIGlobalVariable(scope: null, file: !6, line: 345, type: !201, isLocal: true, isDefinition: true)
!314 = !DIGlobalVariableExpression(var: !315, expr: !DIExpression())
!315 = distinct !DIGlobalVariable(scope: null, file: !6, line: 346, type: !201, isLocal: true, isDefinition: true)
!316 = !DIGlobalVariableExpression(var: !317, expr: !DIExpression())
!317 = distinct !DIGlobalVariable(scope: null, file: !6, line: 349, type: !318, isLocal: true, isDefinition: true)
!318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 216, elements: !319)
!319 = !{!320}
!320 = !DISubrange(count: 27)
!321 = !DIGlobalVariableExpression(var: !322, expr: !DIExpression())
!322 = distinct !DIGlobalVariable(scope: null, file: !6, line: 355, type: !96, isLocal: true, isDefinition: true)
!323 = !DIGlobalVariableExpression(var: !324, expr: !DIExpression())
!324 = distinct !DIGlobalVariable(scope: null, file: !6, line: 356, type: !185, isLocal: true, isDefinition: true)
!325 = !DIGlobalVariableExpression(var: !326, expr: !DIExpression())
!326 = distinct !DIGlobalVariable(scope: null, file: !6, line: 357, type: !152, isLocal: true, isDefinition: true)
!327 = !DIGlobalVariableExpression(var: !328, expr: !DIExpression())
!328 = distinct !DIGlobalVariable(scope: null, file: !6, line: 358, type: !329, isLocal: true, isDefinition: true)
!329 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 184, elements: !330)
!330 = !{!331}
!331 = !DISubrange(count: 23)
!332 = !DIGlobalVariableExpression(var: !333, expr: !DIExpression())
!333 = distinct !DIGlobalVariable(scope: null, file: !6, line: 360, type: !334, isLocal: true, isDefinition: true)
!334 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 328, elements: !335)
!335 = !{!336}
!336 = !DISubrange(count: 41)
!337 = !DIGlobalVariableExpression(var: !338, expr: !DIExpression())
!338 = distinct !DIGlobalVariable(scope: null, file: !6, line: 365, type: !72, isLocal: true, isDefinition: true)
!339 = !DIGlobalVariableExpression(var: !340, expr: !DIExpression())
!340 = distinct !DIGlobalVariable(scope: null, file: !6, line: 377, type: !341, isLocal: true, isDefinition: true)
!341 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 336, elements: !342)
!342 = !{!343}
!343 = !DISubrange(count: 42)
!344 = !DIGlobalVariableExpression(var: !345, expr: !DIExpression())
!345 = distinct !DIGlobalVariable(scope: null, file: !6, line: 383, type: !346, isLocal: true, isDefinition: true)
!346 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 304, elements: !347)
!347 = !{!348}
!348 = !DISubrange(count: 38)
!349 = !DIGlobalVariableExpression(var: !350, expr: !DIExpression())
!350 = distinct !DIGlobalVariable(scope: null, file: !6, line: 389, type: !341, isLocal: true, isDefinition: true)
!351 = !DIGlobalVariableExpression(var: !352, expr: !DIExpression())
!352 = distinct !DIGlobalVariable(scope: null, file: !6, line: 395, type: !346, isLocal: true, isDefinition: true)
!353 = !DIGlobalVariableExpression(var: !354, expr: !DIExpression())
!354 = distinct !DIGlobalVariable(scope: null, file: !6, line: 401, type: !113, isLocal: true, isDefinition: true)
!355 = !DIGlobalVariableExpression(var: !356, expr: !DIExpression())
!356 = distinct !DIGlobalVariable(scope: null, file: !6, line: 410, type: !108, isLocal: true, isDefinition: true)
!357 = !DIGlobalVariableExpression(var: !358, expr: !DIExpression())
!358 = distinct !DIGlobalVariable(scope: null, file: !6, line: 411, type: !108, isLocal: true, isDefinition: true)
!359 = !DIGlobalVariableExpression(var: !360, expr: !DIExpression())
!360 = distinct !DIGlobalVariable(scope: null, file: !6, line: 420, type: !346, isLocal: true, isDefinition: true)
!361 = !DIGlobalVariableExpression(var: !362, expr: !DIExpression())
!362 = distinct !DIGlobalVariable(scope: null, file: !6, line: 421, type: !346, isLocal: true, isDefinition: true)
!363 = !DIGlobalVariableExpression(var: !364, expr: !DIExpression())
!364 = distinct !DIGlobalVariable(scope: null, file: !6, line: 428, type: !346, isLocal: true, isDefinition: true)
!365 = !DIGlobalVariableExpression(var: !366, expr: !DIExpression())
!366 = distinct !DIGlobalVariable(scope: null, file: !6, line: 430, type: !367, isLocal: true, isDefinition: true)
!367 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 344, elements: !368)
!368 = !{!369}
!369 = !DISubrange(count: 43)
!370 = !DIGlobalVariableExpression(var: !371, expr: !DIExpression())
!371 = distinct !DIGlobalVariable(scope: null, file: !6, line: 437, type: !82, isLocal: true, isDefinition: true)
!372 = !DIGlobalVariableExpression(var: !373, expr: !DIExpression())
!373 = distinct !DIGlobalVariable(scope: null, file: !6, line: 440, type: !152, isLocal: true, isDefinition: true)
!374 = !DIGlobalVariableExpression(var: !375, expr: !DIExpression())
!375 = distinct !DIGlobalVariable(scope: null, file: !6, line: 445, type: !152, isLocal: true, isDefinition: true)
!376 = !DIGlobalVariableExpression(var: !377, expr: !DIExpression())
!377 = distinct !DIGlobalVariable(scope: null, file: !6, line: 447, type: !329, isLocal: true, isDefinition: true)
!378 = !DIGlobalVariableExpression(var: !379, expr: !DIExpression())
!379 = distinct !DIGlobalVariable(scope: null, file: !6, line: 451, type: !297, isLocal: true, isDefinition: true)
!380 = !DIGlobalVariableExpression(var: !381, expr: !DIExpression())
!381 = distinct !DIGlobalVariable(scope: null, file: !6, line: 453, type: !159, isLocal: true, isDefinition: true)
!382 = !DIGlobalVariableExpression(var: !383, expr: !DIExpression())
!383 = distinct !DIGlobalVariable(scope: null, file: !6, line: 457, type: !384, isLocal: true, isDefinition: true)
!384 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 168, elements: !385)
!385 = !{!386}
!386 = !DISubrange(count: 21)
!387 = !DIGlobalVariableExpression(var: !388, expr: !DIExpression())
!388 = distinct !DIGlobalVariable(scope: null, file: !6, line: 459, type: !185, isLocal: true, isDefinition: true)
!389 = !DIGlobalVariableExpression(var: !390, expr: !DIExpression())
!390 = distinct !DIGlobalVariable(scope: null, file: !6, line: 465, type: !72, isLocal: true, isDefinition: true)
!391 = !DIGlobalVariableExpression(var: !392, expr: !DIExpression())
!392 = distinct !DIGlobalVariable(scope: null, file: !6, line: 467, type: !185, isLocal: true, isDefinition: true)
!393 = !DIGlobalVariableExpression(var: !394, expr: !DIExpression())
!394 = distinct !DIGlobalVariable(scope: null, file: !6, line: 471, type: !159, isLocal: true, isDefinition: true)
!395 = !DIGlobalVariableExpression(var: !396, expr: !DIExpression())
!396 = distinct !DIGlobalVariable(scope: null, file: !6, line: 475, type: !152, isLocal: true, isDefinition: true)
!397 = !DIGlobalVariableExpression(var: !398, expr: !DIExpression())
!398 = distinct !DIGlobalVariable(scope: null, file: !6, line: 477, type: !152, isLocal: true, isDefinition: true)
!399 = !DIGlobalVariableExpression(var: !400, expr: !DIExpression())
!400 = distinct !DIGlobalVariable(scope: null, file: !6, line: 479, type: !82, isLocal: true, isDefinition: true)
!401 = !DIGlobalVariableExpression(var: !402, expr: !DIExpression())
!402 = distinct !DIGlobalVariable(scope: null, file: !6, line: 481, type: !147, isLocal: true, isDefinition: true)
!403 = !DIGlobalVariableExpression(var: !404, expr: !DIExpression())
!404 = distinct !DIGlobalVariable(scope: null, file: !6, line: 485, type: !176, isLocal: true, isDefinition: true)
!405 = !DIGlobalVariableExpression(var: !406, expr: !DIExpression())
!406 = distinct !DIGlobalVariable(scope: null, file: !6, line: 487, type: !159, isLocal: true, isDefinition: true)
!407 = !DIGlobalVariableExpression(var: !408, expr: !DIExpression())
!408 = distinct !DIGlobalVariable(scope: null, file: !6, line: 490, type: !214, isLocal: true, isDefinition: true)
!409 = !DIGlobalVariableExpression(var: !410, expr: !DIExpression())
!410 = distinct !DIGlobalVariable(scope: null, file: !6, line: 493, type: !214, isLocal: true, isDefinition: true)
!411 = !DIGlobalVariableExpression(var: !412, expr: !DIExpression())
!412 = distinct !DIGlobalVariable(scope: null, file: !6, line: 496, type: !214, isLocal: true, isDefinition: true)
!413 = !DIGlobalVariableExpression(var: !414, expr: !DIExpression())
!414 = distinct !DIGlobalVariable(scope: null, file: !6, line: 499, type: !415, isLocal: true, isDefinition: true)
!415 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 112, elements: !416)
!416 = !{!417}
!417 = !DISubrange(count: 14)
!418 = !DIGlobalVariableExpression(var: !419, expr: !DIExpression())
!419 = distinct !DIGlobalVariable(scope: null, file: !6, line: 505, type: !147, isLocal: true, isDefinition: true)
!420 = !DIGlobalVariableExpression(var: !421, expr: !DIExpression())
!421 = distinct !DIGlobalVariable(scope: null, file: !6, line: 509, type: !422, isLocal: true, isDefinition: true)
!422 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 392, elements: !423)
!423 = !{!424}
!424 = !DISubrange(count: 49)
!425 = !DIGlobalVariableExpression(var: !426, expr: !DIExpression())
!426 = distinct !DIGlobalVariable(scope: null, file: !6, line: 511, type: !346, isLocal: true, isDefinition: true)
!427 = !DIGlobalVariableExpression(var: !428, expr: !DIExpression())
!428 = distinct !DIGlobalVariable(scope: null, file: !6, line: 520, type: !101, isLocal: true, isDefinition: true)
!429 = !DIGlobalVariableExpression(var: !430, expr: !DIExpression())
!430 = distinct !DIGlobalVariable(scope: null, file: !6, line: 524, type: !431, isLocal: true, isDefinition: true)
!431 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 512, elements: !432)
!432 = !{!433}
!433 = !DISubrange(count: 64)
!434 = !DIGlobalVariableExpression(var: !435, expr: !DIExpression())
!435 = distinct !DIGlobalVariable(scope: null, file: !6, line: 535, type: !133, isLocal: true, isDefinition: true)
!436 = !DIGlobalVariableExpression(var: !437, expr: !DIExpression())
!437 = distinct !DIGlobalVariable(scope: null, file: !6, line: 539, type: !128, isLocal: true, isDefinition: true)
!438 = !DIGlobalVariableExpression(var: !439, expr: !DIExpression())
!439 = distinct !DIGlobalVariable(scope: null, file: !6, line: 541, type: !440, isLocal: true, isDefinition: true)
!440 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 560, elements: !441)
!441 = !{!442}
!442 = !DISubrange(count: 70)
!443 = !DIGlobalVariableExpression(var: !444, expr: !DIExpression())
!444 = distinct !DIGlobalVariable(scope: null, file: !6, line: 544, type: !159, isLocal: true, isDefinition: true)
!445 = !DIGlobalVariableExpression(var: !446, expr: !DIExpression())
!446 = distinct !DIGlobalVariable(scope: null, file: !6, line: 550, type: !176, isLocal: true, isDefinition: true)
!447 = !DIGlobalVariableExpression(var: !448, expr: !DIExpression())
!448 = distinct !DIGlobalVariable(scope: null, file: !6, line: 555, type: !329, isLocal: true, isDefinition: true)
!449 = !DIGlobalVariableExpression(var: !450, expr: !DIExpression())
!450 = distinct !DIGlobalVariable(scope: null, file: !6, line: 559, type: !185, isLocal: true, isDefinition: true)
!451 = !DIGlobalVariableExpression(var: !452, expr: !DIExpression())
!452 = distinct !DIGlobalVariable(scope: null, file: !6, line: 564, type: !329, isLocal: true, isDefinition: true)
!453 = !DIGlobalVariableExpression(var: !454, expr: !DIExpression())
!454 = distinct !DIGlobalVariable(scope: null, file: !6, line: 568, type: !96, isLocal: true, isDefinition: true)
!455 = !DIGlobalVariableExpression(var: !456, expr: !DIExpression())
!456 = distinct !DIGlobalVariable(scope: null, file: !6, line: 572, type: !329, isLocal: true, isDefinition: true)
!457 = !DIGlobalVariableExpression(var: !458, expr: !DIExpression())
!458 = distinct !DIGlobalVariable(scope: null, file: !6, line: 574, type: !108, isLocal: true, isDefinition: true)
!459 = !DIGlobalVariableExpression(var: !460, expr: !DIExpression())
!460 = distinct !DIGlobalVariable(scope: null, file: !6, line: 580, type: !133, isLocal: true, isDefinition: true)
!461 = !DIGlobalVariableExpression(var: !462, expr: !DIExpression())
!462 = distinct !DIGlobalVariable(scope: null, file: !6, line: 589, type: !346, isLocal: true, isDefinition: true)
!463 = !DIGlobalVariableExpression(var: !464, expr: !DIExpression())
!464 = distinct !DIGlobalVariable(scope: null, file: !6, line: 596, type: !346, isLocal: true, isDefinition: true)
!465 = !DIGlobalVariableExpression(var: !466, expr: !DIExpression())
!466 = distinct !DIGlobalVariable(scope: null, file: !6, line: 598, type: !185, isLocal: true, isDefinition: true)
!467 = !DIGlobalVariableExpression(var: !468, expr: !DIExpression())
!468 = distinct !DIGlobalVariable(scope: null, file: !6, line: 601, type: !238, isLocal: true, isDefinition: true)
!469 = !DIGlobalVariableExpression(var: !470, expr: !DIExpression())
!470 = distinct !DIGlobalVariable(scope: null, file: !6, line: 608, type: !72, isLocal: true, isDefinition: true)
!471 = !DIGlobalVariableExpression(var: !472, expr: !DIExpression())
!472 = distinct !DIGlobalVariable(scope: null, file: !6, line: 611, type: !297, isLocal: true, isDefinition: true)
!473 = !DIGlobalVariableExpression(var: !474, expr: !DIExpression())
!474 = distinct !DIGlobalVariable(scope: null, file: !6, line: 613, type: !159, isLocal: true, isDefinition: true)
!475 = !DIGlobalVariableExpression(var: !476, expr: !DIExpression())
!476 = distinct !DIGlobalVariable(scope: null, file: !6, line: 617, type: !477, isLocal: true, isDefinition: true)
!477 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 224, elements: !478)
!478 = !{!479}
!479 = !DISubrange(count: 28)
!480 = !DIGlobalVariableExpression(var: !481, expr: !DIExpression())
!481 = distinct !DIGlobalVariable(scope: null, file: !6, line: 621, type: !152, isLocal: true, isDefinition: true)
!482 = !DIGlobalVariableExpression(var: !483, expr: !DIExpression())
!483 = distinct !DIGlobalVariable(scope: null, file: !6, line: 626, type: !128, isLocal: true, isDefinition: true)
!484 = !DIGlobalVariableExpression(var: !485, expr: !DIExpression())
!485 = distinct !DIGlobalVariable(scope: null, file: !6, line: 630, type: !486, isLocal: true, isDefinition: true)
!486 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 568, elements: !487)
!487 = !{!488}
!488 = !DISubrange(count: 71)
!489 = !DIGlobalVariableExpression(var: !490, expr: !DIExpression())
!490 = distinct !DIGlobalVariable(scope: null, file: !6, line: 633, type: !297, isLocal: true, isDefinition: true)
!491 = !DIGlobalVariableExpression(var: !492, expr: !DIExpression())
!492 = distinct !DIGlobalVariable(scope: null, file: !6, line: 635, type: !101, isLocal: true, isDefinition: true)
!493 = !DIGlobalVariableExpression(var: !494, expr: !DIExpression())
!494 = distinct !DIGlobalVariable(scope: null, file: !6, line: 639, type: !72, isLocal: true, isDefinition: true)
!495 = !DIGlobalVariableExpression(var: !496, expr: !DIExpression())
!496 = distinct !DIGlobalVariable(scope: null, file: !6, line: 645, type: !422, isLocal: true, isDefinition: true)
!497 = !DIGlobalVariableExpression(var: !498, expr: !DIExpression())
!498 = distinct !DIGlobalVariable(scope: null, file: !6, line: 647, type: !176, isLocal: true, isDefinition: true)
!499 = !DIGlobalVariableExpression(var: !500, expr: !DIExpression())
!500 = distinct !DIGlobalVariable(scope: null, file: !6, line: 653, type: !367, isLocal: true, isDefinition: true)
!501 = !DIGlobalVariableExpression(var: !502, expr: !DIExpression())
!502 = distinct !DIGlobalVariable(scope: null, file: !6, line: 659, type: !503, isLocal: true, isDefinition: true)
!503 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 368, elements: !504)
!504 = !{!505}
!505 = !DISubrange(count: 46)
!506 = !DIGlobalVariableExpression(var: !507, expr: !DIExpression())
!507 = distinct !DIGlobalVariable(scope: null, file: !6, line: 663, type: !508, isLocal: true, isDefinition: true)
!508 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 680, elements: !509)
!509 = !{!510}
!510 = !DISubrange(count: 85)
!511 = !DIGlobalVariableExpression(var: !512, expr: !DIExpression())
!512 = distinct !DIGlobalVariable(scope: null, file: !6, line: 665, type: !513, isLocal: true, isDefinition: true)
!513 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 504, elements: !514)
!514 = !{!515}
!515 = !DISubrange(count: 63)
!516 = !DIGlobalVariableExpression(var: !517, expr: !DIExpression())
!517 = distinct !DIGlobalVariable(scope: null, file: !6, line: 667, type: !247, isLocal: true, isDefinition: true)
!518 = !DIGlobalVariableExpression(var: !519, expr: !DIExpression())
!519 = distinct !DIGlobalVariable(scope: null, file: !6, line: 669, type: !520, isLocal: true, isDefinition: true)
!520 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 488, elements: !521)
!521 = !{!522}
!522 = !DISubrange(count: 61)
!523 = !DIGlobalVariableExpression(var: !524, expr: !DIExpression())
!524 = distinct !DIGlobalVariable(scope: null, file: !6, line: 671, type: !525, isLocal: true, isDefinition: true)
!525 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 456, elements: !526)
!526 = !{!527}
!527 = !DISubrange(count: 57)
!528 = !DIGlobalVariableExpression(var: !529, expr: !DIExpression())
!529 = distinct !DIGlobalVariable(scope: null, file: !6, line: 679, type: !503, isLocal: true, isDefinition: true)
!530 = !DIGlobalVariableExpression(var: !531, expr: !DIExpression())
!531 = distinct !DIGlobalVariable(scope: null, file: !6, line: 682, type: !525, isLocal: true, isDefinition: true)
!532 = !DIGlobalVariableExpression(var: !533, expr: !DIExpression())
!533 = distinct !DIGlobalVariable(scope: null, file: !6, line: 688, type: !525, isLocal: true, isDefinition: true)
!534 = !DIGlobalVariableExpression(var: !535, expr: !DIExpression())
!535 = distinct !DIGlobalVariable(scope: null, file: !6, line: 690, type: !536, isLocal: true, isDefinition: true)
!536 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 472, elements: !537)
!537 = !{!538}
!538 = !DISubrange(count: 59)
!539 = !DIGlobalVariableExpression(var: !540, expr: !DIExpression())
!540 = distinct !DIGlobalVariable(scope: null, file: !6, line: 696, type: !503, isLocal: true, isDefinition: true)
!541 = !DIGlobalVariableExpression(var: !542, expr: !DIExpression())
!542 = distinct !DIGlobalVariable(scope: null, file: !6, line: 698, type: !543, isLocal: true, isDefinition: true)
!543 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 408, elements: !544)
!544 = !{!545}
!545 = !DISubrange(count: 51)
!546 = !DIGlobalVariableExpression(var: !547, expr: !DIExpression())
!547 = distinct !DIGlobalVariable(scope: null, file: !6, line: 711, type: !536, isLocal: true, isDefinition: true)
!548 = !DIGlobalVariableExpression(var: !549, expr: !DIExpression())
!549 = distinct !DIGlobalVariable(scope: null, file: !6, line: 713, type: !536, isLocal: true, isDefinition: true)
!550 = !DIGlobalVariableExpression(var: !551, expr: !DIExpression())
!551 = distinct !DIGlobalVariable(scope: null, file: !6, line: 720, type: !341, isLocal: true, isDefinition: true)
!552 = !DIGlobalVariableExpression(var: !553, expr: !DIExpression())
!553 = distinct !DIGlobalVariable(scope: null, file: !6, line: 723, type: !334, isLocal: true, isDefinition: true)
!554 = !DIGlobalVariableExpression(var: !555, expr: !DIExpression())
!555 = distinct !DIGlobalVariable(scope: null, file: !6, line: 729, type: !556, isLocal: true, isDefinition: true)
!556 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 624, elements: !557)
!557 = !{!558}
!558 = !DISubrange(count: 78)
!559 = !DIGlobalVariableExpression(var: !560, expr: !DIExpression())
!560 = distinct !DIGlobalVariable(scope: null, file: !6, line: 732, type: !123, isLocal: true, isDefinition: true)
!561 = !DIGlobalVariableExpression(var: !562, expr: !DIExpression())
!562 = distinct !DIGlobalVariable(scope: null, file: !6, line: 736, type: !563, isLocal: true, isDefinition: true)
!563 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 400, elements: !564)
!564 = !{!565}
!565 = !DISubrange(count: 50)
!566 = !DIGlobalVariableExpression(var: !567, expr: !DIExpression())
!567 = distinct !DIGlobalVariable(scope: null, file: !6, line: 741, type: !568, isLocal: true, isDefinition: true)
!568 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 440, elements: !569)
!569 = !{!570}
!570 = !DISubrange(count: 55)
!571 = !DIGlobalVariableExpression(var: !572, expr: !DIExpression())
!572 = distinct !DIGlobalVariable(scope: null, file: !6, line: 754, type: !573, isLocal: true, isDefinition: true)
!573 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 352, elements: !574)
!574 = !{!575}
!575 = !DISubrange(count: 44)
!576 = !DIGlobalVariableExpression(var: !577, expr: !DIExpression())
!577 = distinct !DIGlobalVariable(scope: null, file: !6, line: 759, type: !133, isLocal: true, isDefinition: true)
!578 = !DIGlobalVariableExpression(var: !579, expr: !DIExpression())
!579 = distinct !DIGlobalVariable(scope: null, file: !6, line: 763, type: !176, isLocal: true, isDefinition: true)
!580 = !DIGlobalVariableExpression(var: !581, expr: !DIExpression())
!581 = distinct !DIGlobalVariable(scope: null, file: !6, line: 767, type: !133, isLocal: true, isDefinition: true)
!582 = !DIGlobalVariableExpression(var: !583, expr: !DIExpression())
!583 = distinct !DIGlobalVariable(scope: null, file: !6, line: 771, type: !133, isLocal: true, isDefinition: true)
!584 = !DIGlobalVariableExpression(var: !585, expr: !DIExpression())
!585 = distinct !DIGlobalVariable(scope: null, file: !6, line: 775, type: !176, isLocal: true, isDefinition: true)
!586 = !DIGlobalVariableExpression(var: !587, expr: !DIExpression())
!587 = distinct !DIGlobalVariable(scope: null, file: !6, line: 777, type: !123, isLocal: true, isDefinition: true)
!588 = !DIGlobalVariableExpression(var: !589, expr: !DIExpression())
!589 = distinct !DIGlobalVariable(scope: null, file: !6, line: 824, type: !108, isLocal: true, isDefinition: true)
!590 = !DIGlobalVariableExpression(var: !591, expr: !DIExpression())
!591 = distinct !DIGlobalVariable(scope: null, file: !6, line: 826, type: !592, isLocal: true, isDefinition: true)
!592 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 32, elements: !593)
!593 = !{!594}
!594 = !DISubrange(count: 4)
!595 = !DIGlobalVariableExpression(var: !596, expr: !DIExpression())
!596 = distinct !DIGlobalVariable(scope: null, file: !6, line: 828, type: !597, isLocal: true, isDefinition: true)
!597 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 16, elements: !598)
!598 = !{!599}
!599 = !DISubrange(count: 2)
!600 = !DIGlobalVariableExpression(var: !601, expr: !DIExpression())
!601 = distinct !DIGlobalVariable(scope: null, file: !6, line: 834, type: !602, isLocal: true, isDefinition: true)
!602 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 128, elements: !603)
!603 = !{!604}
!604 = !DISubrange(count: 16)
!605 = !DIGlobalVariableExpression(var: !606, expr: !DIExpression())
!606 = distinct !DIGlobalVariable(scope: null, file: !6, line: 840, type: !108, isLocal: true, isDefinition: true)
!607 = !DIGlobalVariableExpression(var: !608, expr: !DIExpression())
!608 = distinct !DIGlobalVariable(scope: null, file: !6, line: 843, type: !477, isLocal: true, isDefinition: true)
!609 = !DIGlobalVariableExpression(var: !610, expr: !DIExpression())
!610 = distinct !DIGlobalVariable(scope: null, file: !6, line: 845, type: !602, isLocal: true, isDefinition: true)
!611 = !DIGlobalVariableExpression(var: !612, expr: !DIExpression())
!612 = distinct !DIGlobalVariable(scope: null, file: !6, line: 852, type: !334, isLocal: true, isDefinition: true)
!613 = !DIGlobalVariableExpression(var: !614, expr: !DIExpression())
!614 = distinct !DIGlobalVariable(scope: null, file: !6, line: 859, type: !108, isLocal: true, isDefinition: true)
!615 = !DIGlobalVariableExpression(var: !616, expr: !DIExpression())
!616 = distinct !DIGlobalVariable(scope: null, file: !6, line: 863, type: !334, isLocal: true, isDefinition: true)
!617 = !DIGlobalVariableExpression(var: !618, expr: !DIExpression())
!618 = distinct !DIGlobalVariable(scope: null, file: !6, line: 867, type: !77, isLocal: true, isDefinition: true)
!619 = !DIGlobalVariableExpression(var: !620, expr: !DIExpression())
!620 = distinct !DIGlobalVariable(scope: null, file: !6, line: 870, type: !128, isLocal: true, isDefinition: true)
!621 = !DIGlobalVariableExpression(var: !622, expr: !DIExpression())
!622 = distinct !DIGlobalVariable(scope: null, file: !6, line: 871, type: !592, isLocal: true, isDefinition: true)
!623 = !DIGlobalVariableExpression(var: !624, expr: !DIExpression())
!624 = distinct !DIGlobalVariable(scope: null, file: !6, line: 871, type: !625, isLocal: true, isDefinition: true)
!625 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 24, elements: !626)
!626 = !{!627}
!627 = !DISubrange(count: 3)
!628 = !DIGlobalVariableExpression(var: !629, expr: !DIExpression())
!629 = distinct !DIGlobalVariable(scope: null, file: !6, line: 876, type: !108, isLocal: true, isDefinition: true)
!630 = !DIGlobalVariableExpression(var: !631, expr: !DIExpression())
!631 = distinct !DIGlobalVariable(scope: null, file: !6, line: 880, type: !525, isLocal: true, isDefinition: true)
!632 = !DIGlobalVariableExpression(var: !633, expr: !DIExpression())
!633 = distinct !DIGlobalVariable(scope: null, file: !6, line: 885, type: !72, isLocal: true, isDefinition: true)
!634 = !DIGlobalVariableExpression(var: !635, expr: !DIExpression())
!635 = distinct !DIGlobalVariable(scope: null, file: !6, line: 887, type: !113, isLocal: true, isDefinition: true)
!636 = !DIGlobalVariableExpression(var: !637, expr: !DIExpression())
!637 = distinct !DIGlobalVariable(scope: null, file: !6, line: 891, type: !274, isLocal: true, isDefinition: true)
!638 = !DIGlobalVariableExpression(var: !639, expr: !DIExpression())
!639 = distinct !DIGlobalVariable(scope: null, file: !6, line: 892, type: !176, isLocal: true, isDefinition: true)
!640 = !DIGlobalVariableExpression(var: !641, expr: !DIExpression())
!641 = distinct !DIGlobalVariable(scope: null, file: !6, line: 893, type: !233, isLocal: true, isDefinition: true)
!642 = !DIGlobalVariableExpression(var: !643, expr: !DIExpression())
!643 = distinct !DIGlobalVariable(scope: null, file: !6, line: 898, type: !329, isLocal: true, isDefinition: true)
!644 = !DIGlobalVariableExpression(var: !645, expr: !DIExpression())
!645 = distinct !DIGlobalVariable(scope: null, file: !6, line: 899, type: !646, isLocal: true, isDefinition: true)
!646 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 480, elements: !647)
!647 = !{!648}
!648 = !DISubrange(count: 60)
!649 = !DIGlobalVariableExpression(var: !650, expr: !DIExpression())
!650 = distinct !DIGlobalVariable(scope: null, file: !6, line: 903, type: !334, isLocal: true, isDefinition: true)
!651 = !DIGlobalVariableExpression(var: !652, expr: !DIExpression())
!652 = distinct !DIGlobalVariable(scope: null, file: !6, line: 905, type: !422, isLocal: true, isDefinition: true)
!653 = !DIGlobalVariableExpression(var: !654, expr: !DIExpression())
!654 = distinct !DIGlobalVariable(scope: null, file: !6, line: 909, type: !602, isLocal: true, isDefinition: true)
!655 = !DIGlobalVariableExpression(var: !656, expr: !DIExpression())
!656 = distinct !DIGlobalVariable(scope: null, file: !6, line: 910, type: !657, isLocal: true, isDefinition: true)
!657 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 144, elements: !658)
!658 = !{!659}
!659 = !DISubrange(count: 18)
!660 = !DIGlobalVariableExpression(var: !661, expr: !DIExpression())
!661 = distinct !DIGlobalVariable(scope: null, file: !6, line: 911, type: !159, isLocal: true, isDefinition: true)
!662 = !DIGlobalVariableExpression(var: !663, expr: !DIExpression())
!663 = distinct !DIGlobalVariable(scope: null, file: !6, line: 912, type: !664, isLocal: true, isDefinition: true)
!664 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 120, elements: !665)
!665 = !{!666}
!666 = !DISubrange(count: 15)
!667 = !DIGlobalVariableExpression(var: !668, expr: !DIExpression())
!668 = distinct !DIGlobalVariable(scope: null, file: !6, line: 917, type: !346, isLocal: true, isDefinition: true)
!669 = !DIGlobalVariableExpression(var: !670, expr: !DIExpression())
!670 = distinct !DIGlobalVariable(scope: null, file: !6, line: 919, type: !602, isLocal: true, isDefinition: true)
!671 = !DIGlobalVariableExpression(var: !672, expr: !DIExpression())
!672 = distinct !DIGlobalVariable(scope: null, file: !6, line: 920, type: !602, isLocal: true, isDefinition: true)
!673 = !DIGlobalVariableExpression(var: !674, expr: !DIExpression())
!674 = distinct !DIGlobalVariable(scope: null, file: !6, line: 922, type: !108, isLocal: true, isDefinition: true)
!675 = !DIGlobalVariableExpression(var: !676, expr: !DIExpression())
!676 = distinct !DIGlobalVariable(scope: null, file: !6, line: 924, type: !159, isLocal: true, isDefinition: true)
!677 = !DIGlobalVariableExpression(var: !678, expr: !DIExpression())
!678 = distinct !DIGlobalVariable(scope: null, file: !6, line: 929, type: !341, isLocal: true, isDefinition: true)
!679 = !DIGlobalVariableExpression(var: !680, expr: !DIExpression())
!680 = distinct !DIGlobalVariable(scope: null, file: !6, line: 931, type: !568, isLocal: true, isDefinition: true)
!681 = !DIGlobalVariableExpression(var: !682, expr: !DIExpression())
!682 = distinct !DIGlobalVariable(scope: null, file: !6, line: 939, type: !128, isLocal: true, isDefinition: true)
!683 = !DIGlobalVariableExpression(var: !684, expr: !DIExpression())
!684 = distinct !DIGlobalVariable(scope: null, file: !6, line: 943, type: !176, isLocal: true, isDefinition: true)
!685 = !DIGlobalVariableExpression(var: !686, expr: !DIExpression())
!686 = distinct !DIGlobalVariable(scope: null, file: !6, line: 945, type: !101, isLocal: true, isDefinition: true)
!687 = !DIGlobalVariableExpression(var: !688, expr: !DIExpression())
!688 = distinct !DIGlobalVariable(scope: null, file: !6, line: 948, type: !573, isLocal: true, isDefinition: true)
!689 = !DIGlobalVariableExpression(var: !690, expr: !DIExpression())
!690 = distinct !DIGlobalVariable(scope: null, file: !6, line: 960, type: !367, isLocal: true, isDefinition: true)
!691 = !DIGlobalVariableExpression(var: !692, expr: !DIExpression())
!692 = distinct !DIGlobalVariable(scope: null, file: !6, line: 963, type: !101, isLocal: true, isDefinition: true)
!693 = !DIGlobalVariableExpression(var: !694, expr: !DIExpression())
!694 = distinct !DIGlobalVariable(scope: null, file: !6, line: 968, type: !118, isLocal: true, isDefinition: true)
!695 = !DIGlobalVariableExpression(var: !696, expr: !DIExpression())
!696 = distinct !DIGlobalVariable(scope: null, file: !6, line: 971, type: !697, isLocal: true, isDefinition: true)
!697 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 280, elements: !698)
!698 = !{!699}
!699 = !DISubrange(count: 35)
!700 = !DIGlobalVariableExpression(var: !701, expr: !DIExpression())
!701 = distinct !DIGlobalVariable(scope: null, file: !6, line: 974, type: !82, isLocal: true, isDefinition: true)
!702 = !DIGlobalVariableExpression(var: !703, expr: !DIExpression())
!703 = distinct !DIGlobalVariable(scope: null, file: !6, line: 976, type: !704, isLocal: true, isDefinition: true)
!704 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 312, elements: !705)
!705 = !{!706}
!706 = !DISubrange(count: 39)
!707 = !DIGlobalVariableExpression(var: !708, expr: !DIExpression())
!708 = distinct !DIGlobalVariable(scope: null, file: !6, line: 978, type: !233, isLocal: true, isDefinition: true)
!709 = !DIGlobalVariableExpression(var: !710, expr: !DIExpression())
!710 = distinct !DIGlobalVariable(scope: null, file: !6, line: 982, type: !543, isLocal: true, isDefinition: true)
!711 = !DIGlobalVariableExpression(var: !712, expr: !DIExpression())
!712 = distinct !DIGlobalVariable(scope: null, file: !6, line: 987, type: !233, isLocal: true, isDefinition: true)
!713 = !DIGlobalVariableExpression(var: !714, expr: !DIExpression())
!714 = distinct !DIGlobalVariable(scope: null, file: !6, line: 990, type: !142, isLocal: true, isDefinition: true)
!715 = !DIGlobalVariableExpression(var: !716, expr: !DIExpression())
!716 = distinct !DIGlobalVariable(scope: null, file: !6, line: 992, type: !118, isLocal: true, isDefinition: true)
!717 = !DIGlobalVariableExpression(var: !718, expr: !DIExpression())
!718 = distinct !DIGlobalVariable(scope: null, file: !6, line: 996, type: !697, isLocal: true, isDefinition: true)
!719 = !DIGlobalVariableExpression(var: !720, expr: !DIExpression())
!720 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1001, type: !142, isLocal: true, isDefinition: true)
!721 = !DIGlobalVariableExpression(var: !722, expr: !DIExpression())
!722 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1009, type: !341, isLocal: true, isDefinition: true)
!723 = !DIGlobalVariableExpression(var: !724, expr: !DIExpression())
!724 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1011, type: !543, isLocal: true, isDefinition: true)
!725 = !DIGlobalVariableExpression(var: !726, expr: !DIExpression())
!726 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1015, type: !727, isLocal: true, isDefinition: true)
!727 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 496, elements: !728)
!728 = !{!729}
!729 = !DISubrange(count: 62)
!730 = !DIGlobalVariableExpression(var: !731, expr: !DIExpression())
!731 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1018, type: !520, isLocal: true, isDefinition: true)
!732 = !DIGlobalVariableExpression(var: !733, expr: !DIExpression())
!733 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1022, type: !147, isLocal: true, isDefinition: true)
!734 = !DIGlobalVariableExpression(var: !735, expr: !DIExpression())
!735 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1024, type: !118, isLocal: true, isDefinition: true)
!736 = !DIGlobalVariableExpression(var: !737, expr: !DIExpression())
!737 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1026, type: !738, isLocal: true, isDefinition: true)
!738 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 576, elements: !739)
!739 = !{!740}
!740 = !DISubrange(count: 72)
!741 = !DIGlobalVariableExpression(var: !742, expr: !DIExpression())
!742 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1029, type: !563, isLocal: true, isDefinition: true)
!743 = !DIGlobalVariableExpression(var: !744, expr: !DIExpression())
!744 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1040, type: !233, isLocal: true, isDefinition: true)
!745 = !DIGlobalVariableExpression(var: !746, expr: !DIExpression())
!746 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1044, type: !503, isLocal: true, isDefinition: true)
!747 = !DIGlobalVariableExpression(var: !748, expr: !DIExpression())
!748 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1045, type: !89, isLocal: true, isDefinition: true)
!749 = !DIGlobalVariableExpression(var: !750, expr: !DIExpression())
!750 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1056, type: !82, isLocal: true, isDefinition: true)
!751 = !DIGlobalVariableExpression(var: !752, expr: !DIExpression())
!752 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1058, type: !753, isLocal: true, isDefinition: true)
!753 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 528, elements: !754)
!754 = !{!755}
!755 = !DISubrange(count: 66)
!756 = !DIGlobalVariableExpression(var: !757, expr: !DIExpression())
!757 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1060, type: !758, isLocal: true, isDefinition: true)
!758 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 416, elements: !759)
!759 = !{!760}
!760 = !DISubrange(count: 52)
!761 = !DIGlobalVariableExpression(var: !762, expr: !DIExpression())
!762 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1065, type: !123, isLocal: true, isDefinition: true)
!763 = !DIGlobalVariableExpression(var: !764, expr: !DIExpression())
!764 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1066, type: !765, isLocal: true, isDefinition: true)
!765 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 712, elements: !766)
!766 = !{!767}
!767 = !DISubrange(count: 89)
!768 = !DIGlobalVariableExpression(var: !769, expr: !DIExpression())
!769 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1075, type: !118, isLocal: true, isDefinition: true)
!770 = !DIGlobalVariableExpression(var: !771, expr: !DIExpression())
!771 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1077, type: !772, isLocal: true, isDefinition: true)
!772 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 552, elements: !773)
!773 = !{!774}
!774 = !DISubrange(count: 69)
!775 = !DIGlobalVariableExpression(var: !776, expr: !DIExpression())
!776 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1079, type: !440, isLocal: true, isDefinition: true)
!777 = !DIGlobalVariableExpression(var: !778, expr: !DIExpression())
!778 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1084, type: !503, isLocal: true, isDefinition: true)
!779 = !DIGlobalVariableExpression(var: !780, expr: !DIExpression())
!780 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1099, type: !334, isLocal: true, isDefinition: true)
!781 = !DIGlobalVariableExpression(var: !782, expr: !DIExpression())
!782 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1100, type: !367, isLocal: true, isDefinition: true)
!783 = !DIGlobalVariableExpression(var: !784, expr: !DIExpression())
!784 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1103, type: !422, isLocal: true, isDefinition: true)
!785 = !DIGlobalVariableExpression(var: !786, expr: !DIExpression())
!786 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1105, type: !334, isLocal: true, isDefinition: true)
!787 = !DIGlobalVariableExpression(var: !788, expr: !DIExpression())
!788 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1108, type: !568, isLocal: true, isDefinition: true)
!789 = !DIGlobalVariableExpression(var: !790, expr: !DIExpression())
!790 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1125, type: !82, isLocal: true, isDefinition: true)
!791 = !DIGlobalVariableExpression(var: !792, expr: !DIExpression())
!792 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1130, type: !72, isLocal: true, isDefinition: true)
!793 = !DIGlobalVariableExpression(var: !794, expr: !DIExpression())
!794 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1135, type: !72, isLocal: true, isDefinition: true)
!795 = !DIGlobalVariableExpression(var: !796, expr: !DIExpression())
!796 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1140, type: !697, isLocal: true, isDefinition: true)
!797 = !DIGlobalVariableExpression(var: !798, expr: !DIExpression())
!798 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1143, type: !758, isLocal: true, isDefinition: true)
!799 = !DIGlobalVariableExpression(var: !800, expr: !DIExpression())
!800 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1145, type: !82, isLocal: true, isDefinition: true)
!801 = !DIGlobalVariableExpression(var: !802, expr: !DIExpression())
!802 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1147, type: !367, isLocal: true, isDefinition: true)
!803 = !DIGlobalVariableExpression(var: !804, expr: !DIExpression())
!804 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1149, type: !346, isLocal: true, isDefinition: true)
!805 = !DIGlobalVariableExpression(var: !806, expr: !DIExpression())
!806 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1153, type: !431, isLocal: true, isDefinition: true)
!807 = !DIGlobalVariableExpression(var: !808, expr: !DIExpression())
!808 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1154, type: !809, isLocal: true, isDefinition: true)
!809 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 760, elements: !810)
!810 = !{!811}
!811 = !DISubrange(count: 95)
!812 = !DIGlobalVariableExpression(var: !813, expr: !DIExpression())
!813 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1156, type: !96, isLocal: true, isDefinition: true)
!814 = !DIGlobalVariableExpression(var: !815, expr: !DIExpression())
!815 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1157, type: !816, isLocal: true, isDefinition: true)
!816 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 696, elements: !817)
!817 = !{!818}
!818 = !DISubrange(count: 87)
!819 = !DIGlobalVariableExpression(var: !820, expr: !DIExpression())
!820 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1160, type: !568, isLocal: true, isDefinition: true)
!821 = !DIGlobalVariableExpression(var: !822, expr: !DIExpression())
!822 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1161, type: !123, isLocal: true, isDefinition: true)
!823 = !DIGlobalVariableExpression(var: !824, expr: !DIExpression())
!824 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1163, type: !96, isLocal: true, isDefinition: true)
!825 = !DIGlobalVariableExpression(var: !826, expr: !DIExpression())
!826 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1164, type: !89, isLocal: true, isDefinition: true)
!827 = !DIGlobalVariableExpression(var: !828, expr: !DIExpression())
!828 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1167, type: !89, isLocal: true, isDefinition: true)
!829 = !DIGlobalVariableExpression(var: !830, expr: !DIExpression())
!830 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1168, type: !646, isLocal: true, isDefinition: true)
!831 = !DIGlobalVariableExpression(var: !832, expr: !DIExpression())
!832 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1170, type: !96, isLocal: true, isDefinition: true)
!833 = !DIGlobalVariableExpression(var: !834, expr: !DIExpression())
!834 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1171, type: !727, isLocal: true, isDefinition: true)
!835 = !DIGlobalVariableExpression(var: !836, expr: !DIExpression())
!836 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1174, type: !568, isLocal: true, isDefinition: true)
!837 = !DIGlobalVariableExpression(var: !838, expr: !DIExpression())
!838 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1176, type: !152, isLocal: true, isDefinition: true)
!839 = !DIGlobalVariableExpression(var: !840, expr: !DIExpression())
!840 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1178, type: !753, isLocal: true, isDefinition: true)
!841 = !DIGlobalVariableExpression(var: !842, expr: !DIExpression())
!842 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1180, type: !123, isLocal: true, isDefinition: true)
!843 = !DIGlobalVariableExpression(var: !844, expr: !DIExpression())
!844 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1184, type: !568, isLocal: true, isDefinition: true)
!845 = !DIGlobalVariableExpression(var: !846, expr: !DIExpression())
!846 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1185, type: !847, isLocal: true, isDefinition: true)
!847 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 640, elements: !848)
!848 = !{!849}
!849 = !DISubrange(count: 80)
!850 = !DIGlobalVariableExpression(var: !851, expr: !DIExpression())
!851 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1188, type: !477, isLocal: true, isDefinition: true)
!852 = !DIGlobalVariableExpression(var: !853, expr: !DIExpression())
!853 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1190, type: !346, isLocal: true, isDefinition: true)
!854 = !DIGlobalVariableExpression(var: !855, expr: !DIExpression())
!855 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1192, type: !697, isLocal: true, isDefinition: true)
!856 = !DIGlobalVariableExpression(var: !857, expr: !DIExpression())
!857 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1196, type: !657, isLocal: true, isDefinition: true)
!858 = !DIGlobalVariableExpression(var: !859, expr: !DIExpression())
!859 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1198, type: !543, isLocal: true, isDefinition: true)
!860 = !DIGlobalVariableExpression(var: !861, expr: !DIExpression())
!861 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1199, type: !101, isLocal: true, isDefinition: true)
!862 = !DIGlobalVariableExpression(var: !863, expr: !DIExpression())
!863 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1200, type: !563, isLocal: true, isDefinition: true)
!864 = !DIGlobalVariableExpression(var: !865, expr: !DIExpression())
!865 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1201, type: !697, isLocal: true, isDefinition: true)
!866 = !DIGlobalVariableExpression(var: !867, expr: !DIExpression())
!867 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1202, type: !72, isLocal: true, isDefinition: true)
!868 = !DIGlobalVariableExpression(var: !869, expr: !DIExpression())
!869 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1203, type: !72, isLocal: true, isDefinition: true)
!870 = !DIGlobalVariableExpression(var: !871, expr: !DIExpression())
!871 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1205, type: !727, isLocal: true, isDefinition: true)
!872 = !DIGlobalVariableExpression(var: !873, expr: !DIExpression())
!873 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1207, type: !341, isLocal: true, isDefinition: true)
!874 = !DIGlobalVariableExpression(var: !875, expr: !DIExpression())
!875 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1211, type: !367, isLocal: true, isDefinition: true)
!876 = !DIGlobalVariableExpression(var: !877, expr: !DIExpression())
!877 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1214, type: !525, isLocal: true, isDefinition: true)
!878 = !DIGlobalVariableExpression(var: !879, expr: !DIExpression())
!879 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1215, type: !704, isLocal: true, isDefinition: true)
!880 = !DIGlobalVariableExpression(var: !881, expr: !DIExpression())
!881 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1218, type: !573, isLocal: true, isDefinition: true)
!882 = !DIGlobalVariableExpression(var: !883, expr: !DIExpression())
!883 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1221, type: !573, isLocal: true, isDefinition: true)
!884 = !DIGlobalVariableExpression(var: !885, expr: !DIExpression())
!885 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1225, type: !536, isLocal: true, isDefinition: true)
!886 = !DIGlobalVariableExpression(var: !887, expr: !DIExpression())
!887 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1227, type: !159, isLocal: true, isDefinition: true)
!888 = !DIGlobalVariableExpression(var: !889, expr: !DIExpression())
!889 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1230, type: !159, isLocal: true, isDefinition: true)
!890 = !DIGlobalVariableExpression(var: !891, expr: !DIExpression())
!891 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1233, type: !159, isLocal: true, isDefinition: true)
!892 = !DIGlobalVariableExpression(var: !893, expr: !DIExpression())
!893 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1237, type: !520, isLocal: true, isDefinition: true)
!894 = !DIGlobalVariableExpression(var: !895, expr: !DIExpression())
!895 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1239, type: !72, isLocal: true, isDefinition: true)
!896 = !DIGlobalVariableExpression(var: !897, expr: !DIExpression())
!897 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1243, type: !898, isLocal: true, isDefinition: true)
!898 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 616, elements: !899)
!899 = !{!900}
!900 = !DISubrange(count: 77)
!901 = !DIGlobalVariableExpression(var: !902, expr: !DIExpression())
!902 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1244, type: !568, isLocal: true, isDefinition: true)
!903 = !DIGlobalVariableExpression(var: !904, expr: !DIExpression())
!904 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1248, type: !341, isLocal: true, isDefinition: true)
!905 = !DIGlobalVariableExpression(var: !906, expr: !DIExpression())
!906 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1251, type: !128, isLocal: true, isDefinition: true)
!907 = !DIGlobalVariableExpression(var: !908, expr: !DIExpression())
!908 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1254, type: !128, isLocal: true, isDefinition: true)
!909 = !DIGlobalVariableExpression(var: !910, expr: !DIExpression())
!910 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1257, type: !704, isLocal: true, isDefinition: true)
!911 = !DIGlobalVariableExpression(var: !912, expr: !DIExpression())
!912 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1260, type: !563, isLocal: true, isDefinition: true)
!913 = !DIGlobalVariableExpression(var: !914, expr: !DIExpression())
!914 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1262, type: !477, isLocal: true, isDefinition: true)
!915 = !DIGlobalVariableExpression(var: !916, expr: !DIExpression())
!916 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1265, type: !568, isLocal: true, isDefinition: true)
!917 = !DIGlobalVariableExpression(var: !918, expr: !DIExpression())
!918 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1267, type: !477, isLocal: true, isDefinition: true)
!919 = !DIGlobalVariableExpression(var: !920, expr: !DIExpression())
!920 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1270, type: !568, isLocal: true, isDefinition: true)
!921 = !DIGlobalVariableExpression(var: !922, expr: !DIExpression())
!922 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1272, type: !318, isLocal: true, isDefinition: true)
!923 = !DIGlobalVariableExpression(var: !924, expr: !DIExpression())
!924 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1275, type: !753, isLocal: true, isDefinition: true)
!925 = !DIGlobalVariableExpression(var: !926, expr: !DIExpression())
!926 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1276, type: !927, isLocal: true, isDefinition: true)
!927 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 672, elements: !928)
!928 = !{!929}
!929 = !DISubrange(count: 84)
!930 = !DIGlobalVariableExpression(var: !931, expr: !DIExpression())
!931 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1280, type: !422, isLocal: true, isDefinition: true)
!932 = !DIGlobalVariableExpression(var: !933, expr: !DIExpression())
!933 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1283, type: !101, isLocal: true, isDefinition: true)
!934 = !DIGlobalVariableExpression(var: !935, expr: !DIExpression())
!935 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1291, type: !563, isLocal: true, isDefinition: true)
!936 = !DIGlobalVariableExpression(var: !937, expr: !DIExpression())
!937 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1298, type: !118, isLocal: true, isDefinition: true)
!938 = !DIGlobalVariableExpression(var: !939, expr: !DIExpression())
!939 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1300, type: !142, isLocal: true, isDefinition: true)
!940 = !DIGlobalVariableExpression(var: !941, expr: !DIExpression())
!941 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1308, type: !543, isLocal: true, isDefinition: true)
!942 = !DIGlobalVariableExpression(var: !943, expr: !DIExpression())
!943 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1309, type: !128, isLocal: true, isDefinition: true)
!944 = !DIGlobalVariableExpression(var: !945, expr: !DIExpression())
!945 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1310, type: !440, isLocal: true, isDefinition: true)
!946 = !DIGlobalVariableExpression(var: !947, expr: !DIExpression())
!947 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1311, type: !772, isLocal: true, isDefinition: true)
!948 = !DIGlobalVariableExpression(var: !949, expr: !DIExpression())
!949 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1312, type: !422, isLocal: true, isDefinition: true)
!950 = !DIGlobalVariableExpression(var: !951, expr: !DIExpression())
!951 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1313, type: !334, isLocal: true, isDefinition: true)
!952 = !DIGlobalVariableExpression(var: !953, expr: !DIExpression())
!953 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1315, type: !422, isLocal: true, isDefinition: true)
!954 = !DIGlobalVariableExpression(var: !955, expr: !DIExpression())
!955 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1317, type: !753, isLocal: true, isDefinition: true)
!956 = !DIGlobalVariableExpression(var: !957, expr: !DIExpression())
!957 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1321, type: !543, isLocal: true, isDefinition: true)
!958 = !DIGlobalVariableExpression(var: !959, expr: !DIExpression())
!959 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1325, type: !543, isLocal: true, isDefinition: true)
!960 = !DIGlobalVariableExpression(var: !961, expr: !DIExpression())
!961 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1351, type: !142, isLocal: true, isDefinition: true)
!962 = !DIGlobalVariableExpression(var: !963, expr: !DIExpression())
!963 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1362, type: !123, isLocal: true, isDefinition: true)
!964 = !DIGlobalVariableExpression(var: !965, expr: !DIExpression())
!965 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1363, type: !543, isLocal: true, isDefinition: true)
!966 = !DIGlobalVariableExpression(var: !967, expr: !DIExpression())
!967 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1366, type: !543, isLocal: true, isDefinition: true)
!968 = !DIGlobalVariableExpression(var: !969, expr: !DIExpression())
!969 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1373, type: !329, isLocal: true, isDefinition: true)
!970 = !DIGlobalVariableExpression(var: !971, expr: !DIExpression())
!971 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1374, type: !329, isLocal: true, isDefinition: true)
!972 = !DIGlobalVariableExpression(var: !973, expr: !DIExpression())
!973 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1375, type: !477, isLocal: true, isDefinition: true)
!974 = !DIGlobalVariableExpression(var: !975, expr: !DIExpression())
!975 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1376, type: !477, isLocal: true, isDefinition: true)
!976 = !DIGlobalVariableExpression(var: !977, expr: !DIExpression())
!977 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1378, type: !113, isLocal: true, isDefinition: true)
!978 = !DIGlobalVariableExpression(var: !979, expr: !DIExpression())
!979 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1381, type: !346, isLocal: true, isDefinition: true)
!980 = !DIGlobalVariableExpression(var: !981, expr: !DIExpression())
!981 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1383, type: !563, isLocal: true, isDefinition: true)
!982 = !DIGlobalVariableExpression(var: !983, expr: !DIExpression())
!983 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1385, type: !367, isLocal: true, isDefinition: true)
!984 = !DIGlobalVariableExpression(var: !985, expr: !DIExpression())
!985 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1387, type: !422, isLocal: true, isDefinition: true)
!986 = !DIGlobalVariableExpression(var: !987, expr: !DIExpression())
!987 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1389, type: !367, isLocal: true, isDefinition: true)
!988 = !DIGlobalVariableExpression(var: !989, expr: !DIExpression())
!989 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1391, type: !422, isLocal: true, isDefinition: true)
!990 = !DIGlobalVariableExpression(var: !991, expr: !DIExpression())
!991 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1394, type: !657, isLocal: true, isDefinition: true)
!992 = !DIGlobalVariableExpression(var: !993, expr: !DIExpression())
!993 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1396, type: !520, isLocal: true, isDefinition: true)
!994 = !DIGlobalVariableExpression(var: !995, expr: !DIExpression())
!995 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1398, type: !431, isLocal: true, isDefinition: true)
!996 = !DIGlobalVariableExpression(var: !997, expr: !DIExpression())
!997 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1399, type: !384, isLocal: true, isDefinition: true)
!998 = !DIGlobalVariableExpression(var: !999, expr: !DIExpression())
!999 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1400, type: !185, isLocal: true, isDefinition: true)
!1000 = !DIGlobalVariableExpression(var: !1001, expr: !DIExpression())
!1001 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1403, type: !573, isLocal: true, isDefinition: true)
!1002 = !DIGlobalVariableExpression(var: !1003, expr: !DIExpression())
!1003 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1414, type: !664, isLocal: true, isDefinition: true)
!1004 = !DIGlobalVariableExpression(var: !1005, expr: !DIExpression())
!1005 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1460, type: !1006, isLocal: true, isDefinition: true)
!1006 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 152, elements: !1007)
!1007 = !{!1008}
!1008 = !DISubrange(count: 19)
!1009 = !DIGlobalVariableExpression(var: !1010, expr: !DIExpression())
!1010 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1464, type: !329, isLocal: true, isDefinition: true)
!1011 = !DIGlobalVariableExpression(var: !1012, expr: !DIExpression())
!1012 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1469, type: !1006, isLocal: true, isDefinition: true)
!1013 = !DIGlobalVariableExpression(var: !1014, expr: !DIExpression())
!1014 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1471, type: !329, isLocal: true, isDefinition: true)
!1015 = !DIGlobalVariableExpression(var: !1016, expr: !DIExpression())
!1016 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1475, type: !274, isLocal: true, isDefinition: true)
!1017 = !DIGlobalVariableExpression(var: !1018, expr: !DIExpression())
!1018 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1477, type: !96, isLocal: true, isDefinition: true)
!1019 = !DIGlobalVariableExpression(var: !1020, expr: !DIExpression())
!1020 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1482, type: !82, isLocal: true, isDefinition: true)
!1021 = !DIGlobalVariableExpression(var: !1022, expr: !DIExpression())
!1022 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1484, type: !152, isLocal: true, isDefinition: true)
!1023 = !DIGlobalVariableExpression(var: !1024, expr: !DIExpression())
!1024 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1489, type: !346, isLocal: true, isDefinition: true)
!1025 = !DIGlobalVariableExpression(var: !1026, expr: !DIExpression())
!1026 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1491, type: !346, isLocal: true, isDefinition: true)
!1027 = !DIGlobalVariableExpression(var: !1028, expr: !DIExpression())
!1028 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1493, type: !318, isLocal: true, isDefinition: true)
!1029 = !DIGlobalVariableExpression(var: !1030, expr: !DIExpression())
!1030 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1497, type: !329, isLocal: true, isDefinition: true)
!1031 = !DIGlobalVariableExpression(var: !1032, expr: !DIExpression())
!1032 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1500, type: !657, isLocal: true, isDefinition: true)
!1033 = !DIGlobalVariableExpression(var: !1034, expr: !DIExpression())
!1034 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1501, type: !415, isLocal: true, isDefinition: true)
!1035 = !DIGlobalVariableExpression(var: !1036, expr: !DIExpression())
!1036 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1502, type: !415, isLocal: true, isDefinition: true)
!1037 = !DIGlobalVariableExpression(var: !1038, expr: !DIExpression())
!1038 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1503, type: !415, isLocal: true, isDefinition: true)
!1039 = !DIGlobalVariableExpression(var: !1040, expr: !DIExpression())
!1040 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1504, type: !664, isLocal: true, isDefinition: true)
!1041 = !DIGlobalVariableExpression(var: !1042, expr: !DIExpression())
!1042 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1505, type: !477, isLocal: true, isDefinition: true)
!1043 = !DIGlobalVariableExpression(var: !1044, expr: !DIExpression())
!1044 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1510, type: !96, isLocal: true, isDefinition: true)
!1045 = !DIGlobalVariableExpression(var: !1046, expr: !DIExpression())
!1046 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1513, type: !274, isLocal: true, isDefinition: true)
!1047 = !DIGlobalVariableExpression(var: !1048, expr: !DIExpression())
!1048 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1514, type: !664, isLocal: true, isDefinition: true)
!1049 = !DIGlobalVariableExpression(var: !1050, expr: !DIExpression())
!1050 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1515, type: !664, isLocal: true, isDefinition: true)
!1051 = !DIGlobalVariableExpression(var: !1052, expr: !DIExpression())
!1052 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1516, type: !664, isLocal: true, isDefinition: true)
!1053 = !DIGlobalVariableExpression(var: !1054, expr: !DIExpression())
!1054 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1517, type: !602, isLocal: true, isDefinition: true)
!1055 = !DIGlobalVariableExpression(var: !1056, expr: !DIExpression())
!1056 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1518, type: !152, isLocal: true, isDefinition: true)
!1057 = !DIGlobalVariableExpression(var: !1058, expr: !DIExpression())
!1058 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1524, type: !101, isLocal: true, isDefinition: true)
!1059 = !DIGlobalVariableExpression(var: !1060, expr: !DIExpression())
!1060 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1527, type: !176, isLocal: true, isDefinition: true)
!1061 = !DIGlobalVariableExpression(var: !1062, expr: !DIExpression())
!1062 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1534, type: !704, isLocal: true, isDefinition: true)
!1063 = !DIGlobalVariableExpression(var: !1064, expr: !DIExpression())
!1064 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1535, type: !592, isLocal: true, isDefinition: true)
!1065 = !DIGlobalVariableExpression(var: !1066, expr: !DIExpression())
!1066 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1543, type: !477, isLocal: true, isDefinition: true)
!1067 = !DIGlobalVariableExpression(var: !1068, expr: !DIExpression())
!1068 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1547, type: !346, isLocal: true, isDefinition: true)
!1069 = !DIGlobalVariableExpression(var: !1070, expr: !DIExpression())
!1070 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1548, type: !77, isLocal: true, isDefinition: true)
!1071 = !DIGlobalVariableExpression(var: !1072, expr: !DIExpression())
!1072 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1553, type: !147, isLocal: true, isDefinition: true)
!1073 = !DIGlobalVariableExpression(var: !1074, expr: !DIExpression())
!1074 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1556, type: !233, isLocal: true, isDefinition: true)
!1075 = !DIGlobalVariableExpression(var: !1076, expr: !DIExpression())
!1076 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1561, type: !101, isLocal: true, isDefinition: true)
!1077 = !DIGlobalVariableExpression(var: !1078, expr: !DIExpression())
!1078 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1564, type: !704, isLocal: true, isDefinition: true)
!1079 = !DIGlobalVariableExpression(var: !1080, expr: !DIExpression())
!1080 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1569, type: !147, isLocal: true, isDefinition: true)
!1081 = !DIGlobalVariableExpression(var: !1082, expr: !DIExpression())
!1082 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1571, type: !176, isLocal: true, isDefinition: true)
!1083 = !DIGlobalVariableExpression(var: !1084, expr: !DIExpression())
!1084 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1576, type: !101, isLocal: true, isDefinition: true)
!1085 = !DIGlobalVariableExpression(var: !1086, expr: !DIExpression())
!1086 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1580, type: !169, isLocal: true, isDefinition: true)
!1087 = !DIGlobalVariableExpression(var: !1088, expr: !DIExpression())
!1088 = distinct !DIGlobalVariable(scope: null, file: !6, line: 1584, type: !247, isLocal: true, isDefinition: true)
!1089 = !DIGlobalVariableExpression(var: !1090, expr: !DIExpression())
!1090 = distinct !DIGlobalVariable(name: "operations", scope: !2, file: !6, line: 183, type: !1091, isLocal: true, isDefinition: true)
!1091 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 64, elements: !598)
!1092 = !DIGlobalVariableExpression(var: !1093, expr: !DIExpression())
!1093 = distinct !DIGlobalVariable(name: "STATIC_DATA_FOR_INIT", scope: !2, file: !6, line: 90, type: !1094, isLocal: true, isDefinition: true)
!1094 = !DICompositeType(tag: DW_TAG_array_type, baseType: !1095, size: 464, elements: !1096)
!1095 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !34)
!1096 = !{!1097}
!1097 = !DISubrange(count: 58)
!1098 = !DIGlobalVariableExpression(var: !1099, expr: !DIExpression())
!1099 = distinct !DIGlobalVariable(scope: null, file: !6, line: 101, type: !96, isLocal: true, isDefinition: true)
!1100 = !DIGlobalVariableExpression(var: !1101, expr: !DIExpression())
!1101 = distinct !DIGlobalVariable(scope: null, file: !6, line: 105, type: !176, isLocal: true, isDefinition: true)
!1102 = !DIGlobalVariableExpression(var: !1103, expr: !DIExpression())
!1103 = distinct !DIGlobalVariable(name: "tick", scope: !1104, file: !6, line: 112, type: !24, isLocal: true, isDefinition: true)
!1104 = distinct !DISubprogram(name: "test_timer_cb", scope: !6, file: !6, line: 110, type: !1105, scopeLine: 110, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1111)
!1105 = !DISubroutineType(types: !1106)
!1106 = !{null, !1107}
!1107 = !DIDerivedType(tag: DW_TAG_typedef, name: "TimerHandle_t", file: !1108, line: 87, baseType: !1109)
!1108 = !DIFile(filename: "Programs/Espressif/frameworks/esp-idf-v5.4/components/freertos/FreeRTOS-Kernel/include/freertos/timers.h", directory: "C:/Andrey")
!1109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1110, size: 32)
!1110 = !DICompositeType(tag: DW_TAG_structure_type, name: "tmrTimerControl", file: !1108, line: 86, flags: DIFlagFwdDecl)
!1111 = !{!1112, !1113}
!1112 = !DILocalVariable(name: "xTimer", arg: 1, scope: !1104, file: !6, line: 110, type: !1107)
!1113 = !DILocalVariable(name: "ud", scope: !1104, file: !6, line: 111, type: !54)
!1114 = !DIGlobalVariableExpression(var: !1115, expr: !DIExpression())
!1115 = distinct !DIGlobalVariable(scope: null, file: !6, line: 113, type: !108, isLocal: true, isDefinition: true)
!1116 = !DIGlobalVariableExpression(var: !1117, expr: !DIExpression())
!1117 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 8, type: !297, isLocal: true, isDefinition: true)
!1118 = !DIFile(filename: "C:\\Andrey\\Projects\\VS_Code\\ESPB PRODACTION\\LLVM_TO_ESPB\\main\\test.c", directory: "")
!1119 = !DIGlobalVariableExpression(var: !1120, expr: !DIExpression())
!1120 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 9, type: !297, isLocal: true, isDefinition: true)
!1121 = !DIGlobalVariableExpression(var: !1122, expr: !DIExpression())
!1122 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 12, type: !96, isLocal: true, isDefinition: true)
!1123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1124, producer: "clang version 18.1.2 (https://github.com/espressif/llvm-project.git esp-18.1.2_20240912)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !1125, splitDebugInlining: false, nameTableKind: None)
!1124 = !DIFile(filename: "C:\\Andrey\\Projects\\VS_Code\\ESPB PRODACTION\\LLVM_TO_ESPB\\main/test.c", directory: "C:/Andrey/Projects/VS_Code/ESPB PRODACTION/LLVM_TO_ESPB")
!1125 = !{!1126, !1116, !1119, !1121, !1128, !1130}
!1126 = !DIGlobalVariableExpression(var: !1127, expr: !DIExpression())
!1127 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 5, type: !346, isLocal: true, isDefinition: true)
!1128 = !DIGlobalVariableExpression(var: !1129, expr: !DIExpression())
!1129 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 14, type: !147, isLocal: true, isDefinition: true)
!1130 = !DIGlobalVariableExpression(var: !1131, expr: !DIExpression())
!1131 = distinct !DIGlobalVariable(scope: null, file: !1118, line: 17, type: !72, isLocal: true, isDefinition: true)
!1132 = !{!"clang version 18.1.2 (https://github.com/espressif/llvm-project.git esp-18.1.2_20240912)"}
!1133 = !{i32 7, !"Dwarf Version", i32 4}
!1134 = !{i32 2, !"Debug Info Version", i32 3}
!1135 = !{i32 1, !"wchar_size", i32 4}
!1136 = !{i32 1, !"target-abi", !"ilp32"}
!1137 = !{i32 8, !"SmallDataLimit", i32 8}
!1138 = !{i32 7, !"debug-info-assignment-tracking", i1 true}
!1139 = distinct !DISubprogram(name: "counter_task", scope: !6, file: !6, line: 117, type: !1140, scopeLine: 118, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1142)
!1140 = !DISubroutineType(types: !1141)
!1141 = !{null, !54}
!1142 = !{!1143, !1144}
!1143 = !DILocalVariable(name: "pvParameter", arg: 1, scope: !1139, file: !6, line: 117, type: !54)
!1144 = !DILocalVariable(name: "num", scope: !1139, file: !6, line: 119, type: !24)
!1145 = !DILocation(line: 0, scope: !1139)
!1146 = !DILocation(line: 120, column: 5, scope: !1139)
!1147 = !DILocation(line: 121, column: 5, scope: !1139)
!1148 = !DILocation(line: 122, column: 36, scope: !1149)
!1149 = distinct !DILexicalBlock(scope: !1139, file: !6, line: 121, column: 15)
!1150 = !DILocation(line: 122, column: 9, scope: !1149)
!1151 = !DILocation(line: 123, column: 9, scope: !1149)
!1152 = distinct !{!1152, !1147, !1153, !1154}
!1153 = !DILocation(line: 124, column: 5, scope: !1139)
!1154 = !{!"llvm.loop.unroll.disable"}
!1155 = !DISubprogram(name: "printf", scope: !1156, file: !1156, line: 206, type: !1157, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1156 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/stdio.h", directory: "C:/Andrey")
!1157 = !DISubroutineType(types: !1158)
!1158 = !{!24, !1159, null}
!1159 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1160)
!1160 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1095, size: 32)
!1161 = !DISubprogram(name: "vTaskDelay", scope: !1162, file: !1162, line: 834, type: !1163, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1162 = !DIFile(filename: "Programs/Espressif/frameworks/esp-idf-v5.4/components/freertos/FreeRTOS-Kernel/include/freertos/task.h", directory: "C:/Andrey")
!1163 = !DISubroutineType(types: !1164)
!1164 = !{null, !1165}
!1165 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !14)
!1166 = distinct !DISubprogram(name: "add_func", scope: !6, file: !6, line: 133, type: !61, scopeLine: 133, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1167)
!1167 = !{!1168, !1169}
!1168 = !DILocalVariable(name: "a", arg: 1, scope: !1166, file: !6, line: 133, type: !24)
!1169 = !DILocalVariable(name: "b", arg: 2, scope: !1166, file: !6, line: 133, type: !24)
!1170 = !DILocation(line: 0, scope: !1166)
!1171 = !DILocation(line: 134, column: 55, scope: !1166)
!1172 = !DILocation(line: 134, column: 5, scope: !1166)
!1173 = !DILocation(line: 135, column: 5, scope: !1166)
!1174 = distinct !DISubprogram(name: "mul_func", scope: !6, file: !6, line: 138, type: !61, scopeLine: 138, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1175)
!1175 = !{!1176, !1177}
!1176 = !DILocalVariable(name: "a", arg: 1, scope: !1174, file: !6, line: 138, type: !24)
!1177 = !DILocalVariable(name: "b", arg: 2, scope: !1174, file: !6, line: 138, type: !24)
!1178 = !DILocation(line: 0, scope: !1174)
!1179 = !DILocation(line: 139, column: 55, scope: !1174)
!1180 = !DILocation(line: 139, column: 5, scope: !1174)
!1181 = !DILocation(line: 140, column: 5, scope: !1174)
!1182 = distinct !DISubprogram(name: "call_operation", scope: !6, file: !6, line: 144, type: !1183, scopeLine: 144, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1185)
!1183 = !DISubroutineType(types: !1184)
!1184 = !{!24, !60, !24, !24}
!1185 = !{!1186, !1187, !1188}
!1186 = !DILocalVariable(name: "operation", arg: 1, scope: !1182, file: !6, line: 144, type: !60)
!1187 = !DILocalVariable(name: "x", arg: 2, scope: !1182, file: !6, line: 144, type: !24)
!1188 = !DILocalVariable(name: "y", arg: 3, scope: !1182, file: !6, line: 144, type: !24)
!1189 = !DILocation(line: 0, scope: !1182)
!1190 = !DILocation(line: 145, column: 5, scope: !1182)
!1191 = !DILocation(line: 146, column: 12, scope: !1182)
!1192 = !DILocation(line: 146, column: 5, scope: !1182)
!1193 = distinct !DISubprogram(name: "test_call_indirect", scope: !6, file: !6, line: 150, type: !1194, scopeLine: 150, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1196)
!1194 = !DISubroutineType(types: !1195)
!1195 = !{null}
!1196 = !{!1197, !1198, !1199, !1200, !1201}
!1197 = !DILocalVariable(name: "func_ptr", scope: !1193, file: !6, line: 154, type: !60)
!1198 = !DILocalVariable(name: "result1", scope: !1193, file: !6, line: 155, type: !24)
!1199 = !DILocalVariable(name: "result2", scope: !1193, file: !6, line: 159, type: !24)
!1200 = !DILocalVariable(name: "result3", scope: !1193, file: !6, line: 162, type: !24)
!1201 = !DILocalVariable(name: "result4", scope: !1193, file: !6, line: 167, type: !24)
!1202 = !DILocation(line: 151, column: 5, scope: !1193)
!1203 = !DILocation(line: 0, scope: !1193)
!1204 = !DILocation(line: 0, scope: !1166, inlinedAt: !1205)
!1205 = distinct !DILocation(line: 155, column: 19, scope: !1193)
!1206 = !DILocation(line: 134, column: 5, scope: !1166, inlinedAt: !1205)
!1207 = !DILocation(line: 156, column: 5, scope: !1193)
!1208 = !DILocation(line: 0, scope: !1182, inlinedAt: !1209)
!1209 = distinct !DILocation(line: 159, column: 19, scope: !1193)
!1210 = !DILocation(line: 145, column: 5, scope: !1182, inlinedAt: !1209)
!1211 = !DILocation(line: 0, scope: !1166, inlinedAt: !1212)
!1212 = distinct !DILocation(line: 146, column: 12, scope: !1182, inlinedAt: !1209)
!1213 = !DILocation(line: 134, column: 5, scope: !1166, inlinedAt: !1212)
!1214 = !DILocation(line: 160, column: 5, scope: !1193)
!1215 = !DILocation(line: 0, scope: !1182, inlinedAt: !1216)
!1216 = distinct !DILocation(line: 162, column: 19, scope: !1193)
!1217 = !DILocation(line: 145, column: 5, scope: !1182, inlinedAt: !1216)
!1218 = !DILocation(line: 0, scope: !1174, inlinedAt: !1219)
!1219 = distinct !DILocation(line: 146, column: 12, scope: !1182, inlinedAt: !1216)
!1220 = !DILocation(line: 139, column: 5, scope: !1174, inlinedAt: !1219)
!1221 = !DILocation(line: 163, column: 5, scope: !1193)
!1222 = !DILocation(line: 0, scope: !1174, inlinedAt: !1223)
!1223 = distinct !DILocation(line: 167, column: 19, scope: !1193)
!1224 = !DILocation(line: 139, column: 5, scope: !1174, inlinedAt: !1223)
!1225 = !DILocation(line: 168, column: 5, scope: !1193)
!1226 = !DILocation(line: 170, column: 5, scope: !1193)
!1227 = !DILocation(line: 171, column: 1, scope: !1193)
!1228 = distinct !DISubprogram(name: "call_operation_by_index", scope: !6, file: !6, line: 186, type: !1229, scopeLine: 186, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1231)
!1229 = !DISubroutineType(types: !1230)
!1230 = !{!24, !24, !24, !24}
!1231 = !{!1232, !1233, !1234}
!1232 = !DILocalVariable(name: "op_index", arg: 1, scope: !1228, file: !6, line: 186, type: !24)
!1233 = !DILocalVariable(name: "x", arg: 2, scope: !1228, file: !6, line: 186, type: !24)
!1234 = !DILocalVariable(name: "y", arg: 3, scope: !1228, file: !6, line: 186, type: !24)
!1235 = !DILocation(line: 0, scope: !1228)
!1236 = !DILocation(line: 187, column: 5, scope: !1228)
!1237 = !DILocation(line: 190, column: 32, scope: !1228)
!1238 = !DILocation(line: 190, column: 12, scope: !1228)
!1239 = !{!1240, !1240, i64 0}
!1240 = !{!"any pointer", !1241, i64 0}
!1241 = !{!"omnipotent char", !1242, i64 0}
!1242 = !{!"Simple C/C++ TBAA"}
!1243 = !DILocation(line: 190, column: 5, scope: !1228)
!1244 = distinct !DISubprogram(name: "call_volatile_function", scope: !6, file: !6, line: 194, type: !1245, scopeLine: 194, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1247)
!1245 = !DISubroutineType(types: !1246)
!1246 = !{!23, !20, !24, !24}
!1247 = !{!1248, !1249, !1250}
!1248 = !DILocalVariable(name: "func", arg: 1, scope: !1244, file: !6, line: 194, type: !20)
!1249 = !DILocalVariable(name: "x", arg: 2, scope: !1244, file: !6, line: 194, type: !24)
!1250 = !DILocalVariable(name: "y", arg: 3, scope: !1244, file: !6, line: 194, type: !24)
!1251 = !DILocation(line: 0, scope: !1244)
!1252 = !DILocation(line: 195, column: 5, scope: !1244)
!1253 = !DILocation(line: 196, column: 12, scope: !1244)
!1254 = !DILocation(line: 196, column: 5, scope: !1244)
!1255 = distinct !DISubprogram(name: "test_call_indirect_non_optimizable", scope: !6, file: !6, line: 200, type: !1194, scopeLine: 200, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1256)
!1256 = !{!1257, !1258, !1259, !1260}
!1257 = !DILocalVariable(name: "result1", scope: !1255, file: !6, line: 204, type: !24)
!1258 = !DILocalVariable(name: "result2", scope: !1255, file: !6, line: 207, type: !24)
!1259 = !DILocalVariable(name: "volatile_func_ptr", scope: !1255, file: !6, line: 212, type: !20)
!1260 = !DILocalVariable(name: "result3", scope: !1255, file: !6, line: 213, type: !24)
!1261 = !DILocation(line: 201, column: 5, scope: !1255)
!1262 = !DILocation(line: 0, scope: !1228, inlinedAt: !1263)
!1263 = distinct !DILocation(line: 204, column: 19, scope: !1255)
!1264 = !DILocation(line: 187, column: 5, scope: !1228, inlinedAt: !1263)
!1265 = !DILocation(line: 0, scope: !1166, inlinedAt: !1266)
!1266 = distinct !DILocation(line: 190, column: 12, scope: !1228, inlinedAt: !1263)
!1267 = !DILocation(line: 134, column: 5, scope: !1166, inlinedAt: !1266)
!1268 = !DILocation(line: 0, scope: !1255)
!1269 = !DILocation(line: 205, column: 5, scope: !1255)
!1270 = !DILocation(line: 0, scope: !1228, inlinedAt: !1271)
!1271 = distinct !DILocation(line: 207, column: 19, scope: !1255)
!1272 = !DILocation(line: 187, column: 5, scope: !1228, inlinedAt: !1271)
!1273 = !DILocation(line: 0, scope: !1174, inlinedAt: !1274)
!1274 = distinct !DILocation(line: 190, column: 12, scope: !1228, inlinedAt: !1271)
!1275 = !DILocation(line: 139, column: 5, scope: !1174, inlinedAt: !1274)
!1276 = !DILocation(line: 208, column: 5, scope: !1255)
!1277 = !DILocation(line: 0, scope: !1244, inlinedAt: !1278)
!1278 = distinct !DILocation(line: 213, column: 19, scope: !1255)
!1279 = !DILocation(line: 195, column: 5, scope: !1244, inlinedAt: !1278)
!1280 = !DILocation(line: 0, scope: !1166, inlinedAt: !1281)
!1281 = distinct !DILocation(line: 196, column: 12, scope: !1244, inlinedAt: !1278)
!1282 = !DILocation(line: 134, column: 5, scope: !1166, inlinedAt: !1281)
!1283 = !DILocation(line: 214, column: 5, scope: !1255)
!1284 = !DILocation(line: 216, column: 5, scope: !1255)
!1285 = !DILocation(line: 217, column: 1, scope: !1255)
!1286 = distinct !DISubprogram(name: "test_globals", scope: !6, file: !6, line: 225, type: !1194, scopeLine: 225, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2)
!1287 = !DILocation(line: 226, column: 5, scope: !1286)
!1288 = !DILocation(line: 227, column: 54, scope: !1286)
!1289 = !{!1290, !1290, i64 0}
!1290 = !{!"int", !1241, i64 0}
!1291 = !DILocation(line: 227, column: 5, scope: !1286)
!1292 = !DILocation(line: 228, column: 55, scope: !1286)
!1293 = !{!1294, !1294, i64 0}
!1294 = !{!"long long", !1241, i64 0}
!1295 = !DILocation(line: 228, column: 5, scope: !1286)
!1296 = !DILocation(line: 229, column: 46, scope: !1286)
!1297 = !{!1298, !1298, i64 0}
!1298 = !{!"_Bool", !1241, i64 0}
!1299 = !{i8 0, i8 2}
!1300 = !{}
!1301 = !DILocation(line: 229, column: 5, scope: !1286)
!1302 = !DILocation(line: 231, column: 21, scope: !1286)
!1303 = !DILocation(line: 232, column: 22, scope: !1286)
!1304 = !DILocation(line: 233, column: 25, scope: !1286)
!1305 = !DILocation(line: 233, column: 22, scope: !1286)
!1306 = !DILocation(line: 235, column: 5, scope: !1286)
!1307 = !DILocation(line: 236, column: 56, scope: !1286)
!1308 = !DILocation(line: 236, column: 5, scope: !1286)
!1309 = !DILocation(line: 237, column: 47, scope: !1286)
!1310 = !DILocation(line: 237, column: 5, scope: !1286)
!1311 = !DILocation(line: 238, column: 5, scope: !1286)
!1312 = !DILocation(line: 239, column: 1, scope: !1286)
!1313 = distinct !DISubprogram(name: "test_math_operations32", scope: !6, file: !6, line: 243, type: !1194, scopeLine: 244, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1314)
!1314 = !{!1315, !1317, !1318, !1320}
!1315 = !DILocalVariable(name: "i32_a", scope: !1313, file: !6, line: 245, type: !1316)
!1316 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !25)
!1317 = !DILocalVariable(name: "i32_b", scope: !1313, file: !6, line: 246, type: !1316)
!1318 = !DILocalVariable(name: "u32_a", scope: !1313, file: !6, line: 247, type: !1319)
!1319 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !16)
!1320 = !DILocalVariable(name: "u32_b", scope: !1313, file: !6, line: 248, type: !1319)
!1321 = distinct !DIAssignID()
!1322 = !DILocation(line: 0, scope: !1313)
!1323 = distinct !DIAssignID()
!1324 = distinct !DIAssignID()
!1325 = distinct !DIAssignID()
!1326 = !DILocation(line: 245, column: 5, scope: !1313)
!1327 = !DILocation(line: 245, column: 22, scope: !1313)
!1328 = distinct !DIAssignID()
!1329 = !DILocation(line: 246, column: 5, scope: !1313)
!1330 = !DILocation(line: 246, column: 22, scope: !1313)
!1331 = distinct !DIAssignID()
!1332 = !DILocation(line: 247, column: 5, scope: !1313)
!1333 = !DILocation(line: 247, column: 23, scope: !1313)
!1334 = distinct !DIAssignID()
!1335 = !DILocation(line: 248, column: 5, scope: !1313)
!1336 = !DILocation(line: 248, column: 23, scope: !1313)
!1337 = distinct !DIAssignID()
!1338 = !DILocation(line: 249, column: 5, scope: !1313)
!1339 = !DILocation(line: 250, column: 56, scope: !1313)
!1340 = !DILocation(line: 250, column: 63, scope: !1313)
!1341 = !DILocation(line: 250, column: 70, scope: !1313)
!1342 = !DILocation(line: 250, column: 77, scope: !1313)
!1343 = !DILocation(line: 250, column: 5, scope: !1313)
!1344 = !DILocation(line: 251, column: 25, scope: !1313)
!1345 = !DILocation(line: 251, column: 33, scope: !1313)
!1346 = !DILocation(line: 251, column: 31, scope: !1313)
!1347 = !DILocation(line: 251, column: 5, scope: !1313)
!1348 = !DILocation(line: 252, column: 25, scope: !1313)
!1349 = !DILocation(line: 252, column: 33, scope: !1313)
!1350 = !DILocation(line: 252, column: 31, scope: !1313)
!1351 = !DILocation(line: 252, column: 5, scope: !1313)
!1352 = !DILocation(line: 253, column: 25, scope: !1313)
!1353 = !DILocation(line: 253, column: 33, scope: !1313)
!1354 = !DILocation(line: 253, column: 31, scope: !1313)
!1355 = !DILocation(line: 253, column: 5, scope: !1313)
!1356 = !DILocation(line: 254, column: 26, scope: !1313)
!1357 = !DILocation(line: 254, column: 34, scope: !1313)
!1358 = !DILocation(line: 254, column: 32, scope: !1313)
!1359 = !DILocation(line: 254, column: 5, scope: !1313)
!1360 = !DILocation(line: 255, column: 26, scope: !1313)
!1361 = !DILocation(line: 255, column: 34, scope: !1313)
!1362 = !DILocation(line: 255, column: 32, scope: !1313)
!1363 = !DILocation(line: 255, column: 5, scope: !1313)
!1364 = !DILocation(line: 256, column: 26, scope: !1313)
!1365 = !DILocation(line: 256, column: 34, scope: !1313)
!1366 = !DILocation(line: 256, column: 32, scope: !1313)
!1367 = !DILocation(line: 256, column: 5, scope: !1313)
!1368 = !DILocation(line: 257, column: 26, scope: !1313)
!1369 = !DILocation(line: 257, column: 34, scope: !1313)
!1370 = !DILocation(line: 257, column: 32, scope: !1313)
!1371 = !DILocation(line: 257, column: 5, scope: !1313)
!1372 = !DILocation(line: 258, column: 25, scope: !1313)
!1373 = !DILocation(line: 258, column: 31, scope: !1313)
!1374 = !DILocation(line: 258, column: 5, scope: !1313)
!1375 = !DILocation(line: 259, column: 24, scope: !1313)
!1376 = !DILocation(line: 259, column: 30, scope: !1313)
!1377 = !DILocation(line: 259, column: 5, scope: !1313)
!1378 = !DILocation(line: 260, column: 25, scope: !1313)
!1379 = !DILocation(line: 260, column: 31, scope: !1313)
!1380 = !DILocation(line: 260, column: 5, scope: !1313)
!1381 = !DILocation(line: 261, column: 25, scope: !1313)
!1382 = !DILocation(line: 261, column: 31, scope: !1313)
!1383 = !DILocation(line: 261, column: 5, scope: !1313)
!1384 = !DILocation(line: 262, column: 26, scope: !1313)
!1385 = !DILocation(line: 262, column: 32, scope: !1313)
!1386 = !DILocation(line: 262, column: 5, scope: !1313)
!1387 = !DILocation(line: 263, column: 26, scope: !1313)
!1388 = !DILocation(line: 263, column: 32, scope: !1313)
!1389 = !DILocation(line: 263, column: 5, scope: !1313)
!1390 = !DILocation(line: 264, column: 26, scope: !1313)
!1391 = !DILocation(line: 264, column: 25, scope: !1313)
!1392 = !DILocation(line: 264, column: 5, scope: !1313)
!1393 = !DILocation(line: 267, column: 1, scope: !1313)
!1394 = distinct !DISubprogram(name: "test_math_operations", scope: !6, file: !6, line: 268, type: !1194, scopeLine: 268, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1395)
!1395 = !{!1396, !1397, !1398, !1399, !1400, !1402, !1403, !1408, !1409, !1411, !1412, !1414, !1415, !1416, !1417, !1418}
!1396 = !DILocalVariable(name: "i32_a", scope: !1394, file: !6, line: 273, type: !1316)
!1397 = !DILocalVariable(name: "i32_b", scope: !1394, file: !6, line: 274, type: !1316)
!1398 = !DILocalVariable(name: "u32_a", scope: !1394, file: !6, line: 275, type: !1319)
!1399 = !DILocalVariable(name: "u32_b", scope: !1394, file: !6, line: 276, type: !1319)
!1400 = !DILocalVariable(name: "i64_a", scope: !1394, file: !6, line: 297, type: !1401)
!1401 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !37)
!1402 = !DILocalVariable(name: "i64_b", scope: !1394, file: !6, line: 298, type: !1401)
!1403 = !DILocalVariable(name: "u64_a", scope: !1394, file: !6, line: 299, type: !1404)
!1404 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !1405)
!1405 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !17, line: 60, baseType: !1406)
!1406 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !19, line: 105, baseType: !1407)
!1407 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!1408 = !DILocalVariable(name: "u64_b", scope: !1394, file: !6, line: 300, type: !1404)
!1409 = !DILocalVariable(name: "f32_a", scope: !1394, file: !6, line: 320, type: !1410)
!1410 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !27)
!1411 = !DILocalVariable(name: "f32_b", scope: !1394, file: !6, line: 321, type: !1410)
!1412 = !DILocalVariable(name: "f64_a", scope: !1394, file: !6, line: 335, type: !1413)
!1413 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !42)
!1414 = !DILocalVariable(name: "f64_b", scope: !1394, file: !6, line: 336, type: !1413)
!1415 = !DILocalVariable(name: "i32_from_f64", scope: !1394, file: !6, line: 350, type: !25)
!1416 = !DILocalVariable(name: "f32_from_i64", scope: !1394, file: !6, line: 351, type: !27)
!1417 = !DILocalVariable(name: "i16_from_i32", scope: !1394, file: !6, line: 352, type: !28)
!1418 = !DILocalVariable(name: "i32_from_i8", scope: !1394, file: !6, line: 353, type: !25)
!1419 = distinct !DIAssignID()
!1420 = !DILocation(line: 0, scope: !1394)
!1421 = distinct !DIAssignID()
!1422 = distinct !DIAssignID()
!1423 = distinct !DIAssignID()
!1424 = distinct !DIAssignID()
!1425 = distinct !DIAssignID()
!1426 = distinct !DIAssignID()
!1427 = distinct !DIAssignID()
!1428 = distinct !DIAssignID()
!1429 = distinct !DIAssignID()
!1430 = distinct !DIAssignID()
!1431 = distinct !DIAssignID()
!1432 = !DILocation(line: 269, column: 5, scope: !1394)
!1433 = !DILocation(line: 273, column: 5, scope: !1394)
!1434 = !DILocation(line: 273, column: 22, scope: !1394)
!1435 = distinct !DIAssignID()
!1436 = !DILocation(line: 274, column: 5, scope: !1394)
!1437 = !DILocation(line: 274, column: 22, scope: !1394)
!1438 = distinct !DIAssignID()
!1439 = !DILocation(line: 275, column: 5, scope: !1394)
!1440 = !DILocation(line: 275, column: 23, scope: !1394)
!1441 = distinct !DIAssignID()
!1442 = !DILocation(line: 276, column: 5, scope: !1394)
!1443 = !DILocation(line: 276, column: 23, scope: !1394)
!1444 = distinct !DIAssignID()
!1445 = !DILocation(line: 279, column: 56, scope: !1394)
!1446 = !DILocation(line: 279, column: 63, scope: !1394)
!1447 = !DILocation(line: 279, column: 70, scope: !1394)
!1448 = !DILocation(line: 279, column: 77, scope: !1394)
!1449 = !DILocation(line: 279, column: 5, scope: !1394)
!1450 = !DILocation(line: 280, column: 25, scope: !1394)
!1451 = !DILocation(line: 280, column: 33, scope: !1394)
!1452 = !DILocation(line: 280, column: 31, scope: !1394)
!1453 = !DILocation(line: 280, column: 5, scope: !1394)
!1454 = !DILocation(line: 281, column: 25, scope: !1394)
!1455 = !DILocation(line: 281, column: 33, scope: !1394)
!1456 = !DILocation(line: 281, column: 31, scope: !1394)
!1457 = !DILocation(line: 281, column: 5, scope: !1394)
!1458 = !DILocation(line: 282, column: 25, scope: !1394)
!1459 = !DILocation(line: 282, column: 33, scope: !1394)
!1460 = !DILocation(line: 282, column: 31, scope: !1394)
!1461 = !DILocation(line: 282, column: 5, scope: !1394)
!1462 = !DILocation(line: 283, column: 26, scope: !1394)
!1463 = !DILocation(line: 283, column: 34, scope: !1394)
!1464 = !DILocation(line: 283, column: 32, scope: !1394)
!1465 = !DILocation(line: 283, column: 5, scope: !1394)
!1466 = !DILocation(line: 284, column: 26, scope: !1394)
!1467 = !DILocation(line: 284, column: 34, scope: !1394)
!1468 = !DILocation(line: 284, column: 32, scope: !1394)
!1469 = !DILocation(line: 284, column: 5, scope: !1394)
!1470 = !DILocation(line: 285, column: 26, scope: !1394)
!1471 = !DILocation(line: 285, column: 34, scope: !1394)
!1472 = !DILocation(line: 285, column: 32, scope: !1394)
!1473 = !DILocation(line: 285, column: 5, scope: !1394)
!1474 = !DILocation(line: 286, column: 26, scope: !1394)
!1475 = !DILocation(line: 286, column: 34, scope: !1394)
!1476 = !DILocation(line: 286, column: 32, scope: !1394)
!1477 = !DILocation(line: 286, column: 5, scope: !1394)
!1478 = !DILocation(line: 287, column: 25, scope: !1394)
!1479 = !DILocation(line: 287, column: 31, scope: !1394)
!1480 = !DILocation(line: 287, column: 5, scope: !1394)
!1481 = !DILocation(line: 288, column: 24, scope: !1394)
!1482 = !DILocation(line: 288, column: 30, scope: !1394)
!1483 = !DILocation(line: 288, column: 5, scope: !1394)
!1484 = !DILocation(line: 289, column: 25, scope: !1394)
!1485 = !DILocation(line: 289, column: 31, scope: !1394)
!1486 = !DILocation(line: 289, column: 5, scope: !1394)
!1487 = !DILocation(line: 290, column: 25, scope: !1394)
!1488 = !DILocation(line: 290, column: 31, scope: !1394)
!1489 = !DILocation(line: 290, column: 5, scope: !1394)
!1490 = !DILocation(line: 291, column: 26, scope: !1394)
!1491 = !DILocation(line: 291, column: 32, scope: !1394)
!1492 = !DILocation(line: 291, column: 5, scope: !1394)
!1493 = !DILocation(line: 292, column: 26, scope: !1394)
!1494 = !DILocation(line: 292, column: 32, scope: !1394)
!1495 = !DILocation(line: 292, column: 5, scope: !1394)
!1496 = !DILocation(line: 293, column: 26, scope: !1394)
!1497 = !DILocation(line: 293, column: 25, scope: !1394)
!1498 = !DILocation(line: 293, column: 5, scope: !1394)
!1499 = !DILocation(line: 296, column: 5, scope: !1394)
!1500 = !DILocation(line: 297, column: 5, scope: !1394)
!1501 = !DILocation(line: 297, column: 22, scope: !1394)
!1502 = distinct !DIAssignID()
!1503 = !DILocation(line: 298, column: 5, scope: !1394)
!1504 = !DILocation(line: 298, column: 22, scope: !1394)
!1505 = distinct !DIAssignID()
!1506 = !DILocation(line: 299, column: 5, scope: !1394)
!1507 = !DILocation(line: 299, column: 23, scope: !1394)
!1508 = distinct !DIAssignID()
!1509 = !DILocation(line: 300, column: 5, scope: !1394)
!1510 = !DILocation(line: 300, column: 23, scope: !1394)
!1511 = distinct !DIAssignID()
!1512 = !DILocation(line: 302, column: 92, scope: !1394)
!1513 = !DILocation(line: 302, column: 99, scope: !1394)
!1514 = !DILocation(line: 302, column: 106, scope: !1394)
!1515 = !DILocation(line: 302, column: 113, scope: !1394)
!1516 = !DILocation(line: 302, column: 5, scope: !1394)
!1517 = !DILocation(line: 303, column: 34, scope: !1394)
!1518 = !DILocation(line: 303, column: 42, scope: !1394)
!1519 = !DILocation(line: 303, column: 40, scope: !1394)
!1520 = !DILocation(line: 303, column: 5, scope: !1394)
!1521 = !DILocation(line: 304, column: 34, scope: !1394)
!1522 = !DILocation(line: 304, column: 42, scope: !1394)
!1523 = !DILocation(line: 304, column: 40, scope: !1394)
!1524 = !DILocation(line: 304, column: 5, scope: !1394)
!1525 = !DILocation(line: 305, column: 34, scope: !1394)
!1526 = !DILocation(line: 305, column: 40, scope: !1394)
!1527 = !DILocation(line: 305, column: 5, scope: !1394)
!1528 = !DILocation(line: 306, column: 35, scope: !1394)
!1529 = !DILocation(line: 306, column: 43, scope: !1394)
!1530 = !DILocation(line: 306, column: 41, scope: !1394)
!1531 = !DILocation(line: 306, column: 5, scope: !1394)
!1532 = !DILocation(line: 307, column: 35, scope: !1394)
!1533 = !DILocation(line: 307, column: 43, scope: !1394)
!1534 = !DILocation(line: 307, column: 41, scope: !1394)
!1535 = !DILocation(line: 307, column: 5, scope: !1394)
!1536 = !DILocation(line: 308, column: 35, scope: !1394)
!1537 = !DILocation(line: 308, column: 43, scope: !1394)
!1538 = !DILocation(line: 308, column: 41, scope: !1394)
!1539 = !DILocation(line: 308, column: 5, scope: !1394)
!1540 = !DILocation(line: 309, column: 35, scope: !1394)
!1541 = !DILocation(line: 309, column: 43, scope: !1394)
!1542 = !DILocation(line: 309, column: 41, scope: !1394)
!1543 = !DILocation(line: 309, column: 5, scope: !1394)
!1544 = !DILocation(line: 310, column: 34, scope: !1394)
!1545 = !DILocation(line: 310, column: 40, scope: !1394)
!1546 = !DILocation(line: 310, column: 5, scope: !1394)
!1547 = !DILocation(line: 311, column: 33, scope: !1394)
!1548 = !DILocation(line: 311, column: 39, scope: !1394)
!1549 = !DILocation(line: 311, column: 5, scope: !1394)
!1550 = !DILocation(line: 312, column: 34, scope: !1394)
!1551 = !DILocation(line: 312, column: 40, scope: !1394)
!1552 = !DILocation(line: 312, column: 5, scope: !1394)
!1553 = !DILocation(line: 313, column: 34, scope: !1394)
!1554 = !DILocation(line: 313, column: 40, scope: !1394)
!1555 = !DILocation(line: 313, column: 5, scope: !1394)
!1556 = !DILocation(line: 314, column: 35, scope: !1394)
!1557 = !DILocation(line: 314, column: 41, scope: !1394)
!1558 = !DILocation(line: 314, column: 5, scope: !1394)
!1559 = !DILocation(line: 315, column: 35, scope: !1394)
!1560 = !DILocation(line: 315, column: 41, scope: !1394)
!1561 = !DILocation(line: 315, column: 5, scope: !1394)
!1562 = !DILocation(line: 316, column: 35, scope: !1394)
!1563 = !DILocation(line: 316, column: 34, scope: !1394)
!1564 = !DILocation(line: 316, column: 5, scope: !1394)
!1565 = !DILocation(line: 319, column: 5, scope: !1394)
!1566 = !DILocation(line: 320, column: 5, scope: !1394)
!1567 = !DILocation(line: 320, column: 20, scope: !1394)
!1568 = !{!1569, !1569, i64 0}
!1569 = !{!"float", !1241, i64 0}
!1570 = distinct !DIAssignID()
!1571 = !DILocation(line: 321, column: 5, scope: !1394)
!1572 = !DILocation(line: 321, column: 20, scope: !1394)
!1573 = distinct !DIAssignID()
!1574 = !DILocation(line: 323, column: 36, scope: !1394)
!1575 = !DILocation(line: 323, column: 43, scope: !1394)
!1576 = !DILocation(line: 323, column: 5, scope: !1394)
!1577 = !DILocation(line: 324, column: 25, scope: !1394)
!1578 = !DILocation(line: 324, column: 33, scope: !1394)
!1579 = !DILocation(line: 324, column: 31, scope: !1394)
!1580 = !DILocation(line: 324, column: 5, scope: !1394)
!1581 = !DILocation(line: 325, column: 25, scope: !1394)
!1582 = !DILocation(line: 325, column: 33, scope: !1394)
!1583 = !DILocation(line: 325, column: 31, scope: !1394)
!1584 = !DILocation(line: 325, column: 5, scope: !1394)
!1585 = !DILocation(line: 326, column: 25, scope: !1394)
!1586 = !DILocation(line: 326, column: 33, scope: !1394)
!1587 = !DILocation(line: 326, column: 31, scope: !1394)
!1588 = !DILocation(line: 326, column: 5, scope: !1394)
!1589 = !DILocation(line: 327, column: 25, scope: !1394)
!1590 = !DILocation(line: 327, column: 33, scope: !1394)
!1591 = !DILocation(line: 327, column: 31, scope: !1394)
!1592 = !DILocation(line: 327, column: 5, scope: !1394)
!1593 = !DILocation(line: 328, column: 31, scope: !1394)
!1594 = !DILocation(line: 328, column: 25, scope: !1394)
!1595 = !DILocation(line: 328, column: 5, scope: !1394)
!1596 = !DILocation(line: 329, column: 32, scope: !1394)
!1597 = !DILocation(line: 329, column: 40, scope: !1394)
!1598 = !DILocation(line: 329, column: 38, scope: !1394)
!1599 = !DILocation(line: 329, column: 26, scope: !1394)
!1600 = !DILocation(line: 329, column: 5, scope: !1394)
!1601 = !DILocation(line: 330, column: 31, scope: !1394)
!1602 = !DILocation(line: 330, column: 38, scope: !1394)
!1603 = !DILocation(line: 330, column: 25, scope: !1394)
!1604 = !DILocation(line: 330, column: 5, scope: !1394)
!1605 = !DILocation(line: 331, column: 31, scope: !1394)
!1606 = !DILocation(line: 331, column: 38, scope: !1394)
!1607 = !DILocation(line: 331, column: 25, scope: !1394)
!1608 = !DILocation(line: 331, column: 5, scope: !1394)
!1609 = !DILocation(line: 334, column: 5, scope: !1394)
!1610 = !DILocation(line: 335, column: 5, scope: !1394)
!1611 = !DILocation(line: 335, column: 21, scope: !1394)
!1612 = !{!1613, !1613, i64 0}
!1613 = !{!"double", !1241, i64 0}
!1614 = distinct !DIAssignID()
!1615 = !DILocation(line: 336, column: 5, scope: !1394)
!1616 = !DILocation(line: 336, column: 21, scope: !1394)
!1617 = distinct !DIAssignID()
!1618 = !DILocation(line: 338, column: 38, scope: !1394)
!1619 = !DILocation(line: 338, column: 45, scope: !1394)
!1620 = !DILocation(line: 338, column: 5, scope: !1394)
!1621 = !DILocation(line: 339, column: 26, scope: !1394)
!1622 = !DILocation(line: 339, column: 34, scope: !1394)
!1623 = !DILocation(line: 339, column: 32, scope: !1394)
!1624 = !DILocation(line: 339, column: 5, scope: !1394)
!1625 = !DILocation(line: 340, column: 26, scope: !1394)
!1626 = !DILocation(line: 340, column: 34, scope: !1394)
!1627 = !DILocation(line: 340, column: 32, scope: !1394)
!1628 = !DILocation(line: 340, column: 5, scope: !1394)
!1629 = !DILocation(line: 341, column: 26, scope: !1394)
!1630 = !DILocation(line: 341, column: 34, scope: !1394)
!1631 = !DILocation(line: 341, column: 32, scope: !1394)
!1632 = !DILocation(line: 341, column: 5, scope: !1394)
!1633 = !DILocation(line: 342, column: 26, scope: !1394)
!1634 = !DILocation(line: 342, column: 34, scope: !1394)
!1635 = !DILocation(line: 342, column: 32, scope: !1394)
!1636 = !DILocation(line: 342, column: 5, scope: !1394)
!1637 = !DILocation(line: 343, column: 31, scope: !1394)
!1638 = !DILocation(line: 343, column: 26, scope: !1394)
!1639 = !DILocation(line: 343, column: 5, scope: !1394)
!1640 = !DILocation(line: 344, column: 32, scope: !1394)
!1641 = !DILocation(line: 344, column: 40, scope: !1394)
!1642 = !DILocation(line: 344, column: 38, scope: !1394)
!1643 = !DILocation(line: 344, column: 27, scope: !1394)
!1644 = !DILocation(line: 344, column: 5, scope: !1394)
!1645 = !DILocation(line: 345, column: 31, scope: !1394)
!1646 = !DILocation(line: 345, column: 38, scope: !1394)
!1647 = !DILocation(line: 345, column: 26, scope: !1394)
!1648 = !DILocation(line: 345, column: 5, scope: !1394)
!1649 = !DILocation(line: 346, column: 31, scope: !1394)
!1650 = !DILocation(line: 346, column: 38, scope: !1394)
!1651 = !DILocation(line: 346, column: 26, scope: !1394)
!1652 = !DILocation(line: 346, column: 5, scope: !1394)
!1653 = !DILocation(line: 349, column: 5, scope: !1394)
!1654 = !DILocation(line: 350, column: 37, scope: !1394)
!1655 = !DILocation(line: 350, column: 28, scope: !1394)
!1656 = !DILocation(line: 351, column: 33, scope: !1394)
!1657 = !DILocation(line: 351, column: 26, scope: !1394)
!1658 = !DILocation(line: 355, column: 40, scope: !1394)
!1659 = !DILocation(line: 355, column: 5, scope: !1394)
!1660 = !DILocation(line: 356, column: 48, scope: !1394)
!1661 = !DILocation(line: 356, column: 55, scope: !1394)
!1662 = !DILocation(line: 356, column: 5, scope: !1394)
!1663 = !DILocation(line: 357, column: 5, scope: !1394)
!1664 = !DILocation(line: 358, column: 5, scope: !1394)
!1665 = !DILocation(line: 360, column: 5, scope: !1394)
!1666 = !DILocation(line: 361, column: 1, scope: !1394)
!1667 = !DISubprogram(name: "sqrtf", scope: !1668, file: !1668, line: 395, type: !1669, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1668 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/math.h", directory: "C:/Andrey")
!1669 = !DISubroutineType(types: !1670)
!1670 = !{!27, !27}
!1671 = !DISubprogram(name: "sqrt", scope: !1668, file: !1668, line: 112, type: !1672, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1672 = !DISubroutineType(types: !1673)
!1673 = !{!42, !42}
!1674 = distinct !DISubprogram(name: "test_memory_operations", scope: !6, file: !6, line: 364, type: !1194, scopeLine: 364, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1675)
!1675 = !{!1676, !1680, !1682, !1683, !1684, !1685, !1686, !1687, !1688, !1689, !1690, !1691, !1692, !1693, !1694, !1695, !1696, !1697, !1698, !1699, !1700}
!1676 = !DILocalVariable(name: "buffer", scope: !1674, file: !6, line: 370, type: !1677)
!1677 = !DICompositeType(tag: DW_TAG_array_type, baseType: !34, size: 800, elements: !1678)
!1678 = !{!1679}
!1679 = !DISubrange(count: 100)
!1680 = !DILocalVariable(name: "i", scope: !1681, file: !6, line: 373, type: !24)
!1681 = distinct !DILexicalBlock(scope: !1674, file: !6, line: 373, column: 5)
!1682 = !DILocalVariable(name: "p_i32", scope: !1674, file: !6, line: 380, type: !35)
!1683 = !DILocalVariable(name: "loaded_i32", scope: !1674, file: !6, line: 382, type: !25)
!1684 = !DILocalVariable(name: "p_i64", scope: !1674, file: !6, line: 386, type: !36)
!1685 = !DILocalVariable(name: "loaded_i64", scope: !1674, file: !6, line: 388, type: !37)
!1686 = !DILocalVariable(name: "p_f32", scope: !1674, file: !6, line: 392, type: !40)
!1687 = !DILocalVariable(name: "loaded_f32", scope: !1674, file: !6, line: 394, type: !27)
!1688 = !DILocalVariable(name: "p_f64", scope: !1674, file: !6, line: 398, type: !41)
!1689 = !DILocalVariable(name: "loaded_f64", scope: !1674, file: !6, line: 400, type: !42)
!1690 = !DILocalVariable(name: "p_i8", scope: !1674, file: !6, line: 404, type: !43)
!1691 = !DILocalVariable(name: "loaded_i8", scope: !1674, file: !6, line: 406, type: !31)
!1692 = !DILocalVariable(name: "p_u8", scope: !1674, file: !6, line: 407, type: !44)
!1693 = !DILocalVariable(name: "loaded_u8", scope: !1674, file: !6, line: 409, type: !45)
!1694 = !DILocalVariable(name: "p_i16", scope: !1674, file: !6, line: 414, type: !48)
!1695 = !DILocalVariable(name: "loaded_i16", scope: !1674, file: !6, line: 416, type: !28)
!1696 = !DILocalVariable(name: "p_u16", scope: !1674, file: !6, line: 417, type: !49)
!1697 = !DILocalVariable(name: "loaded_u16", scope: !1674, file: !6, line: 419, type: !50)
!1698 = !DILocalVariable(name: "p_ptr", scope: !1674, file: !6, line: 424, type: !53)
!1699 = !DILocalVariable(name: "ptr_to_store", scope: !1674, file: !6, line: 425, type: !54)
!1700 = !DILocalVariable(name: "loaded_ptr", scope: !1674, file: !6, line: 427, type: !54)
!1701 = distinct !DIAssignID()
!1702 = !DILocation(line: 0, scope: !1674)
!1703 = !DILocation(line: 365, column: 5, scope: !1674)
!1704 = !DILocation(line: 0, scope: !1681)
!1705 = !DILocation(line: 377, column: 5, scope: !1674)
!1706 = !DILocation(line: 383, column: 5, scope: !1674)
!1707 = !DILocation(line: 389, column: 5, scope: !1674)
!1708 = !DILocation(line: 395, column: 5, scope: !1674)
!1709 = !DILocation(line: 401, column: 5, scope: !1674)
!1710 = !DILocation(line: 410, column: 5, scope: !1674)
!1711 = !DILocation(line: 411, column: 5, scope: !1674)
!1712 = !DILocation(line: 420, column: 5, scope: !1674)
!1713 = !DILocation(line: 421, column: 5, scope: !1674)
!1714 = !DILocation(line: 428, column: 5, scope: !1674)
!1715 = !DILocation(line: 430, column: 5, scope: !1674)
!1716 = !DILocation(line: 431, column: 1, scope: !1674)
!1717 = distinct !DISubprogram(name: "test_control_flow", scope: !6, file: !6, line: 436, type: !1194, scopeLine: 436, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1718)
!1718 = !{!1719, !1720, !1721, !1722, !1723, !1724, !1726, !1728}
!1719 = !DILocalVariable(name: "a", scope: !1717, file: !6, line: 441, type: !24)
!1720 = !DILocalVariable(name: "b", scope: !1717, file: !6, line: 442, type: !24)
!1721 = !DILocalVariable(name: "d1", scope: !1717, file: !6, line: 462, type: !42)
!1722 = !DILocalVariable(name: "d2", scope: !1717, file: !6, line: 463, type: !42)
!1723 = !DILocalVariable(name: "sum", scope: !1717, file: !6, line: 472, type: !24)
!1724 = !DILocalVariable(name: "i", scope: !1725, file: !6, line: 473, type: !24)
!1725 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 473, column: 5)
!1726 = !DILocalVariable(name: "i", scope: !1727, file: !6, line: 486, type: !24)
!1727 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 486, column: 5)
!1728 = !DILabel(scope: !1717, name: "skip_label", file: !6, line: 508)
!1729 = !DILocation(line: 437, column: 5, scope: !1717)
!1730 = !DILocation(line: 440, column: 5, scope: !1717)
!1731 = !DILocation(line: 0, scope: !1717)
!1732 = !DILocation(line: 445, column: 9, scope: !1733)
!1733 = distinct !DILexicalBlock(scope: !1734, file: !6, line: 444, column: 16)
!1734 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 444, column: 9)
!1735 = !DILocation(line: 453, column: 9, scope: !1736)
!1736 = distinct !DILexicalBlock(scope: !1737, file: !6, line: 452, column: 12)
!1737 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 450, column: 9)
!1738 = !DILocation(line: 457, column: 9, scope: !1739)
!1739 = distinct !DILexicalBlock(scope: !1740, file: !6, line: 456, column: 18)
!1740 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 456, column: 9)
!1741 = !DILocation(line: 465, column: 9, scope: !1742)
!1742 = distinct !DILexicalBlock(scope: !1743, file: !6, line: 464, column: 18)
!1743 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 464, column: 9)
!1744 = !DILocation(line: 471, column: 5, scope: !1717)
!1745 = !DILocation(line: 0, scope: !1725)
!1746 = !DILocation(line: 473, column: 5, scope: !1725)
!1747 = !DILocation(line: 477, column: 5, scope: !1717)
!1748 = !DILocation(line: 481, column: 9, scope: !1749)
!1749 = distinct !DILexicalBlock(scope: !1750, file: !6, line: 480, column: 12)
!1750 = distinct !DILexicalBlock(scope: !1717, file: !6, line: 478, column: 9)
!1751 = !DILocation(line: 485, column: 5, scope: !1717)
!1752 = !DILocation(line: 0, scope: !1727)
!1753 = !DILocation(line: 486, column: 5, scope: !1727)
!1754 = !DILocation(line: 474, column: 13, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1756, file: !6, line: 473, column: 34)
!1756 = distinct !DILexicalBlock(scope: !1725, file: !6, line: 473, column: 5)
!1757 = !DILocation(line: 475, column: 9, scope: !1755)
!1758 = !DILocation(line: 473, column: 30, scope: !1756)
!1759 = !DILocation(line: 473, column: 23, scope: !1756)
!1760 = distinct !{!1760, !1746, !1761, !1762, !1154}
!1761 = !DILocation(line: 476, column: 5, scope: !1725)
!1762 = !{!"llvm.loop.mustprogress"}
!1763 = !DILocation(line: 505, column: 5, scope: !1717)
!1764 = !DILocation(line: 508, column: 1, scope: !1717)
!1765 = !DILocation(line: 509, column: 5, scope: !1717)
!1766 = !DILocation(line: 511, column: 5, scope: !1717)
!1767 = !DILocation(line: 512, column: 1, scope: !1717)
!1768 = !DILocation(line: 487, column: 9, scope: !1769)
!1769 = distinct !DILexicalBlock(scope: !1770, file: !6, line: 486, column: 33)
!1770 = distinct !DILexicalBlock(scope: !1727, file: !6, line: 486, column: 5)
!1771 = !DILocation(line: 488, column: 9, scope: !1769)
!1772 = !DILocation(line: 494, column: 17, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1769, file: !6, line: 488, column: 20)
!1774 = !DILocation(line: 497, column: 17, scope: !1773)
!1775 = !DILocation(line: 500, column: 17, scope: !1773)
!1776 = !DILocation(line: 0, scope: !1773)
!1777 = !DILocation(line: 486, column: 29, scope: !1770)
!1778 = !DILocation(line: 486, column: 23, scope: !1770)
!1779 = distinct !{!1779, !1753, !1780, !1762, !1154}
!1780 = !DILocation(line: 502, column: 5, scope: !1727)
!1781 = distinct !DISubprogram(name: "MarchallingTest", scope: !6, file: !6, line: 518, type: !1194, scopeLine: 519, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1782)
!1782 = !{!1783}
!1783 = !DILocalVariable(name: "magic_container", scope: !1781, file: !6, line: 522, type: !24)
!1784 = distinct !DIAssignID()
!1785 = !DILocation(line: 0, scope: !1781)
!1786 = !DILocation(line: 520, column: 5, scope: !1781)
!1787 = !DILocation(line: 522, column: 5, scope: !1781)
!1788 = !DILocation(line: 522, column: 9, scope: !1781)
!1789 = distinct !DIAssignID()
!1790 = !DILocation(line: 524, column: 5, scope: !1781)
!1791 = !DILocation(line: 533, column: 5, scope: !1781)
!1792 = !DILocation(line: 535, column: 50, scope: !1781)
!1793 = !DILocation(line: 535, column: 5, scope: !1781)
!1794 = !DILocation(line: 538, column: 9, scope: !1795)
!1795 = distinct !DILexicalBlock(scope: !1781, file: !6, line: 538, column: 9)
!1796 = !DILocation(line: 538, column: 25, scope: !1795)
!1797 = !DILocation(line: 0, scope: !1795)
!1798 = !DILocation(line: 544, column: 5, scope: !1781)
!1799 = !DILocation(line: 545, column: 1, scope: !1781)
!1800 = !DISubprogram(name: "set_magic_number", scope: !6, file: !6, line: 49, type: !1801, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1801 = !DISubroutineType(types: !1802)
!1802 = !{null, !58}
!1803 = distinct !DISubprogram(name: "test_select_opcodes", scope: !6, file: !6, line: 549, type: !1194, scopeLine: 549, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1804)
!1804 = !{!1805, !1806, !1807, !1808, !1809, !1810}
!1805 = !DILocalVariable(name: "condition", scope: !1803, file: !6, line: 551, type: !24)
!1806 = !DILocalVariable(name: "i32_result", scope: !1803, file: !6, line: 554, type: !24)
!1807 = !DILocalVariable(name: "i64_result", scope: !1803, file: !6, line: 558, type: !37)
!1808 = !DILocalVariable(name: "f32_result", scope: !1803, file: !6, line: 563, type: !27)
!1809 = !DILocalVariable(name: "f64_result", scope: !1803, file: !6, line: 567, type: !42)
!1810 = !DILocalVariable(name: "ptr_result", scope: !1803, file: !6, line: 571, type: !54)
!1811 = !DILocation(line: 550, column: 5, scope: !1803)
!1812 = !DILocation(line: 0, scope: !1803)
!1813 = !DILocation(line: 555, column: 5, scope: !1803)
!1814 = !DILocation(line: 559, column: 5, scope: !1803)
!1815 = !DILocation(line: 564, column: 5, scope: !1803)
!1816 = !DILocation(line: 568, column: 5, scope: !1803)
!1817 = !DILocation(line: 572, column: 5, scope: !1803)
!1818 = !DILocation(line: 574, column: 5, scope: !1803)
!1819 = !DILocation(line: 575, column: 1, scope: !1803)
!1820 = distinct !DISubprogram(name: "test_pointer_ops", scope: !6, file: !6, line: 579, type: !1194, scopeLine: 579, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1821)
!1821 = !{!1822, !1823, !1824, !1825}
!1822 = !DILocalVariable(name: "my_var", scope: !1820, file: !6, line: 582, type: !24)
!1823 = !DILocalVariable(name: "p", scope: !1820, file: !6, line: 585, type: !58)
!1824 = !DILocalVariable(name: "addr_val", scope: !1820, file: !6, line: 588, type: !55)
!1825 = !DILocalVariable(name: "p2", scope: !1820, file: !6, line: 592, type: !58)
!1826 = distinct !DIAssignID()
!1827 = !DILocation(line: 0, scope: !1820)
!1828 = !DILocation(line: 580, column: 5, scope: !1820)
!1829 = !DILocation(line: 582, column: 5, scope: !1820)
!1830 = !DILocation(line: 582, column: 9, scope: !1820)
!1831 = distinct !DIAssignID()
!1832 = !DILocation(line: 588, column: 26, scope: !1820)
!1833 = !DILocation(line: 589, column: 5, scope: !1820)
!1834 = !DILocation(line: 595, column: 9, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1820, file: !6, line: 595, column: 9)
!1836 = !DILocation(line: 595, column: 13, scope: !1835)
!1837 = !DILocation(line: 595, column: 9, scope: !1820)
!1838 = !DILocation(line: 596, column: 9, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1835, file: !6, line: 595, column: 21)
!1840 = !DILocation(line: 597, column: 5, scope: !1839)
!1841 = !DILocation(line: 598, column: 9, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1835, file: !6, line: 597, column: 12)
!1843 = !DILocation(line: 601, column: 6, scope: !1820)
!1844 = !DILocation(line: 602, column: 1, scope: !1820)
!1845 = distinct !DISubprogram(name: "test_atomics", scope: !6, file: !6, line: 607, type: !1194, scopeLine: 607, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1846)
!1846 = !{!1847, !1848, !1849, !1850, !1851, !1852, !1853}
!1847 = !DILocalVariable(name: "i32_atomic_var", scope: !1845, file: !6, line: 612, type: !1316)
!1848 = !DILocalVariable(name: "old_val_add", scope: !1845, file: !6, line: 616, type: !25)
!1849 = !DILocalVariable(name: "old_val_xchg", scope: !1845, file: !6, line: 620, type: !25)
!1850 = !DILocalVariable(name: "expected", scope: !1845, file: !6, line: 624, type: !25)
!1851 = !DILocalVariable(name: "i64_atomic_var", scope: !1845, file: !6, line: 634, type: !1401)
!1852 = !DILocalVariable(name: "old_val_sub64", scope: !1845, file: !6, line: 638, type: !37)
!1853 = !DILocalVariable(name: "loaded_val", scope: !1845, file: !6, line: 642, type: !37)
!1854 = distinct !DIAssignID()
!1855 = !DILocation(line: 0, scope: !1845)
!1856 = distinct !DIAssignID()
!1857 = !DILocation(line: 608, column: 5, scope: !1845)
!1858 = !DILocation(line: 611, column: 5, scope: !1845)
!1859 = !DILocation(line: 612, column: 5, scope: !1845)
!1860 = !DILocation(line: 612, column: 22, scope: !1845)
!1861 = distinct !DIAssignID()
!1862 = !DILocation(line: 613, column: 46, scope: !1845)
!1863 = !DILocation(line: 613, column: 5, scope: !1845)
!1864 = !DILocation(line: 616, column: 27, scope: !1845)
!1865 = !DILocation(line: 617, column: 57, scope: !1845)
!1866 = !DILocation(line: 617, column: 5, scope: !1845)
!1867 = !DILocation(line: 620, column: 28, scope: !1845)
!1868 = !DILocation(line: 621, column: 59, scope: !1845)
!1869 = !DILocation(line: 621, column: 5, scope: !1845)
!1870 = !DILocation(line: 625, column: 5, scope: !1845)
!1871 = !DILocation(line: 626, column: 63, scope: !1845)
!1872 = !DILocation(line: 626, column: 5, scope: !1845)
!1873 = !DILocation(line: 629, column: 5, scope: !1845)
!1874 = !DILocation(line: 630, column: 97, scope: !1845)
!1875 = !DILocation(line: 630, column: 5, scope: !1845)
!1876 = !DILocation(line: 633, column: 5, scope: !1845)
!1877 = !DILocation(line: 634, column: 5, scope: !1845)
!1878 = !DILocation(line: 634, column: 22, scope: !1845)
!1879 = distinct !DIAssignID()
!1880 = !DILocation(line: 635, column: 48, scope: !1845)
!1881 = !DILocation(line: 635, column: 5, scope: !1845)
!1882 = !DILocation(line: 638, column: 29, scope: !1845)
!1883 = !DILocation(line: 639, column: 67, scope: !1845)
!1884 = !DILocation(line: 639, column: 5, scope: !1845)
!1885 = !DILocation(line: 643, column: 5, scope: !1845)
!1886 = !DILocation(line: 644, column: 18, scope: !1845)
!1887 = !DILocation(line: 645, column: 5, scope: !1845)
!1888 = !DILocation(line: 647, column: 5, scope: !1845)
!1889 = !DILocation(line: 648, column: 1, scope: !1845)
!1890 = distinct !DISubprogram(name: "test_heap_and_memory_operations", scope: !6, file: !6, line: 652, type: !1194, scopeLine: 652, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1891)
!1891 = !{!1892, !1893, !1900, !1903, !1905}
!1892 = !DILocalVariable(name: "dynamic_buffer", scope: !1890, file: !6, line: 660, type: !59)
!1893 = !DILocalVariable(name: "data_len", scope: !1894, file: !6, line: 681, type: !1896)
!1894 = distinct !DILexicalBlock(scope: !1895, file: !6, line: 680, column: 25)
!1895 = distinct !DILexicalBlock(scope: !1890, file: !6, line: 680, column: 9)
!1896 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1897, line: 40, baseType: !1898)
!1897 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/strings.h", directory: "C:/Andrey")
!1898 = !DIDerivedType(tag: DW_TAG_typedef, name: "__size_t", file: !1899, line: 131, baseType: !7)
!1899 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/sys/_types.h", directory: "C:/Andrey")
!1900 = !DILocalVariable(name: "fill_ok", scope: !1901, file: !6, line: 702, type: !69)
!1901 = distinct !DILexicalBlock(scope: !1902, file: !6, line: 697, column: 25)
!1902 = distinct !DILexicalBlock(scope: !1890, file: !6, line: 697, column: 9)
!1903 = !DILocalVariable(name: "i", scope: !1904, file: !6, line: 703, type: !24)
!1904 = distinct !DILexicalBlock(scope: !1901, file: !6, line: 703, column: 9)
!1905 = !DILocalVariable(name: "reused_buffer", scope: !1906, file: !6, line: 727, type: !59)
!1906 = distinct !DILexicalBlock(scope: !1907, file: !6, line: 721, column: 25)
!1907 = distinct !DILexicalBlock(scope: !1890, file: !6, line: 721, column: 9)
!1908 = !DILocation(line: 653, column: 5, scope: !1890)
!1909 = !DILocation(line: 659, column: 5, scope: !1890)
!1910 = !DILocation(line: 660, column: 35, scope: !1890)
!1911 = !DILocation(line: 0, scope: !1890)
!1912 = !DILocation(line: 662, column: 24, scope: !1913)
!1913 = distinct !DILexicalBlock(scope: !1890, file: !6, line: 662, column: 9)
!1914 = !DILocation(line: 662, column: 9, scope: !1890)
!1915 = !DILocation(line: 665, column: 9, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1913, file: !6, line: 664, column: 12)
!1917 = !DILocation(line: 667, column: 9, scope: !1916)
!1918 = !DILocation(line: 668, column: 13, scope: !1919)
!1919 = distinct !DILexicalBlock(scope: !1916, file: !6, line: 668, column: 13)
!1920 = !DILocation(line: 668, column: 51, scope: !1919)
!1921 = !DILocation(line: 0, scope: !1913)
!1922 = !DILocation(line: 679, column: 5, scope: !1890)
!1923 = !DILocation(line: 0, scope: !1894)
!1924 = !DILocation(line: 682, column: 9, scope: !1894)
!1925 = !DILocation(line: 684, column: 9, scope: !1894)
!1926 = !DILocation(line: 687, column: 13, scope: !1927)
!1927 = distinct !DILexicalBlock(scope: !1894, file: !6, line: 687, column: 13)
!1928 = !DILocation(line: 687, column: 68, scope: !1927)
!1929 = !DILocation(line: 0, scope: !1927)
!1930 = !DILocation(line: 696, column: 5, scope: !1890)
!1931 = !DILocation(line: 698, column: 9, scope: !1901)
!1932 = !DILocation(line: 699, column: 9, scope: !1901)
!1933 = !DILocation(line: 0, scope: !1901)
!1934 = !DILocation(line: 0, scope: !1904)
!1935 = !DILocation(line: 703, column: 9, scope: !1904)
!1936 = !DILocation(line: 703, column: 34, scope: !1937)
!1937 = distinct !DILexicalBlock(scope: !1904, file: !6, line: 703, column: 9)
!1938 = !DILocation(line: 703, column: 27, scope: !1937)
!1939 = distinct !{!1939, !1935, !1940, !1762, !1154}
!1940 = !DILocation(line: 708, column: 9, scope: !1904)
!1941 = !DILocation(line: 704, column: 17, scope: !1942)
!1942 = distinct !DILexicalBlock(scope: !1943, file: !6, line: 704, column: 17)
!1943 = distinct !DILexicalBlock(scope: !1937, file: !6, line: 703, column: 38)
!1944 = !{!1241, !1241, i64 0}
!1945 = !DILocation(line: 704, column: 35, scope: !1942)
!1946 = !DILocation(line: 704, column: 17, scope: !1943)
!1947 = !DILocation(line: 680, column: 9, scope: !1890)
!1948 = !DILocation(line: 720, column: 5, scope: !1890)
!1949 = !DILocation(line: 721, column: 9, scope: !1890)
!1950 = !DILocation(line: 722, column: 9, scope: !1906)
!1951 = !DILocation(line: 723, column: 9, scope: !1906)
!1952 = !DILocation(line: 727, column: 38, scope: !1906)
!1953 = !DILocation(line: 0, scope: !1906)
!1954 = !DILocation(line: 728, column: 13, scope: !1955)
!1955 = distinct !DILexicalBlock(scope: !1906, file: !6, line: 728, column: 13)
!1956 = !DILocation(line: 728, column: 13, scope: !1906)
!1957 = !DILocation(line: 729, column: 14, scope: !1958)
!1958 = distinct !DILexicalBlock(scope: !1955, file: !6, line: 728, column: 28)
!1959 = !DILocation(line: 730, column: 14, scope: !1958)
!1960 = !DILocation(line: 731, column: 9, scope: !1958)
!1961 = !DILocation(line: 732, column: 14, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1955, file: !6, line: 731, column: 16)
!1963 = !DILocation(line: 736, column: 5, scope: !1890)
!1964 = !DILocation(line: 737, column: 1, scope: !1890)
!1965 = !DISubprogram(name: "malloc", scope: !1966, file: !1966, line: 108, type: !1967, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1966 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/stdlib.h", directory: "C:/Andrey")
!1967 = !DISubroutineType(types: !1968)
!1968 = !{!54, !1969}
!1969 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1970, line: 18, baseType: !7)
!1970 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/lib/clang/18/include/__stddef_size_t.h", directory: "C:/Andrey")
!1971 = !DISubprogram(name: "strcmp", scope: !1972, file: !1972, line: 36, type: !1973, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1972 = !DIFile(filename: "Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/../lib/clang-runtimes/riscv32-esp-unknown-elf/rv32imac-zicsr-zifencei_ilp32/include/string.h", directory: "C:/Andrey")
!1973 = !DISubroutineType(types: !1974)
!1974 = !{!24, !1160, !1160}
!1975 = !DISubprogram(name: "memcmp", scope: !1972, file: !1972, line: 30, type: !1976, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1976 = !DISubroutineType(types: !1977)
!1977 = !{!24, !1978, !1978, !1896}
!1978 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1979, size: 32)
!1979 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1980 = !DISubprogram(name: "free", scope: !1966, file: !1966, line: 94, type: !1140, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1981 = distinct !DISubprogram(name: "test_i64_imm8_ops", scope: !6, file: !6, line: 740, type: !1194, scopeLine: 740, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1982)
!1982 = !{!1983, !1984, !1985, !1986, !1987, !1988, !1989, !1990, !1991}
!1983 = !DILocalVariable(name: "i64_a_volatile", scope: !1981, file: !6, line: 745, type: !1401)
!1984 = !DILocalVariable(name: "u64_a_volatile", scope: !1981, file: !6, line: 746, type: !1404)
!1985 = !DILocalVariable(name: "i64_a", scope: !1981, file: !6, line: 751, type: !37)
!1986 = !DILocalVariable(name: "u64_a", scope: !1981, file: !6, line: 752, type: !1405)
!1987 = !DILocalVariable(name: "div_res", scope: !1981, file: !6, line: 758, type: !37)
!1988 = !DILocalVariable(name: "divu_res", scope: !1981, file: !6, line: 762, type: !1405)
!1989 = !DILocalVariable(name: "rem_res", scope: !1981, file: !6, line: 766, type: !37)
!1990 = !DILocalVariable(name: "remu_res", scope: !1981, file: !6, line: 770, type: !1405)
!1991 = !DILocalVariable(name: "shru_res", scope: !1981, file: !6, line: 774, type: !1405)
!1992 = distinct !DIAssignID()
!1993 = !DILocation(line: 0, scope: !1981)
!1994 = distinct !DIAssignID()
!1995 = !DILocation(line: 741, column: 5, scope: !1981)
!1996 = !DILocation(line: 745, column: 5, scope: !1981)
!1997 = !DILocation(line: 745, column: 22, scope: !1981)
!1998 = distinct !DIAssignID()
!1999 = !DILocation(line: 746, column: 5, scope: !1981)
!2000 = !DILocation(line: 746, column: 23, scope: !1981)
!2001 = distinct !DIAssignID()
!2002 = !DILocation(line: 751, column: 21, scope: !1981)
!2003 = !DILocation(line: 752, column: 22, scope: !1981)
!2004 = !DILocation(line: 754, column: 5, scope: !1981)
!2005 = !DILocation(line: 758, column: 29, scope: !1981)
!2006 = !DILocation(line: 759, column: 5, scope: !1981)
!2007 = !DILocation(line: 762, column: 31, scope: !1981)
!2008 = !DILocation(line: 763, column: 5, scope: !1981)
!2009 = !DILocation(line: 766, column: 29, scope: !1981)
!2010 = !DILocation(line: 767, column: 5, scope: !1981)
!2011 = !DILocation(line: 770, column: 31, scope: !1981)
!2012 = !DILocation(line: 771, column: 5, scope: !1981)
!2013 = !DILocation(line: 774, column: 31, scope: !1981)
!2014 = !DILocation(line: 775, column: 5, scope: !1981)
!2015 = !DILocation(line: 777, column: 5, scope: !1981)
!2016 = !DILocation(line: 778, column: 1, scope: !1981)
!2017 = distinct !DISubprogram(name: "print_int_array", scope: !6, file: !6, line: 823, type: !2018, scopeLine: 823, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2020)
!2018 = !DISubroutineType(types: !2019)
!2019 = !{null, !58, !1896}
!2020 = !{!2021, !2022, !2023}
!2021 = !DILocalVariable(name: "arr", arg: 1, scope: !2017, file: !6, line: 823, type: !58)
!2022 = !DILocalVariable(name: "size", arg: 2, scope: !2017, file: !6, line: 823, type: !1896)
!2023 = !DILocalVariable(name: "i", scope: !2024, file: !6, line: 825, type: !1896)
!2024 = distinct !DILexicalBlock(scope: !2017, file: !6, line: 825, column: 5)
!2025 = !DILocation(line: 0, scope: !2017)
!2026 = !DILocation(line: 824, column: 5, scope: !2017)
!2027 = !DILocation(line: 0, scope: !2024)
!2028 = !DILocation(line: 825, column: 26, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2024, file: !6, line: 825, column: 5)
!2030 = !DILocation(line: 825, column: 5, scope: !2024)
!2031 = !DILocation(line: 828, column: 5, scope: !2017)
!2032 = !DILocation(line: 829, column: 1, scope: !2017)
!2033 = !DILocation(line: 826, column: 23, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2029, file: !6, line: 825, column: 39)
!2035 = !DILocation(line: 826, column: 9, scope: !2034)
!2036 = !DILocation(line: 825, column: 35, scope: !2029)
!2037 = distinct !{!2037, !2030, !2038, !1762, !1154}
!2038 = !DILocation(line: 827, column: 5, scope: !2024)
!2039 = distinct !DISubprogram(name: "modify_sensor_by_ref", scope: !6, file: !6, line: 832, type: !2040, scopeLine: 832, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2050)
!2040 = !DISubroutineType(types: !2041)
!2041 = !{null, !2042}
!2042 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2043, size: 32)
!2043 = !DIDerivedType(tag: DW_TAG_typedef, name: "SensorData", file: !6, line: 794, baseType: !2044)
!2044 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 789, size: 224, elements: !2045)
!2045 = !{!2046, !2047, !2048, !2049}
!2046 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !2044, file: !6, line: 790, baseType: !25, size: 32)
!2047 = !DIDerivedType(tag: DW_TAG_member, name: "temperature", scope: !2044, file: !6, line: 791, baseType: !27, size: 32, offset: 32)
!2048 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2044, file: !6, line: 792, baseType: !602, size: 128, offset: 64)
!2049 = !DIDerivedType(tag: DW_TAG_member, name: "is_active", scope: !2044, file: !6, line: 793, baseType: !69, size: 8, offset: 192)
!2050 = !{!2051}
!2051 = !DILocalVariable(name: "sensor", arg: 1, scope: !2039, file: !6, line: 832, type: !2042)
!2052 = !DILocation(line: 0, scope: !2039)
!2053 = !DILocation(line: 833, column: 13, scope: !2039)
!2054 = !DILocation(line: 833, column: 25, scope: !2039)
!2055 = !{!2056, !1569, i64 4}
!2056 = !{!"", !1290, i64 0, !1569, i64 4, !1241, i64 8, !1298, i64 24}
!2057 = !DILocation(line: 834, column: 20, scope: !2039)
!2058 = !DILocation(line: 834, column: 5, scope: !2039)
!2059 = !DILocation(line: 835, column: 13, scope: !2039)
!2060 = !DILocation(line: 835, column: 23, scope: !2039)
!2061 = !{!2056, !1298, i64 24}
!2062 = !DILocation(line: 836, column: 1, scope: !2039)
!2063 = distinct !DISubprogram(name: "test_complex_data_types", scope: !6, file: !6, line: 839, type: !1194, scopeLine: 839, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2064)
!2064 = !{!2065, !2067, !2069, !2072, !2073, !2074, !2082, !2084, !2086, !2088}
!2065 = !DILocalVariable(name: "simple_array", scope: !2063, file: !6, line: 844, type: !2066)
!2066 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 160, elements: !165)
!2067 = !DILocalVariable(name: "i", scope: !2068, file: !6, line: 846, type: !24)
!2068 = distinct !DILexicalBlock(scope: !2063, file: !6, line: 846, column: 5)
!2069 = !DILocalVariable(name: "matrix", scope: !2063, file: !6, line: 858, type: !2070)
!2070 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 192, elements: !2071)
!2071 = !{!599, !627}
!2072 = !DILocalVariable(name: "sensor1", scope: !2063, file: !6, line: 864, type: !2043)
!2073 = !DILocalVariable(name: "p_sensor", scope: !2063, file: !6, line: 874, type: !2042)
!2074 = !DILocalVariable(name: "converter", scope: !2063, file: !6, line: 886, type: !2075)
!2075 = !DIDerivedType(tag: DW_TAG_typedef, name: "DataConverter", file: !6, line: 801, baseType: !2076)
!2076 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !6, line: 797, size: 32, elements: !2077)
!2077 = !{!2078, !2079, !2080}
!2078 = !DIDerivedType(tag: DW_TAG_member, name: "i_val", scope: !2076, file: !6, line: 798, baseType: !25, size: 32)
!2079 = !DIDerivedType(tag: DW_TAG_member, name: "f_val", scope: !2076, file: !6, line: 799, baseType: !27, size: 32)
!2080 = !DIDerivedType(tag: DW_TAG_member, name: "bytes", scope: !2076, file: !6, line: 800, baseType: !2081, size: 32)
!2081 = !DICompositeType(tag: DW_TAG_array_type, baseType: !45, size: 32, elements: !593)
!2082 = !DILocalVariable(name: "current_state", scope: !2063, file: !6, line: 904, type: !2083)
!2083 = !DIDerivedType(tag: DW_TAG_typedef, name: "DeviceState", file: !6, line: 809, baseType: !5)
!2084 = !DILocalVariable(name: "sensor_inventory", scope: !2063, file: !6, line: 918, type: !2085)
!2085 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2043, size: 448, elements: !598)
!2086 = !DILocalVariable(name: "i", scope: !2087, file: !6, line: 923, type: !24)
!2087 = distinct !DILexicalBlock(scope: !2063, file: !6, line: 923, column: 5)
!2088 = !DILocalVariable(name: "status", scope: !2063, file: !6, line: 930, type: !2089)
!2089 = !DIDerivedType(tag: DW_TAG_typedef, name: "DeviceStatus", file: !6, line: 817, baseType: !2090)
!2090 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !6, line: 812, size: 8, elements: !2091)
!2091 = !{!2092, !2093, !2094, !2095}
!2092 = !DIDerivedType(tag: DW_TAG_member, name: "power_on", scope: !2090, file: !6, line: 813, baseType: !45, size: 1, flags: DIFlagBitField, extraData: i64 0)
!2093 = !DIDerivedType(tag: DW_TAG_member, name: "wifi_connected", scope: !2090, file: !6, line: 814, baseType: !45, size: 1, offset: 1, flags: DIFlagBitField, extraData: i64 0)
!2094 = !DIDerivedType(tag: DW_TAG_member, name: "error_code", scope: !2090, file: !6, line: 815, baseType: !45, size: 4, offset: 2, flags: DIFlagBitField, extraData: i64 0)
!2095 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2090, file: !6, line: 816, baseType: !45, size: 2, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!2096 = distinct !DIAssignID()
!2097 = !DILocation(line: 0, scope: !2063)
!2098 = distinct !DIAssignID()
!2099 = distinct !DIAssignID()
!2100 = !DILocation(line: 840, column: 5, scope: !2063)
!2101 = !DILocation(line: 843, column: 5, scope: !2063)
!2102 = !DILocation(line: 844, column: 5, scope: !2063)
!2103 = !DILocation(line: 844, column: 9, scope: !2063)
!2104 = distinct !DIAssignID()
!2105 = distinct !DIAssignID()
!2106 = distinct !DIAssignID()
!2107 = distinct !DIAssignID()
!2108 = distinct !DIAssignID()
!2109 = !DILocation(line: 845, column: 5, scope: !2063)
!2110 = !DILocation(line: 0, scope: !2068)
!2111 = !DILocation(line: 846, column: 5, scope: !2068)
!2112 = !DILocation(line: 849, column: 5, scope: !2063)
!2113 = !DILocation(line: 851, column: 21, scope: !2063)
!2114 = distinct !DIAssignID()
!2115 = !DILocation(line: 852, column: 5, scope: !2063)
!2116 = !DILocation(line: 0, scope: !2017, inlinedAt: !2117)
!2117 = distinct !DILocation(line: 855, column: 5, scope: !2063)
!2118 = !DILocation(line: 824, column: 5, scope: !2017, inlinedAt: !2117)
!2119 = !DILocation(line: 0, scope: !2024, inlinedAt: !2117)
!2120 = !DILocation(line: 826, column: 23, scope: !2034, inlinedAt: !2117)
!2121 = !DILocation(line: 826, column: 9, scope: !2034, inlinedAt: !2117)
!2122 = !DILocation(line: 825, column: 35, scope: !2029, inlinedAt: !2117)
!2123 = !DILocation(line: 825, column: 26, scope: !2029, inlinedAt: !2117)
!2124 = !DILocation(line: 825, column: 5, scope: !2024, inlinedAt: !2117)
!2125 = distinct !{!2125, !2124, !2126, !1762, !1154}
!2126 = !DILocation(line: 827, column: 5, scope: !2024, inlinedAt: !2117)
!2127 = !DILocation(line: 828, column: 5, scope: !2017, inlinedAt: !2117)
!2128 = !DILocation(line: 859, column: 5, scope: !2063)
!2129 = !DILocation(line: 863, column: 5, scope: !2063)
!2130 = !DILocation(line: 864, column: 5, scope: !2063)
!2131 = !DILocation(line: 865, column: 16, scope: !2063)
!2132 = !{!2056, !1290, i64 0}
!2133 = distinct !DIAssignID()
!2134 = !DILocation(line: 866, column: 13, scope: !2063)
!2135 = !DILocation(line: 866, column: 25, scope: !2063)
!2136 = distinct !DIAssignID()
!2137 = !DILocation(line: 867, column: 20, scope: !2063)
!2138 = !DILocation(line: 867, column: 5, scope: !2063)
!2139 = !DILocation(line: 868, column: 13, scope: !2063)
!2140 = !DILocation(line: 868, column: 23, scope: !2063)
!2141 = distinct !DIAssignID()
!2142 = !DILocation(line: 870, column: 5, scope: !2063)
!2143 = !DILocation(line: 875, column: 27, scope: !2063)
!2144 = !DILocation(line: 876, column: 5, scope: !2063)
!2145 = !DILocation(line: 0, scope: !2039, inlinedAt: !2146)
!2146 = distinct !DILocation(line: 879, column: 5, scope: !2063)
!2147 = !DILocation(line: 833, column: 25, scope: !2039, inlinedAt: !2146)
!2148 = distinct !DIAssignID()
!2149 = !DILocation(line: 834, column: 5, scope: !2039, inlinedAt: !2146)
!2150 = distinct !DIAssignID()
!2151 = !DILocation(line: 835, column: 23, scope: !2039, inlinedAt: !2146)
!2152 = distinct !DIAssignID()
!2153 = !DILocation(line: 881, column: 26, scope: !2063)
!2154 = !DILocation(line: 880, column: 5, scope: !2063)
!2155 = !DILocation(line: 885, column: 5, scope: !2063)
!2156 = !DILocation(line: 887, column: 5, scope: !2063)
!2157 = !DILocation(line: 891, column: 5, scope: !2063)
!2158 = !DILocation(line: 892, column: 5, scope: !2063)
!2159 = !DILocation(line: 893, column: 5, scope: !2063)
!2160 = !DILocation(line: 898, column: 5, scope: !2063)
!2161 = !DILocation(line: 899, column: 5, scope: !2063)
!2162 = !DILocation(line: 903, column: 5, scope: !2063)
!2163 = !DILocation(line: 905, column: 5, scope: !2063)
!2164 = !DILocation(line: 911, column: 28, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2063, file: !6, line: 908, column: 28)
!2166 = !DILocation(line: 917, column: 5, scope: !2063)
!2167 = !DILocation(line: 918, column: 5, scope: !2063)
!2168 = !DILocation(line: 919, column: 27, scope: !2063)
!2169 = !{i64 0, i64 4, !1289, i64 4, i64 4, !1568, i64 8, i64 16, !1944, i64 24, i64 1, !1297}
!2170 = distinct !DIAssignID()
!2171 = !{i64 0, i64 4, !1568, i64 4, i64 16, !1944, i64 20, i64 1, !1297}
!2172 = distinct !DIAssignID()
!2173 = !{i64 0, i64 16, !1944, i64 16, i64 1, !1297}
!2174 = distinct !DIAssignID()
!2175 = !{i64 0, i64 1, !1297}
!2176 = distinct !DIAssignID()
!2177 = distinct !DIAssignID()
!2178 = !DILocation(line: 920, column: 5, scope: !2063)
!2179 = !DILocation(line: 920, column: 27, scope: !2063)
!2180 = distinct !DIAssignID()
!2181 = distinct !DIAssignID()
!2182 = distinct !DIAssignID()
!2183 = distinct !DIAssignID()
!2184 = distinct !DIAssignID()
!2185 = !DILocation(line: 922, column: 5, scope: !2063)
!2186 = !DILocation(line: 0, scope: !2087)
!2187 = !DILocation(line: 923, column: 5, scope: !2087)
!2188 = !DILocation(line: 847, column: 23, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2190, file: !6, line: 846, column: 33)
!2190 = distinct !DILexicalBlock(scope: !2068, file: !6, line: 846, column: 5)
!2191 = !DILocation(line: 847, column: 9, scope: !2189)
!2192 = !DILocation(line: 846, column: 29, scope: !2190)
!2193 = !DILocation(line: 846, column: 23, scope: !2190)
!2194 = distinct !{!2194, !2111, !2195, !1762, !1154}
!2195 = !DILocation(line: 848, column: 5, scope: !2068)
!2196 = !DILocation(line: 929, column: 5, scope: !2063)
!2197 = !DILocation(line: 931, column: 5, scope: !2063)
!2198 = !DILocation(line: 939, column: 5, scope: !2063)
!2199 = !DILocation(line: 943, column: 9, scope: !2200)
!2200 = distinct !DILexicalBlock(scope: !2201, file: !6, line: 942, column: 52)
!2201 = distinct !DILexicalBlock(scope: !2063, file: !6, line: 942, column: 9)
!2202 = !DILocation(line: 948, column: 5, scope: !2063)
!2203 = !DILocation(line: 949, column: 1, scope: !2063)
!2204 = !DILocation(line: 924, column: 53, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2206, file: !6, line: 923, column: 33)
!2206 = distinct !DILexicalBlock(scope: !2087, file: !6, line: 923, column: 5)
!2207 = !DILocation(line: 924, column: 73, scope: !2205)
!2208 = !DILocation(line: 924, column: 97, scope: !2205)
!2209 = !DILocation(line: 924, column: 9, scope: !2205)
!2210 = !DILocation(line: 923, column: 29, scope: !2206)
!2211 = !DILocation(line: 923, column: 23, scope: !2206)
!2212 = distinct !{!2212, !2187, !2213, !1762, !1154}
!2213 = !DILocation(line: 925, column: 5, scope: !2087)
!2214 = distinct !DISubprogram(name: "test_while_and_do_while_loops", scope: !6, file: !6, line: 959, type: !1194, scopeLine: 959, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2215)
!2215 = !{!2216, !2217, !2218, !2219, !2220, !2221}
!2216 = !DILocalVariable(name: "while_counter", scope: !2214, file: !6, line: 966, type: !24)
!2217 = !DILocalVariable(name: "while_sum", scope: !2214, file: !6, line: 967, type: !24)
!2218 = !DILocalVariable(name: "zero_trip_counter", scope: !2214, file: !6, line: 983, type: !24)
!2219 = !DILocalVariable(name: "do_while_counter", scope: !2214, file: !6, line: 999, type: !24)
!2220 = !DILocalVariable(name: "do_while_sum", scope: !2214, file: !6, line: 1000, type: !24)
!2221 = !DILocalVariable(name: "one_trip_counter", scope: !2214, file: !6, line: 1016, type: !24)
!2222 = !DILocation(line: 960, column: 5, scope: !2214)
!2223 = !DILocation(line: 963, column: 5, scope: !2214)
!2224 = !DILocation(line: 0, scope: !2214)
!2225 = !DILocation(line: 968, column: 5, scope: !2214)
!2226 = !DILocation(line: 969, column: 5, scope: !2214)
!2227 = !DILocation(line: 970, column: 19, scope: !2228)
!2228 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 969, column: 31)
!2229 = !DILocation(line: 971, column: 9, scope: !2228)
!2230 = !DILocation(line: 972, column: 22, scope: !2228)
!2231 = !DILocation(line: 969, column: 26, scope: !2214)
!2232 = distinct !{!2232, !2226, !2233, !1762, !1154}
!2233 = !DILocation(line: 973, column: 5, scope: !2214)
!2234 = !DILocation(line: 974, column: 5, scope: !2214)
!2235 = !DILocation(line: 976, column: 9, scope: !2236)
!2236 = distinct !DILexicalBlock(scope: !2237, file: !6, line: 975, column: 26)
!2237 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 975, column: 9)
!2238 = !DILocation(line: 982, column: 5, scope: !2214)
!2239 = !DILocation(line: 990, column: 9, scope: !2240)
!2240 = distinct !DILexicalBlock(scope: !2241, file: !6, line: 989, column: 34)
!2241 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 989, column: 9)
!2242 = !DILocation(line: 996, column: 5, scope: !2214)
!2243 = !DILocation(line: 1001, column: 5, scope: !2214)
!2244 = !DILocation(line: 1002, column: 5, scope: !2214)
!2245 = !DILocation(line: 1003, column: 22, scope: !2246)
!2246 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 1002, column: 8)
!2247 = !DILocation(line: 1004, column: 9, scope: !2246)
!2248 = !DILocation(line: 1005, column: 25, scope: !2246)
!2249 = !DILocation(line: 1006, column: 31, scope: !2214)
!2250 = !DILocation(line: 1006, column: 5, scope: !2246)
!2251 = distinct !{!2251, !2244, !2252, !1762, !1154}
!2252 = !DILocation(line: 1006, column: 34, scope: !2214)
!2253 = !DILocation(line: 1007, column: 5, scope: !2214)
!2254 = !DILocation(line: 1009, column: 9, scope: !2255)
!2255 = distinct !DILexicalBlock(scope: !2256, file: !6, line: 1008, column: 29)
!2256 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 1008, column: 9)
!2257 = !DILocation(line: 1015, column: 5, scope: !2214)
!2258 = !DILocation(line: 1018, column: 9, scope: !2259)
!2259 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 1017, column: 8)
!2260 = !DILocation(line: 1022, column: 5, scope: !2214)
!2261 = !DILocation(line: 1024, column: 9, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2263, file: !6, line: 1023, column: 33)
!2263 = distinct !DILexicalBlock(scope: !2214, file: !6, line: 1023, column: 9)
!2264 = !DILocation(line: 1029, column: 5, scope: !2214)
!2265 = !DILocation(line: 1030, column: 1, scope: !2214)
!2266 = distinct !DISubprogram(name: "test_break_and_continue", scope: !6, file: !6, line: 1039, type: !1194, scopeLine: 1039, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2267)
!2267 = !{!2268, !2269, !2271, !2272, !2273, !2274, !2276}
!2268 = !DILocalVariable(name: "continue_sum", scope: !2266, file: !6, line: 1046, type: !24)
!2269 = !DILocalVariable(name: "i", scope: !2270, file: !6, line: 1047, type: !24)
!2270 = distinct !DILexicalBlock(scope: !2266, file: !6, line: 1047, column: 5)
!2271 = !DILocalVariable(name: "break_counter", scope: !2266, file: !6, line: 1067, type: !24)
!2272 = !DILocalVariable(name: "outer_loop_runs", scope: !2266, file: !6, line: 1085, type: !24)
!2273 = !DILocalVariable(name: "total_inner_loop_runs", scope: !2266, file: !6, line: 1086, type: !24)
!2274 = !DILocalVariable(name: "i", scope: !2275, file: !6, line: 1087, type: !24)
!2275 = distinct !DILexicalBlock(scope: !2266, file: !6, line: 1087, column: 5)
!2276 = !DILocalVariable(name: "j", scope: !2277, file: !6, line: 1089, type: !24)
!2277 = distinct !DILexicalBlock(scope: !2278, file: !6, line: 1089, column: 9)
!2278 = distinct !DILexicalBlock(scope: !2279, file: !6, line: 1087, column: 33)
!2279 = distinct !DILexicalBlock(scope: !2275, file: !6, line: 1087, column: 5)
!2280 = !DILocation(line: 1040, column: 5, scope: !2266)
!2281 = !DILocation(line: 1044, column: 5, scope: !2266)
!2282 = !DILocation(line: 1045, column: 5, scope: !2266)
!2283 = !DILocation(line: 0, scope: !2266)
!2284 = !DILocation(line: 0, scope: !2270)
!2285 = !DILocation(line: 1056, column: 5, scope: !2266)
!2286 = !DILocation(line: 1058, column: 9, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2288, file: !6, line: 1057, column: 29)
!2288 = distinct !DILexicalBlock(scope: !2266, file: !6, line: 1057, column: 9)
!2289 = !DILocation(line: 1065, column: 5, scope: !2266)
!2290 = !DILocation(line: 1066, column: 5, scope: !2266)
!2291 = !DILocation(line: 1075, column: 5, scope: !2266)
!2292 = !DILocation(line: 1077, column: 9, scope: !2293)
!2293 = distinct !DILexicalBlock(scope: !2294, file: !6, line: 1076, column: 29)
!2294 = distinct !DILexicalBlock(scope: !2266, file: !6, line: 1076, column: 9)
!2295 = !DILocation(line: 1084, column: 5, scope: !2266)
!2296 = !DILocation(line: 0, scope: !2275)
!2297 = !DILocation(line: 1099, column: 5, scope: !2266)
!2298 = !DILocation(line: 1100, column: 5, scope: !2266)
!2299 = !DILocation(line: 1103, column: 9, scope: !2300)
!2300 = distinct !DILexicalBlock(scope: !2301, file: !6, line: 1102, column: 61)
!2301 = distinct !DILexicalBlock(scope: !2266, file: !6, line: 1102, column: 9)
!2302 = !DILocation(line: 1108, column: 5, scope: !2266)
!2303 = !DILocation(line: 1109, column: 1, scope: !2266)
!2304 = distinct !DISubprogram(name: "add_function_1", scope: !6, file: !6, line: 1124, type: !61, scopeLine: 1124, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2305)
!2305 = !{!2306, !2307}
!2306 = !DILocalVariable(name: "a", arg: 1, scope: !2304, file: !6, line: 1124, type: !24)
!2307 = !DILocalVariable(name: "b", arg: 2, scope: !2304, file: !6, line: 1124, type: !24)
!2308 = !DILocation(line: 0, scope: !2304)
!2309 = !DILocation(line: 1125, column: 5, scope: !2304)
!2310 = !DILocation(line: 1126, column: 14, scope: !2304)
!2311 = !DILocation(line: 1126, column: 5, scope: !2304)
!2312 = distinct !DISubprogram(name: "multiply_function_1", scope: !6, file: !6, line: 1129, type: !61, scopeLine: 1129, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2313)
!2313 = !{!2314, !2315}
!2314 = !DILocalVariable(name: "a", arg: 1, scope: !2312, file: !6, line: 1129, type: !24)
!2315 = !DILocalVariable(name: "b", arg: 2, scope: !2312, file: !6, line: 1129, type: !24)
!2316 = !DILocation(line: 0, scope: !2312)
!2317 = !DILocation(line: 1130, column: 5, scope: !2312)
!2318 = !DILocation(line: 1131, column: 14, scope: !2312)
!2319 = !DILocation(line: 1131, column: 5, scope: !2312)
!2320 = distinct !DISubprogram(name: "subtract_function_1", scope: !6, file: !6, line: 1134, type: !61, scopeLine: 1134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2321)
!2321 = !{!2322, !2323}
!2322 = !DILocalVariable(name: "a", arg: 1, scope: !2320, file: !6, line: 1134, type: !24)
!2323 = !DILocalVariable(name: "b", arg: 2, scope: !2320, file: !6, line: 1134, type: !24)
!2324 = !DILocation(line: 0, scope: !2320)
!2325 = !DILocation(line: 1135, column: 5, scope: !2320)
!2326 = !DILocation(line: 1136, column: 14, scope: !2320)
!2327 = !DILocation(line: 1136, column: 5, scope: !2320)
!2328 = distinct !DISubprogram(name: "test_table_operations", scope: !6, file: !6, line: 1139, type: !1194, scopeLine: 1139, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2329)
!2329 = !{!2330, !2331, !2332}
!2330 = !DILocalVariable(name: "initial_size", scope: !2328, file: !6, line: 1144, type: !24)
!2331 = !DILocalVariable(name: "final_size", scope: !2328, file: !6, line: 1175, type: !24)
!2332 = !DILocalVariable(name: "expanded_size", scope: !2328, file: !6, line: 1187, type: !24)
!2333 = !DILocation(line: 1140, column: 5, scope: !2328)
!2334 = !DILocation(line: 1143, column: 5, scope: !2328)
!2335 = !DILocation(line: 1144, column: 24, scope: !2328)
!2336 = !DILocation(line: 0, scope: !2328)
!2337 = !DILocation(line: 1145, column: 5, scope: !2328)
!2338 = !DILocation(line: 1146, column: 22, scope: !2339)
!2339 = distinct !DILexicalBlock(scope: !2328, file: !6, line: 1146, column: 9)
!2340 = !DILocation(line: 1146, column: 9, scope: !2328)
!2341 = !DILocation(line: 1147, column: 9, scope: !2342)
!2342 = distinct !DILexicalBlock(scope: !2339, file: !6, line: 1146, column: 29)
!2343 = !DILocation(line: 1148, column: 5, scope: !2342)
!2344 = !DILocation(line: 1149, column: 9, scope: !2345)
!2345 = distinct !DILexicalBlock(scope: !2339, file: !6, line: 1148, column: 12)
!2346 = !DILocation(line: 1153, column: 5, scope: !2328)
!2347 = !DILocation(line: 1154, column: 5, scope: !2328)
!2348 = !DILocation(line: 1155, column: 5, scope: !2328)
!2349 = !DILocation(line: 1156, column: 5, scope: !2328)
!2350 = !DILocation(line: 1157, column: 5, scope: !2328)
!2351 = !DILocation(line: 1160, column: 5, scope: !2328)
!2352 = !DILocation(line: 1161, column: 5, scope: !2328)
!2353 = !DILocation(line: 1162, column: 5, scope: !2328)
!2354 = !DILocation(line: 1163, column: 5, scope: !2328)
!2355 = !DILocation(line: 1164, column: 5, scope: !2328)
!2356 = !DILocation(line: 1167, column: 5, scope: !2328)
!2357 = !DILocation(line: 1168, column: 5, scope: !2328)
!2358 = !DILocation(line: 1169, column: 5, scope: !2328)
!2359 = !DILocation(line: 1170, column: 5, scope: !2328)
!2360 = !DILocation(line: 1171, column: 5, scope: !2328)
!2361 = !DILocation(line: 1174, column: 5, scope: !2328)
!2362 = !DILocation(line: 1175, column: 22, scope: !2328)
!2363 = !DILocation(line: 1176, column: 5, scope: !2328)
!2364 = !DILocation(line: 1177, column: 20, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2328, file: !6, line: 1177, column: 9)
!2366 = !DILocation(line: 0, scope: !2365)
!2367 = !DILocation(line: 1184, column: 5, scope: !2328)
!2368 = !DILocation(line: 1185, column: 5, scope: !2328)
!2369 = !DILocation(line: 1186, column: 5, scope: !2328)
!2370 = !DILocation(line: 1187, column: 25, scope: !2328)
!2371 = !DILocation(line: 1188, column: 5, scope: !2328)
!2372 = !DILocation(line: 1189, column: 23, scope: !2373)
!2373 = distinct !DILexicalBlock(scope: !2328, file: !6, line: 1189, column: 9)
!2374 = !DILocation(line: 1189, column: 9, scope: !2328)
!2375 = !DILocation(line: 0, scope: !2373)
!2376 = !DILocation(line: 1196, column: 5, scope: !2328)
!2377 = !DILocation(line: 1197, column: 28, scope: !2378)
!2378 = distinct !DILexicalBlock(scope: !2328, file: !6, line: 1197, column: 9)
!2379 = !DILocation(line: 1198, column: 9, scope: !2380)
!2380 = distinct !DILexicalBlock(scope: !2378, file: !6, line: 1197, column: 71)
!2381 = !DILocation(line: 1199, column: 9, scope: !2380)
!2382 = !DILocation(line: 1200, column: 9, scope: !2380)
!2383 = !DILocation(line: 1201, column: 9, scope: !2380)
!2384 = !DILocation(line: 1202, column: 9, scope: !2380)
!2385 = !DILocation(line: 1204, column: 5, scope: !2380)
!2386 = !DILocation(line: 0, scope: !2378)
!2387 = !DILocation(line: 1207, column: 5, scope: !2328)
!2388 = !DILocation(line: 1208, column: 1, scope: !2328)
!2389 = !DISubprogram(name: "OP_table_size", scope: !6, file: !6, line: 1113, type: !2390, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2390 = !DISubroutineType(types: !2391)
!2391 = !{!24, !24}
!2392 = !DISubprogram(name: "OP_table_init", scope: !6, file: !6, line: 1114, type: !2393, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2393 = !DISubroutineType(types: !2394)
!2394 = !{null, !24, !24, !24, !24, !24}
!2395 = !DISubprogram(name: "OP_table_fill", scope: !6, file: !6, line: 1116, type: !2396, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2396 = !DISubroutineType(types: !2397)
!2397 = !{null, !24, !24, !24, !24}
!2398 = !DISubprogram(name: "OP_table_copy", scope: !6, file: !6, line: 1115, type: !2393, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2399 = distinct !DISubprogram(name: "test_call_indirect_with_table", scope: !6, file: !6, line: 1210, type: !1194, scopeLine: 1210, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2400)
!2400 = !{!2401, !2402, !2403, !2404, !2407, !2408, !2409, !2410, !2412, !2414, !2417, !2418, !2419, !2421}
!2401 = !DILocalVariable(name: "func_idx_0", scope: !2399, file: !6, line: 1226, type: !24)
!2402 = !DILocalVariable(name: "func_idx_1", scope: !2399, file: !6, line: 1229, type: !24)
!2403 = !DILocalVariable(name: "func_idx_2", scope: !2399, file: !6, line: 1232, type: !24)
!2404 = !DILocalVariable(name: "func_table", scope: !2399, file: !6, line: 1247, type: !2405)
!2405 = !DICompositeType(tag: DW_TAG_array_type, baseType: !2406, size: 96, elements: !626)
!2406 = !DIDerivedType(tag: DW_TAG_typedef, name: "binary_func_t", file: !6, line: 1121, baseType: !60)
!2407 = !DILocalVariable(name: "result_add", scope: !2399, file: !6, line: 1261, type: !24)
!2408 = !DILocalVariable(name: "result_mul", scope: !2399, file: !6, line: 1266, type: !24)
!2409 = !DILocalVariable(name: "result_sub", scope: !2399, file: !6, line: 1271, type: !24)
!2410 = !DILocalVariable(name: "dynamic_results", scope: !2399, file: !6, line: 1278, type: !2411)
!2411 = !DICompositeType(tag: DW_TAG_array_type, baseType: !24, size: 96, elements: !626)
!2412 = !DILocalVariable(name: "i", scope: !2413, file: !6, line: 1279, type: !24)
!2413 = distinct !DILexicalBlock(scope: !2399, file: !6, line: 1279, column: 5)
!2414 = !DILocalVariable(name: "result", scope: !2415, file: !6, line: 1281, type: !24)
!2415 = distinct !DILexicalBlock(scope: !2416, file: !6, line: 1279, column: 33)
!2416 = distinct !DILexicalBlock(scope: !2413, file: !6, line: 1279, column: 5)
!2417 = !DILocalVariable(name: "expected_dynamic", scope: !2399, file: !6, line: 1287, type: !2411)
!2418 = !DILocalVariable(name: "dynamic_pass", scope: !2399, file: !6, line: 1288, type: !69)
!2419 = !DILocalVariable(name: "i", scope: !2420, file: !6, line: 1289, type: !24)
!2420 = distinct !DILexicalBlock(scope: !2399, file: !6, line: 1289, column: 5)
!2421 = !DILocalVariable(name: "all_pass", scope: !2399, file: !6, line: 1305, type: !69)
!2422 = distinct !DIAssignID()
!2423 = !DILocation(line: 0, scope: !2399)
!2424 = distinct !DIAssignID()
!2425 = distinct !DIAssignID()
!2426 = !DILocation(line: 1211, column: 5, scope: !2399)
!2427 = !DILocation(line: 1214, column: 5, scope: !2399)
!2428 = !DILocation(line: 1215, column: 5, scope: !2399)
!2429 = !DILocation(line: 1216, column: 5, scope: !2399)
!2430 = !DILocation(line: 1218, column: 5, scope: !2399)
!2431 = !DILocation(line: 1219, column: 5, scope: !2399)
!2432 = !DILocation(line: 1221, column: 5, scope: !2399)
!2433 = !DILocation(line: 1222, column: 5, scope: !2399)
!2434 = !DILocation(line: 1225, column: 5, scope: !2399)
!2435 = !DILocation(line: 1226, column: 22, scope: !2399)
!2436 = !DILocation(line: 1227, column: 5, scope: !2399)
!2437 = !DILocation(line: 1229, column: 22, scope: !2399)
!2438 = !DILocation(line: 1230, column: 5, scope: !2399)
!2439 = !DILocation(line: 1232, column: 22, scope: !2399)
!2440 = !DILocation(line: 1233, column: 5, scope: !2399)
!2441 = !DILocation(line: 1236, column: 20, scope: !2442)
!2442 = distinct !DILexicalBlock(scope: !2399, file: !6, line: 1236, column: 9)
!2443 = !DILocation(line: 1236, column: 25, scope: !2442)
!2444 = !DILocation(line: 0, scope: !2442)
!2445 = !DILocation(line: 1243, column: 5, scope: !2399)
!2446 = !DILocation(line: 1244, column: 5, scope: !2399)
!2447 = !DILocation(line: 1247, column: 5, scope: !2399)
!2448 = !DILocation(line: 1248, column: 5, scope: !2399)
!2449 = !DILocation(line: 1249, column: 19, scope: !2399)
!2450 = distinct !DIAssignID()
!2451 = !DILocation(line: 1251, column: 5, scope: !2399)
!2452 = !DILocation(line: 1252, column: 5, scope: !2399)
!2453 = !DILocation(line: 1252, column: 19, scope: !2399)
!2454 = distinct !DIAssignID()
!2455 = !DILocation(line: 1254, column: 5, scope: !2399)
!2456 = !DILocation(line: 1255, column: 5, scope: !2399)
!2457 = !DILocation(line: 1255, column: 19, scope: !2399)
!2458 = distinct !DIAssignID()
!2459 = !DILocation(line: 1257, column: 5, scope: !2399)
!2460 = !DILocation(line: 1260, column: 5, scope: !2399)
!2461 = !DILocation(line: 0, scope: !2304, inlinedAt: !2462)
!2462 = distinct !DILocation(line: 1261, column: 22, scope: !2399)
!2463 = !DILocation(line: 1125, column: 5, scope: !2304, inlinedAt: !2462)
!2464 = !DILocation(line: 1262, column: 5, scope: !2399)
!2465 = !DILocation(line: 1265, column: 5, scope: !2399)
!2466 = !DILocation(line: 0, scope: !2312, inlinedAt: !2467)
!2467 = distinct !DILocation(line: 1266, column: 22, scope: !2399)
!2468 = !DILocation(line: 1130, column: 5, scope: !2312, inlinedAt: !2467)
!2469 = !DILocation(line: 1267, column: 5, scope: !2399)
!2470 = !DILocation(line: 1270, column: 5, scope: !2399)
!2471 = !DILocation(line: 0, scope: !2320, inlinedAt: !2472)
!2472 = distinct !DILocation(line: 1271, column: 22, scope: !2399)
!2473 = !DILocation(line: 1135, column: 5, scope: !2320, inlinedAt: !2472)
!2474 = !DILocation(line: 1272, column: 5, scope: !2399)
!2475 = !DILocation(line: 1275, column: 5, scope: !2399)
!2476 = !DILocation(line: 1276, column: 5, scope: !2399)
!2477 = !DILocation(line: 1278, column: 5, scope: !2399)
!2478 = !DILocation(line: 0, scope: !2413)
!2479 = !DILocation(line: 1279, column: 5, scope: !2413)
!2480 = !DILocation(line: 1287, column: 5, scope: !2399)
!2481 = !DILocation(line: 1287, column: 9, scope: !2399)
!2482 = distinct !DIAssignID()
!2483 = distinct !DIAssignID()
!2484 = distinct !DIAssignID()
!2485 = !DILocation(line: 0, scope: !2420)
!2486 = !DILocation(line: 1289, column: 5, scope: !2420)
!2487 = !DILocation(line: 1280, column: 9, scope: !2415)
!2488 = !DILocation(line: 1281, column: 22, scope: !2415)
!2489 = !DILocation(line: 0, scope: !2415)
!2490 = !DILocation(line: 1282, column: 9, scope: !2415)
!2491 = !DILocation(line: 1282, column: 28, scope: !2415)
!2492 = !DILocation(line: 1283, column: 9, scope: !2415)
!2493 = !DILocation(line: 1279, column: 29, scope: !2416)
!2494 = !DILocation(line: 1279, column: 23, scope: !2416)
!2495 = distinct !{!2495, !2479, !2496, !1762, !1154}
!2496 = !DILocation(line: 1284, column: 5, scope: !2413)
!2497 = !DILocation(line: 0, scope: !2498)
!2498 = distinct !DILexicalBlock(scope: !2399, file: !6, line: 1297, column: 9)
!2499 = !DILocation(line: 1304, column: 5, scope: !2399)
!2500 = !DILocation(line: 1307, column: 9, scope: !2399)
!2501 = !DILocation(line: 1290, column: 13, scope: !2502)
!2502 = distinct !DILexicalBlock(scope: !2503, file: !6, line: 1290, column: 13)
!2503 = distinct !DILexicalBlock(scope: !2504, file: !6, line: 1289, column: 33)
!2504 = distinct !DILexicalBlock(scope: !2420, file: !6, line: 1289, column: 5)
!2505 = !DILocation(line: 1290, column: 35, scope: !2502)
!2506 = !DILocation(line: 1290, column: 32, scope: !2502)
!2507 = !DILocation(line: 1290, column: 13, scope: !2503)
!2508 = !DILocation(line: 1291, column: 13, scope: !2509)
!2509 = distinct !DILexicalBlock(scope: !2502, file: !6, line: 1290, column: 56)
!2510 = !DILocation(line: 1294, column: 9, scope: !2509)
!2511 = !DILocation(line: 1289, column: 29, scope: !2504)
!2512 = !DILocation(line: 1289, column: 23, scope: !2504)
!2513 = distinct !{!2513, !2486, !2514, !1762, !1154}
!2514 = !DILocation(line: 1295, column: 5, scope: !2420)
!2515 = !DILocation(line: 1308, column: 9, scope: !2516)
!2516 = distinct !DILexicalBlock(scope: !2517, file: !6, line: 1307, column: 19)
!2517 = distinct !DILexicalBlock(scope: !2399, file: !6, line: 1307, column: 9)
!2518 = !DILocation(line: 1309, column: 9, scope: !2516)
!2519 = !DILocation(line: 1310, column: 9, scope: !2516)
!2520 = !DILocation(line: 1311, column: 9, scope: !2516)
!2521 = !DILocation(line: 1312, column: 9, scope: !2516)
!2522 = !DILocation(line: 1314, column: 5, scope: !2516)
!2523 = !DILocation(line: 1315, column: 9, scope: !2524)
!2524 = distinct !DILexicalBlock(scope: !2517, file: !6, line: 1314, column: 12)
!2525 = !DILocation(line: 1322, column: 9, scope: !2526)
!2526 = distinct !DILexicalBlock(scope: !2527, file: !6, line: 1320, column: 28)
!2527 = distinct !DILexicalBlock(scope: !2524, file: !6, line: 1320, column: 13)
!2528 = !DILocation(line: 0, scope: !2517)
!2529 = !DILocation(line: 1325, column: 5, scope: !2399)
!2530 = !DILocation(line: 1326, column: 1, scope: !2399)
!2531 = !DISubprogram(name: "OP_table_set", scope: !6, file: !6, line: 1118, type: !2532, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2532 = !DISubroutineType(types: !2533)
!2533 = !{null, !24, !24, !24}
!2534 = !DISubprogram(name: "OP_table_get", scope: !6, file: !6, line: 1117, type: !61, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2535 = distinct !DISubprogram(name: "add_function", scope: !6, file: !6, line: 1333, type: !61, scopeLine: 1333, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2536)
!2536 = !{!2537, !2538}
!2537 = !DILocalVariable(name: "a", arg: 1, scope: !2535, file: !6, line: 1333, type: !24)
!2538 = !DILocalVariable(name: "b", arg: 2, scope: !2535, file: !6, line: 1333, type: !24)
!2539 = !DILocation(line: 0, scope: !2535)
!2540 = !DILocation(line: 1334, column: 5, scope: !2535)
!2541 = !DILocation(line: 1335, column: 14, scope: !2535)
!2542 = !DILocation(line: 1335, column: 5, scope: !2535)
!2543 = distinct !DISubprogram(name: "multiply_function", scope: !6, file: !6, line: 1338, type: !61, scopeLine: 1338, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2544)
!2544 = !{!2545, !2546}
!2545 = !DILocalVariable(name: "a", arg: 1, scope: !2543, file: !6, line: 1338, type: !24)
!2546 = !DILocalVariable(name: "b", arg: 2, scope: !2543, file: !6, line: 1338, type: !24)
!2547 = !DILocation(line: 0, scope: !2543)
!2548 = !DILocation(line: 1339, column: 5, scope: !2543)
!2549 = !DILocation(line: 1340, column: 14, scope: !2543)
!2550 = !DILocation(line: 1340, column: 5, scope: !2543)
!2551 = distinct !DISubprogram(name: "subtract_function", scope: !6, file: !6, line: 1343, type: !61, scopeLine: 1343, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2552)
!2552 = !{!2553, !2554}
!2553 = !DILocalVariable(name: "a", arg: 1, scope: !2551, file: !6, line: 1343, type: !24)
!2554 = !DILocalVariable(name: "b", arg: 2, scope: !2551, file: !6, line: 1343, type: !24)
!2555 = !DILocation(line: 0, scope: !2551)
!2556 = !DILocation(line: 1344, column: 5, scope: !2551)
!2557 = !DILocation(line: 1345, column: 14, scope: !2551)
!2558 = !DILocation(line: 1345, column: 5, scope: !2551)
!2559 = distinct !DISubprogram(name: "call_function_by_address", scope: !6, file: !6, line: 1350, type: !2560, scopeLine: 1350, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2562)
!2560 = !DISubroutineType(types: !2561)
!2561 = !{!24, !54, !24, !24}
!2562 = !{!2563, !2564, !2565, !2566}
!2563 = !DILocalVariable(name: "func_addr", arg: 1, scope: !2559, file: !6, line: 1350, type: !54)
!2564 = !DILocalVariable(name: "arg1", arg: 2, scope: !2559, file: !6, line: 1350, type: !24)
!2565 = !DILocalVariable(name: "arg2", arg: 3, scope: !2559, file: !6, line: 1350, type: !24)
!2566 = !DILocalVariable(name: "unsafe_func", scope: !2559, file: !6, line: 1355, type: !60)
!2567 = !DILocation(line: 1350, column: 36, scope: !2559)
!2568 = !DILocation(line: 1350, column: 51, scope: !2559)
!2569 = !DILocation(line: 1350, column: 61, scope: !2559)
!2570 = !DILocation(line: 1351, column: 72, scope: !2559)
!2571 = !DILocation(line: 1351, column: 83, scope: !2559)
!2572 = !DILocation(line: 1351, column: 89, scope: !2559)
!2573 = !DILocation(line: 1351, column: 5, scope: !2559)
!2574 = !DILocation(line: 1355, column: 5, scope: !2559)
!2575 = !DILocation(line: 1355, column: 11, scope: !2559)
!2576 = !DILocation(line: 1355, column: 54, scope: !2559)
!2577 = !DILocation(line: 1357, column: 12, scope: !2559)
!2578 = !DILocation(line: 1357, column: 24, scope: !2559)
!2579 = !DILocation(line: 1357, column: 30, scope: !2559)
!2580 = !DILocation(line: 1358, column: 1, scope: !2559)
!2581 = !DILocation(line: 1357, column: 5, scope: !2559)
!2582 = distinct !DISubprogram(name: "test_call_indirect_ptr_unsafe", scope: !6, file: !6, line: 1361, type: !1194, scopeLine: 1361, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2583)
!2583 = !{!2584, !2585, !2586, !2587, !2588, !2589}
!2584 = !DILocalVariable(name: "addr_add", scope: !2582, file: !6, line: 1369, type: !54)
!2585 = !DILocalVariable(name: "addr_mul", scope: !2582, file: !6, line: 1370, type: !54)
!2586 = !DILocalVariable(name: "addr_sub", scope: !2582, file: !6, line: 1371, type: !54)
!2587 = !DILocalVariable(name: "result1", scope: !2582, file: !6, line: 1382, type: !24)
!2588 = !DILocalVariable(name: "result2", scope: !2582, file: !6, line: 1386, type: !24)
!2589 = !DILocalVariable(name: "result3", scope: !2582, file: !6, line: 1390, type: !24)
!2590 = !DILocation(line: 1362, column: 5, scope: !2582)
!2591 = !DILocation(line: 1363, column: 5, scope: !2582)
!2592 = !DILocation(line: 1366, column: 5, scope: !2582)
!2593 = !DILocation(line: 0, scope: !2582)
!2594 = !DILocation(line: 1373, column: 5, scope: !2582)
!2595 = !DILocation(line: 1374, column: 5, scope: !2582)
!2596 = !DILocation(line: 1375, column: 5, scope: !2582)
!2597 = !DILocation(line: 1376, column: 5, scope: !2582)
!2598 = !DILocation(line: 1378, column: 5, scope: !2582)
!2599 = !DILocation(line: 1381, column: 5, scope: !2582)
!2600 = !DILocation(line: 1382, column: 19, scope: !2582)
!2601 = !DILocation(line: 1383, column: 5, scope: !2582)
!2602 = !DILocation(line: 1385, column: 5, scope: !2582)
!2603 = !DILocation(line: 1386, column: 19, scope: !2582)
!2604 = !DILocation(line: 1387, column: 5, scope: !2582)
!2605 = !DILocation(line: 1389, column: 5, scope: !2582)
!2606 = !DILocation(line: 1390, column: 19, scope: !2582)
!2607 = !DILocation(line: 1391, column: 5, scope: !2582)
!2608 = !DILocation(line: 1394, column: 5, scope: !2582)
!2609 = !DILocation(line: 1395, column: 17, scope: !2610)
!2610 = distinct !DILexicalBlock(scope: !2582, file: !6, line: 1395, column: 9)
!2611 = !DILocation(line: 1395, column: 23, scope: !2610)
!2612 = !DILocation(line: 1398, column: 9, scope: !2613)
!2613 = distinct !DILexicalBlock(scope: !2610, file: !6, line: 1397, column: 12)
!2614 = !DILocation(line: 1399, column: 9, scope: !2613)
!2615 = !DILocation(line: 0, scope: !2610)
!2616 = !DILocation(line: 1403, column: 5, scope: !2582)
!2617 = !DILocation(line: 1404, column: 1, scope: !2582)
!2618 = distinct !DISubprogram(name: "app_main", scope: !6, file: !6, line: 1407, type: !1194, scopeLine: 1408, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2619)
!2619 = !{!2620, !2621, !2625, !2626, !2627, !2628, !2629, !2630, !2631, !2632, !2633, !2634, !2635}
!2620 = !DILocalVariable(name: "t", scope: !2618, file: !6, line: 1409, type: !1107)
!2621 = !DILocalVariable(name: "counter_task_handle", scope: !2618, file: !6, line: 1410, type: !2622)
!2622 = !DIDerivedType(tag: DW_TAG_typedef, name: "TaskHandle_t", file: !1162, line: 93, baseType: !2623)
!2623 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2624, size: 32)
!2624 = !DICompositeType(tag: DW_TAG_structure_type, name: "tskTaskControlBlock", file: !1162, line: 92, flags: DIFlagFwdDecl)
!2625 = !DILocalVariable(name: "a", scope: !2618, file: !6, line: 1442, type: !39)
!2626 = !DILocalVariable(name: "b", scope: !2618, file: !6, line: 1443, type: !39)
!2627 = !DILocalVariable(name: "c", scope: !2618, file: !6, line: 1444, type: !39)
!2628 = !DILocalVariable(name: "flag1", scope: !2618, file: !6, line: 1465, type: !69)
!2629 = !DILocalVariable(name: "flag2", scope: !2618, file: !6, line: 1466, type: !69)
!2630 = !DILocalVariable(name: "result", scope: !2618, file: !6, line: 1480, type: !69)
!2631 = !DILocalVariable(name: "f1", scope: !2618, file: !6, line: 1498, type: !27)
!2632 = !DILocalVariable(name: "f2", scope: !2618, file: !6, line: 1499, type: !27)
!2633 = !DILocalVariable(name: "d1", scope: !2618, file: !6, line: 1511, type: !42)
!2634 = !DILocalVariable(name: "d2", scope: !2618, file: !6, line: 1512, type: !42)
!2635 = !DILocalVariable(name: "i", scope: !2636, file: !6, line: 1552, type: !24)
!2636 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1552, column: 5)
!2637 = distinct !DIAssignID()
!2638 = distinct !DIAssignID()
!2639 = !DILocation(line: 0, scope: !2618)
!2640 = !DILocation(line: 1410, column: 5, scope: !2618)
!2641 = !DILocation(line: 1410, column: 18, scope: !2618)
!2642 = distinct !DIAssignID()
!2643 = !DILocation(line: 1414, column: 5, scope: !2618)
!2644 = !DILocation(line: 1416, column: 5, scope: !2618)
!2645 = !DILocation(line: 1417, column: 5, scope: !2618)
!2646 = !DILocation(line: 1418, column: 5, scope: !2618)
!2647 = !DILocation(line: 1419, column: 5, scope: !2618)
!2648 = !DILocation(line: 1420, column: 5, scope: !2618)
!2649 = !DILocation(line: 1421, column: 6, scope: !2618)
!2650 = !DILocation(line: 1422, column: 4, scope: !2618)
!2651 = !DILocation(line: 1423, column: 6, scope: !2618)
!2652 = !DILocation(line: 1424, column: 7, scope: !2618)
!2653 = !DILocation(line: 1425, column: 6, scope: !2618)
!2654 = !DILocation(line: 1426, column: 7, scope: !2618)
!2655 = !DILocation(line: 550, column: 5, scope: !1803, inlinedAt: !2656)
!2656 = distinct !DILocation(line: 1427, column: 5, scope: !2618)
!2657 = !DILocation(line: 0, scope: !1803, inlinedAt: !2656)
!2658 = !DILocation(line: 555, column: 5, scope: !1803, inlinedAt: !2656)
!2659 = !DILocation(line: 559, column: 5, scope: !1803, inlinedAt: !2656)
!2660 = !DILocation(line: 564, column: 5, scope: !1803, inlinedAt: !2656)
!2661 = !DILocation(line: 568, column: 5, scope: !1803, inlinedAt: !2656)
!2662 = !DILocation(line: 572, column: 5, scope: !1803, inlinedAt: !2656)
!2663 = !DILocation(line: 574, column: 5, scope: !1803, inlinedAt: !2656)
!2664 = !DILocation(line: 0, scope: !1820, inlinedAt: !2665)
!2665 = distinct !DILocation(line: 1428, column: 5, scope: !2618)
!2666 = !DILocation(line: 580, column: 5, scope: !1820, inlinedAt: !2665)
!2667 = !DILocation(line: 582, column: 5, scope: !1820, inlinedAt: !2665)
!2668 = !DILocation(line: 582, column: 9, scope: !1820, inlinedAt: !2665)
!2669 = distinct !DIAssignID()
!2670 = !DILocation(line: 588, column: 26, scope: !1820, inlinedAt: !2665)
!2671 = !DILocation(line: 589, column: 5, scope: !1820, inlinedAt: !2665)
!2672 = !DILocation(line: 595, column: 9, scope: !1835, inlinedAt: !2665)
!2673 = !DILocation(line: 595, column: 13, scope: !1835, inlinedAt: !2665)
!2674 = !DILocation(line: 595, column: 9, scope: !1820, inlinedAt: !2665)
!2675 = !DILocation(line: 596, column: 9, scope: !1839, inlinedAt: !2665)
!2676 = !DILocation(line: 597, column: 5, scope: !1839, inlinedAt: !2665)
!2677 = !DILocation(line: 598, column: 9, scope: !1842, inlinedAt: !2665)
!2678 = !DILocation(line: 601, column: 6, scope: !1820, inlinedAt: !2665)
!2679 = !DILocation(line: 602, column: 1, scope: !1820, inlinedAt: !2665)
!2680 = !DILocation(line: 1429, column: 5, scope: !2618)
!2681 = !DILocation(line: 1430, column: 7, scope: !2618)
!2682 = !DILocation(line: 1434, column: 5, scope: !2618)
!2683 = !DILocation(line: 1436, column: 5, scope: !2618)
!2684 = !DILocation(line: 1438, column: 5, scope: !2618)
!2685 = !DILocation(line: 1440, column: 4, scope: !2618)
!2686 = !DILocation(line: 1460, column: 5, scope: !2618)
!2687 = !DILocation(line: 1464, column: 5, scope: !2618)
!2688 = !DILocation(line: 1469, column: 9, scope: !2689)
!2689 = distinct !DILexicalBlock(scope: !2690, file: !6, line: 1468, column: 16)
!2690 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1468, column: 9)
!2691 = !DILocation(line: 1475, column: 9, scope: !2692)
!2692 = distinct !DILexicalBlock(scope: !2693, file: !6, line: 1474, column: 17)
!2693 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1474, column: 9)
!2694 = !DILocation(line: 1484, column: 9, scope: !2695)
!2695 = distinct !DILexicalBlock(scope: !2696, file: !6, line: 1483, column: 12)
!2696 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1481, column: 9)
!2697 = !DILocation(line: 1489, column: 9, scope: !2698)
!2698 = distinct !DILexicalBlock(scope: !2699, file: !6, line: 1488, column: 16)
!2699 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1488, column: 9)
!2700 = !DILocation(line: 1493, column: 5, scope: !2618)
!2701 = !DILocation(line: 1497, column: 5, scope: !2618)
!2702 = !DILocation(line: 1500, column: 5, scope: !2618)
!2703 = !DILocation(line: 1501, column: 5, scope: !2618)
!2704 = !DILocation(line: 1502, column: 5, scope: !2618)
!2705 = !DILocation(line: 1503, column: 5, scope: !2618)
!2706 = !DILocation(line: 1504, column: 5, scope: !2618)
!2707 = !DILocation(line: 1505, column: 5, scope: !2618)
!2708 = !DILocation(line: 1510, column: 5, scope: !2618)
!2709 = !DILocation(line: 1513, column: 5, scope: !2618)
!2710 = !DILocation(line: 1514, column: 5, scope: !2618)
!2711 = !DILocation(line: 1515, column: 5, scope: !2618)
!2712 = !DILocation(line: 1516, column: 5, scope: !2618)
!2713 = !DILocation(line: 1517, column: 5, scope: !2618)
!2714 = !DILocation(line: 1518, column: 5, scope: !2618)
!2715 = !DILocation(line: 1524, column: 5, scope: !2618)
!2716 = !DILocation(line: 1525, column: 5, scope: !2618)
!2717 = !DILocation(line: 1527, column: 5, scope: !2618)
!2718 = !DILocation(line: 1528, column: 5, scope: !2618)
!2719 = !DILocation(line: 1534, column: 5, scope: !2618)
!2720 = !DILocation(line: 1535, column: 9, scope: !2618)
!2721 = !DILocation(line: 1540, column: 9, scope: !2722)
!2722 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1540, column: 9)
!2723 = !DILocation(line: 1540, column: 9, scope: !2618)
!2724 = !DILocation(line: 1541, column: 9, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2722, file: !6, line: 1540, column: 12)
!2726 = !DILocation(line: 1542, column: 5, scope: !2725)
!2727 = !DILocation(line: 1543, column: 9, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2722, file: !6, line: 1542, column: 12)
!2729 = !DILocation(line: 1547, column: 5, scope: !2618)
!2730 = !DILocalVariable(name: "pxTaskCode", arg: 1, scope: !2731, file: !1162, line: 371, type: !2734)
!2731 = distinct !DISubprogram(name: "xTaskCreate", scope: !1162, file: !1162, line: 371, type: !2732, scopeLine: 377, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2743)
!2732 = !DISubroutineType(types: !2733)
!2733 = !{!63, !2734, !2737, !2738, !2739, !2740, !2741}
!2734 = !DIDerivedType(tag: DW_TAG_typedef, name: "TaskFunction_t", file: !2735, line: 40, baseType: !2736)
!2735 = !DIFile(filename: "Programs/Espressif/frameworks/esp-idf-v5.4/components/freertos/FreeRTOS-Kernel/include/freertos/projdefs.h", directory: "C:/Andrey")
!2736 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1140, size: 32)
!2737 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1160)
!2738 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !16)
!2739 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !54)
!2740 = !DIDerivedType(tag: DW_TAG_typedef, name: "UBaseType_t", file: !15, line: 104, baseType: !7)
!2741 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2742)
!2742 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2622, size: 32)
!2743 = !{!2730, !2744, !2745, !2746, !2747, !2748}
!2744 = !DILocalVariable(name: "pcName", arg: 2, scope: !2731, file: !1162, line: 372, type: !2737)
!2745 = !DILocalVariable(name: "usStackDepth", arg: 3, scope: !2731, file: !1162, line: 373, type: !2738)
!2746 = !DILocalVariable(name: "pvParameters", arg: 4, scope: !2731, file: !1162, line: 374, type: !2739)
!2747 = !DILocalVariable(name: "uxPriority", arg: 5, scope: !2731, file: !1162, line: 375, type: !2740)
!2748 = !DILocalVariable(name: "pxCreatedTask", arg: 6, scope: !2731, file: !1162, line: 376, type: !2741)
!2749 = !DILocation(line: 0, scope: !2731, inlinedAt: !2750)
!2750 = distinct !DILocation(line: 1548, column: 4, scope: !2618)
!2751 = !DILocation(line: 394, column: 16, scope: !2731, inlinedAt: !2750)
!2752 = !DILocation(line: 0, scope: !2636)
!2753 = !DILocation(line: 1552, column: 5, scope: !2636)
!2754 = !DILocation(line: 1556, column: 5, scope: !2618)
!2755 = !DILocation(line: 1558, column: 5, scope: !2618)
!2756 = !DILocation(line: 1560, column: 9, scope: !2618)
!2757 = !DILocation(line: 1553, column: 10, scope: !2758)
!2758 = distinct !DILexicalBlock(scope: !2759, file: !6, line: 1552, column: 33)
!2759 = distinct !DILexicalBlock(scope: !2636, file: !6, line: 1552, column: 5)
!2760 = !DILocation(line: 1554, column: 9, scope: !2758)
!2761 = !DILocation(line: 1552, column: 29, scope: !2759)
!2762 = !DILocation(line: 1552, column: 23, scope: !2759)
!2763 = distinct !{!2763, !2753, !2764, !1762, !1154}
!2764 = !DILocation(line: 1555, column: 5, scope: !2636)
!2765 = !DILocation(line: 1561, column: 9, scope: !2766)
!2766 = distinct !DILexicalBlock(scope: !2767, file: !6, line: 1560, column: 12)
!2767 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1560, column: 9)
!2768 = !DILocation(line: 1562, column: 9, scope: !2766)
!2769 = !DILocation(line: 1563, column: 9, scope: !2766)
!2770 = !DILocation(line: 1564, column: 9, scope: !2766)
!2771 = !DILocation(line: 1566, column: 5, scope: !2766)
!2772 = !DILocation(line: 1568, column: 9, scope: !2773)
!2773 = distinct !DILexicalBlock(scope: !2618, file: !6, line: 1568, column: 9)
!2774 = !DILocation(line: 1568, column: 9, scope: !2618)
!2775 = !DILocation(line: 1569, column: 9, scope: !2776)
!2776 = distinct !DILexicalBlock(scope: !2773, file: !6, line: 1568, column: 30)
!2777 = !DILocation(line: 1570, column: 21, scope: !2776)
!2778 = !DILocation(line: 1570, column: 9, scope: !2776)
!2779 = !DILocation(line: 1573, column: 5, scope: !2776)
!2780 = !DILocation(line: 0, scope: !2773)
!2781 = !DILocation(line: 1580, column: 5, scope: !2618)
!2782 = !DILocation(line: 1582, column: 5, scope: !2618)
!2783 = !DILocation(line: 1584, column: 5, scope: !2618)
!2784 = !DILocation(line: 1596, column: 1, scope: !2618)
!2785 = distinct !DISubprogram(name: "cb_print", scope: !6, file: !6, line: 100, type: !1140, scopeLine: 100, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2786)
!2786 = !{!2787}
!2787 = !DILocalVariable(name: "ud", arg: 1, scope: !2785, file: !6, line: 100, type: !54)
!2788 = !DILocation(line: 0, scope: !2785)
!2789 = !DILocation(line: 101, column: 5, scope: !2785)
!2790 = !DILocation(line: 102, column: 1, scope: !2785)
!2791 = !DISubprogram(name: "host_invoke_cb", scope: !6, file: !6, line: 52, type: !2792, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2792 = !DISubroutineType(types: !2793)
!2793 = !{null, !2736, !54}
!2794 = distinct !DISubprogram(name: "cb_with_int", scope: !6, file: !6, line: 104, type: !2795, scopeLine: 104, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2797)
!2795 = !DISubroutineType(types: !2796)
!2796 = !{null, !24, !54}
!2797 = !{!2798, !2799}
!2798 = !DILocalVariable(name: "x", arg: 1, scope: !2794, file: !6, line: 104, type: !24)
!2799 = !DILocalVariable(name: "ud", arg: 2, scope: !2794, file: !6, line: 104, type: !54)
!2800 = !DILocation(line: 0, scope: !2794)
!2801 = !DILocation(line: 105, column: 5, scope: !2794)
!2802 = !DILocation(line: 106, column: 1, scope: !2794)
!2803 = !DISubprogram(name: "host_invoke_cb2", scope: !6, file: !6, line: 53, type: !2804, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2804 = !DISubroutineType(types: !2805)
!2805 = !{null, !2806, !24, !54}
!2806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2795, size: 32)
!2807 = !DILocation(line: 0, scope: !1104)
!2808 = !DILocation(line: 111, column: 16, scope: !1104)
!2809 = !DILocation(line: 113, column: 57, scope: !1104)
!2810 = !DILocation(line: 113, column: 5, scope: !1104)
!2811 = !DILocation(line: 114, column: 1, scope: !1104)
!2812 = !DISubprogram(name: "xTimerCreate", scope: !1108, file: !1108, line: 234, type: !2813, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2813 = !DISubroutineType(types: !2814)
!2814 = !{!1107, !2737, !1165, !2815, !2739, !2816}
!2815 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !63)
!2816 = !DIDerivedType(tag: DW_TAG_typedef, name: "TimerCallbackFunction_t", file: !1108, line: 92, baseType: !2817)
!2817 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1105, size: 32)
!2818 = !DISubprogram(name: "xTaskGetTickCount", scope: !1162, file: !1162, line: 1418, type: !2819, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2819 = !DISubroutineType(types: !2820)
!2820 = !{!14}
!2821 = !DISubprogram(name: "xTimerGenericCommand", scope: !1108, file: !1108, line: 1313, type: !2822, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2822 = !DISubroutineType(types: !2823)
!2823 = !{!63, !1107, !2815, !1165, !2824, !1165}
!2824 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2825)
!2825 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !63, size: 32)
!2826 = !DISubprogram(name: "xTaskCreatePinnedToCore", scope: !1162, file: !1162, line: 382, type: !2827, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2827 = !DISubroutineType(types: !2828)
!2828 = !{!63, !2734, !2737, !2738, !2739, !2740, !2741, !2815}
!2829 = !DISubprogram(name: "vTaskDelete", scope: !1162, file: !1162, line: 785, type: !2830, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2830 = !DISubroutineType(types: !2831)
!2831 = !{null, !2622}
!2832 = !DISubprogram(name: "pvTimerGetTimerID", scope: !1108, file: !1108, line: 385, type: !2833, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!2833 = !DISubroutineType(types: !2834)
!2834 = !{!54, !2835}
!2835 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1107)
!2836 = distinct !DISubprogram(name: "test", scope: !1118, file: !1118, line: 3, type: !2837, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !1123, retainedNodes: !2839)
!2837 = !DISubroutineType(types: !2838)
!2838 = !{null, !24, !42, !1160}
!2839 = !{!2840, !2841, !2842}
!2840 = !DILocalVariable(name: "some_int", arg: 1, scope: !2836, file: !1118, line: 3, type: !24)
!2841 = !DILocalVariable(name: "some_double", arg: 2, scope: !2836, file: !1118, line: 3, type: !42)
!2842 = !DILocalVariable(name: "some_string", arg: 3, scope: !2836, file: !1118, line: 3, type: !1160)
!2843 = !DILocation(line: 0, scope: !2836)
!2844 = !DILocation(line: 5, column: 5, scope: !2836)
!2845 = !DILocation(line: 8, column: 5, scope: !2836)
!2846 = !DILocation(line: 9, column: 5, scope: !2836)
!2847 = !DILocation(line: 11, column: 9, scope: !2848)
!2848 = distinct !DILexicalBlock(scope: !2836, file: !1118, line: 11, column: 9)
!2849 = !DILocation(line: 11, column: 9, scope: !2836)
!2850 = !DILocation(line: 12, column: 9, scope: !2851)
!2851 = distinct !DILexicalBlock(scope: !2848, file: !1118, line: 11, column: 22)
!2852 = !DILocation(line: 13, column: 5, scope: !2851)
!2853 = !DILocation(line: 14, column: 9, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2848, file: !1118, line: 13, column: 12)
!2855 = !DILocation(line: 17, column: 5, scope: !2836)
!2856 = !DILocation(line: 18, column: 1, scope: !2836)
