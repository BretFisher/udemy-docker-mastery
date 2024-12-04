#! /bin/bash

# do some startup stuff
echo "Checking permissions on /var/www/html/upload"
mkdir -p /var/www/html/upload
chown -R www-data:www-data /var/www/html/upload

# Start the application set in CMD
exec "$@"