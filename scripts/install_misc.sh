#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# install packages
sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install gimp
sudo apt-get -y install inkscape
sudo apt-get -y install meld
sudo apt-get -y install astyle
sudo apt-get -y install screen

# git configuration
git config --global push.default simple
git config --global core.editor vim
git config --global diff.tool meld
git config --global merge.tool meld
git config --global alias.subup "submodule update --init --recursive"

# vim configuration
cp $DIR/../resources/vimrc ~/.vimrc

# mkdocs
sudo apt-get -y install python-pip
sudo pip install mkdocs
