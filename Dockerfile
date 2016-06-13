FROM docker-registry.eyeosbcn.com/alpine6-node-base

ENV WHATAMI pim

ENV EYEOS_LDAP_URL ldap://ldap.service.consul/
ENV EYEOS_LDAP_DN ou=People,dc=eyeos,dc=com
ENV EYEOS_LDAP_ADMIN_USER cn=Manager,dc=eyeos,dc=com
ENV EYEOS_LDAP_ADMIN_PASSWORD manager

RUN apk update && \
    /scripts-base/buildDependencies.sh --production --install && \
    apk add python py-pip && \
    apk add py-pyldap --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    pip install radicale && \
    mkdir /etc/radicale && \
    npm install -g eyeos-service-ready-notify-cli && \
    /scripts-base/buildDependencies.sh --production --purgue

COPY radicale.conf /etc/radicale/radicale.conf
COPY logger.conf /etc/radicale/logger.conf
COPY start.sh /start.sh

CMD ["/start.sh"]
