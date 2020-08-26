FROM php:7.4-cli-alpine3.12

RUN apk add --no-cache git openssh libpng libpng-dev && \
    docker-php-ext-install gd && \
    apk del libpng-dev

RUN mkdir ~/.ssh/ && \
    touch ~/.ssh/id_rsa \
    chmod 700 ~/.ssh && chmod 600 ~/.ssh/id_rsa && \
    ssh-keyscan gitlab.owd.io > ~/.ssh/known_hosts

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '8a6138e2a05a8c28539c9f0fb361159823655d7ad2deecb371b04a83966c61223adc522b0189079e3e9e277cd72b8897') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer

RUN composer global require phpunit/phpunit
