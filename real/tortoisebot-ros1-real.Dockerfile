FROM mcognie/maximecognie-cp22:tortoisebot-ros1-real-base

RUN apt-get update && apt-get install -y \
    libraspberrypi0 \
    python3-dev \
    python3-rpi.gpio \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -a -G video root

COPY ./ros-entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["./entrypoint.sh"]
