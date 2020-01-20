FROM php:7.4.1-cli-alpine
MAINTAINER Norbert Kowalik <norbert.kowalik@icloud.com>

COPY templates /app/templates
COPY index.php /app/index.php
ENTRYPOINT [ 'php', '/app/index.php' ]
