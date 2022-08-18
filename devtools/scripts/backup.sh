#!/bin/bash

set -e

base_path="$(cd -- "$(dirname "$0")/../.." >/dev/null 2>&1 ; pwd -P)"
current_date=$(date '+%Y%m%d')

mkdir -p "./backups/$current_date"

docker run --user $(id -u):$(id -g) --rm -v "$base_path/backups:/backups" --network host --entrypoint /bin/bash \
  postgres:14 -c "
    mkdir -p /backups/$current_date;
    /usr/bin/pg_dump -d $DB_URI -F t > /backups/$current_date/backup.tar;
    gzip -f -9 /backups/$current_date/backup.tar;
  "

cp "$base_path/backups/${current_date}/backup.tar.gz" "$base_path/backups/current.tar.gz"
