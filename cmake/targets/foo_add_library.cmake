#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

function(foo_add_library _NAME)

  set(options)
  set(oneValueArgs)
  set(multiValueArgs H_FILES CPP_FILES INTERNAL_DEPENDENCIES EXTERNAL_DEPENDENCIES)
  cmake_parse_arguments(FOO_ADD_LIBRARY "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  foo_force_subdirectory(FOO_ADD_LIBRARY_H_FILES H_FILES "include/foo/${_NAME}")
  foo_force_subdirectory(FOO_ADD_LIBRARY_CPP_FILES CPP_FILES "src")

  if(NOT CPP_FILES)
    foo_header_only_workaround(${_NAME} CPP_FILES)
  endif()

  add_library(${_NAME} ${H_FILES} ${CPP_FILES})

  target_include_directories(${_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
  target_link_libraries(${_NAME} ${FOO_ADD_LIBRARY_INTERNAL_DEPENDENCIES} ${FOO_ADD_LIBRARY_EXTERNAL_DEPENDENCIES})

endfunction()
