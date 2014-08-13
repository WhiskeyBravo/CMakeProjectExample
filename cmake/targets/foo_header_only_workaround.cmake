#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

# Create a dummy cpp file.
# An alternative would be to create an interface library. However those don't allow adding files to them, which is needed if the header files should show up in an IDE.
macro(foo_header_only_workaround _NAME _CPP_FILES)
  set(FILENAME "${CMAKE_CURRENT_BINARY_DIR}/${_NAME}_dummy.cpp")
  file(WRITE "${FILENAME}"
    "// Autmoatically generated file to avoid having problems with header-only libraries.\n\n"
    "void ${_NAME}Dummy ()\n{\n}\n"
  )
  list(APPEND ${_CPP_FILES} ${FILENAME})
endmacro()

