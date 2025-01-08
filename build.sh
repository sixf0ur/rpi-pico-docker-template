#!/bin/bash

CONTAINER_NAME="pico-sdk"

if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "Removing existing container: $CONTAINER_NAME"
    docker rm -f $CONTAINER_NAME
fi

echo "Starting container..."
docker run -d -it --name $CONTAINER_NAME --mount type=bind,source=$(pwd),target=/home/dev lukstep/raspberry-pi-pico-sdk:latest

echo "Building project..."
docker exec -it $CONTAINER_NAME /bin/sh -c "
    cd /home/dev &&
    mkdir -p build &&
    cd build &&
    cmake .. &&
    make -j4
"

echo "Removing container..."
docker rm -f $CONTAINER_NAME

echo "Build done!"
