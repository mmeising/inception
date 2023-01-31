#!/bin/sh

sleep 3 && mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_NAME};" \
    && mysql -u root -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PWD}';" \
    && mysql -u root -e "GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'localhost' WITH GRANT OPTION;" \
    && mysql -u root -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}';" \
    && mysql -u root -e "GRANT ALL PRIVILEGES ON ${MARIADB_NAME}.* TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;" \
    && mysql -u root -e "FLUSH PRIVILEGES;" \
    && mysql -u root -e "DROP USER ''@'localhost'; FLUSH PRIVILEGES;" \
    && mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';"

mysqld_safe --defaults-extra-file=/etc/mysql/mariadb.conf.d/50-server.conf
