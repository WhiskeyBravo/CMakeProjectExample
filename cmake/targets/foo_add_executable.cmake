#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

function(foo_add_executable _NAME)

  set(options)
  set(oneValueArgs)
  set(multiValueArgs H_FILES CPP_FILES INTERNAL_DEPENDENCIES EXTERNAL_DEPENDENCIES)
  cmake_parse_arguments(FOO_ADD_EXECUTABLE "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  if(NOT FOO_ADD_EXECUTABLE_CPP_FILES)
    message(FATAL_ERROR "No CPP_FILES given for executable '${_NAME}'.")
  endif()

  add_executable(${_NAME} ${FOO_ADD_EXECUTABLE_H_FILES} ${FOO_ADD_EXECUTABLE_CPP_FILES})

  target_include_directories(${_NAME} PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}")
  target_link_libraries(${_NAME} ${FOO_ADD_EXECUTABLE_INTERNAL_DEPENDENCIES} ${FOO_ADD_EXECUTABLE_EXTERNAL_DEPENDENCIES})

endfunction()
