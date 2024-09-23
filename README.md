# tortoisebot_ros1_docker
---

This package contains all the Docker related ressources to setup a ready to use ROS1 environment to work with the Tortoisebot,  
in a simulated or real environment.

## Instalation
---

#### prerequisites

You need to have **Docker** in your system.
For installing Docker, refer to the official documentation at https://www.docker.com/.

## SIM
---

The docker image tags available for the simulation part are the following:

| Tag                            | Description                                                                               |
|--------------------------------|-------------------------------------------------------------------------------------------|
| tortoisebot_base_ros1          | Base image containing with ROS1 noetic + all the required packages for the child image.   |
| tortoisebot-ros1-gazebo        | This Docker image contains everything necessary for starting the Gazebo simulation.       |
| tortoisebot-ros1-slam          | This Docker image contains everything necessary for starting the mapping system.          |
| tortoisebot-ros1-waypoints     | This Docker image contains everything necessary for starting the waypoints action server. |
| tortoisebot-ros1-webapp        | This Docker image contains everything necessary for starting the Tortoisebot webapp.      |

### Usage

You can directly build the image yourself using the following command:  
`./build.sh`

Or you can pull the images from Docker Hub using the following command:  
`docker pull mcognie/maximecognie-cp22:tag`  
where `tag` is one tag of the previous list.  
<br/>  

Then start the containers using docker-compose `docker-compose up`

## Real
---

The docker image tags available for the real robot are the following:

| Tag                            | Description                                                                                                               |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| tortoisebot-ros1-real-base     | Base image containing with ROS1 noetic + all the required packages for the child image.                                   |
| tortoisebot-ros1-real          | This Docker image contains everything necessaary for starting all the real robot systems, including the camera and laser. |
| tortoisebot-ros1-slam-real     | This Docker image contains everything necessary for starting the mapping system for the real robot.                       |

### Usage

To build the different images and start the containers you can directly use the following command:  
`docker-compose up --build`  
Or you can pull the images from Docker Hub using the following command:  
`docker pull mcognie/maximecognie-cp22:tag`  where `tag` is one of the tags from the previous list. 
<br/>  
Then start the containers using docker-compose `docker-compose up`

#### Note

* real robot advice  
If you decide to build the image on the Tortoisebot itself (raspberry pi),
the raspberry pi might run out of ressources to avoid this issue you can increase the swap size to the necessary size.
(e.g tested with raspberry pi 4 with 2Gb of RAM + 2Gb Swap storage)  
As an advice opt for pulling the image from Docker Hub instead of building it yourself.
