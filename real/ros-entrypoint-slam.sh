#!/bin/bash

source carto_ws/devel_isolated/setup.bash
source devel/setup.bash

# Execute the command passed into this entrypoint
exec "$@"