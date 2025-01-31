FROM debian:bullseye

RUN apt update && apt upgrade && apt install -y \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    curl

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY tools/script.sh .
RUN chmod +x script.sh

RUN mkdir /run/php

CMD ["./script.sh"]
