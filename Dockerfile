FROM alpine:latest

WORKDIR /

RUN apk add bash
RUN apk add rsync
RUN apk add make
COPY ./backup.sh /
COPY ./restore.sh /
COPY ./Makefile /
RUN chmod 770 /backup.sh /restore.sh /Makefile

CMD ["/bin/bash", "-c", "make", "sync"]