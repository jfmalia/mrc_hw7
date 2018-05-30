#/bin/bash

# Gazebo with the Watkins lab world and spawn two TB3s
roslaunch turtlebot3_nps watkins_multi.launch &

# Two instances of gmapping with appropriate parameters for the TB3
roslaunch turtlebot3_gazebo multi_turtlebot3_slam.launch ns:=tb3_0 &
roslaunch turtlebot3_gazebo multi_turtlebot3_slam.launch ns:=tb3_1 &

# Multi-map merge node for combining maps from each of the TB3s
roslaunch turtlebot3_nps multi_map_merge.launch &

# RVIZ with the pre-cooked configuration file
rosrun rviz rviz -d `rospack find turtlebot3_nps`/rviz/multi_map.rviz

