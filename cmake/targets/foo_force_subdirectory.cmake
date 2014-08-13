#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

macro(foo_force_subdirectory _INPUT_FILES _OUTPUT_FILES _SUBDIRECTORY)

  if(${_INPUT_FILES} STREQUAL ${_OUTPUT_FILES})
    message(FATAL_ERROR "Please use a different name for the input and output files: '${_INPUT_FILES}'")
  endif()

  set(${_OUTPUT_FILES})
  foreach(INPUT_FILE ${${_INPUT_FILES}})
    list(APPEND ${_OUTPUT_FILES} "${_SUBDIRECTORY}/${INPUT_FILE}")
  endforeach()

endmacro()
