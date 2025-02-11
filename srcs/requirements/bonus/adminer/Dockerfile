FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-mysql \
    php7.4-fpm \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/php && \
    mkdir -p /var/www/html

RUN curl -L https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php -o /var/www/html/index.php

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/
COPY tools/script.sh /script.sh

RUN chmod +x /script.sh && \
    chown -R www-data:www-data /var/www/html && \
    chmod 755 /var/www/html/index.php

WORKDIR /var/www/html

EXPOSE 8080

CMD ["/script.sh"]
