cmake_minimum_required(VERSION 3.16)

# The CI and developer environments provide IDF_PATH and the ESP Clang toolchain.
if("$ENV{IDF_PATH}" STREQUAL "")
    message(FATAL_ERROR "IDF_PATH must point to an installed ESP-IDF tree")
endif()

set(ENV{IDF_TOOLCHAIN} "clang")
set(ENV{IDF_CC} "clang")
set(ENV{IDF_CXX} "clang++")
set(IDF_TOOLCHAIN "clang")

# Optional machine-local overrides may be added in an untracked file.
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt.local)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt.local)
endif()

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
project(espb_llvm_examples)
