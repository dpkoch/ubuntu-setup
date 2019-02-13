#!/usr/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install (from http://wiki.ros.org/melodic/Installation/Ubuntu)
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update
sudo apt -y install ros-melodic-desktop-full
sudo rosdep init
rosdep update
sudo apt -y install python-rosinstall

# local configuration
cp -r $DIR/../resources/ros/. ~

LINE="source /home/$USER/.rosrc"
if [ -f ~/.zshrc ]; then
  if ! grep -xq "$LINE" ~/.zshrc; then
    echo "" >> ~/.zshrc
    echo "# ROS" >> ~/.zshrc
    echo "$LINE" >> ~/.zshrc
  fi
fi

setrosmaster localhost
