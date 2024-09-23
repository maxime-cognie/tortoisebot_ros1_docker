#!/bin/bash

source devel/setup.bash
rosrun course_web_dev_ros tortoisebot_action_server.py

# Execute the command passed into this entrypoint
exec "$@"