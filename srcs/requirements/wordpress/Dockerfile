FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-redis \
    curl \
    wget \
    unzip

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/script.sh .

RUN mkdir /run/php && \
    mkdir -p /var/www/html/wp-content/plugins && \
    wget -P /var/www/html/wp-content/plugins/ https://downloads.wordpress.org/plugin/redis-cache.latest-stable.zip && \
    cd /var/www/html/wp-content/plugins/ && \
    unzip redis-cache.latest-stable.zip && \
    rm redis-cache.latest-stable.zip

RUN chmod +x script.sh

CMD ["./script.sh"]
