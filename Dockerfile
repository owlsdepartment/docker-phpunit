FROM owlsdepartment/php-fpm-alpine:latest

## SqlLite
RUN docker-php-ext-install pdo_sqlite \
    && docker-php-ext-enable pdo_sqlite

## OpenSshClient
RUN apk add --no-cache git openssh-client

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=1.10.16 --filename=composer
