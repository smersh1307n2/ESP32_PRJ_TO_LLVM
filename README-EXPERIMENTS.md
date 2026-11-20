# ESPB runtime test corpus

This branch contains small, isolated C inputs intended to exercise translator and runtime behavior:

- `01_integer`: integer ALU chains and signed operations.
- `02_control_flow`: loops, nested branches, and merge points.
- `03_memory`: pointer loads/stores and array loops.
- `04_calls`: direct calls and a hot caller/callee chain.

Functions marked with `JIT_HOT` carry the `espb_jit_hot` LLVM annotation. They are intentionally `noinline` so that the translator can identify and compile them independently.

## CI output

The `Build ESPB LLVM bitcode examples` workflow compiles each example with the ESP-IDF Clang toolchain and uploads the resulting `.bc` files as the `espb-llvm-bitcode` artifact. The bitcode is generated once per source revision; later runtime/QEMU runs should consume these fixtures rather than recompile them.

The examples are deliberately free of GPIO, FreeRTOS, and timing dependencies. Their purpose is deterministic bytecode/JIT coverage, not a full hardware application.
