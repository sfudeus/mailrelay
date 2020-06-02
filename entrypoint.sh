#!/bin/bash

set -eu

if [ -f /etc/postfix/sasl_passwd ]; then
  postmap /etc/postfix/sasl_passwd
fi

cp -f /etc/services /var/spool/postfix/etc/
cp -f /etc/resolv.conf /var/spool/postfix/etc/

/usr/sbin/rsyslogd
tail -F /var/log/mail.log &

exec postfix start-fg
