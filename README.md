# rpi-pico-docker-template
A template to compile C/C++ faster for the RP2040 with docker.

## Usage
Make sure Docker is installed on your system.

You need to pull the [`lukstep`](https://hub.docker.com/r/lukstep/raspberry-pi-pico-sdk) Docker image: 

```
docker pull lukstep/raspberry-pi-pico-sdk
```

### For Mac/Linux:
Make the script executable:

```
chmod +x build.sh
```

Then, build the project with:
```
./build.sh
```

### For Windows:

Build the project with
```
./build.bat
```

## Uploading the Code

Using an editor or the command line, simply copy the executable: `my_project/build/my_project.uf2`

to the RP2040.
