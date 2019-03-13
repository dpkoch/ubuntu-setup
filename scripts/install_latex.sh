#/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

sudo apt -y install texlive texlive-latex-extra texlive-generic-extra texlive-bibtex-extra texlive-fonts-extra texlive-extra-utils texlive-science texlive-humanities texlive-font-utils biber latexmk

if [ ! -d "/home/$USER/.local/bin" ]; then
  mkdir /home/$USER/.local/bin
fi
cp $DIR/../resources/clean-latex ~/.local/bin/

sudo apt -y install okular
