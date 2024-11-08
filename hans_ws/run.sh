#!/bin/bash

# Проверка, установлен ли Docker
if ! command -v docker &> /dev/null
then
    echo "Docker не установлен. Пожалуйста, установите Docker и попробуйте снова."
    exit 1
fi

# Разрешить доступ к X-серверу для Docker
echo "Разрешение доступа к X-серверу для Docker..."
xhost +local:docker

# Путь к директории на хосте, которую нужно смонтировать
HOST_DIR="$HOME/hans_ws"   # Замените на нужный путь
# Путь внутри контейнера, куда будет смонтирована директория
CONTAINER_DIR="/workspace"             # Замените на нужный путь внутри контейнера

# Имя Docker образа
IMAGE_NAME="osrf/ros:noetic-desktop-full"

# Проверка существования директории на хосте
if [ ! -d "$HOST_DIR" ]; then
    echo "Директория на хосте '$HOST_DIR' не существует. Пожалуйста, создайте её или укажите правильный путь."
    exit 1
fi

# Запуск Docker контейнера
echo "Запуск Docker контейнера..."
docker run -it \
    --rm \
    --env DISPLAY=$DISPLAY \
    --env QT_X11_NO_MITSHM=1 \
    --volume /tmp/.X11-unix:/tmp/.X11-unix \
    --volume "$HOST_DIR":"$CONTAINER_DIR" \
    --name ros_noetic_container \
    "$IMAGE_NAME"

# После завершения работы контейнера, отключить доступ к X-серверу для Docker
echo "Отключение доступа к X-серверу для Docker..."
#xhost -local:docker
