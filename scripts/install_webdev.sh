#!/bin/bash

# install compass (sass compiler)
sudo apt-get -y install ruby ruby-dev
sudo gem install sass
sudo gem install compass

# install local web server
sudo apt-get -y install nginx php-fpm php-curl
