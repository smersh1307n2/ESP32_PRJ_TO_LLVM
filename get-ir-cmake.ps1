# ==============================================================================
# ESP-IDF LLVM IR Generator (Universal)
# ==============================================================================
# This script automatically finds all .c files, generates a
# CMakeLists.txt for them, compiles them, and links them into a single .bc file.
[CmdletBinding()]
param(
    # Comma-separated list of directories to search for .c files
    [Parameter(Mandatory=$true)]
    [string]$SourceDirs,
    # If specified, creates a .ll file from the final .bc
    [switch]$EmitLL
)

# --- CONFIGURATION ---
$ESP_IDF = "C:/Andrey/Programs/Espressif/frameworks/esp-idf-v5.4"
$BASE_CLANG_DIR = "C:/Andrey/Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin"
$PROJECT_CLANG_DIR = Join-Path $PSScriptRoot "clang"
$BUILD_DIR = "build"
$OUTPUT_DIR = "llvm_output"

# --- EXECUTABLES ---
$CLANG_EXE = Join-Path $BASE_CLANG_DIR "clang.exe"
$LLVM_LINK_EXE = Join-Path $PROJECT_CLANG_DIR "llvm-link.exe"
$LLVM_DIS_EXE = Join-Path $PROJECT_CLANG_DIR "llvm-dis.exe"
$LLVM_AS_EXE = Join-Path $PROJECT_CLANG_DIR "llvm-as.exe"

# --- SCRIPT START ---

# 1. Find source files
Write-Host "Step 1: Finding source files..." -ForegroundColor Cyan
$sourceFiles = @()
($SourceDirs.Trim('"').Split(',') | ForEach-Object { $_.Trim() }) | ForEach-Object {
    if (Test-Path $_) {
        Get-ChildItem -Path $_ -Recurse -Filter *.c | ForEach-Object { $sourceFiles += $_ }
    }
}
if ($sourceFiles.Count -eq 0) { Write-Host "No source files found." -ForegroundColor Red; exit 1 }
Write-Host "Found $($sourceFiles.Count) source file(s)." -ForegroundColor Green


# 2. Dynamically generate main/CMakeLists.txt
Write-Host "Step 2: Generating main/CMakeLists.txt..." -ForegroundColor Cyan
$mainCmakePath = Join-Path $PSScriptRoot "main/CMakeLists.txt"
$sourceFileNames = $sourceFiles | ForEach-Object { '"' + $_.Name + '"' }
$cmakeContent = "idf_component_register(SRCS $($sourceFileNames -join ' ') INCLUDE_DIRS .)"
Set-Content -Path $mainCmakePath -Value $cmakeContent
Write-Host "Generated main/CMakeLists.txt with $($sourceFiles.Count) source(s)." -ForegroundColor Green

# 3. Prepare environment
Write-Host "Step 3: Preparing build environment..." -ForegroundColor Cyan
if (Test-Path $OUTPUT_DIR) { Remove-Item -Recurse -Force $OUTPUT_DIR }
New-Item -ItemType Directory -Path $OUTPUT_DIR | Out-Null
& python "$ESP_IDF/tools/idf.py" reconfigure
if ($LASTEXITCODE -ne 0) { Write-Host "idf.py reconfigure failed." -ForegroundColor Red; exit 1 }

# 4. Read compile commands
Write-Host "Step 4: Reading compile commands..." -ForegroundColor Cyan
$commandsMap = @{}
(Get-Content (Join-Path $BUILD_DIR "compile_commands.json") -Raw | ConvertFrom-Json) | ForEach-Object { $commandsMap[$_.file] = $_.command }

# 5. Compile all files to .bc
Write-Host "Step 5: Compiling files to .bc..." -ForegroundColor Cyan
$allBcFiles = [System.Collections.Generic.List[string]]::new()
foreach ($fileInfo in $sourceFiles) {
    $absolutePath = $fileInfo.FullName
    if (-not $commandsMap.ContainsKey($absolutePath)) {
        Write-Warning "Compile command for $absolutePath not found. Skipping."
        continue
    }
    
    $originalCommand = $commandsMap[$absolutePath]
    $compilerRegex = '^(\s*(?:"[^"]+"|''[^'']*''|[^\s]+)\s*)'
    $flagsAndFiles = ([regex]::Match($originalCommand, $compilerRegex)).Result('$1')
    $flagsAndFiles = $originalCommand.Substring($flagsAndFiles.Length).Trim()
    $flagsAndFiles = $flagsAndFiles -replace '\s-c\s', ' ' -replace '\s-o\s+[^\s]+', ' '
    $sourceFileRegex = [regex]::Escape($absolutePath)
    $regexObj = [regex]::new($sourceFileRegex, "IgnoreCase")
    $flagsAndFiles = $regexObj.Replace($flagsAndFiles, "", 1)
    $baseArgs = $flagsAndFiles.Trim().Split(' ')

    # Create a unique name to avoid conflicts
    $uniqueName = "$($fileInfo.BaseName)_$($allBcFiles.Count)"
    $outputFileBc = Join-Path $OUTPUT_DIR "${uniqueName}.bc"
    
    # Add -march flag to prevent issues with atomics
    $finalBcArgs = $baseArgs + @("-march=rv32imac_zicsr_zifencei", "-c", "-emit-llvm", $absolutePath, "-o", $outputFileBc)
    & $CLANG_EXE @finalBcArgs
    
    if ($LASTEXITCODE -eq 0) {
        $allBcFiles.Add($outputFileBc)
    } else {
        Write-Host "Error compiling $absolutePath." -ForegroundColor Red
    }
}

# 6. Link .bc files
Write-Host "Step 6: Linking .bc files..." -ForegroundColor Cyan
$finalBcFile = Join-Path $OUTPUT_DIR "linked_module.bc"
& $LLVM_LINK_EXE $allBcFiles -o $finalBcFile
if ($LASTEXITCODE -ne 0) { Write-Host "llvm-link failed." -ForegroundColor Red; exit 1 }

Write-Host "Successfully created final bitcode: $finalBcFile" -ForegroundColor Green

# 7. (Optional) Disassemble
if ($EmitLL.IsPresent) {
    Write-Host "Step 7: Disassembling for inspection..." -ForegroundColor Cyan
    $finalLlFile = Join-Path $OUTPUT_DIR "linked_module.ll"
    & $LLVM_DIS_EXE $finalBcFile -o $finalLlFile
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Successfully created disassembly: $finalLlFile" -ForegroundColor Green
    }
}

Write-Host "--- Done ---" -ForegroundColor Cyan