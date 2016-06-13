#!/usr/bin/env sh
set -e

sed -i 's@%LDAP_URL%@'$EYEOS_LDAP_URL'@g' /etc/radicale/radicale.conf
sed -i 's@%LDAP_BASE_DN%@'$EYEOS_LDAP_DN'@g' /etc/radicale/radicale.conf
sed -i 's@%LDAP_BIND_DN%@'$EYEOS_LDAP_ADMIN_USER'@g' /etc/radicale/radicale.conf
sed -i 's@%LDAP_PWD%@'$EYEOS_LDAP_ADMIN_PASSWORD'@g' /etc/radicale/radicale.conf

eyeos-service-ready-notify-cli &
exec eyeos-run-server --serf "radicale --config /etc/radicale/radicale.conf"
