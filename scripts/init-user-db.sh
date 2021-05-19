#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER craftcms;
    ALTER USER craftcms WITH ENCRYPTED PASSWORD 'craftcms';
    CREATE DATABASE craftcms;
    GRANT ALL PRIVILEGES ON DATABASE craftcms TO craftcms;
EOSQL

