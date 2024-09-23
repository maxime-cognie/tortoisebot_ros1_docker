#!/bin/bash

cd ~/simulation_ws/src/
docker build -t mcognie/maximecognie-cp22:tortoisebot_base_ros1 -f tortoisebot_ros1_docker/sim/tortoisebot_base.Dockerfile .

cd tortoisebot_ros1_docker/sim/
docker build -f tortoisebot_gazebo.Dockerfile -t mcognie/maximecognie-cp22:tortoisebot-ros1-gazebo .
docker build -f tortoisebot_slam.Dockerfile -t mcognie/maximecognie-cp22:tortoisebot-ros1-slam .
docker build -f tortoisebot_waypoints.Dockerfile -t mcognie/maximecognie-cp22:tortoisebot-ros1-waypoint .
docker build -f tortoisebot_webapp.Dockerfile -t mcognie/maximecognie-cp22:tortoisebot-ros1-webapp .