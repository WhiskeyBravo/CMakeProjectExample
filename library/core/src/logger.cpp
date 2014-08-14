//          Copyright Martin Saelzle 2014.
// Distributed under the Boost Software License, Version 1.0.
//    (See accompanying file LICENSE_1_0.txt or copy at
//          http://www.boost.org/LICENSE_1_0.txt)

#include <foo/core/logger.h>

#include <boost/filesystem/operations.hpp>
#include <iostream> 

bool foo::log (std::string message)
{
  if (boost::filesystem::is_regular_file ("foo bar"))
  {
    std::cout << message << std::endl;
    return true;
  }
  else
  {
    std::cerr << "Invalid log file." << std::endl;
    return false;
  }
}
