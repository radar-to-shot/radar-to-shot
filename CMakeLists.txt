cmake_minimum_required(VERSION 3.20)
project(robotwar_headless VERSION 0.1.0 LANGUAGES CXX)

option(ROBOTWAR_SANITIZERS "Enable address and undefined behavior sanitizers" OFF)
add_library(robotwar src/compiler.cpp src/vm.cpp src/world.cpp src/mac_math.cpp src/simulation.cpp)
target_include_directories(robotwar PUBLIC include)
target_compile_features(robotwar PUBLIC cxx_std_20)
if(CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
  target_compile_options(robotwar PRIVATE -Wall -Wextra -Wpedantic)
  if(ROBOTWAR_SANITIZERS)
    target_compile_options(robotwar PUBLIC -fsanitize=address,undefined -fno-omit-frame-pointer)
    target_link_options(robotwar PUBLIC -fsanitize=address,undefined)
  endif()
endif()
add_executable(robotwar_cli src/main.cpp)
target_link_libraries(robotwar_cli PRIVATE robotwar)
target_include_directories(robotwar_cli PRIVATE third_party)
set_target_properties(robotwar_cli PROPERTIES OUTPUT_NAME robotwar)

include(CTest)
if(BUILD_TESTING)
  find_package(Python3 COMPONENTS Interpreter REQUIRED)
  add_test(NAME original_golden_vectors
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tests/validate_golden.py"
            --binary "$<TARGET_FILE:robotwar_cli>")
  add_executable(robotwar_integration tests/integration.cpp)
  target_link_libraries(robotwar_integration PRIVATE robotwar)
  add_test(NAME simulation_integration COMMAND robotwar_integration)
  add_test(NAME battle_runners
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tests/test_battle_runners.py"
            --binary "$<TARGET_FILE:robotwar_cli>")
endif()
