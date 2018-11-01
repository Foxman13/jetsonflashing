# nVidia Jetson Flashing via containers
This project contains a pattern for building the necessary components, for flashing custom firmware to the nVidia Jetson platform, into a container. Then, this container can be used to flash numerous Jetosn modules via recovery mode. 

## Getting started
In order to flash a Jetson over USB, a Linux host PC is highly recommended. Flashing from a VM on another host OS (Windows/MacOS) does not work reliably. 

- Ensure Docker is installed on your host PC. You can install it on most systems by running "sudo apt-get install docker"
- clone this repository
- You will need to setup the device-specific scripts in a directory named something like "tx2_auvidea_j120", which is a combination of the target Jetson module and the model of the carrier board that we need to flash the firmware for. There are two examples of working config directories. The two key scripts are config.h and apply_firmware.sh. 
- From the depo directory, run the following commmand to build the container:
    - sudo docker build --build-arg DEVICE_NAME=<device config folder name>
- After the container image finishes building, you need to run the container to flash. You can run the container using this command:
    - sudo docker run -it --priviledged -v /dev/bus/usb:/dev/bus/usb <image id>
- When the container starts, it will begin at the bash prompt. You can flash devices using the following commands:
    - cd /Linux_for_Tegra/
    - sudo ./flash.sh <board name> mmcblk0p1 - where <board name> is something like jetson-tx2.
    - Let the device complete flashing. It typically takes around 10 minutes per device.
