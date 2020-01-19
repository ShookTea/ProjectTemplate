FROM php:7.4.0-fpm
MAINTAINER Norbert Kowalik <kowaliknor@gmail.com>
COPY sources.list /etc/apt/sources.list
RUN apt-get update \
    && apt-get install -y --no-install-recommends git zip zlib1g-dev libzip-dev nginx

RUN curl --silent --show-error https://getcomposer.org/installer \
        | php -- --install-dir /usr/bin --filename composer

RUN mkdir /.composer \
    && chown 1000:1000 /.composer \
    && composer clear-cache \
    && composer config -g repo.packagist composer https://packagist.org \
    && composer config -g github-protocols https ssh
RUN docker-php-ext-install zip pdo_mysql
RUN composer global require hirak/prestissimo squizlabs/php_codesniffer
COPY images/nginx.conf /etc/nginx/sites-enabled/default
COPY images/entrypoint.sh /etc/entrypoint.sh
RUN chmod +x /etc/entrypoint.sh

RUN mkdir -p /usr/share/nginx/html/backend
COPY backend/bin /usr/share/nginx/html/backend/bin
COPY backend/config /usr/share/nginx/html/backend/config
COPY backend/public /usr/share/nginx/html/backend/public
COPY backend/src /usr/share/nginx/html/backend/src
COPY backend/templates /usr/share/nginx/html/backend/templates
COPY backend/composer.json /usr/share/nginx/html/backend/composer.json
COPY backend/composer.lock /usr/share/nginx/html/backend/composer.lock
COPY backend/symfony.lock /usr/share/nginx/html/backend/symfony.lock
COPY backend/.env /usr/share/nginx/html/backend/.env
RUN cd /usr/share/nginx/html/backend && composer install

RUN mkdir -p /usr/share/nginx/html/frontend
COPY frontend/dist /usr/share/nginx/html/frontend/dist

WORKDIR /usr/share/nginx/html/backend
EXPOSE 80
EXPOSE 8080
