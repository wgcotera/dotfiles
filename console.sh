#!/bin/sh

curl -sS https://starship.rs/install.sh | sh -s -- -y
echo 'eval "$(starship init bash)"' >> ~/.bashrc
. ~/.bashrc  # or source ~/.zshrc