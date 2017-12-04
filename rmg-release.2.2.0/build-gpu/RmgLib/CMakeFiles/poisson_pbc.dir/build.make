# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu

# Include any dependencies generated for this target.
include RmgLib/CMakeFiles/poisson_pbc.dir/depend.make

# Include the progress variables for this target.
include RmgLib/CMakeFiles/poisson_pbc.dir/progress.make

# Include the compile flags for this target's objects.
include RmgLib/CMakeFiles/poisson_pbc.dir/flags.make

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o: RmgLib/CMakeFiles/poisson_pbc.dir/flags.make
RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o: ../RmgLib/examples/Poisson/poisson_pbc.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o"
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o -c /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib/examples/Poisson/poisson_pbc.cpp

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.i"
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib/examples/Poisson/poisson_pbc.cpp > CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.i

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.s"
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib/examples/Poisson/poisson_pbc.cpp -o CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.s

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.requires:

.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.requires

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.provides: RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.requires
	$(MAKE) -f RmgLib/CMakeFiles/poisson_pbc.dir/build.make RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.provides.build
.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.provides

RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.provides.build: RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o


# Object files for target poisson_pbc
poisson_pbc_OBJECTS = \
"CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o"

# External object files for target poisson_pbc
poisson_pbc_EXTERNAL_OBJECTS =

RmgLib/poisson_pbc: RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o
RmgLib/poisson_pbc: RmgLib/CMakeFiles/poisson_pbc.dir/build.make
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_thread.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_system.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_iostreams.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_program_options.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_filesystem.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_chrono.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_date_time.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_atomic.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_regex.so
RmgLib/poisson_pbc: /usr/lib/powerpc64le-linux-gnu/libpthread.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_thread.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_system.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_iostreams.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_program_options.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_filesystem.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_chrono.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_date_time.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_atomic.so
RmgLib/poisson_pbc: /home/deep8/workspace/benchmark/RMG/source/boost_install/lib/libboost_regex.so
RmgLib/poisson_pbc: /usr/lib/powerpc64le-linux-gnu/libpthread.so
RmgLib/poisson_pbc: /usr/lib/openmpi/lib/libmpi_cxx.so
RmgLib/poisson_pbc: /usr/lib/openmpi/lib/libmpi.so
RmgLib/poisson_pbc: RmgLib/libRmgLibShared.so
RmgLib/poisson_pbc: RmgLib/CMakeFiles/poisson_pbc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable poisson_pbc"
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/poisson_pbc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
RmgLib/CMakeFiles/poisson_pbc.dir/build: RmgLib/poisson_pbc

.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/build

RmgLib/CMakeFiles/poisson_pbc.dir/requires: RmgLib/CMakeFiles/poisson_pbc.dir/examples/Poisson/poisson_pbc.cpp.o.requires

.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/requires

RmgLib/CMakeFiles/poisson_pbc.dir/clean:
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib && $(CMAKE_COMMAND) -P CMakeFiles/poisson_pbc.dir/cmake_clean.cmake
.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/clean

RmgLib/CMakeFiles/poisson_pbc.dir/depend:
	cd /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0 /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/RmgLib /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib /home/deep8/workspace/benchmark/RMG/source/rmg-release.2.2.0/build-gpu/RmgLib/CMakeFiles/poisson_pbc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : RmgLib/CMakeFiles/poisson_pbc.dir/depend

