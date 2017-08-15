#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p $DIR/../resources/atom

cd ~/.atom
cp *.{cson,coffee,less} $DIR/../resources/atom/

cd $DIR/../resources
apm list --installed --bare > atom-packages.list
