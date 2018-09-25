FROM alpine:3.8

COPY src /

RUN adduser -D -u 1000 -g 1000 -s /bin/sh www-data && \
    mkdir -p /www && \
    chown -R www-data:www-data /www

RUN apk --update add \
    nginx \
    php7 \
    php7-apcu \
    php7-bcmath \
    php7-bz2 \
    php7-cgi \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fpm \
    php7-gd \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pcntl \
    php7-pdo \
    php7-pdo_mysql \
    php7-phar \
    php7-session \
    php7-simplexml \
    php7-tokenizer \
    php7-xml \
    php7-xmlwriter \
    php7-zip \
    php7-zlib \
    php7-zmq

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 80