FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y \
    php-fpm \
    php-mysql \
    curl

COPY conf/www.conf /etc/php/8.2/fpm/pool.d/.
COPY tools/script.sh .
RUN chmod +x script.sh

CMD ["./script.sh"]
