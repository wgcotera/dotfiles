#!/bin/sh

# Install PHP required extensions
sudo apt install php php-gd php-intl php-ftp php-mongodb php-redis php-fileinfo php-mysql php-pgsql php-xsl php-zip php-curl

# Install Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer self-update