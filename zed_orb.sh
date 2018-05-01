#!/bin/bash
source zed_ws/devel/setup.bash
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/media/Extra/orb_ws/ORB_SLAM2/Examples/ROS/ORB_SLAM2
roslaunch ORB_SLAM2 ros_mono_cam.launch
