#!/bin/sh
set -e

cat /etc/hosts
echo "ok i'm done, now let's ping'"

exec "$@"