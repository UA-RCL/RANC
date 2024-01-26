cmake_minimum_required(VERSION 3.10 FATAL_ERROR)

project(RANC_Simulator LANGUAGES CXX CUDA)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -ggdb")


include_directories(extern)
include_directories(CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES)

file(GLOB SOURCES "src/*.cpp" "src/*.cu")
#file(GLOB SOURCES "src/*.cpp")

add_executable(ranc_sim ${SOURCES})