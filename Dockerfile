FROM bash:latest
MAINTAINER Norbert Kowalik <norbert.kowalik@icloud.com>

COPY templates /app/templates
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh
WORKDIR /app
CMD [ '/app/run.sh' ]
