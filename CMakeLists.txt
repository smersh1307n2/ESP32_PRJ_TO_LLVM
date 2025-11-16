# The following lines of boilerplate have to be in your project's
# CMakeLists in this exact order for cmake to work correctly
cmake_minimum_required(VERSION 3.16)

# Set IDF_PATH explicitly if environment variable is not set
if("$ENV{IDF_PATH}" STREQUAL "")
    set(ENV{IDF_PATH} "C:/Andrey/Programs/Espressif/frameworks/esp-idf-v5.4")
endif()

# Force toolchain to Clang
set(ENV{IDF_TOOLCHAIN} "clang")
set(ENV{IDF_CC} "clang")
set(IDF_TOOLCHAIN "clang")
set(ENV{CC} "C:/Andrey/Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clang.exe")
set(ENV{CXX} "C:/Andrey/Programs/Espressif/Tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clang++.exe")

# Include local settings for Clang
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt.local)
    include(${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt.local)
endif()

include($ENV{IDF_PATH}/tools/cmake/project.cmake)
#set(EXTRA_COMPONENT_DIRS main)
project(llvm_test2)
