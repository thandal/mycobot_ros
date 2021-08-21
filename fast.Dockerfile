# This Dockerfile allows rapid development iteration, so long as the ros
# dependencies don't change, in which case you MUST re-run docker-compose build
# ros!
# At least once:
#   docker-compose build ros
# Usage:
#   docker build -t fast -f fast.Dockerfile .
#   docker run -e DISPLAY=$DISPLAY -it fast "roslaunch mycobot_320 mycobot_320_slider.launch"

FROM mycobot_ros_ros

# Copy myCobot ROS package
WORKDIR /catkin_ws/src
COPY . mycobot_ros

# Build the project
WORKDIR /catkin_ws
RUN catkin_make
