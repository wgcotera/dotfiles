#!/bin/sh

# Clone repository

mkdir ~/Documents/ipsp && cd ~/Documents/ipsp
git clone git@github.com:SantaPriscilaDevs/SPErp.git

cd SPErp

mv ~/Downloads/.env ~/Documents/ipsp/SPErp/.env
mv ~/Downloads/public.pem ~/Documents/ipsp/SPErp/storage/jwt/public.pem
mv ~/Downloads/private.pem ~/Documents/ipsp/SPErp/storage/jwt/private.pem

# Install PHP required extensions
sudo apt install php php-gd php-intl php-ftp php-mongodb php-redis php-fileinfo php-mysql php-pgsql php-xsl php-zip php-curl

# Install Composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo composer self-update

# Install dependencies
composer config github-oauth.github.com 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
npm ci
composer install