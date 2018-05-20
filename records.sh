#!/bin/bash
rosbag record -b 5120 /tf /tf_static /clock /zed/odom /zed/left/camera_info /zed/left/image_rect_color /zed/odom /zed/right/camera_info /zed/right/image_rect_color /zed/point_cloud/cloud_registered /mavros/imu/data_raw

