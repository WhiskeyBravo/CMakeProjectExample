//          Copyright Martin Saelzle 2014.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

#include <gtest/gtest.h>

#include <foo/core/logger.h>

TEST (TestLogger, Log)
{
  EXPECT_TRUE (foo::log ("hello world"));
}
