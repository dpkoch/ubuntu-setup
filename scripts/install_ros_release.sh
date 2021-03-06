#/bin/bash

# install Docker for prerelease tests
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    qemu-user-static
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt -y install docker-ce

sudo usermod -a -G docker $USER

# install bloom
sudo apt -y install python-bloom
sudo apt -y install python3-ros-buildfarm
