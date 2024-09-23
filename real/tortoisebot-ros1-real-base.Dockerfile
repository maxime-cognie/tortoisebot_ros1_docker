FROM arm64v8/ros:noetic-ros-base

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    gazebo11 \
    ros-noetic-gazebo-ros \
    ros-noetic-camera-info-manager \
    ros-noetic-compressed-image-transport \
    ros-noetic-ros-control \
    ros-noetic-ros-controllers \
    ros-noetic-joint-state-publisher \
    ros-noetic-joint-state-controller \
    ros-noetic-robot-state-publisher \
    ros-noetic-robot-localization \
    ros-noetic-xacro \
    ros-noetic-tf2-ros \
    ros-noetic-tf2-tools \
    ros-noetic-rosbridge-server \
    libraspberrypi-bin \
    libraspberrypi-dev \
    python3-rosdep \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /ros1_ws/src
WORKDIR /ros1_ws/src

RUN /bin/bash -c "git clone https://github.com/rigbetellabs/tortoisebot.git"
RUN /bin/bash -c "rosdep update"

WORKDIR /ros1_ws/

RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && rosdep install --from-paths src --ignore-src -r -y && catkin_make"

RUN echo "source /ros1_ws/devel/setup.bash" >> ~/.bashrc