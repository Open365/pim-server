FROM docker-registry.eyeosbcn.com/alpine6-node-base

RUN apk update && \
    apk add python py-pip && \
    apk add py-pyldap --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    pip install radicale && \
    mkdir /etc/radicale

COPY radicale.conf /etc/radicale/radicale.conf
COPY logger.conf /etc/radicale/logger.conf

CMD radicale --config /etc/radicale/radicale.conf
