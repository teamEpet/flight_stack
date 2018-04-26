#!/bin/bash
source /opt/ros/kinetic/setup.bash
export ROS_IP=10.42.0.1
cd /home/nvidia/flight_stack
pwd
source zed_ros_source.sh
#source sim_ros_source.sh
echo "                                   "
echo $ROS_PACKAGE_PATH
echo "                                   "
#source zed_ws/devel/setup.sh 
echo "                                   "
echo $ROS_PACKAGE_PATH
echo "                                   "
roslaunch offboard zedTx2.launch



