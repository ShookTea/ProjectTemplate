FROM php:7.4.1-cli-alpine
MAINTAINER Norbert Kowalik <norbert.kowalik@icloud.com>

COPY templates /app/templates
COPY run.sh /app/run.sh
RUN chmod +x run.sh
ENTRYPOINT [ '/app/run.sh' ]
