# ESP-IDF to LLVM Bitcode Compilation Project

This project is designed to compile ESP-IDF source code into LLVM Intermediate Representation (IR), also known as bitcode (`.bc`). This allows for further analysis and translation of the code.

The project is configured to work with `clang` as the compiler and uses a custom script to orchestrate the build process.

## Quick Start

1.  **Configure Environment:** Ensure all paths in the `.vscode/settings.json` and `.vscode/c_cpp_properties.json` files match your system's setup.
2.  **Configure Build:** Add your source files and directories to `CMakeLists.txt`.
3.  **Compile:** Execute the command in a PowerShell terminal to generate the `.bc` file.
4.  **Enable JIT Compilation (Optional):** Mark performance-critical functions with `JIT_HOT` attribute for Just-In-Time compilation during bytecode interpretation. See [JIT Compilation](#jit-compilation) section for details.

---

## JIT Compilation

To enable Just-In-Time (JIT) compilation for your functions during interpretation, you must mark them with the `JIT_HOT` attribute. When translating code to `.espb` bytecode, functions marked with `JIT_HOT` will be compiled to native machine code by the JIT compiler when needed during interpretation, resulting in significantly faster execution compared to purely interpreted functions.

### Defining the JIT_HOT Macro

Add the following macro definition to your code:

```c
#define JIT_HOT __attribute__((annotate("espb_jit_hot")))
```

### Marking Functions for JIT Compilation

Apply the `JIT_HOT` attribute to functions that should be JIT-compiled at runtime. For example:

```c
#define JIT_HOT __attribute__((annotate("espb_jit_hot")))

JIT_HOT
__attribute__((noinline))
static void cb_print(void *ud) {
    printf("cb_print: user_data=%p\n", ud);
}
```

**Important Notes:**
- Functions marked with `JIT_HOT` are compiled from LLVM IR to native machine code by the JIT compiler when called during bytecode interpretation.
- Use `JIT_HOT` for performance-critical functions to achieve significant performance improvements over interpreted execution.
- The `__attribute__((noinline))` is recommended to ensure the function maintains its separate compilation context.
- JIT-compiled functions are placed in IRAM (Internal RAM), which has limited size on ESP32. Be mindful of the number and size of functions you mark with `JIT_HOT`.

---

## 1. Environment Setup (VS Code)

For IntelliSense and the build process to work correctly, you need to adapt the configuration files to your system.

### `.vscode/settings.json`

Open this file and modify the following lines with your specific paths:

-   `"idf.espIdfPathWin"`: The path to your ESP-IDF framework.
-   `"idf.toolsPathWin"`: The path to the ESP-IDF tools directory.
-   `"idf.pythonInstallPath"`: The path to the Python executable used by ESP-IDF.
-   `clangd.path`: The absolute path to `clangd.exe`.
-   `clangd.arguments`:
    -   `--query-driver`: The absolute path to `riscv32-esp-elf-gcc.exe`.
    -   `--compile-commands-dir`: The absolute path to the `build` directory of your project.

### `.vscode/c_cpp_properties.json`

This file is usually configured automatically by the ESP-IDF extension. Ensure that `compilerPath` and `compileCommands` point to the correct files. It is recommended to use the variables provided by the extension:

```json
{
    "compilerPath": "${config:idf.compilerPath}",
    "compileCommands": "${config:idf.buildPath}/compile_commands.json"
}
```

---

## 2. Build Configuration

To include new files or directories in the build, you must register them in the CMake build system.

### Adding Individual Files

Open `main/CMakeLists.txt` and add the names of your `.c` files to the `SRCS` list:

```cmake
idf_component_register(SRCS "hello_world_main.c" "new_file.c"
                    INCLUDE_DIRS ".")
```

After any changes to `CMakeLists.txt`, the build system will automatically reconfigure the project on the next run.

---

## 3. Compiling to LLVM Bitcode

The PowerShell script `get-ir-cmake.ps1` is used to compile the project into a `.bc` file.

Open a PowerShell terminal and execute the following command:

```powershell
powershell -ExecutionPolicy Bypass -File .\get-ir-cmake.ps1 -SourceDirs "main" -EmitLL
```

### Command Explanation:
-   `-SourceDirs "main"`: Specifies which source code directories to compile. The script will recursively find all `.c` files within.

### Output
After successful execution, the `llvm_output` directory will contain:
-   Intermediate `.bc` files for each compiled source file.
-   `linked_module.bc`: The final, combined bitcode file.
-   `linked_module.ll`: The textual representation of the final bitcode. To generate it, use the `-EmitLL` flag.

---

## 4. Translation

The generated LLVM IR can be translated using the web-based translator:

**[http://espb.runasp.net/](http://espb.runasp.net/)**

For translation, you must use the binary file `.bc`.
