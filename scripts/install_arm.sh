#!/bin/bash

sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa
sudo apt-get update
sudo apt-get install gcc-arm-embedded

sudo apt -y install stm32flash openocd dfu-util

# setup openocd
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR/../resources/start_openocd_f1 ~/.local/bin/
cp $DIR/../resources/start_openocd_f4 ~/.local/bin/

# install 32-bit python bindings
sudo dpkg --add-architecture i386
sudo apt update
sudo apt -y install libpython2.7:i386

# set permissions
sudo usermod -a -G dialout $USER
