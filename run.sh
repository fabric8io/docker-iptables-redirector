#!/bin/sh

TARGET_IP=${TARGET_IP:-127.0.0.1}
TARGET_PORT=${TARGET_PORT:-8080}

if [ -z "${DESTINATIONS}" ]; then
  iptables -t nat -A OUTPUT -p tcp -j DNAT --to-destination ${TARGET_IP}:${TARGET_PORT}
else
  DESTINATIONS="${DESTINATIONS}" IFS=,
  for dest in $DESTINATIONS; do
    iptables -t nat -A OUTPUT -p tcp -d $dest -j DNAT --to-destination ${TARGET_IP}:${TARGET_PORT}
  done
fi


sleep 1000d
