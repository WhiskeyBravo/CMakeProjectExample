#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

foo_add_library(math
  H_FILES add.h
  INTERNAL_DEPENDENCIES core
  EXTERNAL_DEPENDENCIES eigen
)
