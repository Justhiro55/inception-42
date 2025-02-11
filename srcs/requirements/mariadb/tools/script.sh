#!/bin/bash

mysql_install_db

mysqld_safe &

# Wait for the MySQL server to be ready
until mysqladmin ping >/dev/null 2>&1; do
    echo "Waiting for MariaDB to be ready..."
    sleep 1
done

mysql -u root <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
CREATE DATABASE ${MYSQL_DATABASE};
CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

wait
