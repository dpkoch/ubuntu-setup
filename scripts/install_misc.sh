#!/bin/bash

# install packages
sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install meld
sudo apt-get -y install astyle

# configuration
git config --global core.editor vim
git config --global diff.tool meld
git config --global merge.tool meld

# mkdocs
sudo apt-get -y install python-pip
sudo pip install mkdocs
