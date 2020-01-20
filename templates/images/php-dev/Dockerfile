FROM php:7.4.0-fpm
MAINTAINER Norbert Kowalik <norbert.kowalik@icloud.com>
COPY sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends git zip zlib1g-dev libzip-dev

RUN curl --silent --show-error https://getcomposer.org/installer \
        | php -- --install-dir /usr/bin --filename composer

RUN mkdir /.composer \
    && chown 1000:1000 /.composer \
    && composer clear-cache \
    && composer config -g repo.packagist composer https://packagist.org \
    && composer config -g github-protocols https ssh
RUN docker-php-ext-install zip pdo_mysql
RUN pecl install xdebug-2.9.0
RUN docker-php-ext-enable xdebug
RUN composer global require hirak/prestissimo squizlabs/php_codesniffer
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
WORKDIR /usr/share/nginx/html/backend
EXPOSE 9000
