FROM tortoisebot-ros1-real-base:latest

RUN apt-get update && apt-get install -y \
    ros-noetic-slam-gmapping \
    ros-noetic-map-server \
    ros-noetic-move-base \
    ros-noetic-navigation \
    ros-noetic-dwa-local-planner \
    ros-noetic-ira-laser-tools \
    ros-noetic-teleop-twist-keyboard \
    python3-wstool \
    python3-rosdep \
    ninja-build \
    stow \
    libcairo2-dev \
    libcairo2-dev \
    ros-noetic-rviz \
    python3-sphinx \
    libceres-dev \
    liblua5.2-dev \
    && rm -rf /var/lib/apt/lists/*

# install cartographer
RUN mkdir carto_ws
WORKDIR /ros1_ws/carto_ws
RUN wstool init src &&\
    wstool merge -t src https://raw.githubusercontent.com/cartographer-project/cartographer_ros/master/cartographer_ros.rosinstall &&\
    wstool update -t src
RUN sed -i 's|<depend>libabsl-dev</depend>|""|g' src/cartographer/package.xml
RUN rosdep update &&\
    rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
WORKDIR /ros1_ws/carto_ws/src
RUN git clone -b melodic-devel https://github.com/ros-perception/perception_pcl.git &&\
    git clone https://github.com/ros-perception/pcl_msgs &&\
    git clone -b noetic-devel https://github.com/jsk-ros-pkg/geometry2_python3.git
WORKDIR /ros1_ws/carto_ws
RUN rosdep install --from-paths src --ignore-src --rosdistro=${ROS_DISTRO} -y
RUN src/cartographer/scripts/install_abseil.sh
RUN /bin/bash -c "source /opt/ros/noetic/setup.bash &&\
    catkin_make_isolated --install --use-ninja -j3 -l4"
#-----------------------------------------------------------------#

WORKDIR /ros1_ws
RUN /bin/bash -c "rm -r build/ devel/ &&\
    source carto_ws/devel_isolated/setup.bash &&\
    catkin_make"

COPY ./ros-entrypoint-slam.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

COPY mapping.rviz /ros1_ws/src/tortoisebot/tortoisebot_slam/rviz/
# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["./entrypoint.sh"]
