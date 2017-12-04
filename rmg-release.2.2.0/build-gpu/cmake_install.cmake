# Install script for directory: /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu"
         RPATH "")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/rmg-gpu")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu"
         OLD_RPATH "/usr/lib/openmpi/lib:/home/deep8/anaconda3/lib:/home/deep8/workspace/benchmark/RMG/source/plplot.git/install/lib:/home/deep8/workspace/benchmark/RMG/source/boost_install/lib:/home/deep8/workspace/benchmark/RMG/source/openbabel-2.3.2/install/lib:"
         NEW_RPATH "")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/rmg-gpu")
    endif()
  endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE FILE FILES
    "/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib/libRmgLibShared.so"
    "/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib/libRmgLib.a"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rmg" TYPE DIRECTORY FILES "/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/Examples")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/Finite_diff/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/Force/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/Input/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/MG/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/Misc/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/US_PP/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/XC/cmake_install.cmake")
  include("/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/InternalPseudo/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
