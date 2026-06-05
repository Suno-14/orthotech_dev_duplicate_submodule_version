cmake_minimum_required(VERSION 3.10)
project(Calculations CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

add_subdirectory(third_party/eigen)

set(PYTHON_BINDINGS OFF CACHE BOOL "" FORCE)

add_subdirectory(third_party/ur_rtde)

include_directories(include)

add_executable(main src/main.cpp src/calculations.cpp)

target_link_libraries(main
    Eigen3::Eigen
    ur_rtde::rtde
)