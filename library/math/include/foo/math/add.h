//          Copyright Martin Saelzle 2014.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

#pragma once

#include <Eigen/Core>

#include <foo/core/logger.h>

namespace foo
{
  Eigen::Vector3i add (const Eigen::Vector3i& lhs, const Eigen::Vector3i& rhs)
  {
    foo::log ("add");
    return lhs + rhs;
  }
} // End namespace foo
