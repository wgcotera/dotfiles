#!/bin/sh

# curl -LO https://navicat.com/download/direct-download?product=navicat15-premium-en.AppImage&location=1
sudo apt install libcapstone-dev
sudo apt-get install cmake
cd ~/Downloads
git clone https://github.com/keystone-engine/keystone.git
cd keystone
mkdir build
cd ~/Downloads/keystone/build
../make-share.sh
sudo make install
sudo ldconfig
cd

# install rapidjson
sudo apt-get install rapidjson-dev

cd ~/Downloads

# clone this repository
git clone https://github.com/FuLygon/Navicat-Linux.git


# Installing Navicat
mkdir ~/Downloads/navicat
sudo mount -o loop ~/Downloads/navicat15-premium-en.AppImage ~/Downloads/navicat
sudo cp -r ~/Downloads/navicat /opt/
sudo umount ~/Downloads/navicat

# Patching Navicat
cd ~/Downloads/Navicat-Linux
make all
cd ~/Downloads/Navicat-Linux/bin
sudo ./navicat-patcher /opt/navicat
sudo ./navicat-keygen --text ./RegPrivateKey.pem


