#          Copyright Martin Saelzle 2014.
# Distributed under the Boost Software License, Version 1.0.
#    (See accompanying file LICENSE_1_0.txt or copy at
#          http://www.boost.org/LICENSE_1_0.txt)

ExternalProject_Add(external_gtest
  PREFIX "${PROJECT_BINARY_DIR}/thirdparty/gtest"
  URL https://googletest.googlecode.com/files/gtest-1.7.0.zip
  URL_HASH SHA1=f85f6d2481e2c6c4a18539e391aa4ea8ab0394af
  CMAKE_ARGS -Wno-dev
             -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  INSTALL_COMMAND ""
)

ExternalProject_Get_Property(external_gtest source_dir)
set(GTEST_INCLUDE_DIR "${source_dir}/include")

ExternalProject_Get_Property(external_gtest binary_dir)
set(GTEST_LIBRARY_DIR "${binary_dir}")

add_library(gtest INTERFACE)
target_include_directories(gtest INTERFACE ${GTEST_INCLUDE_DIR})

if( NOT WIN32 )
  set(GTEST_LIBRARY "${GTEST_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}gtest${CMAKE_STATIC_LIBRARY_SUFFIX}")
  set(GTEST_MAIN_LIBRARY "${GTEST_LIBRARY_DIR}/${CMAKE_STATIC_LIBRARY_PREFIX}gtest_main${CMAKE_STATIC_LIBRARY_SUFFIX}")
  set(GTEST_LIBRARIES ${GTEST_LIBRARY} ${GTEST_MAIN_LIBRARY})
	target_link_libraries(gtest INTERFACE ${GTEST_LIBRARIES})
else()
target_link_libraries(gtest INTERFACE
	       debug ${GTEST_LIBS_DIR}/DebugLibs/${CMAKE_FIND_LIBRARY_PREFIXES}gtest${CMAKE_FIND_LIBRARY_SUFFIXES}
	       optimized ${GTEST_LIBS_DIR}/ReleaseLibs/${CMAKE_FIND_LIBRARY_PREFIXES}gtest${CMAKE_FIND_LIBRARY_SUFFIXES}
	)
	target_link_libraries(gtest INTERFACE
	       debug ${GTEST_LIBS_DIR}/DebugLibs/${CMAKE_FIND_LIBRARY_PREFIXES}gtest_main${CMAKE_FIND_LIBRARY_SUFFIXES}
	       optimized ${GTEST_LIBS_DIR}/ReleaseLibs/${CMAKE_FIND_LIBRARY_PREFIXES}gtest_main${CMAKE_FIND_LIBRARY_SUFFIXES}
	)
endif()
