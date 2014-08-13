#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

find_package(Eigen3 3.2.0 REQUIRED)

add_library(eigen INTERFACE)
target_include_directories(eigen INTERFACE ${EIGEN3_INCLUDE_DIR})
