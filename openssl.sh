#!/bin/sh

# Update package list and upgrade system packages
sudo apt update && sudo apt upgrade -y

# Install dependencies
sudo apt install -y libssl-dev build-essential checkinstall zlib1g-dev

# Download and extract OpenSSL source
mkdir -p ~/openssl && cd ~/openssl
curl -LO https://www.openssl.org/source/openssl-1.1.1.tar.gz --no-check-certificate
tar -xzvf openssl-1.1.1.tar.gz
cd openssl-1.1.1

# Configure, compile, and test OpenSSL
./config
make
make test

# Install OpenSSL
sudo make install

# Create symbolic links for the OpenSSL libraries
cd /usr/lib
sudo ln -sf ~/openssl/openssl-1.1.1/libcrypto.so.1.1 libcrypto.so.1.1
sudo ln -sf ~/openssl/openssl-1.1.1/libssl.so.1.1 libssl.so.1.1

# Return to home directory
cd

# Remove OpenSSL source archive
rm -f ~/openssl-1.1.1.tar.gz

# Check installed OpenSSL version
openssl version
