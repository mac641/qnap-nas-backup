FROM alpine:latest

WORKDIR /

RUN apk add bash
RUN apk add rsync
COPY ./backup.sh /

CMD ["/bin/bash", "/backup.sh"]