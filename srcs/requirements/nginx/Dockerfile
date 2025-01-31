FROM debian:latest

EXPOSE 443

RUN apt update && apt upgrade && apt install -y \
    nginx \
    openssl

COPY conf/default /etc/nginx/sites-available/.

ARG CERT_FOLDER="/etc/nginx/cert"
ARG CERT="/etc/nginx/cert/server.crt"
ARG CERT_KEY="/etc/nginx/cert/server.key"
ARG COUNTRY="JP"
ARG STATE="Tokyo"
ARG LOCALITY="Shinjuku"
ARG ORGANIZATION="42Tokyo"
ARG UNIT="42"
ARG COMMON_NAME="localhost"

RUN mkdir -p ${CERT_FOLDER}
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out ${CERT} \
    -keyout ${CERT_KEY} \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${LOCALITY}/O=${ORGANIZATION}/OU=${UNIT}/CN=${COMMON_NAME}"

CMD ["nginx", "-g", "daemon off;"]
