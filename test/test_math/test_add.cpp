//          Copyright Martin Saelzle 2014.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

#include <gtest/gtest.h>

#include <foo/math/add.h>

TEST (TestAdd, Vector3i)
{
  Eigen::Vector3i lhs (1, 9, 2);
  Eigen::Vector3i rhs (3, -11, 5);
  Eigen::Vector3i expected (4, -2, 7);
  Eigen::Vector3i actual = foo::add (lhs, rhs);

  EXPECT_EQ (expected.x (), actual.x ());
  EXPECT_EQ (expected.y (), actual.y ());
  EXPECT_EQ (expected.z (), actual.z ());
}
