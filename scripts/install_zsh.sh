#!/usr/bin/bash

# zsh
sudo apt -y install zsh

# modify /etc/passwd to use zsh as default shell
# UPDATE
# Oh My Zsh does this for you. Also, chsh is the proper way to do it.
#sudo sed -i -r "s|(^$USER:.*:)/bin/bash$|\1/usr/bin/zsh|g" /etc/passwd

# Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# customize
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -r $DIR/../resources/zsh ~
sed -i 's/^ZSH_THEME=".*"$/ZSH_THEME="dpkoch"/'

# TODO modify PATH, source .rosrc, etc.
