#This is a sample CMake file for building boost on windows with static linking (no dll) using vcpkg
#see build.bat for predefine variable CMAKE_TOOLCHAIN_FILE, VCPKG_TARGET_TRIPLET and Traget -T v140
cmake_minimum_required(VERSION 3.11)

#So we can build in debug or release
set						(CMAKE_BUILD_TYPE "Debug")

#Set the static/dynamic runtime
include					(${CMAKE_CURRENT_SOURCE_DIR}/cmake_msvc.cmake)
configure_msvc_runtime	("${VCPKG_TARGET_TRIPLET}")

project					(test-${VCPKG_TARGET_TRIPLET})
FIND_PACKAGE			(Boost REQUIRED)

#dump_all				()

include_directories		(${Boost_INCLUDE_DIR})
add_executable			(${PROJECT_NAME} test.cpp)
target_link_libraries	(${PROJECT_NAME} 
						optimized ${Boost_THREAD_LIBRARY_RELEASE}
						debug ${Boost_THREAD_LIBRARY_DEBUG}
						)
