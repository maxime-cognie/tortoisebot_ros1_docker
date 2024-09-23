FROM mcognie/maximecognie-cp22:tortoisebot_base_ros1

ENV ROS_MASTER_URI=http://master:11311

COPY ./entrypoint-gazebo.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

# /bin/bash is the command we want to execute when running a docker container
ENTRYPOINT ["/bin/bash"]

# We want /bin/bash to execute our /entrypoint.sh when container starts
CMD ["./entrypoint.sh"]