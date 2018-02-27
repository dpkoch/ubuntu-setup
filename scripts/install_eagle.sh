#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd . &> /dev/null

cd /tmp

# download latest and extract version
URL="https://www.autodesk.com/eagle-download-lin"
FILENAME=$(wget -nv --content-disposition $URL 2>&1 | cut -d\" -f2)
EAGLE_VERSION=$(echo $FILENAME | cut -d_ -f3)

# extract
sudo mkdir -p /opt/eagle
cd /opt/eagle
sudo tar xf /tmp/$FILENAME
rm /tmp/$FILENAME

# fix permissions
sudo chmod -R a+rX /opt/eagle/eagle-$EAGLE_VERSION/

# add to path
BASHRC_LINE="export PATH=\"/opt/eagle/eagle-$EAGLE_VERSION:\$PATH\""
if ! grep -xq "$BASHRC_LINE" ~/.bashrc
then
  echo "" >> ~/.bashrc
  echo "# Eagle" >> ~/.bashrc
  echo $BASHRC_LINE >> ~/.bashrc
fi

# add desktop file
sed -e "s/%%VERSION%%/$EAGLE_VERSION/g" $DIR/../resources/eagle.desktop > ~/.local/share/applications/eagle-$EAGLE_VERSION.desktop

popd &> /dev/null
