#!/usr/bin/env bash

# stop on errors
set -e

# tear down previous containers
docker compose down

# re-populate CSV files with default 6 months of data (add an integer parameter to get-data.sh to specify custom number of months)
cd data
./get-data.sh

# make the duckdb database from the downloaded CSV files
./make-db.sh ../trino-catalog/fw.duckdb -f
cd ..

# start the trino container
docker compose up 
