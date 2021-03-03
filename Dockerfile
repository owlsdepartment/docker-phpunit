FROM owlsdepartment/php-fpm-alpine:latest

## Prepare config
RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
RUN echo "display_errors = On" >> $PHP_INI_DIR/php.ini

## OpenSshClient
RUN apk add --no-cache git openssh-client

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --version=1.10.16 --filename=composer
