#!/usr/bin/env bash

set -e

DBFILE=${1:-}
FORCE=${2:-}
MIGRATION_FILE=bootstrap.sql
export DOWNLOAD_PATH=$PWD/downloaded

if [ -z $DBFILE ]; then
    echo "Provide a filename to use as database output"
    exit 1
elif [[ -f $DBFILE && $FORCE != "-f" ]]; then
    echo "Database already exists - $DBFILE"
    echo "Remove the file or choose a different filename"
    exit 1
fi

duckdb $DBFILE < $MIGRATION_FILE
