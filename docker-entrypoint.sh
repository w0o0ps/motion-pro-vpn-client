#!/bin/bash
set -eu

/usr/bin/vpnd 2>&1

if [! -f /var/lock/subsys/local ]; then
  touch /var/lock/subsys/local
fi

exec "$@"