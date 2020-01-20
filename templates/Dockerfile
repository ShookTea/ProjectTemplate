FROM ${GITLAB_REPO}/php-dev
MAINTAINER Norbert Kowalik <kowaliknor@gmail.com>

RUN apt-get update \
    && apt-get install -y nginx

COPY images/nginx.conf /etc/nginx/sites-enabled/default
COPY images/xdebug_disabled.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
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
