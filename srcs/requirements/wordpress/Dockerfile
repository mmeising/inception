FROM alpine:3.16

# install php-fpm
RUN apk --update --upgrade add --no-cache php8-fpm php8-mysqli php8-cli php8-phar php8-iconv \
    curl mysql-client

RUN rm -f /etc/php8/php-fpm.d/www.conf && rm -f /var/www/wordpress/wp-config-sample.php
COPY wp-config.php /var/www/wordpress/wp-config.php
COPY www.conf /etc/php8/php-fpm.d/www.conf

# Wordpress Download + permissions
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

# maybe can save next line later on
WORKDIR /var/www/wordpress
RUN wp core download --allow-root
COPY entry.sh /usr/local/bin/entry.sh
RUN chmod +x /usr/local/bin/entry.sh

ENTRYPOINT ["/usr/local/bin/entry.sh"]
