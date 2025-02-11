FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    redis-server \
    && rm -rf /var/lib/apt/lists/*

COPY conf/redis.conf /etc/redis/redis.conf
COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 6379

CMD ["/script.sh"]
