#!/bin/bash
rosbag record -b 5120 /tf /tf_static /clock /zed/odom  /zed/point_cloud/cloud_registered

