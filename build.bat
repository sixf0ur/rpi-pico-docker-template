@echo off
setlocal

set CONTAINER_NAME=pico-sdk

for /f "tokens=*" %%i in ('docker ps -aq -f name=%CONTAINER_NAME%') do (
    echo Removing existing container: %CONTAINER_NAME%
    docker rm -f %%i
)

echo Starting container...
docker run -d -it --name %CONTAINER_NAME% --mount type=bind,source=%cd%,target=/home/dev lukstep/raspberry-pi-pico-sdk:latest

echo Building project...
docker exec -it %CONTAINER_NAME% sh -c "
    cd /home/dev &&
    mkdir -p build &&
    cd build &&
    cmake .. &&
    make -j4
"

echo Removing container...
docker rm -f %CONTAINER_NAME%

echo Build done!
endlocal
