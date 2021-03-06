#!/usr/bin/bash

# icon theme
sudo add-apt-repository -y ppa:numix/ppa # numix themes
sudo apt update
sudo apt -y install numix-icon-theme-circle

# i3
sudo apt -y install i3

# rofi
sudo apt -y install rofi

# feh
sudo apt -y install feh

# termite
# source: https://computingforgeeks.com/install-termite-terminal-on-ubuntu-18-04-ubuntu-16-04-lts/
sudo apt -y install build-essential
sudo apt -y install git g++ libgtk-3-dev gtk-doc-tools gnutls-bin valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev libgirepository1.0-dev libxml2-utils gperf

pushd . &> /dev/null
cd $(mktemp -d)

git clone https://github.com/thestinger/vte-ng.git
echo export LIBRARY_PATH="/usr/include/gtk-3.0:$LIBRARY_PATH"
cd vte-ng
./autogen.sh
make && sudo make install

cd ..
git clone --recursive https://github.com/thestinger/termite.git
cd termite
make && sudo make install
sudo ldconfig
sudo mkdir -p /lib/terminfo/x
sudo ln -s /usr/local/share/terminfo/x/xterm-termite /lib/terminfo/x/xterm-termite
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/termite 60

popd &> /dev/null

# polybar
# source: https://github.com/polybar/polybar/wiki/Compiling
pip install -U sphinx
sudo apt -y install build-essential git cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt -y install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

pushd . &> /dev/null
cd $(mktemp -d)

git clone --recursive https://github.com/polybar/polybar.git
cd polybar

mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install

popd &> /dev/null

# audio management
sudo apt -y install pulseaudio-utils

# copy configuration files
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -r $DIR/../resources/i3/. ~

# don't start graphical service by default
#sudo systemctl enable multi-user.target --force
sudo systemctl set-default multi-user.target

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo "To finish installation, manually install playerctl from the .deb file"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

