#!/bin/sh

sudo apt update && sudo apt upgrade -y
sudo apt install -y \
        curl \
        git

./console.sh