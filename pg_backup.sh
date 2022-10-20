#!/usr/bin/env sh

set -e

if [ -f ./backups/demo-backup.sql.gz ]; then
  cp ./backups/demo-backup.sql.gz ./backups/demo-backup.sql.gz.old
fi

docker-compose exec postgres sh -c "/usr/bin/pg_dump -U rundeck rundeck | gzip -9 > /docker-entrypoint-initdb.d/demo-backup.sql.gz"
