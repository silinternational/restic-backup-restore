FROM alpine:3.11

RUN apk update \
 && apk add --no-cache bash

ARG restic_ver=0.9.6

RUN wget https://github.com/restic/restic/releases/download/v${restic_ver}/restic_${restic_ver}_linux_amd64.bz2 \
         -O /tmp/restic.bz2 \
 && bunzip2 /tmp/restic.bz2 \
 && chmod +x /tmp/restic \
 && mv /tmp/restic /usr/local/bin/restic

COPY application/ /data/
WORKDIR /data

#dkn ENTRYPOINT ["./entrypoint.sh"]
CMD ["./entrypoint.sh"]
