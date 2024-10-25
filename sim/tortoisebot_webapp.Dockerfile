FROM mcognie/maximecognie-cp22:tortoisebot_base_ros1

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    git \
    ros-noetic-web-video-server \
    ros-noetic-tf2-web-republisher \
    && rm -rf /var/lib/apt/lists/*

RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1
 
COPY ./entrypoint-webapp.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

RUN git clone -b checkpoint22 https://github.com/maxime-cognie/tortoisebot_webapp.git

WORKDIR /catkin_ws

# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["/bin/bash"]

# We want /bin/bash to execute our /entrypoint.sh when container starts
CMD ["./entrypoint.sh"]