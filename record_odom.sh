#!/bin/bash
rosbag record -b 5120 /tf /tf_static /clock /zed/odom /mavros/imu/data_raw

