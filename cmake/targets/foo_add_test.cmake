#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

function(foo_add_test _NAME)

  set(options)
  set(oneValueArgs)
  set(multiValueArgs H_FILES CPP_FILES INTERNAL_DEPENDENCIES EXTERNAL_DEPENDENCIES EXTERNAL_BUILD_DEPENDENCIES)
  cmake_parse_arguments(FOO_ADD_TEST "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})

  foo_add_executable(${_NAME}
    H_FILES ${FOO_ADD_TEST_H_FILES}
    CPP_FILES ${FOO_ADD_TEST_CPP_FILES}
    INTERNAL_DEPENDENCIES ${FOO_ADD_TEST_INTERNAL_DEPENDENCIES}
    EXTERNAL_DEPENDENCIES ${FOO_ADD_TEST_EXTERNAL_DEPENDENCIES} gtest
	EXTERNAL_BUILD_DEPENDENCIES ${FOO_ADD_TEST_EXTERNAL_BUILD_DEPENDENCIES} external_gtest
  )
  add_test(NAME ${_NAME} COMMAND ${_NAME})

endfunction()
