# Base image
FROM osrf/ros:noetic-desktop-full-focal

# Install Gazebo 11 and other dependencies
RUN apt-get update && apt-get install -y \
  gazebo11 \
  ros-noetic-gazebo-ros-pkgs \
  ros-noetic-gazebo-ros-control \
  ros-noetic-ros-control \
  ros-noetic-ros-controllers \
  ros-noetic-joint-state-publisher \
  ros-noetic-joint-state-controller \
  ros-noetic-robot-state-publisher \
  ros-noetic-robot-localization \
  ros-noetic-xacro \
  ros-noetic-tf2-ros \
  ros-noetic-tf2-tools \
  ros-noetic-gmapping \
  ros-noetic-rosbridge-server \
  && rm -rf /var/lib/apt/lists/*
RUN rosdep update

# make workspace
WORKDIR /
RUN mkdir -p /catkin_ws/src
WORKDIR /catkin_ws

# Copy the files in the current directory into the container
COPY ./tortoisebot /catkin_ws/src/tortoisebot
COPY ./course_web_dev_ros /catkin_ws/src/course_web_dev_ros

# Source ros noetic and build workspace
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && cd /catkin_ws && rosdep install --from-paths src --ignore-src -r -y && catkin_make"

# Source the setup.bash file before executing further commands
RUN echo "source /catkin_ws/devel/setup.bash" >> ~/.bashrc