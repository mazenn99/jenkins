#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer update
fi

sudo chown $USER:$USER /var/www/ -R

chmod -R 777 storage/
chmod -R 777 bootstrap/cache/

php artisan migrate --force
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear

exec docker-php-entrypoint "$@"
