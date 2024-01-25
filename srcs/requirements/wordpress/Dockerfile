FROM alpine:3.18

RUN apk --no-cache add \
    curl \
    bash \
    nano \
    php81 \
    php81-mysqli \
    php81-json \
    php81-openssl \
    php81-curl \
    php81-dom \
    php81-xml \
    php81-xmlreader \
    php81-xmlwriter \
    php81-simplexml \
    php81-zip \
    php81-gd \
    php81-session \
    php81-tokenizer \
    php81-ctype \
    php81-fpm \
    php81-phar

COPY wp.sh /
RUN chmod +x /wp.sh

CMD ["/bin/sh", "-c", "/wp.sh && tail -f /dev/null"]

