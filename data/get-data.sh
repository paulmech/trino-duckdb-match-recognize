#!/usr/bin/env bash

set -eo pipefail

DOWNLOAD_PATH=$PWD/downloaded

# fuelwatch data
FUELWATCH_URL_BASE="https://warsydprdstafuelwatch.blob.core.windows.net/historical-reports/"
BACKFILL_MONTHS=6
if [[ "$1" != "" && "$1" =~ ^[0-9]+$ ]]; then
    BACKFILL_MONTHS=$1
fi

echo "Backfilling $BACKFILL_MONTHS months of data"

COUNTER=0
while true; do
    FILENAME=$(date --date="$(date +%Y-%m-15) -${COUNTER} month" "+FuelWatchRetail-%m-%Y.csv")
    OUTPUT_FUELWATCH=$DOWNLOAD_PATH/$FILENAME

    if [ ! -f $OUTPUT_FUELWATCH ]; then
	echo " - Downloading $OUTPUT_FUELWATCH"
        curl -f -sL "${FUELWATCH_URL_BASE}${FILENAME}" -o $DOWNLOAD_PATH/$FILENAME || true
    fi
    let COUNTER="COUNTER + 1"
    if [ $COUNTER -gt $BACKFILL_MONTHS ]; then
        break;
    fi
done
