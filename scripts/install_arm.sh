#!/bin/bash

pushd .

# install ARM compiler
sudo apt-get -y install lib32ncurses5 lib32tinfo5 libc6-i386

GCC_ARM_TARBALL=gcc-arm-none-eabi-5_3-2016q1-20160330-linux.tar.bz2

cd /tmp
wget https://launchpad.net/gcc-arm-embedded/5.0/5-2016-q1-update/+download/$GCC_ARM_TARBALL
sudo mkdir -p /opt/gcc-arm-none-eabi
cd /opt/gcc-arm-none-eabi
sudo tar xf /tmp/$GCC_ARM_TARBALL
rm /tmp/$GCC_ARM_TARBALL

BASHRC_LINE='export PATH="/opt/gcc-arm-none-eabi/gcc-arm-none-eabi-5_3-2016q1/bin:$PATH"'
if ! grep -xq "$BASHRC_LINE" ~/.bashrc
then
  echo "" >> ~/.bashrc
  echo "# ARM compiler" >> ~/.bashrc
  echo $BASHRC_LINE >> ~/.bashrc
fi

# install the stm32flash utility
cd /tmp
git clone git://git.code.sf.net/p/stm32flash/code stm32flash-code
cd stm32flash-code
sudo make install
cd ..
rm -rf stm32flash-code

# install openocd
cd /tmp
OPENOCD_TARBALL=gnuarmeclipse-openocd-debian64-0.10.0-201704182147-dev.tgz
wget https://github.com/gnuarmeclipse/openocd/releases/download/gae-0.10.0-20170418/$OPENOCD_TARBALL
cd /opt
sudo tar xf /tmp/$OPENOCD_TARBALL
rm /tmp/$OPENOCD_TARBALL

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp $DIR/../resources/start_openocd_f1 ~/.local/bin/

# install 32-bit python bindings
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get -y install libpython2.7:i386

popd
