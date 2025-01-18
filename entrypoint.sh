#!/bin/bash

# DO NOT EDIT!

set -e

: "${SMTP_HOST:?Need to set SMTP_HOST}"
: "${SMTP_PORT:?Need to set SMTP_PORT}"
: "${SMTP_USER:?Need to set SMTP_USER}"
: "${SMTP_PASS:?Need to set SMTP_PASS}"

cat <<EOF > /etc/exim4/update-exim4.conf.conf
dc_eximconfig_configtype='smarthost'
dc_other_hostnames=''
dc_local_interfaces='0.0.0.0 ; ::1'
dc_readhost=''
dc_relay_domains='*'
dc_minimaldns='false'
dc_relay_nets='0.0.0.0/0'
dc_smarthost='${SMTP_HOST}::${SMTP_PORT}'
dc_hide_mailname='true'
dc_mailname_in_oh='true'
dc_localdelivery='mail_spool'
EOF

cat <<EOF > /etc/exim4/passwd.client
${SMTP_HOST}:${SMTP_USER}:${SMTP_PASS}
EOF

update-exim4.conf

exec "$@"
