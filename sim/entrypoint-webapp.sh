#!/bin/bash

source devel/setup.bash
roslaunch course_web_dev_ros web.launch

# Execute the command passed into this entrypoint
exec "$@"