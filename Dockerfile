FROM alpine:latest
MAINTAINER Norbert Kowalik <norbert.kowalik@icloud.com>

RUN apk add --no-cache --upgrade bash
COPY templates /app/templates
COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh
ENTRYPOINT [ "sh", "/app/run.sh" ]
