#!/usr/bin/env sh
set -e

sed -i 's@%IMAP_HOST%@'$EYEOS_IMAP_HOST'@g' /etc/radicale/radicale.conf

eyeos-service-ready-notify-cli &
exec eyeos-run-server --serf "radicale --config /etc/radicale/radicale.conf"
