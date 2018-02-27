#!/bin/bash

# add user to dialout group
sudo usermod -a -G dialout $USER

pushd .

# download and extract OpenOCD
OPENOCD_VERSION="0.10.0-5-20171110"
OPENOCD_SUFFIX="1117"
OPENOCD_TAR="gnu-mcu-eclipse-openocd-${OPENOCD_VERSION}-${OPENOCD_SUFFIX}-debian64.tgz"

cd /tmp
wget https://github.com/gnu-mcu-eclipse/openocd/releases/download/v${OPENOCD_VERSION}/${OPENOCD_TAR}
tar xf ${OPENOCD_TAR}
sudo mv gnu-mcu-eclipse/openocd /opt/

# create start script
SCRIPT_NAME="start_openocd_f1"

echo "#!/bin/bash" > $SCRIPT_NAME
echo "" >> $SCRIPT_NAME
echo "cd /opt/openocd/${OPENOCD_VERSION}-${OPENOCD_SUFFIX}/bin" >> $SCRIPT_NAME
echo "./openocd -f interface/stlink-v2.cfg -f target/stm32f1x.cfg" >> $SCRIPT_NAME

chmod +x $SCRIPT_NAME
mv $SCRIPT_NAME /home/$USER/.local/bin

popd

