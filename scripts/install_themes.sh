#!/bin/bash

# add ppa's
sudo add-apt-repository ppa:tista/adapta # adapta theme
sudo add-apt-repository ppa:noobslab/themes # arc theme
sudo add-apt-repository ppa:numix/ppa # numix themes
sudo add-apt-repository ppa:dyatlov-igor/materia-theme # materia theme
sudo add-apt-repository ppa:snwh/pulp # paper theme

sudo apt update

# gnome tweak tool
sudo apt -y install gnome-tweak-tool

# adapta theme
sudo apt -y install adapta-gtk-theme

# arc theme
sudo apt -y install arc-theme

# numix icon themes
sudo apt -y install numix-icon-theme numix-icon-theme-square numix-icon-theme-circle numix-gtk-theme

# materia theme
sudo apt -y install materia-theme

# paper themes
sudo apt -y install paper-gtk-theme paper-icon-theme paper-cursor-theme
