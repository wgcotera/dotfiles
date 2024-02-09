\#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y \
        curl \
        git
./console.sh
./fonts.sh
./vscode.sh
# ./openssl.sh
# ./navicat.sh
