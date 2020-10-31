cmake_minimum_required(VERSION 3.11.0 FATAL_ERROR)
project(torch_test VERSION 0.1.0)

include(CTest)
enable_testing()

set(libtorch_VERSION 1.7.0)
find_package(Torch ${libtorch_VERSION} EXACT QUIET CONFIG)
if(NOT Torch_FOUND)
  message(STATUS "libtorch ${libtorch_VERSION} - not found")
  message(STATUS "Fetching libtorch")
  include(FetchContent)
  FetchContent_Declare(
    libtorch
    URL https://download.pytorch.org/libtorch/cpu/libtorch-shared-with-deps-${libtorch_VERSION}%2Bcpu.zip
    SOURCE_DIR libtorch)
  FetchContent_GetProperties(libtorch)
  if(NOT libtorch_POPULATED)
    unset(FETCHCONTENT_QUIET CACHE)
    FetchContent_Populate(libtorch)
    list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/libtorch)
  endif()
  find_package(Torch ${libtorch_VERSION} EXACT CONFIG REQUIRED)
else()
  message(STATUS "libtorch ${libtorch_VERSION} - found")
endif()

list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR}/libtorch)
find_package(Torch REQUIRED)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${TORCH_CXX_FLAGS}")

add_executable(torch_test main.cpp)
target_link_libraries(torch_test "${TORCH_LIBRARIES}")
set_property(TARGET torch_test PROPERTY CXX_STANDARD 14)

if (MSVC)
  file(GLOB TORCH_DLLS "${TORCH_INSTALL_PREFIX}/lib/*.dll")
  add_custom_command(TARGET torch_test
                     POST_BUILD
                     COMMAND ${CMAKE_COMMAND} -E copy_if_different
                     ${TORCH_DLLS}
                     $<TARGET_FILE_DIR:example-app>)
endif (MSVC)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
