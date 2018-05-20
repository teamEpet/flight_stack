#!/bin/zsh
source /opt/ros/kinetic/setup.zsh
source ./flight_ws/devel/setup.zsh 
#source ./flight_ws/devel/setup.bash
source ./Firmware/Tools/setup_gazebo.bash $(pwd) $(pwd)/Firmware/build/posix_sitl_default
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware/Tools/sitl_gazebo
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:$(pwd)/Firmware/Tools/rotors_description
