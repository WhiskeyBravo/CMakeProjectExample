#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(CMakeProjectExample)

include(CMakeParseArguments)
include(ExternalProject)

list(APPEND CMAKE_CXX_FLAGS -std=c++11)

# Thirdparty
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/modules")

include(cmake/thirdparty/foo_find_boost.cmake)
include(cmake/thirdparty/foo_find_eigen.cmake)

# Framework
include(cmake/targets/foo_force_subdirectory.cmake)
include(cmake/targets/foo_header_only_workaround.cmake)

include(cmake/targets/foo_add_executable.cmake)
include(cmake/targets/foo_add_library.cmake)

add_subdirectory(application)
add_subdirectory(library)

# Documentation (the files should show up in the IDE).
add_custom_target(documentation SOURCES README.md)

# Test
include(cmake/thirdparty/foo_fetch_and_build_gtest.cmake)
include(cmake/targets/foo_add_test.cmake)

enable_testing()
add_subdirectory(test)
