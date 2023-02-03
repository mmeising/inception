#!/bin/sh

wp core install --url=${DOMAIN} --title=${TITLE} --admin_user=${WP_ROOT_USER} \
                --admin_password=${WP_ROOT_PWD} --admin_email=${WP_ROOT_MAIL} \
                --allow-root

export root=$(wp user list | grep dieter)
export max=$(wp user list | grep max)

php-fpm8 -F
