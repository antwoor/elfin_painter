docker run -it \
    --rm \
    --network host \
    --env DISPLAY=$DISPLAY \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume $HOME/Solovov/robo-painter:/workspace \
    hans_noetic
