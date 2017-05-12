#!/bin/bash

pushd .

# install
cd /tmp
wget https://download.qt.io/official_releases/qtcreator/4.1/4.1.0/qt-creator-opensource-linux-x86_64-4.1.0.run
chmod +x qt-creator-opensource-linux-x86_64-4.1.0.run
sudo ./qt-creator-opensource-linux-x86_64-4.1.0.run
rm qt-creator-opensource-linux-x86_64-4.1.0.run

sudo ln -s /opt/qtcreator-4.1.0/bin/qtcreator /home/$USER/.local/bin/qtcreator

# import settings
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ~/.config/QtProject
cp -r $DIR/../resources/qtcreator ~/.config/QtProject/

popd
