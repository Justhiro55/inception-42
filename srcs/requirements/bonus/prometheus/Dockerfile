FROM debian:bullseye

RUN apt-get update && apt-get install -y \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV PROMETHEUS_VERSION=2.45.0

RUN wget https://github.com/prometheus/prometheus/releases/download/v${PROMETHEUS_VERSION}/prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    tar xvfz prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz && \
    cd prometheus-${PROMETHEUS_VERSION}.linux-amd64 && \
    mv prometheus /usr/local/bin/ && \
    mv promtool /usr/local/bin/ && \
    mkdir /etc/prometheus && \
    mv consoles /etc/prometheus/ && \
    mv console_libraries /etc/prometheus/ && \
    cd .. && \
    rm -rf prometheus-${PROMETHEUS_VERSION}.linux-amd64.tar.gz prometheus-${PROMETHEUS_VERSION}.linux-amd64

COPY conf/prometheus.yml /etc/prometheus/
COPY tools/script.sh /script.sh

RUN chmod +x /script.sh

EXPOSE 9090

CMD ["/script.sh"]