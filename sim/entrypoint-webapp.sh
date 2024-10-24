#!/bin/bash

source devel/setup.bash
roslaunch course_web_dev_ros web.launch &
roslaunch course_web_dev_ros tf2_web.launch &

cd tortoisebot_webapp && python -m http.server 7000

# Execute the command passed into this entrypoint
exec "$@"