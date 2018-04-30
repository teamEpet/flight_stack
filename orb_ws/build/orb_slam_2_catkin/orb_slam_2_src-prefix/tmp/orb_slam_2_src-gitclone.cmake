if("master" STREQUAL "")
  message(FATAL_ERROR "Tag for git checkout should not be empty.")
endif()

set(run 0)

if("/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitinfo.txt" IS_NEWER_THAN "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitclone-lastrun.txt")
  set(run 1)
endif()

if(NOT run)
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src'")
endif()

# try the clone 3 times incase there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git" clone --origin "origin" "git@github.com:raulmur/ORB_SLAM2.git" "orb_slam_2_src"
    WORKING_DIRECTORY "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'git@github.com:raulmur/ORB_SLAM2.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git" checkout master
  WORKING_DIRECTORY "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule init 
  WORKING_DIRECTORY "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to init submodules in: '/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src'")
endif()

execute_process(
  COMMAND "/usr/bin/git" submodule update --recursive 
  WORKING_DIRECTORY "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitinfo.txt"
    "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitclone-lastrun.txt"
  WORKING_DIRECTORY "/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/media/Extra/flight_stack/orb_ws/build/orb_slam_2_catkin/orb_slam_2_src-prefix/src/orb_slam_2_src-stamp/orb_slam_2_src-gitclone-lastrun.txt'")
endif()

