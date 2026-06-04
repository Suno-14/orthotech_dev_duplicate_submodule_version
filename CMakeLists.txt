<<<<<<< HEAD
cmake_minimum_required(VERSION 3.10) 
project(Calculations CXX) 
set(CMAKE_CXX_STANDARD 17) 
set(CMAKE_CXX_STANDARD_REQUIRED True) 
find_package(Eigen3 REQUIRED NO_MODULE) 
include_directories(include) 
add_executable(main src/main.cpp src/calculations.cpp) 
target_link_libraries(main Eigen3::Eigen )
=======
cmake_minimum_required(VERSION 3.10)
project(Calculations CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

find_package(Eigen3 REQUIRED)
find_package(ur_rtde REQUIRED)

include_directories(include)

add_executable(arith src/main.cpp
    src/calculations.cpp)

target_link_libraries(arith
    Eigen3::Eigen
    ur_rtde::rtde
)
>>>>>>> 6fe8166 (Added ur_rtde for windows and linux)
