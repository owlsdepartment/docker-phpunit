FROM owlsdepartment/php:7.4-composer2

## Prepare config
RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
RUN echo "display_errors = On" >> $PHP_INI_DIR/php.ini

## OpenSshClient
RUN apk add --no-cache git openssh-client
