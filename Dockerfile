FROM alpine:3.11

RUN apk update \
 && apk add --no-cache \
        rsyslog rsyslog-tls \
        ca-certificates openssl \
        bash \
 && update-ca-certificates

COPY dockerbuild/rsyslog.conf /etc/rsyslog.conf

RUN wget https://raw.githubusercontent.com/silinternational/runny/0.2/runny \
         -O /usr/local/bin/runny \
 && chmod +x /usr/local/bin/runny

ARG restic_ver=0.9.6

RUN wget https://github.com/restic/restic/releases/download/v${restic_ver}/restic_${restic_ver}_linux_amd64.bz2 \
         -O /tmp/restic.bz2 \
 && bunzip2 /tmp/restic.bz2 \
 && chmod +x /tmp/restic \
 && mv /tmp/restic /usr/local/bin/restic

COPY application/ /data/
WORKDIR /data

ENTRYPOINT ["./entrypoint.sh"]
#dkn CMD ["crond -f"]
