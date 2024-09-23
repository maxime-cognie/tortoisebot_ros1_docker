#!/bin/bash

source devel/setup.bash
roslaunch tortoisebot_slam mapping.launch

# Execute the command passed into this entrypoint
exec "$@"