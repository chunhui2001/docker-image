#!/bin/sh
# Docker entrypoint (pid 1), run as root
[ "$1" = "mongod" ] || exec "$@" || exit $?

# Make sure that database is owned by user mongodb
[ "$(stat -c %U /data/db)" = mongodb ] || chown -R mongodb:mongodb /data 

exec su -s /bin/sh -c "exec 'mongod' '-f' '/etc/mongodb.conf' & tail -f /data/log/mongod.log" mongodb
