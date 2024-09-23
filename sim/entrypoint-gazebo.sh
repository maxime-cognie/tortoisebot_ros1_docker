#!/bin/bash

source devel/setup.bash
roslaunch tortoisebot_gazebo tortoisebot_playground.launch

# Execute the command passed into this entrypoint
exec "$@"