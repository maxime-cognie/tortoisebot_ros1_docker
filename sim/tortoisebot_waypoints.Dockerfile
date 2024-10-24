FROM mcognie/maximecognie-cp22:tortoisebot_base_ros1

COPY ./entrypoint-waypoints.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

RUN sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["/bin/bash"]

# We want /bin/bash to execute our /entrypoint.sh when container starts
CMD ["./entrypoint.sh"]