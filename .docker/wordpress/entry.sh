#!/bin/sh

wp core install --url=${DOMAIN} --title=${TITLE} --admin_user=${WP_ROOT_USER} \
                --admin_password=${WP_ROOT_PWD} --admin_email=${WP_ROOT_MAIL} \
                --allow-root

export root=$(wp user list | grep dieter)
export max=$(wp user list | grep max)

#crappy workaround
if [ -z "$root" ]
then
    wp user create ${WP_ROOT_USER} ${WP_ROOT_MAIL} --role=administrator \
                    --user_pass=${WP_ROOT_PWD} --allow-root
fi

if [ -z "$max" ]
then
    wp user create ${WP_USER} ${WP_MAIL} --user_pass=${WP_PWD}
fi

php-fpm8 -F
