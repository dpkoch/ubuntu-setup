#!/bin/bash

# install compass (sass compiler)
sudo apt-get -y install ruby ruby-dev
sudo gem install sass
sudo gem install compass

# install local web server
sudo apt-get -y install apache2 php libapache2-mod-php
