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
add_library(robotwar_json src/json_protocol.cpp)
target_link_libraries(robotwar_json PUBLIC robotwar)
target_include_directories(robotwar_json PUBLIC src third_party)

if(EMSCRIPTEN)
  # Exception support must also be enabled while compiling the core and JSON
  # libraries, so requests can report failures through the shared protocol.
  target_compile_options(robotwar PUBLIC -fexceptions)
  add_executable(robotwar_wasm src/wasm.cpp)
  target_link_libraries(robotwar_wasm PRIVATE robotwar_json)
  target_link_options(robotwar_wasm PRIVATE
    --no-entry
    -fexceptions
    "-sDISABLE_EXCEPTION_CATCHING=0"
    "-sMODULARIZE=1"
    "-sEXPORT_ES6=1"
    "-sEXPORT_NAME=createRobotWarModule"
    "-sENVIRONMENT=web,worker,node"
    "-sEXPORTED_FUNCTIONS=['_robotwar_request','_malloc','_free']"
    "-sEXPORTED_RUNTIME_METHODS=['cwrap','ccall']"
    "-sALLOW_MEMORY_GROWTH=1"
    "-sINITIAL_MEMORY=33554432"
    "-sMAXIMUM_MEMORY=268435456"
    "-sSTACK_SIZE=1048576"
    "-sEXIT_RUNTIME=0"
    "-sFILESYSTEM=0")
  set_target_properties(robotwar_wasm PROPERTIES OUTPUT_NAME robotwar SUFFIX ".js")
  # Node differential tests import the same ES module that browsers use.
  file(GENERATE OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/package.json"
    CONTENT "{\"type\":\"module\"}\n")
else()
  add_executable(robotwar_cli src/main.cpp)
  target_link_libraries(robotwar_cli PRIVATE robotwar_json)
  set_target_properties(robotwar_cli PROPERTIES OUTPUT_NAME robotwar)
endif()

include(CTest)
if(BUILD_TESTING AND NOT EMSCRIPTEN)
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
  add_test(NAME tournament
    COMMAND "${Python3_EXECUTABLE}" "${CMAKE_CURRENT_SOURCE_DIR}/tests/test_tournament.py"
            --binary "$<TARGET_FILE:robotwar_cli>")
endif()
