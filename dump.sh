#!/bin/bash

set -e

echo "Job started at $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PREFIX-$DATE.sql"

pg_dump -h "${PGHOST}" -U "${PGUSER}" -f "${FILE}" -d "${PGDATABASE}"
gzip "$FILE"

echo "Job finished at $(date)"
