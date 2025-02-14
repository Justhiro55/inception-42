#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN_USER} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --allow-root

./wp-cli.phar user create ${WP_NORMAL_USER} ${WP_NORMAL_EMAIL} --user_pass=${WP_NORMAL_PASSWORD} --role=author --allow-root

./wp-cli.phar config set WP_CACHE_KEY_SALT ${DOMAIN_NAME} --allow-root
./wp-cli.phar config set WP_REDIS_HOST redis --allow-root
./wp-cli.phar config set WP_REDIS_PORT 6379 --allow-root
./wp-cli.phar plugin activate redis-cache --allow-root

echo "127.0.0.1 ${DOMAIN_NAME}" >> /etc/hosts

php-fpm7.4 -F
