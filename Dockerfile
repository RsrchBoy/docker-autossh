# Teensy autossh tunnel maintenance
#
# You should do a bind-mount to get ssh configuration, public-keys, etc, into
# the running container.
#
#   -v dotssh:/root/.ssh:ro

FROM alpine:3.3
MAINTAINER Chris Weyl <chris.weyl@dreamhost.com>

RUN cat /etc/apk/repositories

# NOTE: right now, autossh is only available in the testing repo.
RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk update && \
    apk add autossh@testing && \
    rm -r /var/cache/

ENTRYPOINT [ "autossh", "-gN" ]
