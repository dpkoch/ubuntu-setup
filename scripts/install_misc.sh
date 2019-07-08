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
git config --global color.status always

git config --global alias.subup "submodule update --init --recursive"
git config --global alias.br branch
git config --global alias.st status
git config --global alias.ch checkout

git config --global --add url.git@github.com:.insteadOf git://github.com/
git config --global --add url.git@github.com:.insteadOf https://github.com/
git config --global --add url.git@magiccvs.byu.edu:.insteadOf https://magiccvs.byu.edu/gitlab/

# vim configuration
cp $DIR/../resources/vimrc ~/.vimrc

# mkdocs
sudo apt-get -y install python-pip python3-pip
#sudo pip install mkdocs

# install miscellaneous scripts
cp $DIR/../resources/check-reboot ~/.local/bin/
cp $DIR/../resources/git-status ~/.local/bin/

# override default opening of bibtex and pdf files in Mendeley destkop
xdg-mime default gedit.desktop text/x-bibtex
xdg-mime default evince.desktop application/pdf

# exfat filesystem support
sudo apt -y install exfat-fuse exfat-utils
