#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

set(TESTS
  test_add
)

foreach(TEST ${TESTS})
  foo_add_test(${TEST}
    CPP_FILES "${TEST}.cpp"
    INTERNAL_DEPENDENCIES math
  )
endforeach()
