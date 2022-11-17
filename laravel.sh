#!/bin/bash

if [ ! -f "vendor/autoload.php" ]; then
    composer update
fi

npm install


php artisan migrate --force
php artisan key:generate
php artisan cache:clear
php artisan config:clear
php artisan route:clear
npm run dev

php artisan serv

exec docker-php-entrypoint "$@"
