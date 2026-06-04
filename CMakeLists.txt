cmake_minimum_required(VERSION 3.10)
project(Calculations CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Eigen — header only, no build needed
add_subdirectory(third_party/eigen)

# Standalone Asio — header only, no Boost needed
add_library(asio INTERFACE)
target_include_directories(asio INTERFACE third_party/asio/asio/include)
target_compile_definitions(asio INTERFACE ASIO_STANDALONE)

# ur_rtde — disable Python bindings and force standalone Asio
set(BUILD_PYTHON_BINDINGS OFF CACHE BOOL "" FORCE)
set(RTDE_STANDALONE_ASIO  ON  CACHE BOOL "" FORCE)
add_subdirectory(third_party/ur_rtde)

include_directories(include)

add_executable(main src/main.cpp src/calculations.cpp)

target_link_libraries(main
    Eigen3::Eigen
    ur_rtde::rtde
)