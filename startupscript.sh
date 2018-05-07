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
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/nvidia/orb_ws/src/ORB_SLAM2_CUDA/Examples/ROS
#export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:/home/nvidia/ORB_SLAM2/Examples/ROS
echo "                                   "
echo $ROS_PACKAGE_PATH
echo "                                   "

roslaunch offboard zedTx2.launch
#roslaunch ORB_SLAM2_CUDA ros_mono.launch


