FROM osrf/ros:noetic-desktop-full
RUN apt-get update
RUN apt-get install ros-noetic-soem
RUN apt install -y ros-noetic-gazebo-ros-control
RUN apt install -y ros-noetic-ros-control 
RUN apt install -y ros-noetic-ros-controllers
RUN apt-get update
RUN apt-get install -y ros-noetic-moveit-*
RUN apt-get install -y ros-noetic-trac-ik
RUN apt-get install -y build-essential libgtk-3-dev
RUN apt-get install -y python3-pip
RUN pip install wxpython
