docker run -it \
    --rm \
    --network host \
    --env DISPLAY=$DISPLAY \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume $HOME/Solovov/robo-painter:/root/catkin_ws \
    ros:noetic-full
