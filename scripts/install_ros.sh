#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install (from http://wiki.ros.org/melodic/Installation/Ubuntu)
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt -y install ros-melodic-desktop-full
sudo rosdep init
rosdep update
sudo apt-get -y install python-rosinstall

# local configuration
if [ ! -d "/home/$USER/.local/bin" ]; then
  mkdir /home/$USER/.local/bin
fi
cp $DIR/../resources/setrosmaster ~/.local/bin/

cp $DIR/../resources/rosconsole ~/.rosconsole
cp $DIR/../resources/rosrc ~/.rosrc

if ! grep -xq "source /home/$USER/.rosrc" ~/.bashrc
then
  echo "" >> ~/.bashrc
  echo "# ROS" >> ~/.bashrc
  echo "source /home/$USER/.rosrc" >> ~/.bashrc
fi

setrosmaster localhost
source ~/.rosrc
