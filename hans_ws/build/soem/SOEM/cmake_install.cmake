# Install script for directory: /workspace/src/soem/SOEM

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/workspace/install")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/workspace/devel/lib/libsoem.a")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/soem" TYPE FILE FILES
    "/workspace/src/soem/SOEM/soem/ethercat.h"
    "/workspace/src/soem/SOEM/soem/ethercatbase.h"
    "/workspace/src/soem/SOEM/soem/ethercatcoe.h"
    "/workspace/src/soem/SOEM/soem/ethercatconfig.h"
    "/workspace/src/soem/SOEM/soem/ethercatconfiglist.h"
    "/workspace/src/soem/SOEM/soem/ethercatdc.h"
    "/workspace/src/soem/SOEM/soem/ethercateoe.h"
    "/workspace/src/soem/SOEM/soem/ethercatfoe.h"
    "/workspace/src/soem/SOEM/soem/ethercatmain.h"
    "/workspace/src/soem/SOEM/soem/ethercatprint.h"
    "/workspace/src/soem/SOEM/soem/ethercatsoe.h"
    "/workspace/src/soem/SOEM/soem/ethercattype.h"
    "/workspace/src/soem/SOEM/osal/linux/osal_defs.h"
    "/workspace/src/soem/SOEM/osal/osal.h"
    "/workspace/src/soem/SOEM/oshw/linux/nicdrv.h"
    "/workspace/src/soem/SOEM/oshw/linux/oshw.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/workspace/build/soem/SOEM/test/linux/slaveinfo/cmake_install.cmake")
  include("/workspace/build/soem/SOEM/test/linux/eepromtool/cmake_install.cmake")
  include("/workspace/build/soem/SOEM/test/linux/simple_test/cmake_install.cmake")

endif()

