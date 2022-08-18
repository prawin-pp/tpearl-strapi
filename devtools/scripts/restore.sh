#!/bin/bash

set -e

base_path="$(cd -- "$(dirname "$0")/../.." >/dev/null 2>&1 ; pwd -P)"

gzip -f -d -k "$base_path/backups/current.tar.gz"

docker run --user $(id -u):$(id -g) --rm -v "$base_path/backups:/backups:ro" --network host --entrypoint /bin/bash \
  postgres:14 -c "/usr/bin/pg_restore -d $DB_URI /backups/current.tar;"
