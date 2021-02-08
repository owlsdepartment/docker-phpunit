FROM php:7.4-cli-alpine3.12

RUN apk add --no-cache git openssh libzip libzip-dev libpng libpng-dev libjpeg-turbo libjpeg-turbo-dev php7-pdo_sqlite && \
    docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install gd pdo pdo_mysql

RUN mkdir ~/.ssh/ && \
    touch ~/.ssh/id_rsa && \
    chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa

RUN apk add --no-cache composer

ENV PATH "/composer/vendor/bin:$PATH"

RUN composer global require hirak/prestissimo

RUN composer global require phpunit/phpunit

