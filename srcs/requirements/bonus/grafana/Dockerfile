FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    apt-transport-https \
    software-properties-common \
    wget \
    gpg \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /usr/share/keyrings/grafana.key https://apt.grafana.com/gpg.key && \
    echo "deb [signed-by=/usr/share/keyrings/grafana.key] https://apt.grafana.com stable main" | tee /etc/apt/sources.list.d/grafana.list

RUN apt-get update && apt-get install -y \
    grafana \
    && rm -rf /var/lib/apt/lists/*

COPY conf/grafana.ini /etc/grafana/grafana.ini
COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 3000

CMD ["/script.sh"]
