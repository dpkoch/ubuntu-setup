#/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt-get -y install texlive texlive-latex-extra texlive-generic-extra texlive-bibtex-extra texlive-fonts-extra texlive-math-extra texlive-extra-utils texlive-science texlive-humanities biber latexmk

if [ ! -d "/home/$USER/.local/bin" ]; then
  mkdir /home/$USER/.local/bin
fi
cp $DIR/../resources/clean-latex ~/.local/bin/

sudo apt-get -y install okular
