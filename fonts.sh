#!/bin/sh

curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
unzip FiraCode.zip -d ~/.local/share/fonts
rm FiraCode.zip
fc-cache -f