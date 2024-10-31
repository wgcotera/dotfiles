\#!/bin/sh

sudo apt update && sudo apt upgrade -y
echo "bind -s 'set completion-ignore-case on'" >> ~/.bashrc
sudo apt install -y \
        curl
git config --global user.name "wgcotera"
git config --global user.email "wgcotera@espol.edu.ec" 
 ./console.sh
 ./fonts.sh
# ./vscode.sh
./toolbox.sh
# ./openssl.sh
# ./navicat.sh
./nvm.sh
./ipsp.sh
